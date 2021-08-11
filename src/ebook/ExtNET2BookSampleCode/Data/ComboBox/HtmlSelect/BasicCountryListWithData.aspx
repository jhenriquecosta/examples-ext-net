<%@ Page Language="C#" %>
<%@ Import Namespace="ExtNET2BookSampleCode.Data.ComboBox.HtmlSelect" %>
<script runat="server">
	protected void Page_Load(object sender, EventArgs e)
	{
		var store = ComboBox1.GetStore();

		// OECD Stats as source for GDP and Population data:
		// http://stats.oecd.org/Index.aspx?DatasetCode=SNA_TABLE1
		
		store.DataSource = new List<CountryInfo>
		{
		    new CountryInfo { Icon = Icon.FlagCa, Name = "Canada", Gdp = 1.4, Population = 34 },
		    new CountryInfo { Icon = Icon.FlagFr, Name = "France", Gdp = 2.3, Population = 63 },
		    new CountryInfo { Icon = Icon.FlagDe, Name = "Germany", Gdp = 3.2, Population = 83 },
		    new CountryInfo { Icon = Icon.FlagGb, Name = "United Kingdom", Gdp = 2.3, Population = 63 },
		    new CountryInfo { Icon = Icon.FlagUs, Name = "United States of America", Gdp = 15.0, Population = 313}
		};
		
		store.DataBind();

		var manager = ResourceManager.GetInstance();

		manager.RegisterIcon(Icon.FlagCa);
		manager.RegisterIcon(Icon.FlagFr);
		manager.RegisterIcon(Icon.FlagDe);
		manager.RegisterIcon(Icon.FlagGb);
		manager.RegisterIcon(Icon.FlagUs);
	}
</script>
<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Example</title>
		<style>
			body { padding: 10px; }
			#Label1 { margin-top: 10px; display: block; }
			.icon-combo-item {
				background-repeat   : no-repeat !important;
				background-position : 3px 3px !important;
				padding-left        : 24px !important;
				font-weight: bold;
				line-height: 1.4;
			}
			.icon-combo-item .details { font-weight: normal; font-size: 0.9em; }
		</style>
	</head>
	<body>
		<ext:ResourceManager Id="ResourceManager1" runat="server" />

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
								<ext:ModelField Name="icon" Mapping="IconClass" />
								<ext:ModelField Name="name" Mapping="Name"/>
								<ext:ModelField Name="gdp" Mapping="Gdp" Type="Int" />
								<ext:ModelField Name="population" Mapping="Population" Type="Float" />
							</Fields>
						</ext:Model>
					</Model>
				</ext:Store>
			</Store>
			<ListConfig>
				<ItemTpl>
					<Html>
						<div class="icon-combo-item {icon}">
							{name}
							<div class="details">
								<p>2011 Population (millions): {population}</p>
								<p>2011 GDP (trillions): ${gdp}</p>
							</div>
						</div>
					</Html>
				</ItemTpl>
			</ListConfig>
			<Listeners>
				<Select Handler="
					#{Label1}.setText('Icon selected ' + this.getRawValue());"
				/>
			</Listeners>
		</ext:ComboBox>
		
		<ext:Label runat="server" ID="Label1" />
	</body>
</html>
