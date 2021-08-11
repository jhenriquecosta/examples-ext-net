<%@ Page Language="C#" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>Example</title>
		
		<script>
			var MyApp = {
				getServerTime: function() {
					Ext.net.DirectMethod.request({
						url: "/ServerTime/GetTime",
						success: function(result) {
							console.log(result);
						}
					});
				}
			};
		</script>

	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		
		<ext:Button runat="server" Text="Get Server Time">
			<DirectEvents>
				<Click Url="/ServerTime/GetTime" />
			</DirectEvents>
		</ext:Button>
		
		<ext:Button runat="server" Text="Get Server Time">
			<Listeners>
				<Click Fn="MyApp.getServerTime" />
			</Listeners>
		</ext:Button>
	</body>
</html>
