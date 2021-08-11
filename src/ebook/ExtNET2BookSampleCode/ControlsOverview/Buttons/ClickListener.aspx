<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Click listener</title>
		<style>
			body { padding: 10px; }
		</style>
		
		<script>
			// Ext.ns("MyApp");
			// MyApp.onButtonClick = function(button, event) {
			//	console.log(button, event);
			// };

			var MyApp = {
				onButtonClick: function(button, event) {
					console.log(this, button, event);
				}
			};
		</script>
	</head>
	<body>
		<ext:ResourceManager ID="ResourceManager1" runat="server" />
		<ext:Button ID="Button1" runat="server" Text="Click Me!">
			<Listeners>
				<Click Handler="alert('clicked');" />
			</Listeners>
		</ext:Button>
		<ext:Button ID="Button2" runat="server" Text="Click Me!">
			<Listeners>
				<Click Fn="MyApp.onButtonClick" />
			</Listeners>
		</ext:Button>
		<ext:Button ID="Button3" runat="server" Text="Click Me!">
			<Listeners>
				<Click Fn="MyApp.onButtonClick" Scope="window" />
			</Listeners>
		</ext:Button>
		<ext:Button ID="Button4" runat="server" Text="Click Me!">
			<Listeners>
				<Click Fn="MyApp.onButtonClick" Single="true" />
			</Listeners>
		</ext:Button>
	</body>
</html>
