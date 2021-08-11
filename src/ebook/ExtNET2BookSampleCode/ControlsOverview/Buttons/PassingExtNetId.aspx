<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Passing Ext.NET component id</title>
		<style>
			body { padding: 10px; }
		</style>
		
		<script>
			var MyApp = {
				changeButtonText: function (target, source) {
					target.setText('Text changed by ' + source.id);
				}
			};
		</script>
	</head>
	<body>
		<ext:ResourceManager ID="ResourceManager1" runat="server" />
		<ext:Button ID="ButtonA" runat="server" Text="Change Button B">
			<Listeners>
				<Click Handler="MyApp.changeButtonText(#{ButtonB}, this);" />
			</Listeners>
		</ext:Button>
		<ext:Button ID="ButtonB" runat="server" Text="Change Button A">
			<Listeners>
				<Click Handler="MyApp.changeButtonText(#{ButtonA}, this);" />
			</Listeners>
		</ext:Button>
	</body>
</html>
