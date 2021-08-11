<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ToolbarFromCodeBehind.aspx.cs" Inherits="ExtNET2BookSampleCode.ControlsOverview.Toolbars.ToolbarFromCodeBehind" %>

<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Toolbar loaded from code-behind</title>
		<script>
			var MyApp = {
				onDateSelected: function (item, date) {
					alert(Ext.String.format('You chose {0}.', Ext.util.Format.date(date, 'M j, Y')));
				}
			};
		</script>
		<style>
			.x-menu-item-link { padding-top: 4px; } /* fix menu text misalignment */
		</style>
	</head>
	<body>
		<ext:ResourceManager runat="server" Theme="Gray" />
		<ext:Window ID="Window1" runat="server" />
	</body>
</html>
