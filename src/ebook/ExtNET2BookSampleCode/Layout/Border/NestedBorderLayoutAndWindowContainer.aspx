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
				<ext:Panel region="Center" Layout="Border" Border="false">
					<Items>
						<ext:Panel region="West" Split="true" Title="Inner West" Width="100" Collapsible="true" />
						<ext:Panel region="Center" Title="Inner Center" />
					</Items>
				</ext:Panel>
			</Items>
		</ext:Window>

		<ext:Window runat="server" Layout="Border" Height="200" Width="400" Border="false">
			<Items>
				<ext:Panel region="West" Split="true" Title="West" Width="100" Collapsible="true" />
				<ext:Panel region="Center" Layout="Border" Border="false">
					<Items>
						<ext:Panel region="Center" Title="Inner Center" />
						<ext:Panel region="South" Split="true" Title="Nested South" Height="100" Collapsible="true" />
					</Items>
				</ext:Panel>
			</Items>
		</ext:Window>
	</body>
</html>
