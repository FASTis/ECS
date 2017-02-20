using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ECS.BLL; //This line must be present in order to access the methods in the BLL.

namespace ECS
{
    public partial class RunReports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"].ToString().Equals("false"))
                Response.Redirect("Default.aspx");
            else
            {
                Load_gvReportData();
            }
        }

        private void Load_gvReportData()
        {
            int monthNumber = Convert.ToInt16(ddMonths.SelectedValue);
            Bll bll = new Bll();
            gvReportData.DataSource = bll.GetReportForMonth(monthNumber);
            gvReportData.DataBind();

        }
        protected void gvReportData_Paging(object sender, GridViewPageEventArgs e)
        {
            gvReportData.PageIndex = e.NewPageIndex;
            Load_gvReportData();
        }
        protected void btnRunReport_Click(object sender, EventArgs e)
        {

        }
    }
}