<%@ Page Language="C#" %>
<%@ Import Namespace="ExtNET2BookSampleCode.Data.ComboBox.HtmlSelect" %>
<script runat="server">
	protected void Page_Load(object sender, EventArgs e)
	{
		var manager = ResourceManager.GetInstance();
		foreach (CountryInfo countryInfo in CountryInfo.GetData(0, CountryInfo.TotalDataCount))
		{
			manager.RegisterIcon(countryInfo.Icon);
		}
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
			DisplayField="name"
			PageSize="5">
			<Store>
				<ext:Store runat="server" AutoLoad="false" IsPagingStore="true" PageSize="5">
					<Model>
						<ext:Model runat="server">
							<Fields>
								<ext:ModelField Name="icon" Mapping="IconClass" />
								<ext:ModelField Name="name" Mapping="Name"/>
								<ext:ModelField Name="gdp" Mapping="Gdp" Type="Int" />
								<ext:ModelField Name="population" Mapping="Population" Type="Float" />
							</Fields>
						</ext:Model>
					</Model>
					<Proxy>
						<ext:AjaxProxy Url="CountryData.ashx">
							<ActionMethods Read="GET" />
							<Reader>
								<ext:JsonReader Root="data" />
							</Reader>
						</ext:AjaxProxy>
					</Proxy>
				</ext:Store>
			</Store>
			<ListConfig>
				<ItemTpl runat="server">
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
