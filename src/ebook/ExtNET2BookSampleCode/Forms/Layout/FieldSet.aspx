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

		<ext:Container runat="server">
			<Items>
				<ext:FieldSet Collapsed="false" Collapsible="true" Title="Name" Width="260">
					<Items>
						<ext:TextField FieldLabel="First name" LabelWidth="80" />
						<ext:TextField FieldLabel="Last name" LabelWidth="80" />
					</Items>
				</ext:FieldSet>

				<ext:FieldSet Collapsed="true" Collapsible="true" Title="Name" Width="260">
					<Items>
						<ext:TextField FieldLabel="First name" />
						<ext:TextField FieldLabel="Last name" />
					</Items>
				</ext:FieldSet>
			</Items>
		</ext:Container>

		<ext:Container runat="server" Layout="HBoxLayout" MarginSpec="0 0 10">
			<Items>
				<ext:FieldSet 
					Title="Individual Checkboxes" 
					Layout="AnchorLayout">
							
					<Defaults>
						<ext:Parameter Name="HideEmptyLabel" Value="false" Mode="Raw" />
					</Defaults>

					<Items>
						<ext:TextField FieldLabel="Alignment Test" />
						<ext:Checkbox BoxLabel="Dog" FieldLabel="Favorite Animals" />
						<ext:Checkbox BoxLabel="Cat" />
						<ext:Checkbox BoxLabel="Monkey" Checked="true" />
					</Items>
				</ext:FieldSet>

				<ext:FieldSet 
					Flex="1" 
					Title="Individual Radios" 
					Layout="AnchorLayout"
					DefaultAnchor="100%"
					StyleSpec="margin-left:10px;">
							
					<Defaults>
						<ext:Parameter Name="HideEmptyLabel" Value="false" Mode="Raw" />
					</Defaults>

					<Items>
						<ext:TextField FieldLabel="Alignment Color" />
						<ext:Radio BoxLabel="Red" Name="fav-color" FieldLabel="Favorite Color" Checked="true" />
						<ext:Radio BoxLabel="Blue" Name="fav-color" />
						<ext:Radio BoxLabel="Green" Name="fav-color" />
					</Items>
				</ext:FieldSet>
			</Items>
		</ext:Container>
		
	</body>
</html>
