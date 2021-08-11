<%@ Page Language="C#" %>

<script runat="server">
	protected void ShowPanel(object sender, DirectEventArgs e)
	{
		X.Msg.Alert("DirectEvent", string.Format("Item - {0}", e.ExtraParams["Item"])).Show();
	}
</script>
<!DOCTYPE html>
<html>
	<head id="Head1" runat="server">
		<title>Direct Event Example</title>
		<style>
			body { padding: 10px; }
		</style>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Button runat="server" Text="Click Me">
			<DirectEvents>
				<Click OnEvent="ShowPanel">
					<ExtraParams>
						<ext:Parameter Name="Item" Value="My param" />
					</ExtraParams>
				</Click>
			</DirectEvents>
		</ext:Button>
	</body>
</html>
