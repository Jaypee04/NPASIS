using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Microsoft.Reporting.WebForms;
using System.Data;

public partial class ReportMapFlowDetailed : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int i = DateTime.Now.Year;
        for (i = 1988; i <= DateTime.Now.Year; i++)
            DropDownList1.Items.Add(Convert.ToString(i));
        
    }

    //
    private void LoadReportDataSource(string msocode, string typedesc, string year)
    {

        decimal dyear = decimal.Parse(year);
        
        if (lblValue.Text == "1")
        {
            ReportViewer1.Visible = true;
            ReportViewer2.Visible = false;
            InventoryJanToJun.DTJanToJunDataTable dt = new InventoryJanToJun.DTJanToJunDataTable();
            InventoryJanToJunTableAdapters.JanToJunTableAdapter ad = new InventoryJanToJunTableAdapters.JanToJunTableAdapter();
            ad.Fill(dt, msocode, typedesc, dyear);
            ReportDataSource rds = new ReportDataSource("DataSetMapFlowDET", (DataTable)dt);
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(rds);
            ReportViewer1.LocalReport.Refresh();
        }
        else if (lblValue.Text == "2")
        {
            ReportViewer2.Visible = true;
            ReportViewer1.Visible = false;
            InventoryJulToDec.DTJulToDecDataTable dt = new InventoryJulToDec.DTJulToDecDataTable();
            InventoryJulToDecTableAdapters.JulToDecTableAdapter ad = new InventoryJulToDecTableAdapters.JulToDecTableAdapter();
            ad.Fill(dt, msocode, typedesc, dyear);
            ReportDataSource rds = new ReportDataSource("DataSetMapFlowDETJD", (DataTable)dt);
            ReportViewer2.LocalReport.DataSources.Clear();
            ReportViewer2.LocalReport.DataSources.Add(rds);
            ReportViewer2.LocalReport.Refresh();
        }
        


    }
    //

    protected void ButtonFilterInventory_Click(object sender, EventArgs e)
    {

        string yr = DropDownList1.SelectedValue;
        ReportParameter daterange = new ReportParameter("ReportParameterYear", DropDownList1.SelectedValue);
        ReportParameter place = new ReportParameter("ReportParameterMSO", Session["MSODESC"].ToString());
        ReportParameter descr = new ReportParameter("ReportParameterTypeDesc", DropDownList2.SelectedValue);
        if (rdbtnJanToJun.Checked)
        {
            lblValue.Text = "1";
            ReportViewer1.LocalReport.SetParameters(place);
            ReportViewer1.LocalReport.SetParameters(daterange);
            ReportViewer1.LocalReport.SetParameters(descr);
            ReportViewer1.LocalReport.Refresh();
            LoadReportDataSource(Session["MSOCODE"].ToString(), DropDownList2.SelectedValue, DropDownList1.SelectedValue);
        }
        else if (rdbtnJulToDec.Checked)
        {
            lblValue.Text = "2";
            ReportViewer2.LocalReport.SetParameters(place);
            ReportViewer2.LocalReport.SetParameters(daterange);
            ReportViewer2.LocalReport.SetParameters(descr);
            ReportViewer2.LocalReport.Refresh();
            LoadReportDataSource(Session["MSOCODE"].ToString(), DropDownList2.SelectedValue, DropDownList1.SelectedValue);
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
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}