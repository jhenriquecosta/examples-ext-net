<%@ Page Language="C#" %>
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
					<ext:Store runat="server" PageSize="10">
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
						<ext:RowNumbererColumn Width="25" />
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
				<BottomBar>
					<ext:PagingToolbar runat="server" />
				</BottomBar>
			</ext:GridPanel>
		</Items>
	</ext:Viewport>    
</body>
</html>