<%@ Page Language="C#" %>
<%@ Import Namespace="System.Threading" %>

<script runat="server">
	protected void ShowPanel(object sender, DirectEventArgs e)
	 {
		Thread.Sleep(5000); // fake delay just to allow mask to show
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
		<ext:Button runat="server" Text="Click Me">
			<DirectEvents>
				<Click OnEvent="ShowPanel">
					<EventMask ShowMask="true" />
				</Click>
			</DirectEvents>
		</ext:Button>
	</body>
</html>
