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
		<ext:Panel runat="server" Title="My Panel" Icon="UserHome" BodyPadding="10" Width="300" Height="200" AutoScroll="true">
			<Items>
				<ext:Label runat="server" Html="<p>Some text</p>" />
				<ext:Label runat="server" Html="<p>Some text</p>" />
				<ext:Label runat="server" Html="<p>Some text</p>" />
				<ext:Label runat="server" Html="<p>Some text</p>" />
				<ext:Label runat="server" Html="<p>Some text</p>" />
				<ext:Label runat="server" Html="<p>Some text</p>" />
				<ext:Label runat="server" Html="<p>Some text</p>" />
				<ext:Label runat="server" Html="<p>Some text</p>" />
			</Items>
			<Tools>
				<ext:Tool Type="Gear" Fn="MyApp.showOptions" Qtip="View options" />
				<ext:Tool Type="Help" Fn="MyApp.showHelp" />
			</Tools>
			<DockedItems>
				<ext:Toolbar runat="server" Dock="Top">
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
				<ext:StatusBar runat="server" DefaultText="Ready" BusyText="Please wait..." Dock="Bottom">
					<Items>
						<ext:ToolbarFill runat="server" />
						<ext:Button runat="server" Text="About" />
					</Items>
				</ext:StatusBar>
				<ext:Toolbar runat="server" Dock="Bottom">
					<Items>
						<ext:Button runat="server" Icon="Disk" Text="Save" />
						<ext:Button runat="server" Icon="Delete" Text="Cancel" />
					</Items>
				</ext:Toolbar>
				<ext:Toolbar runat="server" Dock="Left">
					<Items>
						<ext:Button runat="server" Icon="UserAdd" />
						<ext:Button runat="server" Icon="UserDelete" />
						<ext:ToolbarSeparator runat="server" />
						<ext:Button runat="server" Icon="TimeAdd" />
					</Items>
				</ext:Toolbar>
			</DockedItems>
		</ext:Panel>
	</body>
</html>
