using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ECS.BLL;
using ECS.Model;

namespace ECS
{
    public partial class AdminManageStaffTypes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"].ToString().Equals("false"))
                Response.Redirect("Default.aspx");
            else
            {
                Bll bll = new Bll();
                gvStaffTypes.DataSource = bll.GetStaffTypes();
                gvStaffTypes.DataBind();
            }
        }
    }
}