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
    public partial class EditCenter : System.Web.UI.Page
    {
        //Instantiate a new BLL object so that you can access its methods later...
        Bll _bll = new Bll();
        string _mode = "";
        string _id = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            //Make sure the person is a valid Admin user, and isn't just browsing to this page to wreak havoc...
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

            //Get the values in the query string and store them in variables...
            _mode = Request.QueryString["mode"];
            _id = "";

            if (_mode != "A") //if mode is not "A" for "add", then get the id from the query string and populate the staff type textbox.
            {
                _id = Request.QueryString["id"];
                if (!IsPostBack) //Don't do this on postback -- don't do the below unless we're loading the form for the first time!!!
                {
                    Center center = _bll.GetCenterForID(_id);
                    txtCenter.Text = center.CenterName.ToString();
                    txtAddress.Text = center.StreetAddress.ToString();
                    txtZip.Text = center.Zip.ToString();
                }
            }

            if (_mode == "D")
                btnSubmit.Text = "Delete";

        }
    }
}