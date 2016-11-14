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
    public partial class ManageVolunteers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Bll bll = new Bll();
            gvVolunteers.DataSource = bll.GetVolunteers();
        }

    }
}