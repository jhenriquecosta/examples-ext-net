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
		
		<ext:NumberField runat="server" FieldLabel="Number" />
		<ext:NumberField 
			runat="server" 
			FieldLabel="Number" 
			MinValue="0"
			MaxValue="100"
			AllowDecimals="true"
			DecimalPrecision="1"
			Step="0.5"
			Number="3"
			/>
	</body>
</html>