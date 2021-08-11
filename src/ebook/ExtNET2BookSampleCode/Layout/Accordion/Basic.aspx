<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Accordion example</title>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Window runat="server" Layout="Accordion" Width="200" Height="200">
			<%-- //use this for further configuration options:
			<LayoutConfig>
				<ext:AccordionLayoutConfig Animate="true" />
			</LayoutConfig>
			--%>
			<Items>
				<ext:Panel Title="Panel 1" />
				<ext:Panel Title="Panel 2" />
				<ext:Panel Title="Panel 3" />
			</Items>
		</ext:Window>
	</body>
</html>
