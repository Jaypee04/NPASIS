using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.Data;
using System.Data.SqlClient;

public partial class ReportBankDeposit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MSOOffice();
    }
    private void LoadReportDataSource(string msocode, DateTime startdate, DateTime enddate)
    {
        ReportViewer1.Visible = true;

        DataSetBankDeposit.BANKDEPOSITSDataTable dt = new DataSetBankDeposit.BANKDEPOSITSDataTable();
        DataSetBankDepositTableAdapters.BANKDEPOSITSTableAdapter ad = new DataSetBankDepositTableAdapters.BANKDEPOSITSTableAdapter();
        ad.Fill(dt, startdate, enddate, msocode);

        ReportDataSource rds = new ReportDataSource("DataSetBankDeposit", (DataTable)dt);
        ReportDataSource rds2 = new ReportDataSource("DSSignatory", (DataTable)dt);
        ReportViewer1.LocalReport.DataSources.Clear();
        ReportViewer1.LocalReport.DataSources.Add(rds);
        ReportViewer1.LocalReport.DataSources.Add(rds2);
        ReportViewer1.LocalReport.Refresh();
    }
    protected void buttonOK_Click(object sender, EventArgs e)
    {
        DateTime startdate;
        DateTime enddate;

        if (DateTime.TryParse(this.TextBoxStartDate.Text, out startdate) && DateTime.TryParse(this.TextBoxEndDate.Text, out enddate))
        {

            ReportParameter daterange = new ReportParameter("ReportParameterDateRange", startdate.Date.ToShortDateString() + " to " + enddate.Date.ToShortDateString());
            ReportParameter place = new ReportParameter("ReportParameterMSO", Session["MSODESC"].ToString());
            ReportParameter tel = new ReportParameter("ReportParameterMSOTel", Session["TEL"].ToString());
            ReportParameter addr = new ReportParameter("ReportParameterMSOAddress", Session["ADDR"].ToString());
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
    protected void MSOOffice()
    {
        String sqlMSO = "SELECT * FROM MSOLIB WHERE MSOCODE=@MSO";
        SqlConnection connMSO = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString);
        SqlCommand cmdMSO  = new SqlCommand(sqlMSO, connMSO);
        cmdMSO.Parameters.AddWithValue("@MSO", Session["MSOCODE"].ToString());
        SqlDataReader reader;
        connMSO.Open();
        reader = cmdMSO.ExecuteReader();
        if (reader.Read ()) 
        {
           Session["MSODESC"] = reader["MSODESC"];
           if (reader["TELNO"] == System.DBNull.Value)
           {
               Session["TEL"] = "";
           }
           else
           {
               Session["TEL"] = reader["TELNO"];
           }
           if (reader["ADDRESS"] == System.DBNull.Value)
           {
               Session["ADDR"] = "";
           }
           else
           {
               Session["ADDR"] = reader["ADDRESS"];
           }
         }
        
    }
}