using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.Data;

public partial class ReportTopSectotalClients : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            ReportParameter MSODESC = new ReportParameter("MSODESC", Session["MSODESC"].ToString());
            ReportParameter ADDRESS = new ReportParameter("ADDRESS", Session["ADDRESS"].ToString());
            ReportParameter CONTACT = new ReportParameter("CONTACT", Session["CONTACT"].ToString());
            ReportViewer1.LocalReport.SetParameters(new ReportParameter[] { MSODESC, ADDRESS, CONTACT });
            ReportViewer1.LocalReport.Refresh();
        }

    }
    private void LoadReportDataSource(Int32 top, DateTime startdate, DateTime enddate)
    {


        ReportViewer1.Visible = true;

        TopSectoralClients.DataTableTopSectoralClientDataTable dt = new TopSectoralClients.DataTableTopSectoralClientDataTable();               
        TopSectoralClientsTableAdapters.TableAdapterTopSectoralClient ad = new TopSectoralClientsTableAdapters.TableAdapterTopSectoralClient();

        ad.Fill(dt, top,Session["MSOCODE"].ToString(), startdate, enddate);

        ReportDataSource rds = new ReportDataSource("TopSectoralClients", (DataTable)dt);
        ReportViewer1.LocalReport.DataSources.Clear();
        ReportViewer1.LocalReport.DataSources.Add(rds);
        ReportViewer1.LocalReport.Refresh();


    }

    protected void ButtonFilter_Click(object sender, EventArgs e)
    {
        DateTime startdate;
        DateTime enddate;
        Int32 top;

        if (DateTime.TryParse(this.TextBoxStartDate.Text, out startdate) && DateTime.TryParse(this.TextBoxEndDate.Text, out enddate) && Int32.TryParse(this.TextBoxTop.Text, out top))
        {

            ReportParameter daterange = new ReportParameter("daterange", "Transaction Date: " + startdate.Date.ToString("MMMM dd, yyyy") + " - " + enddate.Date.ToString("MMMM dd, yyyy"));
            ReportParameter Top = new ReportParameter("Top", top.ToString());
            ReportViewer1.LocalReport.SetParameters(daterange);
            ReportViewer1.LocalReport.SetParameters(Top);
            ReportViewer1.LocalReport.Refresh();
            LoadReportDataSource(top, startdate, enddate);
        }

    }
}