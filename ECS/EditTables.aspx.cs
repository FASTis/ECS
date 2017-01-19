﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECS
{
    public partial class EditTables : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"].ToString().Equals("false"))
                Response.Redirect("Default.aspx");
        }

        protected void btnStaffTypes_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageStaffTypes.aspx");
        }

        protected void btnVolunteerTypes_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageVolunteerTypes.aspx");
        }
    }
}