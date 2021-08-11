<%@ Page Language="C#" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Child page</title>
	</head>
	<body>
		<p>Content from a child page</p>
		
		<p>
			Page requested:
			<%= Server.HtmlEncode(Request.RawUrl) %>
		</p>
	</body>
</html>
