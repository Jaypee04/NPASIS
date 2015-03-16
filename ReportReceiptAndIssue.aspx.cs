using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.Data;

public partial class ReportReceiptAndIssue : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DateTime now = DateTime.Now;
            int month = now.Month;
            ComboBoxMonth.SelectedValue = month.ToString();
        }
    }

    private void LoadReportDataSource(DateTime startdate, DateTime enddate)
    {


        ReportViewer1.Visible = true;

        ReceiptAndIssue.ReceiptAndIssueDataTable dt = new ReceiptAndIssue.ReceiptAndIssueDataTable();
        ReceiptAndIssueTableAdapters.ReceiptAndIssueTableAdapter ad = new ReceiptAndIssueTableAdapters.ReceiptAndIssueTableAdapter();


        ad.Fill(dt, Session["MSOCODE"].ToString(), startdate, enddate);

        ReportDataSource rds = new ReportDataSource("ReceiptAndissue", (DataTable)dt);
        ReportViewer1.LocalReport.DataSources.Clear();
        ReportViewer1.LocalReport.DataSources.Add(rds);
        ReportViewer1.LocalReport.Refresh();


    }
    protected void ButtonFilter_Click(object sender, EventArgs e)
    {
        DateTime startdate = new DateTime(DateTime.Now.Year, Convert.ToInt16(ComboBoxMonth.SelectedValue), 1);
        DateTime enddate;
        enddate = startdate.AddMonths(1).AddDays(-1);

        ReportParameter mso = new ReportParameter("mso", Session["MSODESC"] .ToString());
        ReportViewer1.LocalReport.SetParameters(mso);
        ReportParameter header = new ReportParameter("header", "For the period ended " + startdate.ToString("MMMM dd, yyyy") + " - " + enddate.ToString("MMMM dd, yyyy") );
        ReportViewer1.LocalReport.SetParameters(header);
        ReportParameter month = new ReportParameter("month", ComboBoxMonth.SelectedItem.Text);
        ReportViewer1.LocalReport.SetParameters(month);
        ReportViewer1.LocalReport.Refresh();
                             
        LoadReportDataSource(startdate, enddate);
       
       
    }
    protected void ComboBoxMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
}