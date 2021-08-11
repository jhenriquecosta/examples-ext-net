<%@ Page Language="C#" %>
<script runat="server">
	protected void EmployeeStore_ReadData(object sender, StoreReadDataEventArgs e)
	{
		DataSource.SelectParameters["start"].DefaultValue = e.Start.ToString();
		DataSource.SelectParameters["limit"].DefaultValue = e.Limit.ToString();

		EmployeeStore.DataBind();
	}
	
	private void DataSource_Selected(object sender, ObjectDataSourceStatusEventArgs e)
	{
		((PageProxy)EmployeeStore.Proxy[0]).Total = (int)e.OutputParameters["totalCount"];
	}
</script>
<!DOCTYPE html>
<html>
<head>
	<title>Example</title>
	<style>
		body { padding:10px; }
		
		.info-old { padding: 4px; margin-bottom: 4px; border-bottom: 1px solid #ccc; }
		.info-old p { line-height: 1.6; }
		
		.info {
			margin: 14px 1% 0 2%;
			padding: 4px;
			width: 46%;
			float: left;
			border: 1px solid #ddd;
			border-radius: 4px;
			box-shadow: 2px 2px 2px #999;
		}
		.info:first-child, .info:nth-child(4) { background-color:#eee; }
		.info p { line-height: 1.6; }
		.info a { color: #37d; }
		.info img { float: left; margin: 0 10px 0 0; }
	</style>
	<script type="text/javascript">
		var MyApp = {
			employee: {
				prepareData: function(data) {
					data.IsManagerText = data.IsManager === true ? 'Yes' : 'No';
					return data;
				} 
			}
		};
	</script>
</head>
<body>
	<ext:ResourceManager runat="server" />

	<asp:ObjectDataSource
		ID="DataSource"
		runat="server"
		SelectMethod="GetData"
		TypeName="ExtNET2BookSampleCode.Data.DataView.Simple.Employee"
		OnSelected="DataSource_Selected">
		<SelectParameters>
			<asp:Parameter Name="start" DefaultValue="0" Type="Int32" />
			<asp:Parameter Name="limit" DefaultValue="5" Type="Int32" />
			<asp:Parameter Name="totalCount" Direction="Output" Type="Int32" />
		</SelectParameters>
	</asp:ObjectDataSource>

	<ext:Panel runat="server" Title="Employees" Icon="Group" AutoScroll="true" Width="500" Height="330">
		<Items>
			<ext:DataView runat="server" ItemSelector=".info">
				<Store>
					<ext:Store
						ID="EmployeeStore"
						runat="server"
						PageSize="5"
						DataSourceId="DataSource"
						OnReadData="EmployeeStore_ReadData">
						<Model>
							<ext:Model runat="server" IDProperty="Id">
								<Fields>
									<ext:ModelField Name="Id" />
									<ext:ModelField Name="FirstName" />
									<ext:ModelField Name="LastName" />      
									<ext:ModelField Name="DateOfBirth" Type="Date" />
									<ext:ModelField Name="Age" Type="Int" />
									<ext:ModelField Name="IsManager" Type="Boolean" />
								</Fields>
							</ext:Model>
						</Model>
						<Proxy>
							<ext:PageProxy />
						</Proxy>
					</ext:Store>
				</Store>
				<Tpl runat="server">
					<Html>
						<tpl for=".">
							<div class="info">
								<img src="/images/employees/{Id}.png" height="90" width="90" alt="Employee {Id}" />
								<p><a href="/details/{Id}">Employee {Id}</a></p>
								<p>{FirstName} {LastName}</p>
								<p>Dob: {DateOfBirth:date("m/d/Y")}</p>
								<p>Age: {Age}</p>
								<p>Is Manager? {IsManagerText}</p>
							</div>
						</tpl>
					</Html>
				</Tpl>
				<PrepareData Fn="MyApp.employee.prepareData" />
			</ext:DataView>
		</Items>
		<BottomBar>
			<ext:PagingToolbar runat="server" StoreID="EmployeeStore" />
		</BottomBar>
	</ext:Panel>
</body>
</html>
