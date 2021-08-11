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

		<ext:Checkbox runat="server" BoxLabel="Dog" FieldLabel="Favorite Animals" />
		<ext:Checkbox runat="server" BoxLabel="Cat" HideEmptyLabel="false" />
		<ext:Checkbox runat="server" BoxLabel="Monkey" Checked="true" HideEmptyLabel="false" />
	</body>
</html>
