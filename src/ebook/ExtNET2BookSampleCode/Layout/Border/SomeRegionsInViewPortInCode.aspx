<%@ Page Language="C#" %>
<%@ Register assembly="Ext.Net" namespace="Ext.Net" tagprefix="ext" %>

<script runat="server">
	protected void Page_Load(object sender, EventArgs e)
	{
		var viewport = new Viewport
		{
			Layout = "border",
			Items =
			{
				new Ext.Net.Panel
				{
					Region      = Region.West,
					Title       = "West",
					Width       = 200,
					Collapsible = true,
					Split       = true
				},
				
				new Ext.Net.Panel
				{
					Region = Region.Center,
					Title  = "Center content"
				}
			}
		};

		Form.Controls.Add(viewport);
	}
</script>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Border Layout Example</title>
	</head>
	<body>
		<form runat="server">
			<ext:ResourceManager runat="server" Theme="Gray" />
		</form>
	</body>
</html>
