<%@ Page Language="C#" %>

<script runat="server">
	protected void ShowPanel(object sender, DirectEventArgs e)
	{
		MyExtLabel.Text = string.Format("Time on server: {0}", DateTime.Now);
		MyExtPanel.Show();
	}
</script>
<!DOCTYPE html>
<html>
	<head runat="server">
		<title>A button with a Direct Event</title>
		<style>
			body { padding: 10px; }
		</style>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Panel ID="MyExtPanel" runat="server" Title="My Panel" Hidden="true" BodyPaddingSummary="2 2 4 2">
			<Items>
				<ext:Label ID="MyExtLabel" runat="server" />
			</Items>
		</ext:Panel>
		<ext:Button ID="Button1" runat="server" Text="Click Me">
			<DirectEvents>
				<Click OnEvent="ShowPanel">
					<EventMask ShowMask="true" />
				</Click>
			</DirectEvents>
		</ext:Button>
	</body>
</html>
