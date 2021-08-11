<%@ Page Language="C#" %>

<script runat="server">
	[DirectMethod]
	public static int Divide(int number1, int number2)
	{
	 	return number1 / number2;
	}
</script>
<!DOCTYPE html>
<html>
	<head id="Head1" runat="server">
		<title>Direct Method Example</title>
		
		<script>
			function doDivision() {
				App.direct.Divide(5, 0);
			}
		</script>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Button runat="server" Text="Do Divide">
			<Listeners>
				<Click Fn="doDivision" />
			</Listeners>
		</ext:Button>
	</body>
</html>
