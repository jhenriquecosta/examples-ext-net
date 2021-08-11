<%@ Page Language="C#" %>

<script runat="server">
	protected void CreatePanel(object sender, DirectEventArgs e)
	{
		var literal = new Literal
		{
			Text = "<p>Hello from server</p>"
		};
		Panel1.Controls.Clear();
		Panel1.Controls.Add(literal);
		Panel1.Update();
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

		<ext:Button runat="server" Text="Click Me" OnDirectClick="CreatePanel" />

		<asp:Panel Id="Panel1" runat="server">
			<p>Some initial content</p>
		</asp:Panel>
	</body>
</html>
