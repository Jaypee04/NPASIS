using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.Data.SqlClient;
using System.Configuration;

public partial class ReportReOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["MSODESC"] == null)
                Response.Redirect("login.aspx");

            ReportParameter MSODESC = new ReportParameter("MSODESC", Session["MSODESC"].ToString());
            ReportParameter ADDRESS = new ReportParameter("ADDRESS", Session["ADDRESS"].ToString());
            ReportParameter CONTACT = new ReportParameter("CONTACT", Session["CONTACT"].ToString());
            ReportParameter OICNAME = new ReportParameter("OICNAME", GetMSOOIC(Session["MSOCODE"].ToString()));
            ReportParameter MSOOIC = new ReportParameter("MSOOIC", "OIC MSO-" + Session["MSOCODE"].ToString());
            ReportParameter DATE = new ReportParameter("DATE", DateTime.Now.ToString("MMMM d, yyyy"));
            ReportParameter H2 = new ReportParameter("H2", "\tWe would like to inform you that the following map sheets had reached their reordering points at\r\n" + Session["MSODESC"].ToString());
            ReportViewer1.LocalReport.SetParameters(new ReportParameter[] { MSODESC, ADDRESS, CONTACT,OICNAME,MSOOIC,DATE,H2});
            ReportViewer1.LocalReport.Refresh();
        }
    }

    private string GetMSOOIC(string MSOCODE)
    {

        using (SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            cnn.Open();
            using (SqlCommand cmd = new SqlCommand("SELECT Name FROM MSOPERLIB WHERE MSOCODE=@MSOCODE AND Position='OIC'", cnn))
            {
                cmd.Parameters.AddWithValue("MSOCODE", MSOCODE);
                object obj = cmd.ExecuteScalar();
                if (obj!=null)
                    return obj.ToString();
                else
                    return string.Empty;
            }        
        }
    }
}