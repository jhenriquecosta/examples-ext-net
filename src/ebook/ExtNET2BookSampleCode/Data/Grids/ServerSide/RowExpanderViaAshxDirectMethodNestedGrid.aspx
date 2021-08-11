<%@ Page Language="C#" %>
<%@ Import Namespace="ExtNET2BookSampleCode.Data.Grids.Shared" %>
<script runat="server">
	[DirectMethod]
	public static List<PriceHistory> GetPriceHistory(string symbol)
	{
		return new List<PriceHistory>
		{
			new PriceHistory { Date = DateTime.Parse("2012-06-01"), Price = 56.50, PercentChange=1.00 },
			new PriceHistory { Date = DateTime.Parse("2012-05-01"), Price = 56.01, PercentChange=1.5 },
			new PriceHistory { Date = DateTime.Parse("2012-04-01"), Price = 53.20, PercentChange=0.2 },
			new PriceHistory { Date = DateTime.Parse("2012-03-01"), Price = 54, PercentChange=-0.15 },
			new PriceHistory { Date = DateTime.Parse("2012-02-01"), Price = 55.01, PercentChange=-0.1 },
			new PriceHistory { Date = DateTime.Parse("2012-01-01"), Price = 56.00, PercentChange=0.00 }
		};
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

		.company-details { margin:3px; padding:3px; border:1px solid #ccc; background:#fff; }
		.perf { float: right; width: 170px; padding:5px; }
	</style>

	<script type="text/javascript">
		var template = '<span class="{0}">{1}</span>';

		var change = function(value) {
			return Ext.String.format(template, (value > 0) ? "positive" : "negative", value);
		};

		var pctChange = function(value) {
			return Ext.String.format(template, (value > 0) ? "positive" : "negative", value + "%");
		};

		var cache = {};

		var onExpand = function(symbol, nestedGrid) {
			if (cache.hasOwnProperty(symbol)) {
				nestedGrid.getView().refresh();
				return;
			}

			App.direct.GetPriceHistory(
				symbol,
				{
					success: function(history) {
						nestedGrid.getStore().loadData(history);
						cache[symbol] = true;
					},
					eventMask: { showMask: true }
				}
			);
		};
	</script>
</head>
<body>
	<ext:ResourceManager runat="server" />

	<ext:GridPanel runat="server" Title="Simple Grid" Height="310" Width="500">
		<Store>
			<ext:Store runat="server" PageSize="10">
				<Model>
					<ext:Model runat="server">
						<Fields>
							<ext:ModelField Name="Company" Mapping="Name"  />
							<ext:ModelField Name="Price" Type="Float" />
							<ext:ModelField Name="Change" Type="Float" />
							<ext:ModelField Name="PctChange" Mapping="PercentChange" Type="Float" />
							<ext:ModelField Name="LastChange" Type="Date" />
							<ext:ModelField Name="Symbol" />
						</Fields>
					</ext:Model>
				</Model>
				<Proxy>
					<ext:AjaxProxy Url="../Shared/FinancialData.ashx">
						<Reader>
							<ext:JsonReader Root="data" />
						</Reader>
					</ext:AjaxProxy>
				</Proxy>
			</ext:Store>
		</Store>
		<ColumnModel>
			<Columns>
				<ext:Column Text="Company" DataIndex="Company" Flex="1" />
				<ext:Column Text="Price" DataIndex="Price" Width="50">                  
					<Renderer Format="UsMoney" />
				</ext:Column>
				<ext:Column Text="Change" DataIndex="Change" Width="50">
					<Renderer Fn="change" />
				</ext:Column>
				<ext:Column Text="Change" DataIndex="PctChange" Width="50">
					<Renderer Fn="pctChange" />
				</ext:Column>
				<ext:DateColumn Text="Last Updated" DataIndex="LastChange" Format="yyyy-MM-dd hh:mmtt" Width="130" />
			</Columns>
		</ColumnModel>
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
		<Plugins>
			<ext:RowExpander runat="server" SingleExpand="true">
				<Listeners>
					<Expand Handler="onExpand(record.data.Symbol, #{NestedGrid});" />
				</Listeners>
				<Component>
					<ext:GridPanel Id="NestedGrid" runat="server" Title="Monthly Average" Height="150" Padding="10">
						<Store>
							<ext:Store>
								<Model>
									<ext:Model>
										<Fields>
											<ext:ModelField Name="Price" Type="Float" />
											<ext:ModelField Name="PercentChange" Type="Float" />
											<ext:ModelField Name="Date" Type="Date" />
										</Fields>
									</ext:Model>
								</Model>
							</ext:Store>
						</Store>
						<ColumnModel>
							<Columns>
								<ext:DateColumn Text="Last Updated" DataIndex="Date" Format="MM-yyyy" Hideable="false" />
								<ext:Column Text="Price" DataIndex="Price" Width="50" Hideable="false">
									<Renderer Format="UsMoney" />
								</ext:Column>
								<ext:Column Text="Change" DataIndex="PercentChange" Width="50" Hideable="false">
									<Renderer Fn="pctChange" />
								</ext:Column>
								<%-- 
								// an example of using a command column in the nested grid
								<ext:CommandColumn runat="server" Width="60">
									<Commands>
										<ext:GridCommand Icon="Delete" CommandName="Delete">
											<ToolTip Text="Delete" />
										</ext:GridCommand>
										<ext:CommandSeparator />
										<ext:GridCommand Icon="NoteEdit" CommandName="Edit">
											<ToolTip Text="Edit" />
										</ext:GridCommand>
									</Commands>
									<Listeners>
										<Command Handler="Ext.Msg.alert(command, record.data.Price);" />
									</Listeners>
								</ext:CommandColumn>
								--%>
							</Columns>
						</ColumnModel>
					</ext:GridPanel>
				</Component>
			</ext:RowExpander>
		</Plugins>
		<BottomBar>
			<ext:PagingToolbar runat="server" />
		</BottomBar>
	</ext:GridPanel>
</body>
</html>