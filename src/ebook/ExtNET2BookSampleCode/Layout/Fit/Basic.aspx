<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Fit layout</title>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Window runat="server" Layout="Fit" Width="200" Height="200">
			<Items>
				<ext:Panel Title="Fitted panel" AutoScroll="true" Border="false">
					<BottomBar>
						<ext:StatusBar>
							<Items>
								<ext:Button Text="Click Me!" />
							</Items>
						</ext:StatusBar>
					</BottomBar>
				</ext:Panel>
			</Items>
		</ext:Window>
	</body>
</html>
