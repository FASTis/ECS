using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ECS.BLL;

namespace ECS
{
    public partial class ManageCenters : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string s = Session["IsAdmin"].ToString(); // test to make sure user is an Admin.
                if (s.Equals("false"))
                    Response.Redirect("Default.aspx");
            }
            catch (NullReferenceException)
            {
                Response.Redirect("Default.aspx"); // if the IsAdmin flag is null, redirect to Default page.
            }

            LoadCenters();

        }

        private void LoadCenters()
        {
            Bll bll = new Bll();
            gvCenters.DataSource = bll.GetCenters();
            gvCenters.DataBind();
        }
        protected void gvCenters_Paging(object sender, GridViewPageEventArgs e)
        {
            gvCenters.PageIndex = e.NewPageIndex;
            LoadCenters();
        }
    }
}