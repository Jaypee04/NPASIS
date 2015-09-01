using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data;

/// <summary>
/// Summary description for Helper
/// </summary>
public static class Helper
{
    public static string SayHello()
    {
        return "Hello";
    }

    public static int GetStockOnHand(string msoCode, string productCode)
    {
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = @"SELECT (isnull(INV.Inventory,0) -isnull(SOLD.SOLD,0))AS stock FROM

        (SELECT MSOCODE, CODE,[TYPE],SUM([Count]) as Inventory FROM PRODINV 
               WHERE MSOCODE=@MSOCODE AND CODE=@CODE GROUP BY MSOCODE,[TYPE],CODE) INV  
					
        LEFT JOIN					
 
             (SELECT CODE,SUM(QTY) as SOLD     
              FROM [NPASIS].[dbo].[ORDERDT] 
              INNER JOIN ORDERFL 
              ON ORDERDT.MSOCODE = ORDERFL.MSOCODE AND ORDERDT.ORDERNO = ORDERFL.ORDERNO
              WHERE ORDERDT.MSOCODE=@MSOCODE  AND CODE=@CODE
              GROUP BY ORDERDT.MSOCODE,[TYPE],CODE) SOLD
  
         ON INV.CODE = SOLD.CODE";

            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@MSOCODE", msoCode);
            cmd.Parameters.AddWithValue("@CODE", productCode);



            return Convert.ToInt32(cmd.ExecuteScalar());

        }
    }

    public static DataTable LoadProducts(string msocode)
    {
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = "SELECT S.CODE,PRODTYPELIB.TYPEDESC,S.TYPE, PRICE,PRODINV.COUNT, PRODINV.MSOCODE FROM dbo.PRODPRICE AS S LEFT OUTER JOIN PRODINV ON PRODINV.CODE = S.CODE AND PRODINV.TYPE = S.TYPE LEFT OUTER JOIN PRODTYPELIB ON PRODINV.TYPE = PRODTYPELIB.TYPE WHERE(S.EFFDATE = (SELECT MAX(EFFDATE) AS Expr1 FROM  dbo.PRODPRICE WHERE(CODE = S.CODE) AND ([TYPE] = S.[TYPE]) AND EFFDATE<=GETDATE())) AND PRODINV.MSOCODE=@MSOCODE AND PRODINV.COUNT <> 2 ORDER BY PRODTYPELIB.TYPEDESC";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@MSOCODE", msocode);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            
            return dt;
        }
        
    }

     public static DataRow FindProducts(string msocode,string code)
    {
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = "SELECT S.CODE,PRODTYPELIB.TYPEDESC,S.TYPE, PRICE, PRODFLE.PRODDESC AS TITLE, PRODINV.COUNT, PRODINV.MSOCODE FROM dbo.PRODPRICE AS S LEFT OUTER JOIN PRODINV ON PRODINV.CODE = S.CODE AND PRODINV.TYPE = S.TYPE LEFT OUTER JOIN PRODTYPELIB ON PRODINV.TYPE = PRODTYPELIB.TYPE LEFT OUTER JOIN PRODFLE ON PRODINV.CODE = PRODFLE.CODE AND PRODINV.TYPE = PRODFLE.TYPE WHERE(S.EFFDATE = (SELECT MAX(EFFDATE) AS Expr1 FROM  dbo.PRODPRICE WHERE(CODE = S.CODE) AND ([TYPE] = S.[TYPE]) AND EFFDATE<=GETDATE())) AND PRODINV.MSOCODE=@MSOCODE AND PRODINV.COUNT <> 2 AND PRODINV.CODE = @CODE";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@MSOCODE", msocode);
            cmd.Parameters.AddWithValue("@CODE", code);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            
            return dt.Rows[0];
        }
        
    }


    public static DataTable LoadPaidOrders(string msocode)
    {
        DataTable dt = new DataTable();
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = @"SELECT ORDERFL.ORNO, ORDERFL.ORDERNO, ORDERFL.MSOCODE, ORDERFL.COCODE, ORDERFL.CLIENTCODE, ORDERFL.PAIDDATE, ORDERFL.PAIDAMT, 
                                   CLIENTLIB.FIRSTNAME + ' ' + CLIENTLIB.LASTNAME AS CLIENTNAME, COMPANYLIB.CODESC, COMPANYBRANCHLIB.BRDESC
                            FROM   ORDERFL LEFT OUTER JOIN COMPANYLIB ON ORDERFL.COCODE = COMPANYLIB.COCODE AND COMPANYLIB.MSOCODE = ORDERFL.MSOCODE
                            LEFT OUTER JOIN COMPANYBRANCHLIB ON ORDERFL.COBRANCH = COMPANYBRANCHLIB.COBRANCH AND COMPANYBRANCHLIB.MSOCODE = ORDERFL.MSOCODE
                            LEFT OUTER JOIN CLIENTLIB ON ORDERFL.CLIENTCODE = CLIENTLIB.CLIENTCODE AND CLIENTLIB.MSOCODE = ORDERFL.MSOCODE
                            WHERE (ORDERFL.MSOCODE =@MSOCODE)
                            AND SUBSTRING(ORDERNO,1,1) = 'P'
                            ORDER BY ORDERFL.PAIDDATE DESC";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@MSOCODE", msocode);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    return dt;
                }
                else
                {
                    dt.Rows.Add("");
                    return dt;
                }
            }
        }


    }

    public static DataTable LoadOrderDetails(string msocode,string orderno)
    {
        DataTable dt = new DataTable();
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = @"SELECT ORDERDT.ORDERNO, PRODTYPELIB.TYPEDESC, ORDERDT.CODE, PRODFLE.PRODDESC AS TITLE, 
            ORDERDT.UNIT, ORDERDT.QTY, ORDERDT.PRICE, ORDERDT.QTY * ORDERDT.PRICE AS TOTAL FROM ORDERDT 
            LEFT JOIN PRODFLE ON ORDERDT.CODE = PRODFLE.CODE AND PRODFLE.TYPE = ORDERDT.TYPE
            LEFT OUTER JOIN PRODTYPELIB ON ORDERDT.TYPE = PRODTYPELIB.TYPE 
            WHERE (ORDERDT.MSOCODE = @MSOCODE) AND ORDERNO=@ORDERNO";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@MSOCODE", msocode);                
                cmd.Parameters.AddWithValue("@ORDERNO", orderno);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    return dt;
                }
                else
                {
                    DataRow dr = dt.NewRow();
                    dt.Rows.Add(dr);
                    return dt;
                }
            }
        }


    }

    public static DataTable LoadCompany(string msocode)
    {
        DataTable dt = new DataTable();
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = @"SELECT COCODE,CODESC FROM COMPANYLIB WHERE MSOCODE=@MSOCODE";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@MSOCODE", msocode);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                return dt;
            }
        }


    }

    public static DataTable LoadSector()
    {
        DataTable dt = new DataTable();
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = @"SELECT SECCODE,SECDESC FROM SECTORLIB";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                return dt;
            }
        }


    }

    public static DataTable LoadClients(string msocode,string cocode)
    {
           
        DataTable dt = new DataTable();
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = @"SELECT CLIENTCODE,FIRSTNAME + ' ' + LASTNAME AS CLIENTNAME FROM CLIENTLIB WHERE MSOCODE=@MSOCODE AND COCODE=@COCODE";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@MSOCODE", msocode);
                cmd.Parameters.AddWithValue("@COCODE", cocode);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                DataRow dr = dt.NewRow();
                dr["CLIENTCODE"]="0000000000";
                dr["CLIENTNAME"]="---";
                dt.Rows.InsertAt(dr,0);
                return dt;
            }
        }


    }


    public static void UpdateOrder(string msocode, string orderno,string cocode,string clientcode)
    {
       
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = @"Update ORDERFL SET COCODE=@COCODE,CLIENTCODE=@CLIENTCODE WHERE MSOCODE=@MSOCODE AND ORDERNO=@ORDERNO";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@MSOCODE", msocode);
                cmd.Parameters.AddWithValue("@COCODE", cocode);
                cmd.Parameters.AddWithValue("@ORDERNO", orderno);
                cmd.Parameters.AddWithValue("@CLIENTCODE", clientcode);

                cmd.ExecuteNonQuery();
            }
        }


    }

    public static void DeleteOrder(string msocode, string orderno)
    {

        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = @"DELETE FROM ORDERFL WHERE MSOCODE=@MSOCODE AND ORDERNO=@ORDERNO";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@MSOCODE", msocode);                
                cmd.Parameters.AddWithValue("@ORDERNO", orderno);              

                cmd.ExecuteNonQuery();
            }
        }


    }


    public static bool HasDuplicate(System.Web.UI.WebControls.GridView gv, string columnName, string keyword)
    {


        foreach (System.Web.UI.WebControls.GridViewRow row in gv.Rows)
        {

            Label lableField = (Label)row.FindControl(columnName);

            if (lableField.Text == keyword)
            {
                return true;


            }
        }

        return false;

    }


}