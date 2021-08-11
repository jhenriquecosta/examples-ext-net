<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>HBox layout</title>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		
		<ext:Window runat="server" Width="400" Height="200">
			<Items>
				<ext:Panel Layout="HBox" BodyPadding="5" DefaultMargins="0 5 0 0">
					<Items>
						<ext:Button Text="Button 1" />
						<ext:Panel BaseCls="x-plain" Flex="1" />
						<ext:Button Text="Button 2" />
						<ext:Button Text="Button 3" />
						<ext:Button Text="Button 4" Margins="0" />
					</Items>
				</ext:Panel>
		
				<%-- // can also Align="Middle", Stretch or StretchMax --%>
				<ext:Panel Layout="HBox" Height="50" BodyPadding="5" DefaultMargins="0 5 0 0">
					<LayoutConfig>
						<ext:HBoxLayoutConfig Align="Top" />
					</LayoutConfig>
					<Items>
						<ext:Button Text="Button 1" />
						<ext:Button Text="Button 2" />
						<ext:Button Text="Button 3" />
						<ext:Button Text="Button 4" />
					</Items>
				</ext:Panel>
		
				<ext:Panel Layout="HBox" BodyPadding="5" DefaultMargins="0 5 0 0">
					<Items>
						<ext:Button Text="Button 1" />
						<ext:Button Text="Button 2" Flex="1" />
						<ext:Button Text="Button 3" Flex="1" />
						<ext:Button Text="Button 4" Flex="3" Margins="0" />
					</Items>
				</ext:Panel>
		
				<%-- // Pack="Start" or Pack="End" --%>
				<ext:Panel Layout="HBox" BodyPadding="5">
					<%-- // note this is the same as DefaultMargins="0 5 0 0" on the ParentPanel --%>
					<Defaults>
						<ext:Parameter Name="margins" Value="0 5 0 0" Mode="Value" />
					</Defaults>
					<LayoutConfig>
						<ext:HBoxLayoutConfig Pack="Center" />
					</LayoutConfig>
					<Items>
						<ext:Button Text="Button 1" />
						<ext:Button Text="Button 2" />
						<ext:Button Text="Button 3" />
						<ext:Button Text="Button 4" />
					</Items>
				</ext:Panel>
			</Items>
		</ext:Window>
	</body>
</html>
