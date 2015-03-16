using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for Products
/// </summary>
/// 
[Serializable]
public class Products
{
    SqlConnection cnn;
    DataTable dt;
    DataTable dtPrices;
    DataTable dtInventory;

   
    SqlDataAdapter da;
    SqlDataAdapter daPrices;
    SqlDataAdapter daInventory;

    int _count;
    int _index;
    bool isNew;
    string MSOCODE;

	public Products(string _MSOCODE)
	{
        MSOCODE = _MSOCODE;
        cnn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString);
        cnn.Open();
        _count = GetRecordCount();    
        _index = _count>0?1:-1;
        GetValues(_index);

	}

    public string Code{ get; set; }
    public string Type { get; set; }
    public string Description { get; set; }
    public string Scale { get; set; }
    public string DTE { get; set; }
    public double Price { get; set; }
    public string OrigCode { get; set; }
    public string OrigType { get; set; }

    public int Index
    {
        get
        {
            return _index;
        }
    }
    public int Count {
        get
        {
            return _count;
        }
   
            
             }
  


    public DataTable ProductTypes()
    {
        DataTable dtTypes = new DataTable();
        SqlDataAdapter daTypes = new SqlDataAdapter("Select * from PRODTYPELIB order by TYPEDESC", cnn);
        daTypes.Fill(dtTypes);
        return dtTypes;
    }


    public DataTable Prices()
    {
        dtPrices = new DataTable();
        daPrices = new SqlDataAdapter("Select EFFDATE,PRICE from PRODPRICE WHERE type='" +  Type + "' AND code='" + Code + "' order by effdate DESC", cnn);
        
        daPrices.Fill(dtPrices);
        return dtPrices;
    }

    public DataTable Inventory()
    {
        dtInventory = new DataTable();
        daInventory = new SqlDataAdapter("Select EFFDATE,COUNT from PRODINV WHERE type='" + Type + "' AND code='" + Code + "' AND MSOCODE='" + MSOCODE + "' order by effdate DESC", cnn);

        daInventory.Fill(dtInventory);
        return dtInventory;
    }
      
     

    public void GetValues(int i)
    {
        SqlCommand cmd;
        if (MSOCODE != "ALL")
        {
           cmd = new SqlCommand("SELECT *  FROM (SELECT PRODFLE.*, ROW_NUMBER() OVER(ORDER BY PRODFLE.CODE) AS i_rank FROM PRODFLE) AS Temp WHERE i_rank=" + i, cnn);
           //cmd = new SqlCommand("SELECT *  FROM (SELECT PRODFLE.*, ROW_NUMBER() OVER(ORDER BY PRODFLE.CODE) AS i_rank FROM PRODFLE WHERE MSOCODE='" + MSOCODE + "') AS Temp WHERE i_rank=" + i, cnn);
        }
        else
        {
           cmd = new SqlCommand("SELECT *  FROM (SELECT PRODFLE.*, ROW_NUMBER() OVER(ORDER BY PRODFLE.CODE) AS i_rank FROM PRODFLE WHERE MSOCODE='" + MSOCODE + "') AS Temp WHERE i_rank=" + i, cnn);
        }


        dt = new DataTable();
        da = new SqlDataAdapter(cmd);
        da.Fill(dt);

        Code = dt.Rows[0]["Code"].ToString();
        Type = dt.Rows[0]["Type"].ToString();
        OrigCode = Code;
        OrigType = Type;
        Description = dt.Rows[0]["ProdDesc"].ToString();
        Scale = dt.Rows[0]["Scale"].ToString();
        DTE = dt.Rows[0]["DTE"].ToString();
        _index = i;

    }

    

    public int GetItemCount()
    {
        SqlCommand cmd = new SqlCommand("Select Sum(COUNT) FROM PRODINV  WHERE CODE=@Code", cnn);
        cmd.Parameters.AddWithValue("@Code", Code);
        object result=cmd.ExecuteScalar();
        if (result == DBNull.Value)
        {
            return 0;
        }
        else
        {
            return Convert.ToInt32(result);
        }

    }

    public int GetRecordCount()
    {
        SqlCommand cmd = new SqlCommand("Select COUNT(*) FROM PRODFLE", cnn);
      
        object result = cmd.ExecuteScalar();
        if (result == DBNull.Value)
        {
            return 0;
        }
        else
        {
            return Convert.ToInt32(result);
        }

    }

    public int GetItemUsed()
    {
        SqlCommand cmd = new SqlCommand("Select Sum(QTY) FROM ORDERDT WHERE CODE=@Code", cnn);
        cmd.Parameters.AddWithValue("@Code", Code);
        object result = cmd.ExecuteScalar();
        if (result == DBNull.Value)
        {
            return 0;
        }
        else
        {
            return Convert.ToInt32(result);
        }

    }

    public int? GetPrice()
    {
        SqlCommand cmd = new SqlCommand("SELECT PRICE,[TYPE],CODE FROM dbo.PRODPRICE AS S WHERE(EFFDATE = (SELECT     MAX(EFFDATE) AS Expr1 FROM  dbo.PRODPRICE WHERE      (CODE = S.CODE) AND (CODE = @Code)  AND  ([TYPE] = S.[TYPE]) AND ([TYPE] = @Type) AND EFFDATE<=GETDATE()))", cnn);
        //SqlCommand cmd = new SqlCommand("SELECT PRICE,CODE FROM dbo.PRODPRICE AS S WHERE(EFFDATE = (SELECT     MAX(EFFDATE) AS Expr1 FROM  dbo.PRODPRICE WHERE      (CODE = S.CODE) AND (CODE = @Code)  AND EFFDATE<=GETDATE()))", cnn);
        cmd.Parameters.AddWithValue("@Code", Code);
        cmd.Parameters.AddWithValue("@Type", Type);
        
        object result = cmd.ExecuteScalar();
        if (result == DBNull.Value)
        {
            return null;
        }
        else
        {
            return Convert.ToInt32(result);
        }

    }

   
    public DateTime GetPriceEffectivity()
    {
        SqlCommand cmd = new SqlCommand("SELECT EFFDATE,CODE FROM dbo.PRODPRICE AS S WHERE(EFFDATE = (SELECT     MAX(EFFDATE) AS Expr1 FROM  dbo.PRODPRICE WHERE      (CODE = S.CODE) AND (CODE = @Code) AND EFFDATE<=GETDATE()))", cnn);
        cmd.Parameters.AddWithValue("@Code", Code);
        object result = cmd.ExecuteScalar();
       
            return Convert.ToDateTime(result);
      
    }




    public void Next()
    {
        if (_index != _count-1)
        {
            _index++;
        }

        GetValues(_index);
    }


    public void Back()
    {
        if(_index>1)
        {
        _index--;
       
        GetValues(_index);
        }
    }

    public void New()
    {
        isNew = true;

    }

    public void Edit()
    {
        isNew = false;
    }

    public void Delete()
    {
        dt.Rows[0].Delete();
        SqlCommandBuilder cb = new SqlCommandBuilder(da);
        da.Update(dt);       
        GetValues(_index);
    }


    public DataTable Search(string SearchString)
    {
        SqlCommand cmd = new SqlCommand("SELECT * FROM (SELECT CODE,PRODDESC as Description,Scale,TYPEDESC as TYPE, ROW_NUMBER() OVER(ORDER BY CODE) AS i_rank FROM PRODFLE LEFT JOIN PRODTYPELIB On PRODFLE.Type=PRODTYPELIB.TYPE) AS Temp   WHERE  CODE like @Code OR Description like @Description OR type like @Type OR Scale like @Scale", cnn);
        cmd.Parameters.AddWithValue("@Code","%" +  SearchString + "%");
        cmd.Parameters.AddWithValue("@Description", "%" + SearchString + "%");
        cmd.Parameters.AddWithValue("@Type", "%" + SearchString + "%");
        cmd.Parameters.AddWithValue("@Scale", "%" + SearchString + "%");
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;

    }

    public int Save()
    {
        SqlCommandBuilder cb =new SqlCommandBuilder(da);
        DataRow dr;

        if (isNew == true)
        {
           dr = dt.NewRow();
        }
        else
        {
            dr = dt.Rows[0];
        }

        dr["Code"] = Code;
        dr["Type"] = Type;
        dr["ProdDesc"] = Description;
        dr["Scale"] = Scale;
        dr["DTE"] = DTE;

        if (isNew == true)
        {
            dt.Rows.Add(dr);
        }

        try
        {
            da.Update(dt);
            if (isNew == false)
            {
                UpdatePrices();
            }
            
            return 0;
        }
        catch
        {
            dt.RejectChanges();
            return 1;
        }
        
    }


    public int UpdatePrice(DateTime effdate,Double price,DateTime origeffdate)
    {
        string query = "Update PRODPRICE set effdate=@effdate,price=@price,dte=@dte,userid=@userid Where type=@type and code=@code and effdate=@origeffdate";
        SqlCommand cmd = new SqlCommand(query, cnn);
        cmd.Parameters.AddWithValue("@effdate", effdate);
        cmd.Parameters.AddWithValue("@origeffdate", origeffdate);
        cmd.Parameters.AddWithValue("@price",price);
        cmd.Parameters.AddWithValue("@dte",DateTime.Now);
        cmd.Parameters.AddWithValue("@userid","Gerie");
        cmd.Parameters.AddWithValue("@type",this.Type);
        cmd.Parameters.AddWithValue("@code",this.Code);

        try
        {
            return cmd.ExecuteNonQuery();
        }
        catch
        {
            return 0;
        }

    }

    public int UpdateInventory(DateTime effdate, int count, DateTime origeffdate)
    {
        string query = "Update PRODINV set effdate=@effdate,count=@count,dte=@dte,userid=@userid Where type=@type and code=@code and effdate=@origeffdate and msocode=@msocode";
        SqlCommand cmd = new SqlCommand(query, cnn);
        cmd.Parameters.AddWithValue("@effdate", effdate);
        cmd.Parameters.AddWithValue("@origeffdate", origeffdate);
        cmd.Parameters.AddWithValue("@count", count);
        cmd.Parameters.AddWithValue("@dte", DateTime.Now);
        cmd.Parameters.AddWithValue("@userid", "Gerie");
        cmd.Parameters.AddWithValue("@type", this.Type);
        cmd.Parameters.AddWithValue("@code", this.Code);
        cmd.Parameters.AddWithValue("@msocode", MSOCODE);
        try
        {
            return cmd.ExecuteNonQuery();
        }
        catch
        {
            return 0;
        }

    }

    public int UpdatePrices()
    {
        string query = "Update PRODPRICE set type=@type,code=@code Where type=@origtype and code=@origcode";
        SqlCommand cmd = new SqlCommand(query, cnn);       
        cmd.Parameters.AddWithValue("@type", this.Type);
        cmd.Parameters.AddWithValue("@code", this.Code);
        cmd.Parameters.AddWithValue("@origtype", this.OrigType);
        cmd.Parameters.AddWithValue("@origcode", this.OrigCode);

        try
        {
            return cmd.ExecuteNonQuery();
        }
        catch
        {
            return 0;
        }

    }

    public int DeletePrice(DateTime effdate)
    {
        string query = "Delete FROM PRODPRICE WHERE Code=@Code AND Type=@Type AND effdate=@effdate";
        SqlCommand cmd = new SqlCommand(query, cnn);
        cmd.Parameters.AddWithValue("@effdate", effdate);      
        cmd.Parameters.AddWithValue("@type", this.Type);
        cmd.Parameters.AddWithValue("@code", this.Code);

        try
        {
            return cmd.ExecuteNonQuery();
        }
        catch
        {
            return 0;
        }

    }

    public int GetTotalInventory()
    {

        SqlCommand cmd = new SqlCommand(@"SELECT SUM([COUNT])AS QUANTITY
                                          FROM [NPASIS].[dbo].[PRODINV]
                                          WHERE MSOCODE=@MSOCODE AND [TYPE]=@TYPE AND CODE=@CODE
                                          GROUP BY MSOCODE,[TYPE],CODE", cnn);
        cmd.Parameters.AddWithValue("@MSOCODE",MSOCODE);
        cmd.Parameters.AddWithValue("@TYPE",this.Type);
        cmd.Parameters.AddWithValue("@CODE", this.Code);
        object result = cmd.ExecuteScalar();
        if (result == DBNull.Value)
        {
            return 0;
        }
        else
        {
            return Convert.ToInt32(result);
        }
    }

    public int GetTotalOrder()
    {

        SqlCommand cmd = new SqlCommand(@"SELECT SUM([QTY])AS QUANTITY
                                          FROM [NPASIS].[dbo].[ORDERDT]
                                          WHERE MSOCODE=@MSOCODE AND [TYPE]=@TYPE AND CODE=@CODE
                                          GROUP BY MSOCODE,[TYPE],CODE", cnn);
        cmd.Parameters.AddWithValue("@MSOCODE", MSOCODE);
        cmd.Parameters.AddWithValue("@TYPE", this.Type);
        cmd.Parameters.AddWithValue("@CODE", this.Code);
        object result = cmd.ExecuteScalar();
        if (result == DBNull.Value)
        {
            return 0;
        }
        else
        {
            return Convert.ToInt32(result);
        }
    }

    public int DeleteInventory(DateTime effdate)
    {
        string query = "Delete FROM PRODINV WHERE Code=@Code AND Type=@Type AND effdate=@effdate AND msocode=@msocode";
        SqlCommand cmd = new SqlCommand(query, cnn);
        cmd.Parameters.AddWithValue("@effdate", effdate);
        cmd.Parameters.AddWithValue("@type", this.Type);
        cmd.Parameters.AddWithValue("@code", this.Code);
        cmd.Parameters.AddWithValue("@msocode", MSOCODE);

        try
        {
            return cmd.ExecuteNonQuery();
        }
        catch
        {
            return 0;
        }

    }

    public int InsertPrice(DateTime effdate,double price,string userid)
    {
        string query = "Insert into PRODPRICE (type,code,effdate,price,dte,userid) VALUES(@type,@code,@effdate,@price,@dte,@userid)";
        SqlCommand cmd = new SqlCommand(query, cnn);
        cmd.Parameters.AddWithValue("@type", this.Type);
        cmd.Parameters.AddWithValue("@code", this.Code);
        cmd.Parameters.AddWithValue("@effdate", effdate);
        cmd.Parameters.AddWithValue("@price", price);
        cmd.Parameters.AddWithValue("@dte", DateTime.Now);
        cmd.Parameters.AddWithValue("@userid", userid);

        try
        {
            return cmd.ExecuteNonQuery();
        }
        catch
        {           
            return 0;
        }

    }

    public int InsertInventory(DateTime invdate, int invcount, string userid)
    {
        string query = "Insert into PRODINV (type,code,effdate,count,dte,msocode,userid) VALUES(@type,@code,@invdate,@invcount,@dte,@msocode,@userid)";
        SqlCommand cmd = new SqlCommand(query, cnn);

        cmd.Parameters.AddWithValue("@type", this.Type);
        cmd.Parameters.AddWithValue("@code", this.Code);
        cmd.Parameters.AddWithValue("@invdate", invdate);
        cmd.Parameters.AddWithValue("@invcount", invcount);
        cmd.Parameters.AddWithValue("@dte", DateTime.Now);
        cmd.Parameters.AddWithValue("@msocode", MSOCODE);
        cmd.Parameters.AddWithValue("@userid", userid);

        try
        {
            return cmd.ExecuteNonQuery();
        }
        catch
        {
            return 0;
        }

    }



}