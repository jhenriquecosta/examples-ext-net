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

		<ext:FieldContainer runat="server" Width="350" FieldLabel="Full Name" Layout="HBoxLayout" DefaultMargins="0 5 0 0">
			<Items>
				<ext:ComboBox Width="50">
					<Items>
						<ext:ListItem Text="Mr" Value="mr" />
						<ext:ListItem Text="Mrs" Value="mrs" />
						<ext:ListItem Text="Miss" Value="miss" />
					</Items>
					<SelectedItems>
						<ext:ListItem Value="mr" />
					</SelectedItems>
				</ext:ComboBox>
				<ext:TextField Flex="1" />
				<ext:TextField Flex="1" Margins="0" />
			</Items>
		</ext:FieldContainer>
		
		<br />
		<br />
		
		<ext:FormPanel runat="server" BodyPadding="10" Width="450" DefaultAnchor="100%">
			<Items>
				<ext:FieldContainer FieldLabel="Full Name" Layout="HBoxLayout" DefaultMargins="0 5 0 0">
					<FieldDefaults LabelAlign="Top" />
					<Items>
						<ext:ComboBox Width="50" FieldLabel="Title">
							<Items>
								<ext:ListItem Text="Mr" Value="mr" />
								<ext:ListItem Text="Mrs" Value="mrs" />
								<ext:ListItem Text="Miss" Value="miss" />
							</Items>
							<SelectedItems>
								<ext:ListItem Value="mr" />
							</SelectedItems>
						</ext:ComboBox>
						<ext:TextField Flex="1" FieldLabel="First Name" />
						<ext:TextField Flex="1" FieldLabel="Last Name" Margins="0" />
					</Items>
				</ext:FieldContainer>

				<ext:TextField FieldLabel="Favourite sport" />

				<ext:FieldContainer FieldLabel="Phone" Layout="HBoxLayout" DefaultMargins="0 5 0 0">
					<Items>
						<ext:DisplayField Text="(" Margins="0" />
						<ext:TextField Width="29" Margins="0" />
						<ext:DisplayField Text=")" />
						<ext:TextField Width="29" />
						<ext:DisplayField Text="-" />
						<ext:TextField Width="48" />
					</Items>
				</ext:FieldContainer>
			</Items>
		</ext:FormPanel>
	</body>
</html>
