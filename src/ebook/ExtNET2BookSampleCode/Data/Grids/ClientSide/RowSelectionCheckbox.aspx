<%@ Page Language="C#" %>
<%@ Import Namespace="ExtNET2BookSampleCode.Data.Grids.Shared" %>

<script runat="server">
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!X.IsAjaxRequest)
		{
			Store1.DataSource = CompanyData.GetData();
			Store1.DataBind();
		}
	}
	
	[DirectMethod]
	public static void Remove(string values)
	{
		var data = JSON.Deserialize<List<string>>(values);
	}
</script>

<!DOCTYPE html>
<html>
<head runat="server">
	<title>Simple Grid - Ext.NET Examples</title>

	<style type="text/css">
		body { padding:10px; }
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

		var MyApp = {
			remove: function(grid) {
				var selectedRecords = grid.getSelectionModel().getSelection(),
				    data = [];

				Ext.each(selectedRecords, function(item) {
					data.push(item.data.Name);
				});

				App.direct.Remove(data,
				{
					success: function(result) {
						MyApp.removeSuccess(result, grid, selectedRecords);
					}
				});
			},

			removeSuccess: function(result, grid, selectedRecords) {
				grid.getStore().remove(selectedRecords);

				grid.getStore().each(function(rec, idx) {
					rec.index = idx;
				});

				grid.getView().refresh();
			}
		};
	</script>
</head>
<body>
	<ext:ResourceManager runat="server" />

	<ext:GridPanel ID="GridPanel1" runat="server" Title="Simple Grid" Height="310" Width="500">
		<Store>
			<ext:Store ID="Store1" runat="server" PageSize="10">
				<Model>
					<ext:Model runat="server" IDProperty="Name">
						<Fields>
							<ext:ModelField Name="Name" />
							<ext:ModelField Name="Price" Type="Float" />
							<ext:ModelField Name="Change" Type="Float" />
							<ext:ModelField Name="PctChange" Mapping="PercentChange" Type="Float" />
							<ext:ModelField Name="LastChange" Type="Date" />
						</Fields>
					</ext:Model>
				</Model>
			</ext:Store>
		</Store>
		<ColumnModel>
			<Columns>
				<ext:RowNumbererColumn Width="25" />
				<ext:Column Text="Company" DataIndex="Name" Flex="1" />
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
		<SelectionModel>
			<ext:CheckboxSelectionModel runat="server" Mode="Multi" />
		</SelectionModel>
		<BottomBar>
			<ext:PagingToolbar runat="server" />
		</BottomBar>
		<TopBar>
			<ext:ToolBar>
				<Items>
					<ext:Button Icon="Delete" Text="Remove Selected">
						<Listeners>
							<Click Handler="MyApp.remove(#{GridPanel1});" />
						</Listeners>
					</ext:Button>
				</Items>
			</ext:ToolBar>
		</TopBar>
	</ext:GridPanel>
</body>
</html>