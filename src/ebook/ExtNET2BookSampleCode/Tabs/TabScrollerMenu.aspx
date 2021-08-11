<%@ Page Language="C#" %>
<%@ Import Namespace="TreesAndTabs.Tabs" %>
<script runat="server">
protected void Page_Load(object sender, EventArgs e)
{
	for (int i = 1; i < 21; i++)
	{
		var panel = new Ext.Net.Panel { Title="Tab " + i };
		TabPanel1.Items.Add(panel);
	}
}
</script>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Tab example</title>
	<style type="text/css">
		body { padding:10px; }
	</style>
</head>
<body>
	<form runat="server">
		<ext:ResourceManager runat="server" />
		
		<ext:TabPanel Id="TabPanel1" runat="server" Width="420" Height="180">
			<Plugins>
				<ext:TabScrollerMenu PageSize="5" />
			</Plugins>
		</ext:TabPanel>
	</form>
</body>
</html>
