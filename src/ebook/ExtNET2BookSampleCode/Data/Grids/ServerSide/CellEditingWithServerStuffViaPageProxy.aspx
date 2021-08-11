<%@ Page Language="C#" %>
<%@ Import Namespace="ExtNET2BookSampleCode.Data.Grids.Shared" %>
<script runat="server">
	protected void Store1_ReadData(object sender, StoreReadDataEventArgs e)
	{
		int start = e.Start;
		int limit = e.Limit;

		string filters = e.Parameters["filter"];
		FilterConditions conditions = null;

		if (!string.IsNullOrWhiteSpace(filters))
		{
			conditions = new FilterConditions(filters);
		}
		
		Paging<CompanyData> data = GetData(start, limit, conditions);

		e.Total = data.TotalRecords;

		Store1.DataSource = data.Data;
		Store1.DataBind();
	}

	private Paging<CompanyData> GetData(int start, int limit, FilterConditions conditions)
	{
		var data = CompanyData.GetData();
		int totalNumber = data.Count;
		
		// TODO: apply filter conditions first, then paging
		
		int numberToGet = start + limit > totalNumber ? totalNumber - start : limit;
		return new Paging<CompanyData>(CompanyData.GetData().GetRange(start, numberToGet), totalNumber);
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
	<ext:ResourceManager runat="server" />

	<ext:Viewport runat="server" Layout="fit">
		<Items>
			<ext:GridPanel runat="server" Title="Simple Grid">
				<Store>
					<ext:Store Id="Store1" OnReadData="Store1_ReadData" runat="server" PageSize="10" RemoteSort="true" WarningOnDirty="true">
						<Model>
							<ext:Model runat="server" IDProperty="Id">
								<Fields>
									<ext:ModelField Name="Id" Type="Int" />
									<ext:ModelField Name="Company" Mapping="Name" />
									<ext:ModelField Name="Price" Type="Float" />
									<ext:ModelField Name="Change" Type="Float" />
									<ext:ModelField Name="PctChange" Mapping="PercentChange" Type="Float" />
									<ext:ModelField Name="LastChange" Type="Date" />
								</Fields>
							</ext:Model>
						</Model>
						<Proxy>
							<ext:PageProxy />
						</Proxy>
					</ext:Store>
				</Store>
				<ColumnModel>
					<Columns>
						<ext:Column Text="Id" DataIndex="Id" Width="25" />
						<ext:Column Text="Company" DataIndex="Company" Flex="1">
							<Editor>
								<ext:TextField runat="server" />
							</Editor>
						</ext:Column>
						<ext:NumberColumn Text="Price" DataIndex="Price" Width="75">                  
							<Renderer Format="UsMoney" />
							<Editor>
								<ext:NumberField runat="server" />
							</Editor>
						</ext:NumberColumn>
						<ext:NumberColumn Text="Change" DataIndex="Change" Width="60">
							<Renderer Fn="change" />
							<Editor>
								<ext:NumberField runat="server" />
							</Editor>
						</ext:NumberColumn>
						<ext:NumberColumn Text="Change" DataIndex="PctChange" Width="60">
							<Renderer Fn="pctChange" />
							<Editor>
								<ext:NumberField runat="server" />
							</Editor>
						</ext:NumberColumn>
						<ext:DateColumn Text="Last Updated" DataIndex="LastChange" Format="yyyy-MM-dd hh:mmtt" Width="130">
							<Editor>
								<ext:DateField runat="server" />
							</Editor>
						</ext:DateColumn>
					</Columns>
				</ColumnModel>
				<Plugins>
					<ext:CellEditing runat="server">
<%--
						<Listeners>
							<Edit Fn="edit" />
						</Listeners>
--%>
					</ext:CellEditing>
				</Plugins>
				<Features>
					<ext:GridFilters>
						<Filters>
							<ext:StringFilter DataIndex="Company" />
							<ext:NumericFilter DataIndex="Price" />
							<ext:NumericFilter DataIndex="Change" />
							<ext:NumericFilter DataIndex="PctChange" />
							<ext:DateFilter DataIndex="LastChange" />
						</Filters>
					</ext:GridFilters>
				</Features>
				<BottomBar>
					<ext:PagingToolbar runat="server" />
				</BottomBar>
			</ext:GridPanel>
		</Items>
	</ext:Viewport>    
</body>
</html>