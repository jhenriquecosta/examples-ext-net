<%@ Page Language="C#" %>

<script runat="server">
	protected void ShowTime(object sender, DirectEventArgs e)
	{
		new Window("Server time", Icon.Time)
		{
			ID       = "MyWindow",
			Html     = DateTime.Now.ToString(),
			AutoShow = true
		}.Render();
	}

	protected void CreatePanel(object sender, DirectEventArgs e)
	{
		var panel = new Ext.Net.Panel
		{
			Title = "Created during Direct Event",
			Html = DateTime.Now.ToString()
		};
		panel.AddTo(Container);
	}
	
	protected void CreateTab(object sender, DirectEventArgs e)
	{
		var panel = new Ext.Net.Panel
		{
			Title = "Created during Direct Event",
			Html = DateTime.Now.ToString()
		};
		panel.AddTo(TabPanel1);
		TabPanel1.SetActiveTab(panel);
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

		<ext:Button runat="server" Text="Click Me">
			<DirectEvents>
				<Click OnEvent="ShowTime" />
			</DirectEvents>
		</ext:Button>

		<ext:Button runat="server" Text="Click Me">
			<DirectEvents>
				<Click OnEvent="CreatePanel" />
			</DirectEvents>
		</ext:Button>
		
		<ext:Container Id="Container" runat="server" />

		<ext:Button runat="server" Text="Click Me">
			<DirectEvents>
				<Click OnEvent="CreateTab" />
			</DirectEvents>
		</ext:Button>
		
		<ext:TabPanel Id="TabPanel1" runat="server" Height="100">
			<Items>
				<ext:Panel Title="Created on page load" Html="Content"/>
			</Items>
		</ext:TabPanel>
	</body>
</html>
