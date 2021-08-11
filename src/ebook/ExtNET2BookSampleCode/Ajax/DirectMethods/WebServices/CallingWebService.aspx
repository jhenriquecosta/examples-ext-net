<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Direct Method Example</title>
		<script>
			function echoXml() {
				Ext.net.DirectMethod.request({
					url: "ServerTimeService.asmx/Echo",
					cleanRequest: true,
					params: {
						something: "Hello world!"
					},
					success: function(result) {
						alert(Ext.DomQuery.selectValue("string", result, ""));
					}
				});
			}

			function echoJson() {
				Ext.net.DirectMethod.request({
					url: "ServerTimeServiceAsJson.asmx/Echo",
					cleanRequest: true,
					json: true,
					params: {
						something: "Hello world!"
					},
					success: function(result) {
						alert(result);
					}
				});
			}

			function showRelativeServerTime() {
				Ext.net.DirectMethod.request({
					url: "ServerTimeService.asmx/GetRelativeServerTime",
					cleanRequest: true,
					params: {
						hours: 5
					},
					success: function(result) {
						alert(Ext.DomQuery.selectValue("dateTime", result, ""));
					}
				});
			}

			function showRelativeServerTimeJson() {
				Ext.net.DirectMethod.request({
					url: "ServerTimeServiceAsJson.asmx/GetRelativeServerTime",
					cleanRequest: true,
					json: true,
					params: {
						hours: 5
					},
					success: function(result) {
						alert(result);
					}
				});
			}
			
			function showHtml5BrowserScoreCard() {
				Ext.net.DirectMethod.request({
					url: "ServerTimeServiceAsJson.asmx/GetHtml5BrowserScoreCard",
					json: true,
					success: function(result) {
						console.log(result);
					}
				});
			}

			function showHtml5BrowserScoreCardFromHandler() {
				Ext.net.DirectMethod.request({
					url: "Handler.ashx",
					success: function(result) {
						console.log(result);
					}
				});
			}
		</script>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />

		<ext:Button runat="server" Text="Echo using XML">
			<Listeners>
				<Click Fn="echoXml" />
			</Listeners>
		</ext:Button>

		<ext:Button runat="server" Text="Echo using JSON">
			<Listeners>
				<Click Fn="echoJson" />
			</Listeners>
		</ext:Button>

		<ext:Button runat="server" Text="Get server time 5 hours from now">
			<Listeners>
				<Click Fn="showRelativeServerTime" />
			</Listeners>
		</ext:Button>

		<ext:Button runat="server" Text="Get server time 5 hours from now">
			<Listeners>
				<Click Fn="showRelativeServerTimeJson" />
			</Listeners>
		</ext:Button>
		
		<ext:Button runat="server" Text="Get browser HTML5 scorecard">
			<Listeners>
				<Click Fn="showHtml5BrowserScoreCard" />
			</Listeners>
		</ext:Button>

		<ext:Button runat="server" Text="Get browser HTML5 scorecard">
			<Listeners>
				<Click Fn="showHtml5BrowserScoreCardFromHandler" />
			</Listeners>
		</ext:Button>
		
	</body>
</html>
