<%@ Page Language="C#" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!X.IsAjaxRequest)
        {
            PersonsStore.DataSource = this.Persons;
            PersonsStore.DataBind();
        }
    }

    [DirectMethod(ShowMask = true, CustomTarget = "#{AddressPanel}")]
    public object GetAddress(string action, Dictionary<string, object> extraParams)
    {
        int id = Convert.ToInt32(extraParams["id"]);
        return this.Addresses.Where(a => a.Id == id);
    }

    public List<Person> Persons
    {
        get
        {
            return new List<Person>
            {
                new Person(1, "John Smith", 1 ),
                new Person(2, "Jane Brown", 2 ),
                new Person(3, "Kevin Jones", 3 )
            };
        }
    }

    public List<Address> Addresses
    {
        get
        {
            return new List<Address>
            {
                new Address(1, "1", "Cross Street 11/1", "Big City", "123456" ),
                new Address(2, "2", "Cross Street 12/2", "Big City", "654321" ),
                new Address(3, "3", "Cross Street 13/3", "Big City", "321654" )
            };
        }
    }

    public class Address
    {
        public Address(int id, string number, string street, string city, string zip)
        {
            this.Id = id;
            this.Number = number;
            this.Street = street;
            this.City = city;
            this.Zip = zip;
        }

        public int Id
        {
            get;
            private set;
        }

        public string Number
        {
            get;
            private set;
        }

        public string Street
        {
            get;
            private set;
        }

        public string City
        {
            get;
            private set;
        }

        public string Zip
        {
            get;
            private set;
        }
    }

    public class Person
    {
        public Person(int id, string name, int addressId)
        {
            this.Id = id;
            this.Name = name;
            this.AddressId = addressId;
        }

        public int Id
        {
            get;
            private set;
        }

        public string Name
        {
            get;
            private set;
        }

        public int AddressId
        {
            get;
            private set;
        }
    }
</script>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Simple HasOne Lazy Load Association - Ext.NET Examples</title>
    <link href="/resources/css/examples.css" rel="stylesheet" />
</head>
<body>
    <ext:ResourceManager runat="server" />

    <h1>Simple HasOne Lazy Load Association</h1>

    <ext:Model runat="server" Name="Address" IDProperty="Id">
        <Fields>
            <ext:ModelField Name="Id" Type="Int" />
            <ext:ModelField Name="Number" />
            <ext:ModelField Name="Street" />
            <ext:ModelField Name="City" />
            <ext:ModelField Name="Zip" />
        </Fields>
        <Proxy>
            <ext:PageProxy DirectFn="App.direct.GetAddress" />
        </Proxy>
    </ext:Model>

    <ext:Store ID="PersonsStore" runat="server">
        <Model>
                <ext:Model runat="server" Name="Person" IDProperty="Id">
                <Fields>
                    <ext:ModelField Name="Id" Type="Int" />
                    <ext:ModelField Name="Name" />
                    <ext:ModelField Name="AddressId" />
                </Fields>
                <Associations>
                    <ext:HasOneAssociation Model="Address" ForeignKey="AddressId" PrimaryKey="Id" />
                </Associations>
            </ext:Model>
        </Model>
    </ext:Store>

    <ext:Panel runat="server" Border="false" Width="500" Height="250">
        <LayoutConfig>
            <ext:HBoxLayoutConfig Align="Stretch" />
        </LayoutConfig>
        <Defaults>
            <ext:Parameter Name="margin" Value="5" Mode="Raw" />
        </Defaults>
        <Items>
            <ext:GridPanel
                runat="server"
                StoreID="PersonsStore"
                Title="Persons (select a row to see an address)"
                Flex="1">
                <ColumnModel>
                    <Columns>
                        <ext:Column runat="server" Text="Name" DataIndex="Name" Flex="1" />
                    </Columns>
                </ColumnModel>
                <Listeners>
                    <SelectionChange Handler="selected.length && selected[0].getAddress(function(address){#{AddressPanel}.loadRecord(address);});" />
                </Listeners>
            </ext:GridPanel>

            <ext:FormPanel
                ID="AddressPanel"
                runat="server"
                Title="Address"
                BodyPadding="5"
                Flex="1">
                <Items>
                    <ext:DisplayField runat="server" FieldLabel="ID" Name="Id" />
                    <ext:DisplayField runat="server" FieldLabel="Number" Name="Number" />
                    <ext:DisplayField runat="server" FieldLabel="Street" Name="Street" />
                    <ext:DisplayField runat="server" FieldLabel="City" Name="City" />
                    <ext:DisplayField runat="server" FieldLabel="Zip" Name="Zip" />
                </Items>
            </ext:FormPanel>
        </Items>
    </ext:Panel>

    <br />

     <ext:GridPanel
        runat="server"
        StoreID="PersonsStore"
        Title="Persons with RowExpander"
        Width="500"
        Height="250">
        <ColumnModel>
            <Columns>
                <ext:Column runat="server" Text="Name" DataIndex="Name" Flex="1" />
            </Columns>
        </ColumnModel>
        <Plugins>
            <ext:RowExpander runat="server" SingleExpand="false">
                <Component>
                    <ext:FormPanel
                        runat="server"
                        BodyPadding="5">
                        <Items>
                            <ext:DisplayField runat="server" FieldLabel="ID" Name="Id" />
                            <ext:DisplayField runat="server" FieldLabel="Number" Name="Number" />
                            <ext:DisplayField runat="server" FieldLabel="Street" Name="Street" />
                            <ext:DisplayField runat="server" FieldLabel="City" Name="City" />
                            <ext:DisplayField runat="server" FieldLabel="Zip" Name="Zip" />
                        </Items>
                        <Listeners>
                            <AfterRender Handler="this.el.mask('Loading...'); this.record.getAddress(function(address){this.el.unmask(); this.getForm().loadRecord(address);}, this);" />
                        </Listeners>
                    </ext:FormPanel>
                </Component>
            </ext:RowExpander>
        </Plugins>
    </ext:GridPanel>
</body>
</html>
