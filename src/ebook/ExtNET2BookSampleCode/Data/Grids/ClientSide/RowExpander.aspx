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
		
		.company-details { margin:3px; padding:3px; border:1px solid #ccc; background:#fff; }
		.perf { float: right; width: 170px; padding:5px; }
		
		.note { font-weight:bold; border:1px solid #aaa; margin-bottom:1em; padding:1em; }
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
	
	<p class="note">Expand the "American Express Company" row to see additional data (other rows have not had their dummy data set up).</p>

	<ext:GridPanel runat="server" Title="Simple Grid" Height="340" Width="500">
		<Store>
			<ext:Store ID="Store1" runat="server" PageSize="10">
				<Model>
					<ext:Model runat="server">
						<Fields>
							<ext:ModelField Name="Company" Mapping="Name" />
							<ext:ModelField Name="Price" Type="Float" />
							<ext:ModelField Name="Change" Type="Float" />
							<ext:ModelField Name="PctChange" Mapping="PercentChange" Type="Float" />
							<ext:ModelField Name="LastChange" Type="Date" />
							<ext:ModelField Name="Description" />
							<ext:ModelField Name="Symbol" />
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
		</Features>
		<Plugins>
			<ext:RowExpander runat="server" SwallowBodyEvents="true">
				<Listeners>
					<Collapse Handler="console.log(arguments);" />
					<Expand Handler="console.log(arguments);" />
				</Listeners>
				<Template runat="server">
					<Html>
						<div class="company-details">
							<div class="perf">
								<h2>Recent Stock Performance</h2>
								<img alt="" src="/images/perf/{Symbol}.png" width="160" height="160" />
							</div>

							<h2>Company:</h2>
							<p>{Company}</p>

							<h2>Description:</h2>
							<p>{Description}</p>
						</div>
					</Html>
				</Template>
			</ext:RowExpander>
		</Plugins>
		<BottomBar>
			<ext:PagingToolbar runat="server" />
		</BottomBar>
	</ext:GridPanel>
</body>
</html>