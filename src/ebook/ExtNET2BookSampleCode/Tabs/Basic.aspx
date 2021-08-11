<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Tab example</title>
</head>
<body>
	<form runat="server">
		<ext:ResourceManager runat="server" />
		
		<ext:Window 
			runat="server" 
			Title="Basic TabPanel"
			Width="420" 
			Height="250" 
			Layout="FitLayout">
			<Items>
				<ext:TabPanel Border="false" DefaultBorder="false">
					<Items>
						<ext:Panel Html="<p>First tab</p>" Title="Panel as tab" Icon="Application" BodyPadding="5" />
						<ext:TreePanel Html="<p>First tab</p>" Title="Tree as tab" Icon="ApplicationSideTree" Closable="true">
							<Root>
								<ext:Node Text="Root" Expanded="true">
									<Children>
										<ext:Node Text="Child 1" Leaf="true" />
										<ext:Node Text="Child 2" Leaf="true" />
										<ext:Node Text="Child 3" Leaf="true" />
										<ext:Node Text="Child 4" Leaf="true" />
									</Children>
								</ext:Node>
							</Root>
						</ext:TreePanel>
					</Items>
				</ext:TabPanel>
			</Items>
		</ext:Window>
	</form>
</body>
</html>