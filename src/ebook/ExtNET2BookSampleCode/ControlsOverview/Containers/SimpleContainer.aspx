<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Container example</title>
	</head>
	<body>
		<ext:ResourceManager runat="server" />
		<ext:Container runat="server" Height="50" Width="500" Layout="Column">
			<Defaults>
				<ext:Parameter Name="columnWidth" Value="0.25" Mode="Raw" />
				<ext:Parameter Name="padding" Value="5" Mode="Raw" />
			</Defaults>
			<Items>
				<ext:Button runat="server" Text="Click Me 1" />
				<ext:Button runat="server" Text="Click Me 2" />
				<ext:Button runat="server" Text="Click Me 3" />
				<ext:Button runat="server" Text="Click Me 4" />
			</Items>
		</ext:Container>
	</body>
</html>
