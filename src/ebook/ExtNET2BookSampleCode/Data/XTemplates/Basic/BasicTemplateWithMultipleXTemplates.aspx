<%@ Page Language="C#" %>
<%@ Import Namespace="ExtNET2BookSampleCode.Data.XTemplates.Basic" %>

<script runat="server">
	protected void Page_Load(object sender, EventArgs e)
	{
		Panel1.Update(new TemplateData
		{
			FirstName = "Joe",
			LastName = "Blogs",
			Info1 = "Hello",
			Info2 = "World"
		});
	}
</script>

<!DOCTYPE html>
<html>
<head>
	<title>Example</title>
	<style>
		body { padding:10px; }
		.info-old { padding: 4px; margin-bottom: 4px; border-bottom: 1px solid #ccc; }
		.info-old p { line-height: 1.6; }
		
		.info {
			margin: 10px 1% 0 2%;
		    padding: 4px;
		    display: inline-block;
			width: 30%;
			/* float: left; for IE7 and below */
		    border: 1px solid #ddd;
		    border-radius: 4px;
			box-shadow: 2px 2px 2px #999;
		}
		.info:nth-child(odd) { background-color:#eee; }
		.info p { line-height: 1.6; }
	</style>
	<script type="text/javascript">
		function updatePanel(panel, template) {
			Ext.net.DirectMethod.request({
				success: function(response) {
					template.overwrite(panel.body, response);
				},
				url: 'DataUpdaterMultiple.ashx',
				cleanRequest: true,
				eventMask: { showMask: true }
			});
		}
	</script>
</head>
<body>
	<ext:ResourceManager runat="server" />

	<ext:Panel ID="Panel1" runat="server" Width="500" Height="300" AutoScroll="True">
		<Tpl ID="Template" runat="server">
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
							<Click Handler="updatePanel(#{Panel1}, #{MultiDataTemplate});" />
						</Listeners>
					</ext:Button>
				</Items>
			</ext:Toolbar>
		</BottomBar>
	</ext:Panel>

	<ext:XTemplate ID="MultiDataTemplate" runat="server">
		<Html>
			<tpl for=".">
				<div class="info">
					<p><a href="/Details/{#}">Item Number: {#}</a></p>
					<p>First Name: {FirstName}</p>
					<p>Last Name: {LastName}</p>
					<p>Info1: {Info1}</p>
					<p>Info2: {Info2}</p>
				</div>
			</tpl>
		</Html>
	</ext:XTemplate>
</body>
</html>
