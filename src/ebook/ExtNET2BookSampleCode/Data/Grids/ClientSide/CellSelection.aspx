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
	
	protected void Cell_Click(object sender, DirectEventArgs e)
	{
		var sm = GridPanel1.GetSelectionModel() as CellSelectionModel;
		X.Msg.Notify("Cell selected",
			string.Format("RecordID: {0}<br />Name: {1}<br />Value: {2}<br />Row: {3}<br />Column: {4}",
				sm.SelectedCell.RecordID,
				sm.SelectedCell.Name,
				sm.SelectedCell.Value,
				sm.SelectedCell.RowIndex,
				sm.SelectedCell.ColIndex)).Show();
	}
</script>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Simple Grid - Ext.NET Examples</title>

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

		<ext:Viewport runat="server" Layout="fit">
			<Items>
				<ext:GridPanel Id="GridPanel1" runat="server" Title="Simple Grid">
					<Store>
						<ext:Store ID="Store1" runat="server" PageSize="10">
							<Model>
								<ext:Model runat="server" IDProperty="Id">
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
						<ext:CellSelectionModel runat="server">
							<DirectEvents>
								<Select OnEvent="Cell_Click" />
							</DirectEvents>
						</ext:CellSelectionModel>
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
			</Items>
		</ext:Viewport>
	</form>
</body>
</html>