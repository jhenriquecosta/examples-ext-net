<%@ Page Language="C#" %>
<%@ Register TagPrefix="cc1" Namespace="ExtNET2BookSampleCode.Custom.Components" Assembly="ExtNET2BookSampleCode" %>

<script runat="server">

protected void Grid_CompanySelected(object sender, DirectEventArgs e)
{
	X.MessageBox.Alert("Company selected", e.ToString()).Show();
}

protected void Grid_Select(object sender, DirectEventArgs e)
{
	X.MessageBox.Alert("Select", e.ToString()).Show();
}

</script>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Custom Component Example</title>
	</head>
	<body>
		<ext:ResourceManager runat="server" />

		<ext:Viewport runat="server">
			<Items>
				<cc1:FinancialGrid Id="Grid" runat="server">
					<Listeners>
						<CompanySelected Handler="console.log(arguments);" />
					</Listeners>
					<DirectEvents>
						<CompanySelected OnEvent="Grid_CompanySelected" />
					</DirectEvents>
				</cc1:FinancialGrid>
			</Items>
		</ext:Viewport>
	</body>
</html>
