<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Ext.NET Window example</title>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Button ID="Button1" runat="server" Text="Show Window">
			<Listeners>
				<Click Handler="#{Window1}.show();" />
			</Listeners>
		</ext:Button>

		<ext:Window
			ID="Window1"
			runat="server"
			AnimateTarget="Button1"
			CloseAction="Destroy"
			Height="200"
			Hidden="true"
			Icon="ApplicationCascade"
			Maximizable="true"
			Minimizable="true"
			Modal="true"
			Title="My Window"
			Width="300">
			<Listeners>
				<Minimize Handler="this.hide();" />
			</Listeners>
		</ext:Window>
	</body>
</html>
