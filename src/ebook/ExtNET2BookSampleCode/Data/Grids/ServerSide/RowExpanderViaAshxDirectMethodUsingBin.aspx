<%@ Page Language="C#" %>
<%@ Import Namespace="ExtNET2BookSampleCode.Data.Grids.Shared" %>
<script runat="server">
	[DirectMethod]
	public static string GetCompanyDescription(string symbol)
	{
		return CompanyData.GetData().First(data => data.Symbol == symbol).Description;
	}
</script>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Simple Grid - Ext.NET Examples</title>

	<style type="text/css">
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

		var onExpand = function(data, template, container) {
			if (data.Description != undefined)
				return;
			
			App.direct.GetCompanyDescription(
				data.Symbol,
				{
					success: function(description) {
						data.Description = description;
						template.overwrite(container.getEl(), data);
					},
					eventMask: { showMask: true }
				}
			);
		};
	</script>
</head>
<body>
	<ext:ResourceManager runat="server" />
	
	<h1>As this is sample data, Expand American Express Row only</h1>

	<ext:GridPanel runat="server" Title="Simple Grid" Width="500" Height="290">
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
			<ext:RowExpander runat="server" SingleExpand="false">
				<Listeners>
					<Expand Handler="onExpand(
						record.data,
						#{CompanyDetailsTemplate},
						#{CompanyDetailsContainer});"
					/>
				</Listeners>
				<Component>
					<ext:Container Id="CompanyDetailsContainer" />
				</Component>
			</ext:RowExpander>
		</Plugins>
		<Bin>
			<ext:XTemplate ID="CompanyDetailsTemplate" runat="server">
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
			</ext:XTemplate>
		</Bin>
		<BottomBar>
			<ext:PagingToolbar runat="server" />
		</BottomBar>
	</ext:GridPanel>
</body>
</html>