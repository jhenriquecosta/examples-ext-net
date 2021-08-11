<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Form Field Examples</title>
		<style>
			body { padding:2px 10px; }
		</style>
	</head>
	<body>
		<ext:ResourceManager runat="server" />

		<ext:TimeField 
			runat        = "server" 
			MinTime      = "9:00" 
			MaxTime      = "18:00" 
			Increment    = "30" 
			SelectedTime = "10:00"
			Format       = "hh:mm tt"
			PickerMaxHeight = "80"
			/>
	</body>
</html>
