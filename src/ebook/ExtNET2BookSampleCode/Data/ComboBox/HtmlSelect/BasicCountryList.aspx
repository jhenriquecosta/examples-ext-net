<%@ Page Language="C#" %>
<script runat="server">
	protected void Page_Load(object sender, EventArgs e)
	{
		var store = ComboBox1.GetStore();

		store.DataSource = new object[]
		{
			new object[] {"France"},
			new object[] {"Canada"},
			new object[] {"Germany"},
			new object[] {"Italy"},
			new object[] {"United Kingdom"},
			new object[] {"United States of America"}
		};
		
		store.DataBind();
	}
</script>
<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Example</title>
		<style>
			body { padding: 10px; }
			#Label1 { margin-top: 10px; display: block; }
		</style>
	</head>
	<body>
		<ext:ResourceManager runat="server" />

		<ext:ComboBox 
			ID="ComboBox1"
			runat="server"
			Width="250"
			EmptyText="Select a country"
			DisplayField="name">
			<Store>
				<ext:Store>
					<Model>
						<ext:Model>
							<Fields>
								<ext:ModelField Name="name" />
							</Fields>
						</ext:Model>
					</Model>            
				</ext:Store>
			</Store>
			<Listeners>
				<Select Handler="
					#{Label1}.setText('You selected ' + this.getRawValue());"
				/>
			</Listeners>
		</ext:ComboBox>
		
		<ext:Label runat="server" ID="Label1" />
	</body>
</html>
