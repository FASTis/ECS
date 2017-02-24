using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ECS.BLL;

namespace ECS
{
    public partial class ManageTasks : System.Web.UI.Page
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
            LoadTasks();
        }

        private void LoadTasks()
        {
            Bll bll = new Bll();
            gvTasks.DataSource = bll.GetTasks();
            gvTasks.DataBind();
        }

        protected void gvTasks_Paging(object sender, GridViewPageEventArgs e)
        {
            gvTasks.PageIndex = e.NewPageIndex;
            LoadTasks();
        }
    }
}