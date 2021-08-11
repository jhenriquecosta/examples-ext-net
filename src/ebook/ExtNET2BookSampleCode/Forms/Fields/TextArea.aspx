<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Form Field Examples</title>
		<style>
			body { padding:10px; }
			.x-form-item { margin: 2.5em 0; }
		</style>
	</head>
	<body>
		<ext:ResourceManager runat="server" />

		<ext:TextArea
			runat      = "server"
			FieldLabel = "Text area"
			LabelAlign = "Top"
			Width      = "450"
			Grow       = "true"
			GrowMax    = "250" />
	</body>
</html>