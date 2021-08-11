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

		<ext:HtmlEditor
			runat      = "server"
			FieldLabel = "HTML Editor"
			LabelAlign = "Top"
			Width      = "450"
			Text ="<h2>Heading</h2><p>Some text goes here</p>" />
	</body>
</html>