<%@ Page Language="C#" %>
<%@ Register TagPrefix="cc1" Namespace="ExtNET2BookSampleCode.Custom.Plugins" Assembly="ExtNET2BookSampleCode" %>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Custom Component Example</title>
	</head>
	<body>
		<ext:ResourceManager runat="server" />
			
		<ext:Viewport runat="server">
			<Items>
				<cc1:FinancialGridPluginExample Id="Grid" runat="server" />
			</Items>
		</ext:Viewport>
	</body>
</html>
