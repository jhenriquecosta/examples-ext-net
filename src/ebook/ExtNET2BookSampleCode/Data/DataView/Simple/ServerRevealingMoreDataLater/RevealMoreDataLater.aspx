<%@ Page Language="C#" %>

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
			text-align: center; 
		}
		.info:hover { box-shadow: 2px 2px 2px #37d; border-color: #59f; cursor: pointer; }
		.info:first-child, .info:nth-child(4) { background-color:#eee; }
		.info p { line-height: 1.6; }
		.info a { color: #37d; }
		.info img { display:block; margin: 0 auto 10px; }
		
		.details { padding: 10px; }
		.details p { margin-bottom: 1em; }
		.details img { display: block; margin: auto; }
	</style>
	<script type="text/javascript">
		var MyApp = {
			employee: {
				prepareData: function(data) {
					data.IsManagerText = data.IsManager === true ? 'Yes' : 'No';
					return data;
				},

				filter: function(text, store) {
					store.filter('FirstName', text);
				}
			}
		};
	</script>
</head>
<body>
	<ext:ResourceManager runat="server" />
	 
	<ext:Container runat="server" Layout="Border" Width="530" Height="330">
		<Items>
			<ext:Panel runat="server" Title="Employees" Icon="Group" AutoScroll="true" Region="Center">
				<Items>
					<ext:DataView runat="server" ItemSelector=".info">
						<Store>
							<ext:Store Id="EmployeeStore" runat="server" PageSize="5" RemoteSort="true" RemoteFilter="true">
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
									<ext:AjaxProxy Url="EmployeesRetriever.ashx">
										<ActionMethods Read="GET" />
										<Reader>
											<ext:JsonReader Root="data" />
										</Reader>
									</ext:AjaxProxy>
								</Proxy>
							</ext:Store>
						</Store>
						<Tpl runat="server">
							<Html>
								<tpl for=".">
									<div class="info">
										<img src="/images/employees/{Id}.png" height="90" width="90" alt="Employee {Id}" />
										<p>{FirstName} {LastName}</p>
									</div>
								</tpl>
							</Html>
						</Tpl>
						<PrepareData Fn="MyApp.employee.prepareData" />
						<Listeners>
							<SelectionChange Handler="if (selections[0]) {
								App.DetailsPanel.loadRecord(selections[0]);
							}" />
						</Listeners>
					</ext:DataView>
				</Items>
				<TopBar>
					<ext:Toolbar runat="server">
						<Items>
							<ext:ToolbarTextItem Text="Filter:" runat="server" />
							<ext:TextField Id="FilterText" EmptyText="Filter" runat="server" />
							<ext:Button Icon="Find" runat="server">
								<Listeners>
									<Click Handler="MyApp.employee.filter(
										#{FilterText}.getValue(),
										#{EmployeeStore});" />
								</Listeners>
							</ext:Button>
							<ext:ToolbarSeparator runat="server" />
							<ext:Button Icon="BulletArrowDown" runat="server" Text="Sort by LastName Descending">
								<Listeners>
									<Click Handler="#{EmployeeStore}.sort('LastName', 'DESC');" />
								</Listeners>
							</ext:Button>
						</Items>
					</ext:Toolbar>
				</TopBar>
				<BottomBar>
					<ext:PagingToolbar runat="server" StoreID="EmployeeStore" />
				</BottomBar>
			</ext:Panel>
			<ext:Panel Id="DetailsPanel" runat="server" Title="Details" BodyCls="details" Region="East" Width="150" Html="Please select an employee to see details">
				<Tpl runat="server">
					<Html>
						<tpl for=".">
							<img src="/images/employees/{Id}.png" height="90" width="90" alt="Employee {Id}" />
							<h2>Name</h2>
							<p>{FirstName} {LastName}</p>

							<h2>Employee Id</h2>
							<p>{Id}</p>

							<h2>Date of Birth</h2>
							<p>{DateOfBirth:date("m/d/Y")} ({Age})</p>

							<h2>Role</h2>
							<p>
								<tpl if="IsManager === true">
									Manager
								<tpl else>
									Subordinate
								</tpl>
							</p>
								
							<p><a href="/Details/{Id}">More details</a></p>
						</tpl>
					</Html>
				</Tpl>
				<CustomConfig>
					<ext:ConfigItem Name="loadRecord" Value="function(employeeStore) {
							this.update(employeeStore.data);
						}" 
						Mode="Raw" />
				</CustomConfig>
			</ext:Panel>
		</Items>
	</ext:Container>
</body>
</html>
