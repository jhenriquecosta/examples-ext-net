<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Form Layout Examples</title>
		<style>
			body { padding:10px; }
		</style>
	</head>
	<body>
		<ext:ResourceManager runat="server" />

		<ext:Window 
			runat="server" 
			Layout="FitLayout" 
			Width="250" 
			Height="250"
			Title="Enter values"
			Icon="ApplicationForm">
			<Items>
				<ext:FormPanel 
					runat="server" 
					BodyPadding="5"
					Border="false"
					ButtonAlign="Right"
					Layout="VBoxLayout">
					<LayoutConfig>
						<ext:VBoxLayoutConfig Align="Stretch" />
					</LayoutConfig>
					<Defaults>
						<ext:Parameter Name="LabelWidth" Value="70" Mode="Raw" />
					</Defaults>
					<Items>
						<ext:TextField FieldLabel="First Name" />
						<ext:TextField FieldLabel="Last Name" />
						<ext:TextArea FieldLabel="Profile" LabelAlign="Top" Flex="1" />
					</Items>
				</ext:FormPanel>
			</Items>
			<Buttons>
				<ext:Button runat="server" Text="Save" />
				<ext:Button runat="server" Text="Cancel" />
			</Buttons>
		</ext:Window>
	</body>
</html>
