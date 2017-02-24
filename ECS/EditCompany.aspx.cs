﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ECS.BLL;

namespace ECS
{
    public partial class EditCompany : System.Web.UI.Page
    {
        //Instantiate a new BLL object so that you can access its methods later...
        Bll _bll = new Bll();
        string _mode = "";
        string _id = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            //Make sure the person is a valid Admin user, and isn't just browsing to this page to wreak havoc...
            if (Session["IsAdmin"].ToString().Equals("false"))
                Response.Redirect("Default.aspx");

            //Get the values in the query string and store them in variables...
            _mode = Request.QueryString["mode"];
            _id = "";

            if (_mode != "A") //if mode is not "A" for "add", then get the id from the query string and populate the staff type textbox.
            {
                _id = Request.QueryString["id"];
                if (!IsPostBack) //Don't do this on postback -- don't do the below unless we're loading the form for the first time!!!
                {
                    string Company = _bll.GetCompanyForID(_id);
                    txtCompany.Text = Company;
                }
            }

            if (_mode == "D")
                btnSubmit.Text = "Delete";

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string sCompany = txtCompany.Text;
            string returnedMessage = "";
            switch (_mode)
            {
                case "E":
                    returnedMessage = _bll.UpdateCompany(_id, sCompany);
                    break;
                case "A":
                    returnedMessage = _bll.AddCompany(sCompany);
                    break;
                case "D":
                    returnedMessage = "The delete feature has not yet been implemented.";
                    btnCancel.Text = "Close Form";
                    break;
                default:
                    break;
            }

            //Return the value to the user.
            DisplayPopup(returnedMessage);

            if (returnedMessage.Contains("success"))
            {
                btnCancel.Text = "Close Form";
            }

        }

        private void DisplayPopup(string returnedMessage)
        {
            string radalertscript = "<script language='javascript'>function f(){radalert('" + returnedMessage + "', 300, 100, 'ECS Volunteer App: Edit Company'); Sys.Application.remove_load(f);}; Sys.Application.add_load(f);</script>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "radalert", radalertscript);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageCompanies.aspx");
        }
    }
}