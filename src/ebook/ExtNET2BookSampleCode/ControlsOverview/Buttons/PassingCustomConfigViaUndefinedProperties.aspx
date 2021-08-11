<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Passing custom config</title>
		<style>
			body { padding: 10px; }
		</style>
		
		<script>
			var MyApp = {
				changeButtonText: function (target, source) {
					target.setText('Text changed by ' + source.whoAmI);
				}
			};
		</script>
	</head>
	<body>
		<ext:ResourceManager ID="ResourceManager1" runat="server" />
		<ext:Button ID="ButtonC" runat="server" Text="Change Button D" WhoAmI="Button C">
			<Listeners>
				<Click Handler="MyApp.changeButtonText(#{ButtonD}, this);" />
			</Listeners>
		</ext:Button>
		<ext:Button ID="ButtonD" runat="server" Text="Change Button C" WhoAmI="Button D" BooleanExample="false" NumberExample="123.3">
			<Listeners>
				<Click Handler="MyApp.changeButtonText(#{ButtonC}, this);" />
			</Listeners>
		</ext:Button>
	</body>
</html>
