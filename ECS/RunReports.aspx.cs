using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ECS.BLL; //This line must be present in order to access the methods in the BLL.
using System.IO;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Configuration;

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
            gvReportData.DataBind();
        }
        protected void btnRunReport_Click(object sender, EventArgs e)
        {

        }

        protected void ExportToExcel(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages
                gvReportData.AllowPaging = false;
                this.DataBind();

                gvReportData.HeaderRow.BackColor = Color.White;
                foreach (TableCell cell in gvReportData.HeaderRow.Cells)
                {
                    cell.BackColor = gvReportData.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in gvReportData.Rows)
                {
                    row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = gvReportData.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = gvReportData.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }

                gvReportData.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
    }
}