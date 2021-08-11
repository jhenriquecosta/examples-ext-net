<%@ Page Language="C#" %>
<script runat="server">
	protected void CheckUserName(object sender, RemoteValidationEventArgs e)
	{
		var field = (TextField)sender;
		
		if (field.Text == "Valid")
		{
			e.Success = true;
		}
		else
		{
			e.Success = false;
			e.ErrorMessage = string.Format("'{0}' cannot be used", field.Text);
		}

		System.Threading.Thread.Sleep(1000); // just to demonstrate the effect         
	}
</script>
<!DOCTYPE html>
<html>
	<head>
		<title>Form Layout Examples</title>
		<style>
			body { padding:10px; }
			.x-form-item { margin: 0.5em 0 0; }
		</style>
	</head>
	<body>
		<ext:ResourceManager runat="server" />

		<form runat="server">
			<ext:TextField ID="UserName" runat="server" FieldLabel="Username" IsRemoteValidation="true">
				<RemoteValidation OnValidation="CheckUserName" />
			</ext:TextField>
		</form>
	</body>
</html>
