<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Ext.NET Panel example</title>
		<style>
			body { padding: 10px; }
		</style>
		<script>
			var MyApp = {
				showHelp: function() {
					alert('showing help');
				},

				showOptions: function() {
					alert('showing options');
				}
			};
		</script>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Panel runat="server" Title="My Panel" Icon="UserHome" BodyPadding="10" Width="300" Height="140" AutoScroll="true">
			<Items>
				<ext:Label runat="server" Html="<p>Some text</p>" />
				<ext:Label runat="server" Html="<p>Some text</p>" />
				<ext:Label runat="server" Html="<p>Some text</p>" />
				<ext:Label runat="server" Html="<p>Some text</p>" />
				<ext:Label runat="server" Html="<p>Some text</p>" />
				<ext:Label runat="server" Html="<p>Some text</p>" />
			</Items>
			<TopBar>
				<ext:Toolbar runat="server">
					<Items>
						<ext:Button runat="server" Icon="Add" Text="Do something">
							<Menu>
								<ext:Menu runat="server">
									<Items>
										<ext:MenuItem runat="server" Text="Something more" />
									</Items>
								</ext:Menu>
							</Menu>
						</ext:Button>
					</Items>
				</ext:Toolbar>
			</TopBar>
			<BottomBar>
				<ext:StatusBar runat="server" DefaultText="Ready" BusyText="Please wait...">
					<Items>
						<ext:ToolbarFill runat="server" />
						<ext:Button runat="server" Text="About" />
					</Items>
				</ext:StatusBar>
			</BottomBar>
			<Tools>
				<ext:Tool Type="Gear" Fn="MyApp.showOptions" Qtip="View options" />
				<ext:Tool Type="Help" Fn="MyApp.showHelp" />
			</Tools>
		</ext:Panel>
	</body>
</html>
