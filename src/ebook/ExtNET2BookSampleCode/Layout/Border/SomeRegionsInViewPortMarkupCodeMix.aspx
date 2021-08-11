<%@ Page Language="C#" %>
<%@ Register assembly="Ext.Net" namespace="Ext.Net" tagprefix="ext" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
		WestPanel.Title       = "West";
		WestPanel.Split       = true;
    	WestPanel.Collapsible = true;

		Viewport1.Items.Add(new Ext.Net.Panel
		{
			Region = Region.Center,
			Title  = "Center content"
		});
    }
</script>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Border Layout Example</title>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Viewport ID="Viewport1" runat="server" Layout="Border">
			<Items>
				<ext:Panel ID="WestPanel" Region="West" Width="200" runat="server" />
			</Items>
		</ext:Viewport>
	</body>
</html>
