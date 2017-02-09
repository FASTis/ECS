using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ECS.BLL;
using ECS.Model;

namespace ECS
{
    public partial class RunReports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"].ToString().Equals("false"))
                Response.Redirect("Default.aspx");

            if (!IsPostBack)
            {
                LoadCenters();
            }
        }

        private void LoadCenters()
        {
            DataTable dt = new DataTable();
            Bll bll = new Bll();
            dt = bll.GetCenters();
            ddCenters.DataTextField = "CenterName";
            ddCenters.DataValueField = "CenterID";
            ddCenters.DataSource = dt;
            ddCenters.DataBind();
        }
    }
}