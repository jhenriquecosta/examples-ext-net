<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Ext.NET Panel replaced by Window example</title>
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
		<ext:Window runat="server" Title="My Panel" Icon="UserHome" BodyPadding="10" Width="300" Height="150" AutoScroll="true">
			<Items>
				<ext:Label Html="<p>Some text</p>" />
				<ext:Label Html="<p>Some text</p>" />
				<ext:Label Html="<p>Some text</p>" />
				<ext:Label Html="<p>Some text</p>" />
				<ext:Label Html="<p>Some text</p>" />
				<ext:Label Html="<p>Some text</p>" />
			</Items>
			<Tools>
				<ext:Tool Type="Gear" Fn="MyApp.showOptions" Qtip="View options" />
				<ext:Tool Type="Help" Fn="MyApp.showHelp" />
			</Tools>
			<DockedItems>
				<ext:Toolbar Dock="Top">
					<Items>
						<ext:Button Icon="Add" Text="Do something" />
					</Items>
				</ext:Toolbar>
			</DockedItems>
			<Buttons>
				<ext:Button Icon="Disk" Text="Save" />
				<ext:Button Icon="Cancel" Text="Cancel" />
			</Buttons>
		</ext:Window>
	</body>
</html>
