<%@ Page Language="C#" %>
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
	</script>
</head>
<body>
	<ext:ResourceManager runat="server" />

	<ext:GridPanel runat="server" Title="Simple Grid" Width="500" Height="290">
		<Store>
			<ext:Store runat="server" PageSize="10" RemoteSort="true" WarningOnDirty="true" AutoSync="true">
				<Model>
					<ext:Model runat="server" IDProperty="Id">
						<Fields>
							<ext:ModelField Name="Company" Mapping="Name" />
							<ext:ModelField Name="Price" Type="Float" />
							<ext:ModelField Name="Change" Type="Float" />
							<ext:ModelField Name="PctChange" Mapping="PercentChange" Type="Float" />
							<ext:ModelField Name="LastChange" Type="Date" />
						</Fields>
					</ext:Model>
				</Model>
				<Proxy>
					<ext:AjaxProxy Url="../Shared/FinancialData.ashx">
						<Reader>
							<ext:JsonReader Root="data" />
						</Reader>
						<Writer>
							<ext:JsonWriter Root="data" Encode="true" WriteAllFields="false" />
						</Writer>
						<API Update="../Shared/FinancialDataUpdate.ashx" />
					</ext:AjaxProxy>
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
			<ext:CellEditing runat="server" />
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
</body>
</html>