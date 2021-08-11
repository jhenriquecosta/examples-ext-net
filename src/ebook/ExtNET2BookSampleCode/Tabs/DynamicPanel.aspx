<%@ Page Language="C#" %>
<%@ Import Namespace="System.Threading" %>
<script runat="server">

private TreePanel BuildTreePanel()
{
	return new TreePanel
	{
	    Title = "Tree Panel",
		Icon = Icon.ApplicationSideTree,
		AutoScroll = true,
		Border = false,
		Root =
		{
			new Node
			{
				Text = "Root",
				Expanded = true,
				Children =
				{
					new Node { Text = "Child 1", Leaf = true },
					new Node { Text = "Child 2", Leaf = true },
					new Node { Text = "Child 3", Leaf = true },
					new Node { Text = "Child 4", Leaf = true },
					new Node { Text = "Child 5", Leaf = true },
					new Node { Text = "Child 6", Leaf = true }
				}
			}
		}
	};
}	

protected void Tab2_Activate(object sender, DirectEventArgs e)
{
	Thread.Sleep(2000); // just to demonstrate the loading mask!
	TreePanel panel = BuildTreePanel();
	panel.AddTo(Tab2);
}

</script>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Tab example</title>
</head>
<body>
	<form runat="server">
		<ext:ResourceManager runat="server" />
		
		<ext:Window 
			runat="server" 
			Title="Basic TabPanel"
			Width="200" 
			Height="155" 
			Layout="FitLayout">
			<Items>
				<ext:TabPanel Id="TabPanel1" runat="server" Border="false" DefaultBorder="false">
					<Items>
						<ext:Panel Html="<p>First tab</p>" Title="Tab 1" BodyPadding="5" />
						<ext:Panel Id="Tab2" runat="server" Title="Tab 2" Layout="fit">
							<DirectEvents>
								<Activate OnEvent="Tab2_Activate" Single="true">
									<EventMask ShowMask="true" Target="This" />
								</Activate>
							</DirectEvents>
						</ext:Panel>
					</Items>
				</ext:TabPanel>
			</Items>
		</ext:Window>
	</form>
</body>
</html>