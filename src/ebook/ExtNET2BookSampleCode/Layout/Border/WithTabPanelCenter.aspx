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
				<ext:TabPanel region="Center" runat="server">
					<Items>
						<ext:Panel Title="First Tab" />
						<ext:Panel Title="Second Tab" />
					</Items>
				</ext:TabPanel>
			</Items>
		</ext:Window>
	</body>
</html>
