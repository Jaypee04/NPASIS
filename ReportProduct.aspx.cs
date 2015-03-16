using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Microsoft.Reporting.WebForms;

public partial class ReportProduct : System.Web.UI.Page
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

    private void LoadReportDataSource(string msocode,DateTime startdate, DateTime enddate)
    {

       
        ReportViewer1.Visible = true;

        DataSetX.ProductInventoryTableDataTable dt = new DataSetX.ProductInventoryTableDataTable();
        DataSetXTableAdapters.ProductInventoryTableTableAdapter ad = new DataSetXTableAdapters.ProductInventoryTableTableAdapter();
        //DataSetProductInv.PRODINVDataTable dt = new DataSetProductInv.PRODINVDataTable();
        //DataSetProductInvTableAdapters.PRODINVTableAdapter ad = new DataSetProductInvTableAdapters.PRODINVTableAdapter();           

        ad.Fill(dt,msocode,startdate,enddate);

        ReportDataSource rds = new ReportDataSource("DataSet1", (DataTable)dt);
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

        if (DateTime.TryParse(this.TextBoxStartDate.Text, out startdate) && DateTime.TryParse(this.TextBoxEndDate.Text,out enddate))
        {
                        
            ReportParameter daterange = new ReportParameter("ReportParameterDateRange", startdate.Date.ToShortDateString() + " to " + enddate.Date.ToShortDateString());
            ReportViewer1.LocalReport.SetParameters(daterange);
            ReportViewer1.LocalReport.Refresh();
            LoadReportDataSource(Session["MSOCODE"].ToString(), startdate, enddate);
        }

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        
    }
}