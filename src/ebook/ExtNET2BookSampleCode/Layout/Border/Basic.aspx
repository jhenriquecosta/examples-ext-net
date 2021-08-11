<%@ Page Language="C#" %>
<%@ Register assembly="Ext.Net" namespace="Ext.Net" tagprefix="ext" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Border Layout Example</title>
	</head>
	<body>
		<ext:ResourceManager runat="server" />
		<ext:Viewport runat="server" Layout="Border">
			<Items>
				<ext:Panel Region="West" Split="true" Title="West" Width="200" Collapsible="true" />
				<ext:Panel Region="Center" Title="Center content" />
			</Items>
		</ext:Viewport>
	</body>
</html>
