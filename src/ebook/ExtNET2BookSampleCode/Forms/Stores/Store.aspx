<%@ Page Language="C#" %>

<script runat="server">
	private static List<Data> dataSource;

	public static List<Data> DataSource
	{
		get
		{
			if (dataSource == null || dataSource.Count == 0)
			{
				dataSource = new List<Data>(5);
				
				for (int i = 1; i <= 5; i++)
				{
					var data = new Data
					{
						Id = i,
						Company = "Company" + i,
						Price = i*10,
						Change = i,
						LastChange = DateTime.Now.AddDays(i)
					};
					dataSource.Add(data);
				}
			}

			return dataSource;
		}
	}

	private Data GetByID(int id)
	{
		return DataSource.FirstOrDefault(data => data.Id == id);
	}

	private int GetMaxID()
	{
		int id = DataSource.Select(data => data.Id).Concat(new[] {0}).Max();

		return id + 1;
	}

	protected void Page_Load(object sender, EventArgs e)
	{
	}

	protected void FetchRecord(object sender, StoreReadDataEventArgs e)
	{
		Store1.DataSource = new List<Data> { DataSource[e.Start] };
		Store1.DataBind();

		e.Total = DataSource.Count;
	}

	protected void DeleteClick(object sender, DirectEventArgs e)
	{
		int id = int.Parse(e.ExtraParams["recordId"]);
		Data data = GetByID(id);

		int index = DataSource.IndexOf(data);
		DataSource.Remove(data);

		if (index == DataSource.Count)
		{
			index--;
		}

		if (index >= 0)
		{
			Store1.LoadPage(index + 1);
		}
	}

	protected void AddClick(object sender, DirectEventArgs e)
	{
		var data = new Data {Id = GetMaxID()};
		DataSource.Add(data);
		Store1.LoadPage(DataSource.Count);
	}

	protected void SaveClick(object sender, DirectEventArgs e)
	{
		// TODO - use e.Params to get the form data, for example, and process it
	}

	public class Data
	{
		public int Id { get; set; }
		public string Company { get; set; }
		public float Price { get; set; }
		public float Change { get; set; }
		public DateTime LastChange { get; set; }
	}
</script>

<!DOCTYPE html>

<html>
<head runat="server">
	<title>Edit Form View Examples</title>
</head>
<body>
	<form runat="server">
		<ext:ResourceManager runat="server" />
		
		<ext:Store ID="Store1" runat="server" OnReadData="FetchRecord" PageSize="1">
			<Proxy>
				<ext:PageProxy />
			</Proxy>
			<Model>
				<ext:Model runat="server">
					<Fields>
						<ext:ModelField Name="ID" />
						<ext:ModelField Name="Company" />
						<ext:ModelField Name="Price" Type="Float" />
						<ext:ModelField Name="Change" Type="Float" />
						<ext:ModelField Name="LastChange" Type="Date" />
					</Fields>
				</ext:Model>
			</Model>
			<Listeners>
				<DataChanged Handler="
					var record = this.getAt(0) || {};
					#{FormPanel1}.getForm().loadRecord(record);
					#{FormPanel1}.clearInvalid();" />
			</Listeners>
		</ext:Store>
		
		<ext:Window 
			runat="server"
			Title="Form running off a store" 
			Width="420" 
			Height="215"           
			Layout="Fit">
			<Items>
				<ext:FormPanel 
					ID="FormPanel1" 
					runat="server" 
					Border="false" 
					BodyPadding="10"
					DefaultAnchor="-10"
					Layout="Form">
					<Items>
						<ext:TextField 
							Name="Company" 
							MsgTarget="Side" 
							AllowBlank="false"
							FieldLabel="Company" 
							/>
						<ext:NumberField 
							Name="Price" 
							MsgTarget="Side" 
							AllowBlank="false"
							FieldLabel="Price" 
							/>
						<ext:NumberField 
							Name="Change" 
							MsgTarget="Side" 
							AllowBlank="false"
							FieldLabel="Change" 
							/>
						<ext:DateField 
							Name="LastChange" 
							MsgTarget="Side" 
							AllowBlank="false"
							FieldLabel="Last change" 
							/>
					</Items>
					<Listeners>
						<ValidityChange Handler="#{btnSaveRecord}.setDisabled(!valid);" />
					</Listeners>
				</ext:FormPanel>
			</Items>
			<TopBar>
				<ext:Toolbar runat="server">
					<Items>
						<ext:Button runat="server" Icon="Add" Text="Add">
							<DirectEvents>
								<Click OnEvent="AddClick" />
							</DirectEvents>
						</ext:Button>
						<ext:Button runat="server" Icon="Delete" Text="Delete">
							<DirectEvents>
								<Click OnEvent="DeleteClick" Success="Ext.Msg.alert('Action', 'Deleted');">
									<ExtraParams>
										<ext:Parameter Name="recordId" Value="#{Store1}.getAt(0).data.ID" Mode="Raw" />
									</ExtraParams>
								</Click>
							</DirectEvents>
						</ext:Button>
						<ext:ToolbarFill runat="server" />
						<ext:Button 
							ID="btnSaveRecord" 
							runat="server" 
							Icon="Disk" 
							Text="Save" 
							Disabled="true">
							<DirectEvents>
								<Click 
									OnEvent="SaveClick" 
									Before="return #{FormPanel1}.getForm().isValid();" 
									Success="Ext.Msg.alert('', 'Saved');">
									<ExtraParams>
										<ext:Parameter Name="recordId" Value="#{Store1}.getAt(0).data.ID" Mode="Raw" />
									</ExtraParams>
								</Click>
							</DirectEvents>
						</ext:Button>
					</Items>
				</ext:Toolbar>
			</TopBar>
			<BottomBar>
				<ext:PagingToolbar 
					ID="Pager1" 
					runat="server" 
					StoreID="Store1" 
					DisplayInfo="false" />
			</BottomBar>
		</ext:Window>
	</form>
</body>
</html>