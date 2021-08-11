<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>HBox layout</title>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		
		<ext:Window runat="server" Width="400" Height="200">
			<LayoutConfig>
				<ext:HBoxLayoutConfig Align="Stretch" DefaultMargins="2 0" />
			</LayoutConfig>
			<Items>
				<ext:Panel Flex="1" Title="Panel 1" CollapseDirection="Left" />
				<ext:BoxSplitter Collapsible="true" CollapseTarget="Prev" />

				<ext:Panel Flex="1" Title="Panel 2" CollapseDirection="Left" />
				<ext:BoxSplitter Collapsible="true" CollapseTarget="Prev" />

				<ext:Panel Flex="1" Title="Panel 3" />

				<ext:BoxSplitter Collapsible="true" />
				<ext:Panel Flex="1" Title="Panel 4" CollapseDirection="Right" />

				<ext:BoxSplitter Collapsible="true"  />
				<ext:Panel ID="Panel5" Flex="1" Title="Panel 5" CollapseDirection="Right" />
			</Items>
		</ext:Window>
	</body>
</html>
