<%@ Page Language="C#" %>

<script runat="server">
	protected void ShowPanel(object sender, DirectEventArgs e)
	{
		MyExtLabel.Text = "Time on server: " + DateTime.Now;
		MyExtPanel.Show();
	}
</script>
<!DOCTYPE html>
<html>
	<head>
		<title>Direct Event Example</title>
		<style>
			body { padding: 10px; }
		</style>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Panel runat="server" ID="MyExtPanel" Title="My Panel" Hidden="true" BodyPaddingSummary="2 2 4 2">
			<Items>
				<ext:Label runat="server" ID="MyExtLabel" />
			</Items>
		</ext:Panel>
		<ext:Button runat="server" Text="Click Me" OnDirectClick="ShowPanel" />
	</body>
</html>
