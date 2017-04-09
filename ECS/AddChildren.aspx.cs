using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECS
{
    public partial class AddChildren : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var fname = txtFirstName.Text;
            var lname = txtLastName.Text;
            var dob = txtDOB.Text;

            ListItem item = new ListItem();

            lstChildren.Items.Add(String.Format("{0}, {1} ( {2} )", lname, fname, dob));
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtDOB.Text = "";
        }
    }
}