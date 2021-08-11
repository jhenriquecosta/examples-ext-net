<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Ext.NET Panel replaced by Window example</title>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Viewport ID="Viewport1" runat="server">
			<Items>
				<ext:Button ID="Button1" runat="server" Text="Show Window">
					<Listeners>
						<Click Handler="#{Window1}.show();" />
					</Listeners>
				</ext:Button>

				<ext:Window
					ID="Window1"
					runat="server"
					Title="My Window"
					Icon="ApplicationCascade"
					Width="300"
					Height="200"
					Maximizable="true"
					Minimizable="true"
					CloseAction="Hide"
					Modal="true"
					Constrain="true">
					<Listeners>
						<Minimize Handler="this.hide(#{Button1}.el);" />
					</Listeners>
				</ext:Window>
			</Items>
		</ext:Viewport>
	</body>
</html>
