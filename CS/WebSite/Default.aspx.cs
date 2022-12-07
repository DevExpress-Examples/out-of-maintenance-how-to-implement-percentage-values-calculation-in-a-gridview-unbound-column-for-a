using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page
{
	protected void grid_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridViewColumnDataEventArgs e) {
		if (e.Column.FieldName == "percent") {
			if ((grid.GroupCount > 0)) {
				string itemKeyValue = e.GetListSourceFieldValue("ProductID").ToString();
				object summaryValue = grid.GetGroupSummaryValue(GetGroupIndex(itemKeyValue), grid.GroupSummary[0]);
				if (summaryValue != null)
					e.Value = (decimal)e.GetListSourceFieldValue("UnitPrice") / (decimal)summaryValue;
			}
			else {
				e.Value = (decimal)e.GetListSourceFieldValue("UnitPrice") / (decimal)grid.GetTotalSummaryValue(grid.TotalSummary[0]);
			}

		}
	}

	protected int GetGroupIndex(string itemKeyValue) {
		int itemIndex = grid.FindVisibleIndexByKeyValue(itemKeyValue);		
		for (int i = itemIndex - 1; i >= 0; i += -1) {
			if (grid.IsGroupRow(i))
				return i; 
		}
		return -1;
	}

}
