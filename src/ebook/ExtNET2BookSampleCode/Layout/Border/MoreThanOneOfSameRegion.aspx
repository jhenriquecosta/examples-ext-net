<%@ Page Language="C#" %>
<%@ Register assembly="Ext.Net" namespace="Ext.Net" tagprefix="ext" %>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Border Layout Example</title>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Viewport runat="server" Layout="border">
			<Items>
				<ext:Panel Region="North" Split="true" Title="North" Height="75" Collapsible="true" />
				<ext:Panel Region="West" Split="true" Title="West" WIdth="150" Collapsible="true" />
				<ext:Panel Region="West" Split="true" Title="West 2" WIdth="150" Collapsible="true" />
				<ext:Panel Region="Center" Title="Center content" />
				<ext:Panel Region="East" Split="true" Title="East" Width="150" Collapsible="true" />
				<ext:Panel Region="South" Split="true" Title="South" Height="75" Collapsible="true" />
			</Items>
		</ext:Viewport>
	</body>
</html>
