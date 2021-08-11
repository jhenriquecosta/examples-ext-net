<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
<head>
	<title>Form Layout Examples</title>
	<style>
		body {
			padding: 10px;
		}
	</style>
</head>
<body>
	<ext:ResourceManager runat="server" />
	<ext:FieldContainer
		runat="server"
		Width="350"
		FieldLabel="Full Name"
		Layout="HBoxLayout"
		DefaultMargins="0 5 0 0"
		DefaultFlex="1"
		CombineErrors="true"
		MsgTarget="Under">
		<FieldDefaults AllowBlank="false" LabelAlign="Top" />
		<Items>
			<ext:TextField FieldLabel="First Name" />
			<ext:TextField FieldLabel="Last Name" />
		</Items>
	</ext:FieldContainer>
</body>
</html>
