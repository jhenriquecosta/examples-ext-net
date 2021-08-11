<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Dynamic control example</title>
		<script>
			var onClickMe = function () {
				Ext.net.DirectMethod.request({
					url: "GenerateComponent.ashx",
					cleanRequest: true,
					params: {
						container: App.TabPanel1.id
					},
					success: function(result) {
						console.log(result);
					}
				});
			};
		</script>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />

		<ext:Button runat="server" Text="Click Me" OnClientClick="onClickMe" />
		
		<ext:TabPanel Id="TabPanel1" runat="server" Height="100">
			<Items>
				<ext:Panel Title="Initially created" />
			</Items>
		</ext:TabPanel>
	</body>
</html>
