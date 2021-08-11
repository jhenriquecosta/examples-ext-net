<%@ Page Title="Title" Language="C#" MasterPageFile="DirectMethod.Master" %>


<asp:Content runat="server" ContentPlaceHolderID="Body">
	<ext:Button runat="server" Text="Call MasterPage Direct Method">
		<Listeners>
			<Click Handler="App.direct.HelloMasterPage();" />
		</Listeners>
	</ext:Button>
</asp:Content>