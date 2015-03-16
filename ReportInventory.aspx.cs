using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.Data;

public partial class ReportInventory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        //ReportParameter asof = new ReportParameter("AsOf", " As of " + datefilter.Date.ToShortDateString());
        if (!Page.IsPostBack)
        {
            
            ReportParameter MSODESC = new ReportParameter("MSODESC", Session["MSODESC"].ToString());
            ReportParameter ADDRESS = new ReportParameter("ADDRESS", Session["ADDRESS"].ToString());
            ReportParameter CONTACT = new ReportParameter("CONTACT", Session["CONTACT"].ToString());
            ReportViewer1.LocalReport.SetParameters(new ReportParameter[] {  MSODESC, ADDRESS, CONTACT });
            ReportViewer1.LocalReport.Refresh();
        }
    }


    protected void ButtonFilterInventory_Click(object sender, EventArgs e)
    {
        DateTime datefilter;        

        if (DateTime.TryParse(this.TextBoxDateFilter.Text, out datefilter) )
        {
            ReportParameter asof = new ReportParameter("AsOf", " As of " + datefilter.Date.ToShortDateString());
            ReportViewer1.LocalReport.SetParameters(new ReportParameter[] { asof });
            ReportViewer1.LocalReport.Refresh();
            LoadReportDataSource(Session["MSOCODE"].ToString(), datefilter);
        }
    }

        private void LoadReportDataSource(string msocode,DateTime datefilter)
    {

       
        ReportViewer1.Visible = true;        
        DataSetInventory.DataTableInventoryDataTable dt = new DataSetInventory.DataTableInventoryDataTable();        
        DataSetInventoryTableAdapters.DataTableInventoryTableAdapter ad = new DataSetInventoryTableAdapters.DataTableInventoryTableAdapter();
      
        ad.Fill(dt,msocode,datefilter);
        ReportDataSource rds = new ReportDataSource("Inventory", (DataTable)dt);
        ReportViewer1.LocalReport.DataSources.Clear();
        ReportViewer1.LocalReport.DataSources.Add(rds);
        ReportViewer1.LocalReport.Refresh();

     
    }
    
}