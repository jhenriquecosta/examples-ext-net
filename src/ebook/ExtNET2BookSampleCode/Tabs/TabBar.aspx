<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>TabBar Config - Ext.NET Examples</title>
	<script runat="server">
		protected void AddTab(object sender, DirectEventArgs e)
		{
			var panel = new Ext.Net.Panel
			{
				Title    = "New Tab",
				Closable = true,
				Layout   = "Fit",
				Html     = "<p>New tab content</p>"
			};

			panel.AddTo(TabPanel1);
			TabPanel1.SetLastTabAsActive();
		}
	</script>

	<style type="text/css">
		body { padding:10px; }
	</style>
	<script>
		var MyApp = {
			onTabAddSuccess: function(tabPanel) {
				tabPanel.tabBar.layout.overflowHandler.scrollToItem(this);
			},
			
			showHelp:function () {
				// help implementation here
			}
		}
	</script>
</head>
<body>
	<form runat="server">
		<ext:ResourceManager runat="server" />
		
		<ext:TabPanel ID="TabPanel1" runat="server" Width="280" Height="110">
			<TabBar>
				<ext:ToolbarFill />
				<ext:Button Id="Add" Flat="true" Icon="Add">
					<DirectEvents>
						<Click
							OnEvent="AddTab"
							Success="MyApp.onTabAddSuccess.call(#{Help}, #{TabPanel1});" />
					</DirectEvents>
				</ext:Button>
				<ext:Button Id="Help" Flat="true" Icon="Help">
					<Listeners>
						<Click Fn="MyApp.showHelp" />
					</Listeners>
				</ext:Button>
			</TabBar>
			<Items>
				<ext:Panel Title="Tab 1" />
			</Items>
		</ext:TabPanel>
	</form>
</body>
</html>