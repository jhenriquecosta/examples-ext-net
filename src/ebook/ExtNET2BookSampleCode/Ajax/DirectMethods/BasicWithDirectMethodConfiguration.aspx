<%@ Page Language="C#" %>

<script runat="server">
	[DirectMethod]
	public void AddToServerTime(int hours)
	{
	 	Label1.Text = DateTime.Now.Add(new TimeSpan(hours, 0, 0)).ToString();
	}
</script>
<!DOCTYPE html>
<html>
	<head id="Head2" runat="server">
		<title>Direct Method Example</title>
		
		<script>
			function onSuccess(result) {
				console.log("onSuccess", result);
			}

			function onFailure(errorMessage) {
				Ext.Msg.alert('Failed', errorMessage);
			}

			function doUpdate(hours) {
				console.log("Before");
				App.direct.AddToServerTime(hours, {
					success: onSuccess,
					failure: onFailure,
					eventMask: { showMask: true }
				});
				console.log("After");
			}
		</script>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Window runat="server" Title="My Window" Width="250" Height="150" PaddingSummary="5px">
			<Items>
				<ext:Label runat="server" ID="Label1" Text="Initial text" />
			</Items>
			<TopBar>
				<ext:Toolbar runat="server">
					<Items>
						<ext:Button runat="server" Text="Update" Icon="ArrowRefresh">
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
