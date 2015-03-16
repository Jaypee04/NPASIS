using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Microsoft.Reporting.WebForms;
using System.Data;

public partial class ReportMapFlowSummary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int i = DateTime.Now.Year;
        for (i = 1998; i <= DateTime.Now.Year; i++)
            DropDownList1.Items.Add(Convert.ToString(i));

    }

    //
    private void LoadReportDataSource(string msocode, string year)
    {

        decimal dyear = decimal.Parse(year);

        if (lblValue.Text == "1")
        {
            ReportViewer1.Visible = true;
            ReportViewer2.Visible = false;
            MapFlowSumJanToJun.DTJanToJunSumDataTable dt = new MapFlowSumJanToJun.DTJanToJunSumDataTable();
            MapFlowSumJanToJunTableAdapters.JanToJunSumTableAdapter ad = new MapFlowSumJanToJunTableAdapters.JanToJunSumTableAdapter();
            ad.Fill(dt, msocode, dyear);
            ReportDataSource rds = new ReportDataSource("DataSetMapFlowSUM", (DataTable)dt);
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(rds);
            ReportViewer1.LocalReport.Refresh();
        }
        else if (lblValue.Text == "2")
        {
            ReportViewer2.Visible = true;
            ReportViewer1.Visible = false;
            DataSetMapFlowJulToDec.DataTableJulToDecDataTable dt = new DataSetMapFlowJulToDec.DataTableJulToDecDataTable();
            DataSetMapFlowJulToDecTableAdapters.JulToDecTableAdapter ad = new DataSetMapFlowJulToDecTableAdapters.JulToDecTableAdapter();
            ad.Fill(dt, msocode, dyear);
            ReportDataSource rds = new ReportDataSource("DataSetMapFlowSUMJD", (DataTable)dt);
            ReportViewer2.LocalReport.DataSources.Clear();
            ReportViewer2.LocalReport.DataSources.Add(rds);
            ReportViewer2.LocalReport.Refresh();
        }



    }
    //

    protected void ButtonFilterInventory_Click(object sender, EventArgs e)
    {

        string yr = DropDownList1.SelectedValue;
        if (rdbtnJanToJun.Checked)
        {
            lblValue.Text = "1";
            ReportParameter daterange = new ReportParameter("ReportParameterYear", DropDownList1.SelectedValue);
            ReportParameter place = new ReportParameter("ReportParameterMSO", Session["MSODESC"].ToString());
            ReportViewer1.LocalReport.SetParameters(place);
            ReportViewer1.LocalReport.SetParameters(daterange);
            ReportViewer1.LocalReport.Refresh();
            LoadReportDataSource(Session["MSOCODE"].ToString(), DropDownList1.SelectedValue);
        }
        else if (rdbtnJulToDec.Checked)
        {
            lblValue.Text = "2";
            ReportParameter daterange = new ReportParameter("ReportParameterYear", DropDownList1.SelectedValue);
            ReportParameter place = new ReportParameter("ReportParameterMSO", Session["MSODESC"].ToString());
            ReportViewer2.LocalReport.SetParameters(place);
            ReportViewer2.LocalReport.SetParameters(daterange);
            ReportViewer2.LocalReport.Refresh();
            LoadReportDataSource(Session["MSOCODE"].ToString(), DropDownList1.SelectedValue);
        }

       
       
    }



    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void rdbtnJanToJun_CheckedChanged(object sender, EventArgs e)
    {
        rdbtnJulToDec.Checked = false;
    }
    protected void rdbtnJulToDec_CheckedChanged(object sender, EventArgs e)
    {
        rdbtnJanToJun.Checked = false;
    }
    
}