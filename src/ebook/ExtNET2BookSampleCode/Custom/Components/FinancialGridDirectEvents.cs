using System.ComponentModel;
using System.Web.UI;
using System.Xml.Serialization;
using Ext.Net;
using Newtonsoft.Json;

namespace ExtNET2BookSampleCode.Custom.Components
{
	public class FinancialGridDirectEvents : GridPanelDirectEvents
	{
		public FinancialGridDirectEvents() { }

		public FinancialGridDirectEvents(Observable parent)
		{
			Parent = parent;
		}

		private ComponentDirectEvent _companySelected;

		[TypeConverter(typeof(ExpandableObjectConverter))]
		[PersistenceMode(PersistenceMode.InnerProperty)]
		[NotifyParentProperty(true)]
		public virtual ComponentDirectEvent CompanySelected
		{
			get
			{
				return _companySelected ?? (_companySelected = new ComponentDirectEvent(this));
			}
		}

		[Browsable(false)]
		[EditorBrowsable(EditorBrowsableState.Never)]
		[DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
		[XmlIgnore]
		[JsonIgnore]
		public override ConfigOptionsCollection ConfigOptions
		{
			get
			{
				ConfigOptionsCollection list = base.ConfigOptions;

				list.Add("companyselected",
					new ConfigOption("CompanySelected",
						new SerializationOptions("companyselected",
							typeof(DirectEventJsonConverter)),
						null,
						CompanySelected));

				return list;
			}
		}
	}
}