<%@ Page Language="C#" %>
<script runat="server">
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!X.IsAjaxRequest)
		{
			Store1.DataSource = new object[]
			{
				new object[] { "AXP", "American Express Company" },
				new object[] { "BA", "Boeing Co." },
				new object[] { "CAT", "Caterpillar Inc." },
				new object[] { "ABC", "Blah" }
			};

			Store1.DataBind();
		}
	}
</script>
<!DOCTYPE html>
<html>
	<head>
		<title>Form Field Examples</title>
		<style>
			body { padding:10px; }
			.x-form-item { margin: 2.5em 0; }
		</style>
	</head>
	<body>
		<ext:ResourceManager runat="server" />

		<ext:DropDownField
			runat="server" 
			Editable="false" 
			Width="245" 
			FieldLabel="Symbol"
			LabelAlign="Top"
			TriggerIcon="Combo">
			<Component>
				<ext:GridPanel runat="server" Height="150">
					<Store>
						<ext:Store ID="Store1" runat="server" PageSize="3">
							<Model>
								<ext:Model runat="server">
									<Fields>
										<ext:ModelField Name="Symbol" />
										<ext:ModelField Name="Company" />
									</Fields>
								</ext:Model>
							</Model>
						</ext:Store>
					</Store>
					<ColumnModel runat="server">
						<Columns>
							<ext:Column Text="Symbol" DataIndex="Symbol" Width="60" />
							<ext:Column Text="Company" DataIndex="Company" Flex="1" />
							<ext:CommandColumn Align="Center" OverOnly="true" Width="25">
								<Commands>
									<ext:GridCommand Icon="Accept" CommandName="pick" />
								</Commands>
								<Listeners>
									<Command Handler="this.grid.dropDownField.setValue(record.data.Symbol);" />
								</Listeners>
							</ext:CommandColumn>
						</Columns>
					</ColumnModel>
					<BottomBar>
						<ext:PagingToolbar runat="server" />
					</BottomBar>
				</ext:GridPanel>
			</Component>
		</ext:DropDownField>
	</body>
</html>
