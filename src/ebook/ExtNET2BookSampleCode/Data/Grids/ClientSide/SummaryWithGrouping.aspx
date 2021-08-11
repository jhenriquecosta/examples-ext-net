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
</script>

<!DOCTYPE html>
<html>
<head runat="server">
	<title>Simple Grid - Ext.NET Examples</title>

	<style type="text/css">
		body { padding:10px; }
		
		.positive { color: green; }
		.negative { color: red; }

		.x-grid-row-summary .x-grid-cell-inner {
			font-weight      : bold;
			font-size        : 11px;
			background-color : #f1f2f4;
		}
	</style>

	<script type="text/javascript">
		var template = '<span class="{0}">{1}</span>';

		var change = function(value) {
			return Ext.String.format(template, (value > 0) ? "positive" : "negative", value);
		};

		var pctChange = function(value) {
			var renderer = Ext.util.Format.numberRenderer('0.00');

			return Ext.String.format(template, (value > 0) ? "positive" : "negative", renderer(value) + "%");
		};

		var App = {
			formatGroupSummary: function(values) {
				var rows = values.rows,
					numRows = rows.length,
					prefix = rows.length > 1 ? "Items" : "Item";

				return Ext.String.format("({0} {1})", numRows, prefix);
			}
		};
	</script>
</head>
<body>
	<ext:ResourceManager runat="server" />

	<ext:GridPanel runat="server" Title="Simple Grid" Height="300" Width="500">
		<Store>
			<ext:Store ID="Store1" runat="server" PageSize="10">
				<Model>
					<ext:Model runat="server">
						<Fields>
							<ext:ModelField Name="Company" Mapping="Name"  />
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
				<ext:SummaryColumn Text="Company" DataIndex="Company" Flex="1" Groupable="false" SummaryType="Count">
					<SummaryRenderer Handler="return '(' + value +' Companies)';" />
				</ext:SummaryColumn>
				<ext:SummaryColumn Text="Price" DataIndex="Price" Width="50" Groupable="false" SummaryType="Average">
					<Renderer Format="UsMoney" />
					<SummaryRenderer Fn="Ext.util.Format.usMoney" />
				</ext:SummaryColumn>
				<ext:SummaryColumn Text="Change" DataIndex="Change" Width="50" SummaryType="Average" />
				<ext:SummaryColumn Text="Change" DataIndex="PctChange" Width="50" SummaryType="Average">
					<Renderer Fn="pctChange" />
					<SummaryRenderer Fn="pctChange" />
				</ext:SummaryColumn>
				<ext:DateColumn Text="Last Updated" DataIndex="LastChange" Format="yyyy-MM-dd hh:mmtt" Width="130" />
			</Columns>
		</ColumnModel>
		<Features>
			<ext:GridFilters Local="true">
				<Filters>
					<ext:StringFilter DataIndex="Company" />
					<ext:NumericFilter DataIndex="Price" />
					<ext:NumericFilter DataIndex="Change" />
					<ext:NumericFilter DataIndex="PctChange" />
					<ext:DateFilter DataIndex="LastChange" />
				</Filters>
			</ext:GridFilters>
			<ext:GroupingSummary GroupHeaderTplString="{columnName}: {name} {[App.formatGroupSummary(values)]}" />
		</Features>
		<BottomBar>
			<ext:PagingToolbar runat="server" />
		</BottomBar>
	</ext:GridPanel>
</body>
</html>