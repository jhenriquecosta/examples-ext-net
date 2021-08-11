<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Accordion example</title>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Window runat="server" Title="PIM" Layout="Accordion" Width="200" Height="225" Icon="ApplicationTileVertical">
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
		</ext:Window>
	</body>
</html>
