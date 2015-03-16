using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Microsoft.Reporting.WebForms;

public partial class ReportDetailedSales : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void LoadReportDataSource(string msocode, DateTime startdate, DateTime enddate)
    {


        ReportViewer1.Visible = true;

        DSDetailedSales.DTDetailedSalesDataTable dt = new DSDetailedSales.DTDetailedSalesDataTable();
        DSDetailedSalesTableAdapters.DTDetailedSalesTableAdapter ad = new DSDetailedSalesTableAdapters.DTDetailedSalesTableAdapter();
        ad.Fill(dt, msocode, startdate, enddate);

        ReportDataSource rds = new ReportDataSource("DSDetailedReport", (DataTable)dt);
        ReportViewer1.LocalReport.DataSources.Clear();
        ReportViewer1.LocalReport.DataSources.Add(rds);
        ReportViewer1.LocalReport.Refresh();


    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void buttonOK_Click(object sender, EventArgs e)
    {

        DateTime startdate;
        DateTime enddate;

        if (DateTime.TryParse(this.TextBoxStartDate.Text, out startdate) && DateTime.TryParse(this.TextBoxEndDate.Text, out enddate))
        {





            //ReportViewer1.Controls.Fint
            ReportParameter daterange = new ReportParameter("ReportParameterDateRange", startdate.Date.ToShortDateString() + " to " + enddate.Date.ToShortDateString());
            ReportParameter place = new ReportParameter("ReportParameterMSO", Session["MSODESC"].ToString());
            ReportParameter tel = new ReportParameter("ReportParameterMSOTel", Session["CONTACT"].ToString());
            ReportParameter addr = new ReportParameter("ReportParameterMSOAddress", Session["ADDRESS"].ToString());
            ReportViewer1.LocalReport.SetParameters(place);
            ReportViewer1.LocalReport.SetParameters(daterange);
            ReportViewer1.LocalReport.SetParameters(tel);
            ReportViewer1.LocalReport.SetParameters(addr);
            ReportViewer1.LocalReport.Refresh();
            LoadReportDataSource(Session["MSOCODE"].ToString(), startdate, enddate);
        }

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }

}