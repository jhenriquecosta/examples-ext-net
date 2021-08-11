<%@ Control Language="C#" %>
<%@ Register assembly="Ext.Net" namespace="Ext.Net" tagprefix="ext" %>

<script runat="server">
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!X.IsAjaxRequest)
		{
			Button1.Text = "UserControl: " + Name;
		}
	}
	
	[DirectMethod]
	public void GetName()
	{
		X.MessageBox.Alert("Name", Name).Show();
	}

	public string Name { get; set; }
</script>

<ext:Button ID="Button1" runat="server">
	<Listeners>
		<Click Handler="#{DirectMethods}.GetName();" />
	</Listeners>
</ext:Button>