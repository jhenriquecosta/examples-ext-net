<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Direct Event Example</title>
		<script>
			function showServerResponse(result) {
				var params = result.extraParamsResponse || {};

				if (params.relativeTime) {
					alert(params.relativeTime);
				}
			}
		</script>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Button runat="server" Text="Get Server Time">
			<DirectEvents>
				<Click 
					Url="ServerTimeService.asmx/GetServerTime" 
					Type="Load" 
					Method="POST" />
			</DirectEvents>
		</ext:Button>

		<ext:Button runat="server" Text="Get server time 5 hours from now">
			<DirectEvents>
				<Click 
					Success="showServerResponse(result);"
					Url="ServerTimeService.asmx/GetRelativeServerTime" 
					Type="Load" 
					Method="POST">
					<ExtraParams>
						<ext:Parameter Name="hours" Value="5" Mode="Raw" />
					</ExtraParams>					
				</Click>
			</DirectEvents>
		</ext:Button>

		<ext:Button runat="server" Text="Get Server Time">
			<DirectEvents>
				<Click 
					Url="ServerTimeService.asmx/GetServerTimeWindow" 
					Type="Load" 
					Method="POST" />
			</DirectEvents>
		</ext:Button>

		<ext:Button runat="server" Text="Get Server Time">
			<DirectEvents>
				<Click 
					Url="ServerTimeHandler.ashx" 
					Type="Load" 
					Method="POST" />
			</DirectEvents>
		</ext:Button>
	</body>
</html>
