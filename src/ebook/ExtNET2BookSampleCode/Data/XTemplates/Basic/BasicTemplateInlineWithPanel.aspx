<%@ Page Language="C#" %>
<%@ Import Namespace="ExtNET2BookSampleCode.Data.XTemplates.Basic" %>

<script runat="server">
	protected void Page_Load(object sender, EventArgs e)
	{
		Panel1.Data = new TemplateData
		{
			FirstName = "Joe",
			LastName = "Blogs",
			Info1 = "Hello",
			Info2 = "World"
		};
	}
</script>

<!DOCTYPE html>
<html>
<head>
	<title>Example</title>
	<style>
		body { padding:10px; }
		.info { padding: 4px; }
		.info p { line-height: 1.6; }
	</style>
	<script type="text/javascript">
		function updatePanel(panel) {
			Ext.net.DirectMethod.request({
				success: function(response) {
					panel.update(response);
				},
				url: 'DataUpdater.ashx',
				cleanRequest: true,
				eventMask: { showMask: true }
			});
		}
	</script>
</head>
<body>
	<ext:ResourceManager runat="server" />

	<ext:Panel ID="Panel1" runat="server" Width="300" Height="200">
		<Tpl>
			<Html>
				<div class="info">
					<p>First Name: {FirstName}</p>
					<p>Last Name: {LastName}</p>
					<p>Info1: {Info1}</p>
					<p>Info2: {Info2}</p>
				</div>
			</Html>            
		</Tpl>  
		<BottomBar>
			<ext:Toolbar>
				<Items>
					<ext:Button Icon="Reload" Text="Reload">
						<Listeners>
							<Click Handler="updatePanel(#{Panel1});" />
						</Listeners>
					</ext:Button>
				</Items>
			</ext:Toolbar>
		</BottomBar>
	</ext:Panel>
</body>
</html>
