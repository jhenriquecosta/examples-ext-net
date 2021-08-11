<%@ Page Language="C#" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>VBoxLayout - Reordering</title>
</head>
<body>
    <ext:ResourceManager runat="server" />
    
    <ext:Window runat="server" Width="250" Height="200">
        <LayoutConfig>
            <ext:VBoxLayoutConfig Align="Stretch" DefaultMargins="3" />
        </LayoutConfig>
        <Items>
            <ext:Panel Flex="1" Title="Panel 1" />
            <ext:Panel Flex="1" Title="Panel 2" />
            <ext:Panel Flex="1" Title="Panel 3" />
        </Items>
        <Plugins>
            <ext:BoxReorderer />
        </Plugins>
    </ext:Window>
</body>
</html>
