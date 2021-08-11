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
			function doUpdate() {
				MyApp.DirectMethods.AddToServerTime(5);
			}
		</script>
	</head>
	<body>
		<ext:ResourceManager runat="server" DirectMethodNamespace="MyApp.DirectMethods" />
		<ext:Window runat="server" Title="My Window" Width="250" Height="150" PaddingSummary="5px">
			<Items>
				<ext:Label runat="server" ID="Label1" Text="Initial text" />
			</Items>
			<TopBar>
				<ext:Toolbar runat="server">
					<Items>
						<ext:Button runat="server" Text="Update" Icon="ArrowRefresh">
							<Listeners>
								<Click Fn="doUpdate" />
							</Listeners>
						</ext:Button>
					</Items>					
				</ext:Toolbar>
			</TopBar>
		</ext:Window>
	</body>
</html>
