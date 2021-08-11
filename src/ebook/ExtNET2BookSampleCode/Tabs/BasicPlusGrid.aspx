<%@ Page Language="C#" %>
<%@ Import Namespace="ExtNET2BookSampleCode.Tabs" %>
<script runat="server">
protected void Page_Load(object sender, EventArgs e)
{
	if (!X.IsAjaxRequest)
	{
		Store1.DataSource = CompanyData.GetData();
		Store1.DataBind();
	}
}
</script>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Tab example</title>
	<style type="text/css">
		.positive { color: green; }
		.negative { color: red; }
	</style>

	<script type="text/javascript">
		var template = '<span class="{0}">{1}</span>';

		var change = function(value) {
			return Ext.String.format(template, (value > 0) ? "positive" : "negative", value);
		};

		var pctChange = function(value) {
			return Ext.String.format(template, (value > 0) ? "positive" : "negative", value + "%");
		};
	</script>
</head>
<body>
	<form runat="server">
		<ext:ResourceManager runat="server" />
		
		<ext:Window 
			runat="server" 
			Title="Basic TabPanel"
			Width="420" 
			Height="250" 
			Layout="FitLayout">
			<Items>
				<ext:TabPanel Border="false" DefaultBorder="false">
					<Items>
						<ext:Panel Html="<p>First tab</p>" Title="Panel as tab" Icon="Application" BodyPadding="5" />
						<ext:TreePanel Html="<p>First tab</p>" Title="Tree as tab" Icon="ApplicationSideTree" Closable="true">
							<Root>
								<ext:Node Text="Root" Expanded="true">
									<Children>
										<ext:Node Text="Child 1" Leaf="true" />
										<ext:Node Text="Child 2" Leaf="true" />
										<ext:Node Text="Child 3" Leaf="true" />
										<ext:Node Text="Child 4" Leaf="true" />
									</Children>
								</ext:Node>
							</Root>
						</ext:TreePanel>
						<ext:GridPanel Title="Simple Grid" Icon="Table">
							<Store>
								<ext:Store ID="Store1" runat="server" PageSize="10">
									<Model>
										<ext:Model IDProperty="Id">
											<Fields>
												<ext:ModelField Name="Company" Mapping="Name"  />
												<ext:ModelField Name="Price" Type="Float" />
												<ext:ModelField Name="Change" Type="Float" />
												<ext:ModelField Name="PctChange" Mapping="PercentChange" Type="Float" />
												<ext:ModelField Name="LastChange" Type="Date" DateFormat="yyyy-MM-ddTHH:mm:ss" />
											</Fields>
										</ext:Model>
									</Model>
								</ext:Store>
							</Store>
							<ColumnModel>
								<Columns>
									<ext:RowNumbererColumn Width="25" />
									<ext:Column Text="Company" DataIndex="Company" Flex="1" />
									<ext:Column Text="Price" DataIndex="Price" Width="50">                  
										<Renderer Format="UsMoney" />
									</ext:Column>
									<ext:NumberColumn Text="Change" DataIndex="Change" Width="50" Format="0.0" />
									<ext:Column Text="Change" DataIndex="PctChange" Width="50">
										<Renderer Fn="pctChange" />
									</ext:Column>
									<ext:DateColumn Text="Last Updated" DataIndex="LastChange" Format="yyyy-MM-dd hh:mmtt" Width="130" />
								</Columns>
							</ColumnModel>
							<BottomBar>
								<ext:PagingToolbar />
							</BottomBar>
						</ext:GridPanel>
					</Items>
				</ext:TabPanel>
			</Items>
		</ext:Window>
	</form>
</body>
</html>