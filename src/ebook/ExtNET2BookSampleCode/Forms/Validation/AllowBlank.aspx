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
		
		<ext:FormPanel runat="server" BodyPadding="10" Width="280">
			<Items>
				<ext:TextField AllowBlank="false" FieldLabel="First Name" />
				<ext:TextField MaxLength="10" FieldLabel="Last Name" />
			</Items>
		</ext:FormPanel>
	</body>
</html>
