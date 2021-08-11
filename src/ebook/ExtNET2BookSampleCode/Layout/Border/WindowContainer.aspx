<%@ Page Language="C#" %>
<%@ Register assembly="Ext.Net" namespace="Ext.Net" tagprefix="ext" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Border Layout Example</title>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Window runat="server" Layout="Border" Height="200" Width="400" Border="false">
			<Items>
				<ext:Panel Region="West" Split="true" Title="West" Width="150" Collapsible="true" />
				<ext:Panel Region="Center" Title="Center content" />
			</Items>
		</ext:Window>
	</body>
</html>
