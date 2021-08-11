<%@ Page Language="C#" %>
<script runat="server">
	protected void ShowMyPanel(object sender, EventArgs e)
	{
		MyAspLiteral.Text = "Time on server: " + DateTime.Now;
		MyAspPanel.Visible = true;
	}
</script>
<!DOCTYPE html>
<html>
	<head runat="server">
		<title>UpdatePanel comparison</title>
	</head>
	<body>
		<form id="HtmlForm" runat="server">
			<asp:ScriptManager ID="ScriptManager1" runat="server" />
			<asp:UpdatePanel ID="UpdatePanel1" runat="server">
				<ContentTemplate>
					<asp:Panel runat="server" ID="MyAspPanel" Visible="false">
						<asp:Literal runat="server" ID="MyAspLiteral" />
					</asp:Panel>
					<asp:Button ID="Button1" runat="server" OnClick="ShowMyPanel" Text="Click Me" />
				</ContentTemplate>
			</asp:UpdatePanel>
		</form>
	</body>
</html>
