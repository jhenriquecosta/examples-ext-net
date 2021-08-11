<%@ Page Language="C#" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>VBoxLayout - Reordering</title>
</head>
<body>
    <ext:ResourceManager runat="server" />
    <ext:Viewport runat="server" Layout="HBoxLayout">
        <LayoutConfig>
            <ext:HBoxLayoutConfig Pack="Center" Align="Stretch" />
        </LayoutConfig>
        <Items>
            <ext:Container Layout="VBoxLayout">
                <LayoutConfig>
                    <ext:VBoxLayoutConfig Pack="Center" />
                </LayoutConfig>
                <Items>
                	<ext:Panel Title="Centered Panel" Height="200" Width="200" />
                </Items>
            </ext:Container>
        </Items>
    </ext:Viewport>
</body>
</html>