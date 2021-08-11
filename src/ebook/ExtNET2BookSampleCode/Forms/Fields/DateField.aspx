<%@ Page Language="C#" %>
<!DOCTYPE html>
<script runat="server">
protected void Page_Load(object sender, EventArgs e)
{
	var today = DateTime.Today;
	DateField1.SelectedDate = today;
	DateField1.MinDate = today.AddDays(-5);
	DateField1.MaxDate = today.AddDays(5);
}
</script>
<html>
	<head>
		<title>Form Field Examples</title>
		<style>
			body { padding:2px 10px; }
		</style>
	</head>
	<body>
		<ext:ResourceManager runat="server" />

		<ext:DateField 
			ID			 = "DateField1"
			runat        = "server"
			Format       = "yyyy-MM-dd"
			FieldLabel   = "Enter Date"
			/>
		
		<ext:DateField 
			runat        = "server"
			Format       = "yyyy-MM-dd"
			MinDate      = "2012/06/01"
			MaxDate      = "2012/06/07"
			SelectedDate = "2012/06/04"
			FieldLabel   = "Enter Date"
			Type         = Month
			>
		</ext:DateField>
	</body>
</html>
