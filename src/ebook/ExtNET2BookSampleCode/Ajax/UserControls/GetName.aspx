<%@ Page Language="C#" %>
<%@ Register Src="GetName.ascx" TagPrefix="uc" TagName="GetName" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Direct Method from User Control Example</title>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<uc:GetName runat="server" ID="ucGetName1" Name="Joe" />
		<uc:GetName runat="server" ID="ucGetName2" Name="Bob" />
		
		<ext:Button runat="server" Text="Call UserControl DirectMethod (Joe)">
			<Listeners>
				<Click Handler="App.direct.ucGetName1.GetName();" />
			</Listeners>
		</ext:Button>
	</body>
</html>
