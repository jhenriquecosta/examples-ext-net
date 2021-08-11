<%@ Page Language="C#" %>
<%@ Register assembly="Ext.Net" namespace="Ext.Net" tagprefix="ext" %>

<!DOCTYPE html>
<html>
	<head id="Head1" runat="server">
		<title>Border Layout Example</title>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Window runat="server" Layout="Border" Height="200" Width="400" Border="false">
			<Items>
				<ext:Panel region="West" Split="true" Title="West" Width="100" Collapsible="true" />
				<ext:Panel region="West" Split="true" Title="Inner West" Width="100" Collapsible="true" />
				<ext:Panel region="Center" Title="Center content" Border="false" />
			</Items>
		</ext:Window>
	</body>
</html>
