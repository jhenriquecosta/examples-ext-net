<%@ Page Language="C#" %>

<script runat="server">
	protected void Page_Load(object sender, EventArgs e)
	{
		var button = new Ext.Net.Button {Text = "Click me!"};
		
		Controls.Add(button);
	}
</script>
<!DOCTYPE html>
<html>
<head>
	<title>Simple button example</title>
</head>
<body>
	<ext:ResourceManager runat="server" Theme="Gray" />
</body>
</html>
