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
		
		<%-- // you need to create handleform.ashx --%>
		<%-- // else just lookin the network traffic to see how data is passed to it, --%>
		<%-- // even if you decide not to create it, just to have a look --%>
		<ext:FormPanel ID="FormPanel1" runat="server" BodyPadding="5" Url="HandleForm.ashx">
			<Items>
				<ext:TextField Name="Fname" FieldLabel="First Name" />
				<ext:TextField Name="Lname" FieldLabel="Last Name" />
			</Items>
		</ext:FormPanel>
		<ext:Button runat="server" Text="Save">
			<Listeners>
				<Click Handler="#{FormPanel1}.submit();" />
			</Listeners>
		</ext:Button>
	</body>
</html>
