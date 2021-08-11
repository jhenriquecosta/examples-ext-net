<%@ Page Language="C#" %>
<%@ Import Namespace="System.Threading" %>

<script runat="server">
	protected void ShowPanel(object sender, DirectEventArgs e)
	{
		Thread.Sleep(5000);
		X.Msg.Alert("DirectEvent", "Event received").Show();
	}
</script>
<!DOCTYPE html>
<html>
	<head id="Head1" runat="server">
		<title>Direct Event Example</title>
		<style>
			body { padding: 10px; }
			.x-mask-msg { border-color: #aaa; }
			.x-mask-msg > div { background-color: #fff; }
		</style>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		
		<ext:Window runat="server" ID="Window1" Title="Window with Button" Width="200" Height="150">
			<Buttons>
				<ext:Button Text="Click Me">
					<DirectEvents>
						<Click OnEvent="ShowPanel">
							<EventMask ShowMask="true" Target="CustomTarget" CustomTarget="App.Window1.body" />
						</Click>
					</DirectEvents>
				</ext:Button>
			</Buttons>
		</ext:Window>
	</body>
</html>
