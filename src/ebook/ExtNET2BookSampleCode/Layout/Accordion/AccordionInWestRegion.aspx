<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Accordion in West region</title>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Viewport runat="server" Layout="Border">
			<Items>
				<ext:Panel region="West" Split="true" Title="West" Width="200" Collapsible="true" Layout="Accordion">
					<Items>
						<ext:TreePanel Title="Folders" Icon="Email" AutoScroll="true" RootVisible="false">
							<Root>
								<ext:Node>
									<Children>
										<ext:Node Text="Inbox (100)" Expanded="true">
											<Children>
												<ext:Node Text="Important (5)" Icon="Exclamation" Leaf="true" />
												<ext:Node Text="Saved searches (6)" Icon="Magnifier" Leaf="true" />
											</Children>
										</ext:Node>
										<ext:Node Icon="EmailStop" Text="Outbox" Expanded="false" Leaf="true" />
										<ext:Node Icon="EmailGo" Text="Sent items (300)" Expanded="false" Leaf="true" />
										<ext:Node Text="Private" Expanded="false" Leaf="true" />
									</Children>
								</ext:Node>
							</Root>
						</ext:TreePanel>
						<ext:Panel Title="Calendar" Icon="Date" />
						<ext:Panel Title="Contacts" Icon="Group" />
					</Items>
				</ext:Panel>
				<ext:TabPanel region="Center">
					<Items>
						<ext:Panel Title="First Tab" />
						<ext:Panel Title="Second Tab" />
					</Items>
				</ext:TabPanel>
			</Items>
		</ext:Viewport>
	</body>
</html>
