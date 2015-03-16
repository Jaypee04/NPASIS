using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonLogin_Click(object sender, EventArgs e)
    {
        Authenticate(this.TextBoxUsername.Text, this.TextBoxPassword.Text);
    }

    private void Authenticate(string username, string password)
    {
        DataTable dt = new DataTable();

        using (SqlConnection cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand("Select USERS.MSOCODE,MSODESC,ADDRESS,TELNO,FAXNO from USERS LEFT JOIN MSOLIB ON USERS.MSOCODE=MSOLIB.MSOCODE WHERE USERS.USERID=@Name and PASS=@Pass", cnn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                cmd.Parameters.AddWithValue("@Name", username);
                cmd.Parameters.AddWithValue("@Pass", password);

                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Session["User"] = username;
                    Session["MSOCODE"] = dt.Rows[0]["MSOCODE"].ToString();
                    Session["MSODESC"] = dt.Rows[0]["MSODESC"].ToString();
                    Session["ADDRESS"] = dt.Rows[0]["ADDRESS"].ToString();

                    if (dt.Rows[0]["FAXNO"] != DBNull.Value)
                    {
                        Session["CONTACT"] = "Tel No. " + dt.Rows[0]["TELNO"].ToString() + " / Fax No. " + dt.Rows[0]["FAXNO"].ToString();
                    }
                    else
                    {
                        Session["CONTACT"] = "Tel No. " + dt.Rows[0]["TELNO"].ToString();
                    }



                    FormsAuthentication.RedirectFromLoginPage(username, false);

                }
                else
                {
                   LabelStatus.Text = "Invalid login.";

                }

                cmd.Dispose();
                cnn.Dispose();
                


            }
            catch (SqlException ex)
            {
            }
            
        }
        

       
    }
}