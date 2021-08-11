using System.ComponentModel;
using System.Web.UI;
using System.Xml.Serialization;
using Ext.Net;
using Newtonsoft.Json;

namespace ExtNET2BookSampleCode.Custom.Components
{
	public class FinancialGridListeners : GridPanelListeners
	{
		private const string CompanySelectedJs = "companyselected";

		private ComponentListener _companySelected;

		[ListenerArgument(0, "grid")]
		[ListenerArgument(1, "record")]
		[TypeConverter(typeof (ExpandableObjectConverter))]
		[PersistenceMode(PersistenceMode.InnerProperty)]
		[NotifyParentProperty(true)]
		public virtual ComponentListener CompanySelected
		{
			get { return _companySelected ?? (_companySelected = new ComponentListener()); }
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

				list.Add(CompanySelectedJs,
					new ConfigOption("CompanySelected",
						new SerializationOptions(CompanySelectedJs,
							typeof(ListenerJsonConverter)),
						null,
						CompanySelected));

				return list;
			}
		}
	}
}