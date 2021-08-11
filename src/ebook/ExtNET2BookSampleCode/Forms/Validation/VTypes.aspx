<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Form Layout Examples</title>
		<style>
			body { padding:10px; }
			
			.custom-err-field { background:#fdd; border-color:#a88; }
			.custom-err .x-form-item-label { font-weight:bold; }
		</style>
	</head>
	<body>
		<ext:ResourceManager runat="server" />
		
		<ext:FormPanel runat="server" BodyPadding="10" Width="280" Border="false">
			<Items>
				<ext:TextField FieldLabel="Enter a value" Vtype="alphanum" />
				<ext:TextField FieldLabel="Email" Vtype="email" />
			</Items>
		</ext:FormPanel>
	</body>
</html>
