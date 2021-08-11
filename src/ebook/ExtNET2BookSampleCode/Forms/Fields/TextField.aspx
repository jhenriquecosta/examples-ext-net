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

		<ext:TextField runat="server" FieldLabel="Text field" />
		
		<ext:TextField runat="server" FieldLabel="Left aligned" />
		<ext:TextField runat="server" FieldLabel="Right aligned" LabelAlign="Right" />
		<ext:TextField runat="server" FieldLabel="Top aligned" LabelAlign="Top" />

		<ext:TextField runat="server" FieldLabel="Text field" Icon="Pencil" />

		<ext:TextField runat="server" FieldLabel="Text field" EmptyText="Empty text" />
		
		<ext:TextField
			runat      = "server"
			FieldLabel = "Text field"
			Note       = "This is a note"
			NoteAlign  = "Down" />
		
		<ext:TextField
			runat         = "server"
			FieldLabel    = "Text field"
			IndicatorIcon = "Lightbulb"
			IndicatorText = "Tip: make it short and sweet!" />
			
		<ext:TextField runat="server" FieldLabel="Text field" Text="Initial text" />
	</body>
</html>
