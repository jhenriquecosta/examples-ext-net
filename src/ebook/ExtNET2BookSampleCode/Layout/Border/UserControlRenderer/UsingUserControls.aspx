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
				<ext:UserControlLoader Path="WestPanel.ascx" />
				<ext:Panel region="Center" Title="Center content" />
			</Items>
		</ext:Viewport>
	</body>
</html>
