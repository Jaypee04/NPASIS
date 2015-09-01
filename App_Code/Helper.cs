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

    //DATE MODiFIED: September 1, 2015
    public static string SayHello()
    {
        return "Hello";
    }

    //OrderNo
    public static int getLastOrderNumber(string msocode)
    {
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string month = DateTime.Now.ToString("MM");
            string year = DateTime.Now.ToString("yyyy");
            string sql = @"select isnull(max(substring(ORDERNO,11,4)),'0000') as seq from ORDERFL where substring(ORDERNO,3,4)='" + year + "' and substring(ORDERNO,8,2)='" + month + "' and MSOCODE=@MSOCODE";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@MSOCODE", msocode);
            int retVal = int.Parse(cmd.ExecuteScalar().ToString());
            return retVal;
        }
    }
    //Company Code
    public static int getLastCompanyNumber(string msocode)
    {
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = @"SELECT isnull(max(substring(COCODE,1,10)),'0000000000') as seq FROM COMPANYLIB WHERE MSOCODE=@MSOCODE";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@MSOCODE", msocode);
            int retVal = int.Parse(cmd.ExecuteScalar().ToString());
            return retVal;
        }
    }
    //Client Code
    public static int getLastClientNumber(string msocode)
    {
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = @"SELECT isnull(max(substring(CLIENTCODE,1,10)),'0000000000') as seq FROM CLIENTLIB WHERE MSOCODE=@MSOCODE";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@MSOCODE", msocode);
            int retVal = int.Parse(cmd.ExecuteScalar().ToString());
            return retVal;
        }
    }

    //Company
    public static DataTable LoadCompany(string msocode)
    {
        DataTable dt = new DataTable();
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = @"SELECT *, COCODE + '|'+ SECCODE AS COMSEC FROM COMPANYLIB WHERE MSOCODE=@MSOCODE";
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
                    DataRow dr = dt.NewRow();
                    dt.Rows.Add(dr);
                    return dt;
                }
            }
        }

    }
    public static void InsertCompanyDetails(string msocode, string cocode, string codesc, string seccode, string address, string zipcd, string telno, string faxno, string whenfirst, string user)
    {

        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {

            conn.Open();
            string sql = @"INSERT INTO COMPANYLIB(MSOCODE,COCODE,CODESC,SECCODE,ADDRESS,ZIPCD,TELNO,FAXNO,WHENFIRST,DTE,USERID) 
                            VALUES(@MSOCODE,@COCODE,@CODESC,@SECCODE,@ADDRESS,@ZIPCD,@TELNO,@FAXNO,@WHENFIRST,@DTE,@USERID)";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@COCODE", cocode);
                cmd.Parameters.AddWithValue("@CODESC", codesc);
                cmd.Parameters.AddWithValue("@MSOCODE", msocode);
                cmd.Parameters.AddWithValue("@SECCODE", seccode);
                cmd.Parameters.AddWithValue("@ADDRESS", address);
                cmd.Parameters.AddWithValue("@ZIPCD", zipcd);
                cmd.Parameters.AddWithValue("@TELNO", telno);
                cmd.Parameters.AddWithValue("@FAXNO", faxno);
                cmd.Parameters.AddWithValue("@WHENFIRST", whenfirst);
                cmd.Parameters.AddWithValue("@DTE", DateTime.Now);
                cmd.Parameters.AddWithValue("@USERID", user);
                cmd.ExecuteNonQuery();
            }
        }
    }
    public static void UpdateCompanyDetails(string msocode, string cocode, string codesc, string seccode, string address, string zipcd, string telno, string faxno, string whenfirst, string user)
    {

        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {

            conn.Open();
            string sql = @"UPDATE COMPANYLIB SET CODESC=@CODESC,SECCODE=@SECCODE,ADDRESS=@ADDRESS,ZIPCD=@ZIPCD,
                            TELNO=@TELNO,FAXNO=@FAXNO,WHENFIRST=@WHENFIRST,DTE=@DTE,USERID=@USERID 
                            WHERE MSOCODE = @MSOCODE AND COCODE = @COCODE";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@COCODE", cocode);
                cmd.Parameters.AddWithValue("@CODESC", codesc);
                cmd.Parameters.AddWithValue("@MSOCODE", msocode);
                cmd.Parameters.AddWithValue("@SECCODE", seccode);
                cmd.Parameters.AddWithValue("@ADDRESS", address);
                cmd.Parameters.AddWithValue("@ZIPCD", zipcd);
                cmd.Parameters.AddWithValue("@TELNO", telno);
                cmd.Parameters.AddWithValue("@FAXNO", faxno);
                cmd.Parameters.AddWithValue("@WHENFIRST", whenfirst);
                cmd.Parameters.AddWithValue("@DTE", DateTime.Now);
                cmd.Parameters.AddWithValue("@USERID", user);
                cmd.ExecuteNonQuery();
            }
        }
    }
    public static void DeleteCompanyDetails(string msocode, string cocode)
    {

        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {

            conn.Open();
            string sql = @"DELETE FROM COMPANYLIB WHERE MSOCODE = @MSOCODE AND COCODE = @COCODE";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@COCODE", cocode);
                cmd.Parameters.AddWithValue("@MSOCODE", msocode);
                cmd.ExecuteNonQuery();
            }
        }
    }
    //End of Company Maintenance transaction
    
    //Clients
    public static DataTable LoadClients(string msocode, string cocode)
    {

        DataTable dt = new DataTable();
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = @"SELECT *, CLIENTCODE,FIRSTNAME + ' ' + LASTNAME AS CLIENTNAME FROM CLIENTLIB WHERE MSOCODE=@MSOCODE AND COCODE=@COCODE";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@MSOCODE", msocode);
                cmd.Parameters.AddWithValue("@COCODE", cocode);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                DataRow dr = dt.NewRow();
                dr["CLIENTCODE"] = "0000000000";
                dr["CLIENTNAME"] = "---";
                dt.Rows.InsertAt(dr, 0);
                return dt;
            }
        }
    }
    public static void InsertClientsDetails(string msocode, string clientcode, string cocode, string seccode, string firstname, string middlename, string lastname, string position, string address, string zipcd, string telno, string faxno, string whenlast, string user)
    {

        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {

            conn.Open();
            string sql = @"INSERT INTO COMPANYLIB(MSOCODE,CLIENTCODE,COCODE,SECCODE,FIRSTNAME,MIDDLENAME,LASTNAME,POSITION,
                            ADDRESS,ZIPCD,TELNO,FAXNO,WHENLAST,DTE,USERID) 
                            VALUES(@MSOCODE,@CLIENTCODE,@COCODE,@SECCODE,@FIRSTNAME,@MIDDLENAME,@LASTNAME,@POSITION,
                            @ADDRESS,@ZIPCD,@TELNO,@FAXNO,@WHENLAST,@DTE,@USERID)";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@CLIENTCODE", clientcode);
                cmd.Parameters.AddWithValue("@COCODE", cocode);
                cmd.Parameters.AddWithValue("@MSOCODE", msocode);
                cmd.Parameters.AddWithValue("@SECCODE", seccode);
                cmd.Parameters.AddWithValue("@FIRSTNAME", firstname);
                cmd.Parameters.AddWithValue("@MIDDLENAME", middlename);
                cmd.Parameters.AddWithValue("@LASTNAME", lastname);
                cmd.Parameters.AddWithValue("@POSITION", position);
                cmd.Parameters.AddWithValue("@ADDRESS", address);
                cmd.Parameters.AddWithValue("@ZIPCD", zipcd);
                cmd.Parameters.AddWithValue("@TELNO", telno);
                cmd.Parameters.AddWithValue("@FAXNO", faxno);
                cmd.Parameters.AddWithValue("@WHENLAST", whenlast);
                cmd.Parameters.AddWithValue("@DTE", DateTime.Now);
                cmd.Parameters.AddWithValue("@USERID", user);
                cmd.ExecuteNonQuery();
            }
        }
    }
    public static void UpdateClientsDetails(string msocode, string clientcode, string cocode, string seccode, string firstname, string middlename, string lastname, string position, string address, string zipcd, string telno, string faxno, string whenlast, string user)
    {

        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {

            conn.Open();
            string sql = @"UPDATE COMPANYLIB SET COCODE=@COCODE,SECCODE=@SECCODE,FIRSTNAME=@FIRSTNAME,MIDDLENAME=@MIDDLENAME,
                            LASTNAME=@LASTNAME,POSITION=@POSITION,ADDRESS=@ADDRESS,ZIPCD=@ZIPCD,TELNO=@TELNO,FAXNO=@FAXNO,
                            WHENLAST=@WHENLAST,DTE=@DTE,USERID=@USERID 
                            WHERE MSOCODE = @MSOCODE AND CLIENTCODE = @CLIENTCODE";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@CLIENTCODE", clientcode);
                cmd.Parameters.AddWithValue("@COCODE", cocode);
                cmd.Parameters.AddWithValue("@MSOCODE", msocode);
                cmd.Parameters.AddWithValue("@SECCODE", seccode);
                cmd.Parameters.AddWithValue("@FIRSTNAME", firstname);
                cmd.Parameters.AddWithValue("@MIDDLENAME", middlename);
                cmd.Parameters.AddWithValue("@LASTNAME", lastname);
                cmd.Parameters.AddWithValue("@POSITION", position);
                cmd.Parameters.AddWithValue("@ADDRESS", address);
                cmd.Parameters.AddWithValue("@ZIPCD", zipcd);
                cmd.Parameters.AddWithValue("@TELNO", telno);
                cmd.Parameters.AddWithValue("@FAXNO", faxno);
                cmd.Parameters.AddWithValue("@WHENLAST", whenlast);
                cmd.Parameters.AddWithValue("@DTE", DateTime.Now);
                cmd.Parameters.AddWithValue("@USERID", user);
                cmd.ExecuteNonQuery();
            }
        }
    }
    public static void DeleteClientsDetails(string msocode, string clientcode)
    {

        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {

            conn.Open();
            string sql = @"DELETE FROM COMPANYLIB WHERE MSOCODE = @MSOCODE AND CLIENTCODE = @CLIENTCODE";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@CLIENTCODE", clientcode);
                cmd.Parameters.AddWithValue("@MSOCODE", msocode);
                cmd.ExecuteNonQuery();
            }
        }
    }
    //End of Client Maintenance transactions

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



    public static DataTable LoadSectorLibChart(string startdate,string enddate)
    {
        DataTable dt = new DataTable();
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = @"select count(*) as [count],sectorlib.seccode,secdesc from orderfl
                left join sectorlib on  sectorlib.seccode=orderfl.seccode
                WHERE ORDERDATE BETWEEN @startdate AND @enddate
                group by sectorlib.seccode,sectorlib.secdesc";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@startdate", startdate);
                cmd.Parameters.AddWithValue("@enddate", enddate);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                return dt;
            }
        }
    }

    //Unit Maintenance
    public static DataTable LoadUnitLib()
    {
        DataTable dt = new DataTable();
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = @"SELECT * FROM UNITLIB";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
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

    public static bool InsertUnitDetails(string unitcode, string unitdescription, string unittype, string user)
    {

        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {

            conn.Open();
            string sql = @"INSERT INTO UNITLIB(UNITCODE,UNITDESCRIPTION,UNITTYPE,DTE,USERID) 
                            VALUES(@UNITCODE,@UNITDESCRIPTION,@UNITTYPE,@DTE,@USERID)";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@UNITCODE", unitcode);
                cmd.Parameters.AddWithValue("@UNITDESCRIPTION", unitdescription);
                cmd.Parameters.AddWithValue("@UNITTYPE", unittype);
                cmd.Parameters.AddWithValue("@DTE", DateTime.Now);
                cmd.Parameters.AddWithValue("@USERID", user);
                try
                {
                    cmd.ExecuteNonQuery();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }
    }
    public static void UpdateUnitDetails(string unitcode, string newunitcode, string unitdescription, string unittype, string user)
    {

        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {

            conn.Open();
            string sql = @"UPDATE UNITLIB SET UNITCODE=@NEWUNITCODE,UNITDESCRIPTION=@UNITDESCRIPTION,UNITTYPE=@UNITTYPE,DTE=@DTE,USERID=@USERID WHERE UNITCODE=@UNITCODE";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@UNITCODE", unitcode);
                cmd.Parameters.AddWithValue("@NEWUNITCODE", newunitcode);
                cmd.Parameters.AddWithValue("@UNITDESCRIPTION", unitdescription);
                cmd.Parameters.AddWithValue("@UNITTYPE", unittype);
                cmd.Parameters.AddWithValue("@DTE", DateTime.Now);
                cmd.Parameters.AddWithValue("@USERID", user);
                cmd.ExecuteNonQuery();
                
            }
        }
    }
    public static bool DeleteUnitDetails(string unitcode)
    {

        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {

            conn.Open();
            string sql = @"DELETE FROM UNITLIB WHERE UNITCODE=@UNITCODE";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@UNITCODE", unitcode);
                try
                {
                    cmd.ExecuteNonQuery();
                    return true;
                }
                catch
                {
                    return false;
                }
                
            }
        }
    }
    //End of Unit Maintenance

    public static int GetStockOnHand(string msoCode, string productCode, string type)
    {
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = @"SELECT (isnull(INV.Inventory,0) -isnull(SOLD.SOLD,0))AS stock FROM

        (SELECT MSOCODE, CODE,[TYPE],SUM([Count]) as Inventory FROM PRODINV 
               WHERE MSOCODE=@MSOCODE AND CODE=@CODE AND TYPE=@TYPE GROUP BY MSOCODE,[TYPE],CODE) INV  
					
        LEFT JOIN					
 
             (SELECT CODE,SUM(QTY) as SOLD     
              FROM [NPASIS].[dbo].[ORDERDT] 
              INNER JOIN ORDERFL 
              ON ORDERDT.MSOCODE = ORDERFL.MSOCODE AND ORDERDT.ORDERNO = ORDERFL.ORDERNO
              WHERE ORDERDT.MSOCODE=@MSOCODE  AND CODE=@CODE AND TYPE=@TYPE
              GROUP BY ORDERDT.MSOCODE,[TYPE],CODE) SOLD
  
         ON INV.CODE = SOLD.CODE";

            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@MSOCODE", msoCode);
            cmd.Parameters.AddWithValue("@CODE", productCode);
            cmd.Parameters.AddWithValue("@TYPE", type);
            return Convert.ToInt32(cmd.ExecuteScalar());

        }
    }

    public static int GetOrderTotalAmount(string msoCode, string orderno)
    {
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = @"SELECT Sum(qty*price) from ORDERDT where msocode=@MSOCODE AND Orderno=@ORDERNO";

            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@MSOCODE", msoCode);
            cmd.Parameters.AddWithValue("@ORDERNO", orderno);

            var result = cmd.ExecuteScalar();
            if (result != DBNull.Value)
            {
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
            else
            {
                return 0;
            }



        }
    }

    //LOAD only products with price records in the prodprice table
    public static DataTable LoadProducts(string msocode)
    {
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = @"select msocode,s.CODE,s.[TYPE],price,SUM([COUNT])as qty,typedesc,proddesc,
                        MSOCODE + '|' + s.CODE + '|' + s.[TYPE] + '|' + Cast(price as varchar)+ '|' + cast(SUM([COUNT])as varchar) + '|'  + typedesc + '|' + proddesc as value from PRODINV  AS S
	                        LEFT JOIN PRODPRICE ON s.code = prodprice.code AND s.type = prodprice.type AND PRODPRICE.EFFDATE = (SELECT MAX(EFFDATE) AS Expr1 FROM  dbo.PRODPRICE WHERE(CODE = S.CODE) AND ([TYPE] = S.[TYPE])         AND EFFDATE<=GETDATE())
	                        left join PRODTYPELIB ON  s.type = PRODTYPELIB.type
	                        left join PRODfle ON  s.type = PRODfle.type   and    s.code = PRODfle.code  
                        where msocode=@MSOCODE 
                        group by msocode,s.code,s.type,price,typedesc,proddesc
                        order by CODE,[type]";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@MSOCODE", msocode);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            return dt;
        }

    }

    public static DataRow FindProducts(string msocode, string code)
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

    public static string[] Split(string concatenatedString)
    {
        string[] result = concatenatedString.Split('|');
        return result;
    }


    public static void InsertOrderDetails(string msocode, string orderno, string code, string type, int qty, double price)
    {

        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {

            conn.Open();
            string sql = @"INSERT INTO ORDERDT (MSOCODE,ORDERNO,CODE,TYPE,QTY,PRICE) VALUES(@MSOCODE,@ORDERNO,@CODE,@TYPE,@QTY,@PRICE)";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@MSOCODE", msocode);
                cmd.Parameters.AddWithValue("@ORDERNO", orderno);
                cmd.Parameters.AddWithValue("@TYPE", type);
                cmd.Parameters.AddWithValue("@CODE", code);
                cmd.Parameters.AddWithValue("@PRICE", price);
                cmd.Parameters.AddWithValue("@QTY", qty);

                cmd.ExecuteNonQuery();
            }

        }
        double amount = GetOrderTotalAmount(msocode, orderno);
        UpdateOrderAmount(msocode, orderno, amount);
    }

    public static void InsertFOADetails(string orderno, string foa, string msocode)
    {

        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {

            conn.Open();
            string sql = @"INSERT INTO ORDERFOADT(MSOCODE,ORDERNO,FOACODE) VALUES(@MSOCODE,@ORDERNO,@FOACODE)";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@ORDERNO", orderno);
                cmd.Parameters.AddWithValue("@FOACODE", foa);
                cmd.Parameters.AddWithValue("@MSOCODE", msocode);

                cmd.ExecuteNonQuery();
            }

            double amount = GetOrderTotalAmount(msocode, orderno);
            UpdateOrderAmount(msocode, orderno, amount);

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

    public static DataTable LoadOrderDetails(string msocode, string orderno)
    {
        DataTable dt = new DataTable();
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = @"SELECT ORDERDT.MSOCODE,ORDERDT.ORDERNO,PRODTYPELIB.TYPE, PRODTYPELIB.TYPEDESC, ORDERDT.CODE, PRODFLE.PRODDESC AS TITLE, 
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

    public static void UpdateOrderAmount(string msocode, string orderno, double amount)
    {

        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = @"Update ORDERFL SET PAIDAMT=@PAIDAMT WHERE MSOCODE=@MSOCODE AND ORDERNO=@ORDERNO";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@MSOCODE", msocode);               
                cmd.Parameters.AddWithValue("@ORDERNO", orderno);
                cmd.Parameters.AddWithValue("@PAIDAMT", amount);

                cmd.ExecuteNonQuery();
            }
        }
    } 


    

    public static void UpdateOrderDetails(string msocode, string orderno, string code,string type,int qty,double price,string newcode,string newtype)
    {

        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = @"Update ORDERDT SET  code=@NEWCODE,type=@NEWTYPE,price=@PRICE,qty=@QTY WHERE MSOCODE=@MSOCODE AND ORDERNO=@ORDERNO AND CODE=@CODE AND TYPE=@TYPE";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@MSOCODE", msocode);
                cmd.Parameters.AddWithValue("@ORDERNO", orderno);
                cmd.Parameters.AddWithValue("@TYPE", type);
                cmd.Parameters.AddWithValue("@CODE", code);
                cmd.Parameters.AddWithValue("@NEWTYPE", newtype);
                cmd.Parameters.AddWithValue("@NEWCODE", newcode);
                cmd.Parameters.AddWithValue("@PRICE", price);
                cmd.Parameters.AddWithValue("@QTY", qty);

                cmd.ExecuteNonQuery();
            }

            double amount = GetOrderTotalAmount(msocode, orderno);
            UpdateOrderAmount(msocode, orderno, amount);
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

    public static void DeleteOrderDetails( string msocode,string orderno,string code,string type)
    {

        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString))
        {
            conn.Open();
            string sql = @"DELETE FROM ORDERDT WHERE MSOCODE=@MSOCODE AND ORDERNO=@ORDERNO AND CODE=@CODE AND TYPE=@TYPE";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@MSOCODE", msocode);
                cmd.Parameters.AddWithValue("@ORDERNO", orderno);
                cmd.Parameters.AddWithValue("@CODE", code);
                cmd.Parameters.AddWithValue("@TYPE", type);
                cmd.ExecuteNonQuery();
              
            }
        }

        double amount= GetOrderTotalAmount(msocode,orderno);
        UpdateOrderAmount(msocode, orderno, amount);
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

    public static bool HasDuplicate(System.Web.UI.WebControls.GridView gv, string codeColumn,string typeColumn, string codeValue,string typeValue)
    {


        foreach (System.Web.UI.WebControls.GridViewRow row in gv.Rows)
        {

            Label lableField1 = (Label)row.FindControl(codeColumn);
            Label lableField2 = (Label)row.FindControl(typeColumn);

            if (lableField1.Text == codeValue && lableField2.Text == typeValue)
            {
                return true;


            }
        }

        return false;

    }


}