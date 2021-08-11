<%@ Page Language="C#" %>
<%@ Import Namespace="System.Web.Services" %>

<!DOCTYPE html>

<script runat="server">
	[WebMethod]
	public static string GetCurrentDate()
	{
		return DateTime.Now.ToString();
	}
</script>

<html>
	<head>
		<title>Page Method Example</title>

		<script type="text/javascript">
			function GetDateFromServer() {
				PageMethods.GetCurrentDate(OnSuccess, OnError);
				return false;
			}

			function OnSuccess(response) {
				alert(response);
			}

			function OnError(error) {
				alert(error);
			}
		</script>
	</head>
	<body>
		<form id="HtmlForm" runat="server">
			<asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" runat="server" />
			<div>
				<asp:Button runat="server" OnClientClick="return GetDateFromServer();" Text="What's the time?" />
			</div>
		</form>
	</body>
</html>
