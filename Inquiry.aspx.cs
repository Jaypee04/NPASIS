using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data;
using System.Drawing;
using System.Web.Services.Description;

public partial class Inquiry : System.Web.UI.Page
{
    Products products;


    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            //Session["MSOCODE"] = "ALL";

            products = new Products(Session["MSOCODE"].ToString());
            Session["Prod"] = products;

            this.DropDownListTypes.DataSource = products.ProductTypes();
            this.DropDownListTypes.DataTextField = "TYPEDESC";
            this.DropDownListTypes.DataValueField = "TYPE";

            DropDownListTypes.DataBind();
            DropDownListTypes.Items.Insert(0, new ListItem(string.Empty, string.Empty));


            Display();

            DataTable table = new DataTable();
            GridView1.DataSource = table;
            GridView1.DataBind();

        }

    }

    protected void Previous_Click(object sender, EventArgs e)
    {
        Products x = (Products)Session["Prod"];
        x.Back();
        Display();

    }

    private void Display()
    {
        Products x = (Products)Session["Prod"];

        try
        {
            this.DropDownListTypes.Text = x.Type;
        }
        catch
        {
        }
        this.Notification.Text = string.Empty;
        this.TextBoxProductCode.Text = x.Code;
        this.TextBoxProductDescription.Text = x.Description;
        this.TextBoxProductScale.Text = x.Scale;
        this.LabelDateEdited.Text = "Date last update: " + x.DTE;



        if (x.Prices().Rows.Count > 0)
        {
            this.TextBoxPrice.Text = x.GetPrice().ToString();
            this.TextBoxEffDate.Text = x.GetPriceEffectivity().ToString("MMMM dd, yyyy");
           
        }
        else
        {
            this.TextBoxPrice.Text = string.Empty;
            this.TextBoxEffDate.Text = string.Empty;
        }

        if (x.Inventory().Rows.Count > 0)
        {
            

        }
        else
        {
            

        }
        //this.GridViewPrices.DataBind();
        this.LabelCounter.Text = "Record: " + x.Index.ToString() + " / " + x.Count.ToString();
    }
    

    private void BrowseMode()
    {
        this.DropDownListTypes.Enabled = false;
        this.TextBoxProductCode.ReadOnly = true;
        this.TextBoxProductDescription.ReadOnly = true;
        this.TextBoxProductScale.ReadOnly = true;

    }

   
    protected void ButtonNext_Click(object sender, EventArgs e)
    {
        Products x = (Products)Session["Prod"];
        x.Next();
        Display();

    }
   
         
        
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Search_Click(object sender, EventArgs e)
    {
        Products x = (Products)Session["Prod"];
        this.GridView1.DataSource = x.SearchNew(this.TextBoxSearch.Text, Session["MSOCODE"].ToString());
        this.GridView1.AllowPaging = true;
        this.GridView1.DataBind();

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        Products x = (Products)Session["Prod"];
        x.GetValues(Convert.ToInt32(GridView1.DataKeys[this.GridView1.SelectedIndex]["i_rank"]));
        Display();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Products x = (Products)Session["Prod"];
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSource = x.SearchNew(this.TextBoxSearch.Text,Session["MSOCODE"].ToString());
        GridView1.DataBind();
    }


    protected void myRowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    protected void TextBoxEffDate_TextChanged(object sender, EventArgs e)
    {

    }
    protected void GridViewPrices_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    private DataTable DummyData()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("effdate");
        dt.Columns.Add("Price");
        DataRow dr = dt.NewRow();
        dt.Rows.Add(dr);
        return dt;
    }

    private DataTable DummyDataInv()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("effdate");
        dt.Columns.Add("Count");
        DataRow dr = dt.NewRow();
        dt.Rows.Add(dr);
        return dt;
    }

    


    private void DataBindPrices()
    {
        Products x = (Products)Session["Prod"];
        
    }

    private void DataBindInventory()
    {
        Products x = (Products)Session["Prod"];
        
    }



    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void GridViewPrices_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
    protected void GridViewPrices_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

   
    protected void GridViewPrices_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }
    protected void GridViewPrices_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    {

    }
    protected void GridViewPrices_RowDataBound1(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView drv = (DataRowView)e.Row.DataItem;
            if (drv["price"].ToString() == "")
            {
                ((LinkButton)e.Row.FindControl("LinkEdit")).Visible = false;
                ((LinkButton)e.Row.FindControl("LinkDelete")).Visible = false;
                e.Row.Visible = false;
            }
        }

    }
    protected void GridViewPrices_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }
    protected void GridViewPrices_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void GridViewInventory_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
   

        


    }
