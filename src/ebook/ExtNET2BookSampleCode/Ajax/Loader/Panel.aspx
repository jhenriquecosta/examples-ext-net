<%@ Page Language="C#" %>
<%@ Register assembly="Ext.Net" namespace="Ext.Net" tagprefix="ext" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
	<title>Ext.NET Example</title>
	<style>
		body { padding: 10px; }
	</style>
</head>
<body>
	<form id="Form1" runat="server">
		<ext:ResourceManager runat="server" Theme="Gray" />
		
		<ext:Panel runat="server" Title="AutoLoad" Height="200" Width="500">
			<Loader Url="Child.aspx">
				<Params>
					<ext:Parameter Name="param1" Value="Value1" />
					<ext:Parameter Name="param2" Value="Value2" />
				</Params>
			</Loader>
		</ext:Panel>
	</form>
</body>
</html>