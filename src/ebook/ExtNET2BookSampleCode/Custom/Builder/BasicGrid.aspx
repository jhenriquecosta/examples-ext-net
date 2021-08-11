<%@ Page Language="C#" %>
<%@ Import Namespace="ExtNET2BookSampleCode.Custom.Builder" %>

<script runat="server">
protected void Page_Load(object sender, EventArgs e)
{
	var grid = new FinancialGridBuilder().Build();
	grid.Width = 450;
	grid.Height = 300;
	
	this.PlaceHolder1.Controls.Add(grid);
}	
</script>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Custom Component Example</title>
		<link rel="stylesheet" type="text/css" href="Resources/style.css" />
		<script src="Resources/grid.js"></script>
	</head>
	<body>
		<ext:ResourceManager runat="server" />
		<asp:PlaceHolder ID="PlaceHolder1" runat="server" />
	</body>
</html>
