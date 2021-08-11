<%@ Page Language="C#" %>

<script runat="server">
	protected void Button_Click(object sender, DirectEventArgs e)
	{
	   X.Msg.Alert("DirectEvent", string.Format("Item - {0}", e.ExtraParams["Item"])).Show();
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
		<ext:Button runat="server" Text="Click Me">
			<DirectEvents>
				<Click OnEvent="Button_Click">
					<EventMask ShowMask="true" />
					<ExtraParams>
						<ext:Parameter Name="Item" Value="My param" />
					</ExtraParams>
				</Click>
			</DirectEvents>
		</ext:Button>
	</body>
</html>
