<%@ Page Language="C#" %>

<script runat="server">
	[DirectMethod]
	public void AddToServerTime(int hours)
	{
	 	var date = DateTime.Now.Add(new TimeSpan(hours, 0, 0));
		Label1.Text = date.ToString();
	}
</script>
<!DOCTYPE html>
<html>
	<head id="Head1" runat="server">
		<title>Direct Method Example</title>
		
		<script>
			function doUpdate(hours) {
				App.direct.AddToServerTime(hours);
			}
		</script>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Window runat="server" Title="My Window" Width="250" Height="150" PaddingSummary="5px">
			<Items>
				<ext:Label ID="Label1" runat="server" Text="Initial text" />
			</Items>
			<TopBar>
				<ext:Toolbar>
					<Items>
						<ext:Button Text="Update" Icon="ArrowRefresh">
							<Listeners>
								<Click Handler="doUpdate(5);" />
							</Listeners>
						</ext:Button>
					</Items>					
				</ext:Toolbar>
			</TopBar>
		</ext:Window>
	</body>
</html>
