<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Column layout</title>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Viewport runat="server" Layout="Column">
			<Defaults>
				<ext:Parameter Name="Padding" Value="4 2" Mode="Value" />
			</Defaults>
			<Items>
				<ext:Panel Height="150" ColumnWidth="0.25" Title="Width=0.25" />
				<ext:Panel Height="200" ColumnWidth="0.75" Title="Width=0.75" />
				<ext:Panel Height="100" Width="150" Title="Width=150px" />
			</Items>
		</ext:Viewport>
	</body>
</html>
