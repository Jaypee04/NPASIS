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

public partial class ProductsAndServices : System.Web.UI.Page
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
            this.GridViewPrices.DataSource = x.Prices();
            this.GridViewPrices.DataBind();

        }
        else
        {
            this.GridViewPrices.DataSource = DummyData();
            this.GridViewPrices.DataBind();
            this.TextBoxPrice.Text = string.Empty;
            this.TextBoxEffDate.Text = string.Empty;
        }

        if (x.Inventory().Rows.Count > 0)
        {
            //this.TextBoxPrice.Text = x.GetPrice().ToString();
           // this.TextBoxEffDate.Text = x.GetPriceEffectivity().ToString("MMMM dd, yyyy");
            this.GridViewInventory.DataSource = x.Inventory();
            this.GridViewInventory.DataBind();

        }
        else
        {
            this.GridViewInventory.DataSource = DummyDataInv();
            this.GridViewInventory.DataBind();
          
        }
        //this.GridViewPrices.DataBind();
        this.LabelCounter.Text = "Record: " + x.Index.ToString() + " / " + x.Count.ToString();
    }
    protected void ButtonProdAdd_Click(object sender, EventArgs e)
    {
        AddEditMode();

        Products x = (Products)Session["Prod"];
        x.New();

        this.Notification.ForeColor = Color.Blue;
        this.Notification.Text = "New";
        this.DropDownListTypes.Text = string.Empty;
        this.TextBoxProductCode.Text = string.Empty;
        this.TextBoxProductDescription.Text = string.Empty;
        this.TextBoxProductScale.Text = string.Empty;
        this.LabelDateEdited.Text = string.Empty;
        this.TextBoxPrice.Text = string.Empty;
        this.TextBoxEffDate.Text = string.Empty;
        this.GridViewPrices.Visible = false;
        this.GridViewPrices.DataSource = DummyData();
        this.GridViewPrices.DataBind();

    }

    private void AddEditMode()

    {
        this.ButtonNext.Visible = false;
        this.ButtonPrevious.Visible = false;
        this.ButtonProdAdd.Visible = false;
        this.ButtonProdEdit.Visible = false;
        this.ButtonProdDelete.Visible = false;
        this.ButtonSave.Visible = true;
        this.ButtonCancel.Visible = true;       
        this.DropDownListTypes.Enabled = true;
        this.TextBoxProductCode.ReadOnly = false;
        this.TextBoxProductDescription.ReadOnly = false;
        this.TextBoxProductScale.ReadOnly = false;

    }

    private void BrowseMode()
    {
        this.ButtonNext.Visible = true;
        this.ButtonPrevious.Visible =true;
        this.ButtonProdAdd.Visible = true;
        this.ButtonProdEdit.Visible = true;
        this.ButtonProdDelete.Visible =true;
        this.ButtonSave.Visible = false;
        this.ButtonCancel.Visible = false;
        this.DropDownListTypes.Enabled =false;
        this.TextBoxProductCode.ReadOnly = true;
        this.TextBoxProductDescription.ReadOnly = true;
        this.TextBoxProductScale.ReadOnly = true;

    }

    protected void ButtonProdEdit_Click(object sender, EventArgs e)
    {
       
    }
    protected void ButtonNext_Click(object sender, EventArgs e)
    {
        Products x = (Products)Session["Prod"];
        x.Next();
        Display();
       
    }
    protected void ButtonSave_Click(object sender, EventArgs e)
    {
        Products x = (Products)Session["Prod"];
        x.Code = this.TextBoxProductCode.Text;
        x.Type = this.DropDownListTypes.SelectedItem.Value.ToString();
        x.Description = this.TextBoxProductDescription.Text;
        x.Scale = this.TextBoxProductScale.Text;

        if (x.Save() != 0)
        {
            this.Notification.ForeColor = Color.Red;
            this.Notification.Text = "Record already exist.";
        }
        else
        {
            this.Notification.ForeColor = Color.DarkGreen;
            this.Notification.Text = "Record successfully saved.";
            BrowseMode();
        }
        this.GridViewPrices.Visible = true;
    }



    protected void ButtonProdEdit_Click1(object sender, EventArgs e)
    {
        AddEditMode();

        Products x = (Products)Session["Prod"];
        x.Edit();
        this.Notification.ForeColor = Color.Blue;
        this.Notification.Text = "Edit";
        this.DropDownListTypes.Enabled = true;
        this.TextBoxProductCode.ReadOnly = false;
        this.TextBoxProductDescription.ReadOnly = false;
        this.TextBoxProductScale.ReadOnly = false;

       
    }
    protected void ButtonCancel_Click(object sender, EventArgs e)
    {
        Display();
        this.GridViewPrices.Visible = true;
        BrowseMode();
    }
    protected void ButtonProdDelete_Click(object sender, EventArgs e)
    {
        Products x = (Products)Session["Prod"];
        x.Delete();
        Display();
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Search_Click(object sender, EventArgs e)
    {
        Products x = (Products)Session["Prod"];
        this.GridView1.DataSource=  x.Search(this.TextBoxSearch.Text);  
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
        GridView1.DataSource = x.Search(this.TextBoxSearch.Text);      
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

    protected void GridViewPrices_RowCommand(object sender, GridViewCommandEventArgs e)
       {

           int rowindex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
           if (e.CommandName == "Edit")
           {
              
               GridViewPrices.EditIndex = rowindex;
               DataBindPrices();

           }


           else if (e.CommandName == "Cancel")
           {
               GridViewPrices.EditIndex = -1;
               DataBindPrices();             

           }



           else if (e.CommandName == "Update")
           {

               Products prod = (Products)Session["Prod"];
               
               
               DateTime origEffDate = (DateTime)GridViewPrices.DataKeys[rowindex]["effdate"];
               Double price = 0;
               try
               {
                   price = Convert.ToDouble(((TextBox)GridViewPrices.Rows[rowindex].FindControl("TextBoxPrice")).Text);
               }
               catch
               {
                   LabelPriceMsg.ForeColor = Color.Red;
                   LabelPriceMsg.Text = "Price should be numeric";
                   return;
               }

               DateTime effdate = Convert.ToDateTime(((TextBox)GridViewPrices.Rows[rowindex].FindControl("TextBoxEditEffDate")).Text);

               int retval = prod.UpdatePrice(effdate, price, origEffDate);

               if (retval > 0)
               {
                   GridViewPrices.EditIndex = -1;
                   LabelPriceMsg.Text = "";
                   DataBindPrices();
               }
               else
               {
                   LabelPriceMsg.ForeColor = Color.Red;
                   LabelPriceMsg.Text = "Invalid Data";
               }
        

               DataBindPrices();
               this.TextBoxPrice.Text = prod.GetPrice().ToString();
               this.TextBoxEffDate.Text = prod.GetPriceEffectivity().ToString("MMMM dd, yyyy");
           }

           else if (e.CommandName == "Insert")
           {
               //int rowindex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;

               DateTime effdate;
               Double price;
               Products prod = (Products)Session["Prod"];
               try
               {
                   effdate = Convert.ToDateTime(((TextBox)GridViewPrices.FooterRow.FindControl("TextBoxEffDate")).Text);
               }
               catch
               {
                   return;
               }

               try
               {
                   price = Convert.ToDouble(((TextBox)GridViewPrices.FooterRow.FindControl("TextBoxInsertPrice")).Text);
               }
               catch
               {
                   return;
               }

               if (prod.InsertPrice(effdate, price, "gerie") == 0)
               {
                   LabelPriceMsg.ForeColor = Color.Red;
                   LabelPriceMsg.Text = "Invalid Data";
               }
               else
               {
                   LabelPriceMsg.ForeColor = Color.Green;
                   LabelPriceMsg.Text = "Insert successful.";
               }

               DataBindPrices();
               this.TextBoxPrice.Text = prod.GetPrice().ToString();
               this.TextBoxEffDate.Text = prod.GetPriceEffectivity().ToString("MMMM dd, yyyy");
           }

           else if (e.CommandName == "Delete")
           {
               Products prod = (Products)Session["Prod"];
               DateTime deleffdate = Convert.ToDateTime(((Label)GridViewPrices.Rows[rowindex].FindControl("LabelEffDate")).Text);
               prod.DeletePrice(deleffdate);

               if (prod.Prices().Rows.Count > 0)
               {
                   this.TextBoxPrice.Text = prod.GetPrice().ToString();
                   this.TextBoxEffDate.Text = prod.GetPriceEffectivity().ToString("MMMM dd, yyyy");
                   this.GridViewPrices.DataSource = prod.Prices();
                   this.GridViewPrices.DataBind();
               }
               else
               {
                   this.TextBoxPrice.Text = string.Empty;
                   this.TextBoxEffDate.Text = string.Empty;
                   this.GridViewPrices.DataSource = DummyData();
                   this.GridViewPrices.DataBind();
               }
              
               
           }

           if (e.CommandName == "Edit")
           {

               GridViewPrices.EditIndex = rowindex;
               DataBindPrices();

           }


           

    }


    private void DataBindPrices()
    {
        Products x = (Products)Session["Prod"];
        GridViewPrices.DataSource = x.Prices();
        GridViewPrices.DataBind();  
    }

    private void DataBindInventory()
    {
        Products x = (Products)Session["Prod"];
        GridViewInventory.DataSource = x.Inventory();
        GridViewInventory.DataBind();
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

    protected void GridViewPrices_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewPrices.EditIndex = e.NewEditIndex;
    }
    protected void GridViewPrices_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewPrices.EditIndex = -1;
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
            DataRowView drv =(DataRowView)e.Row.DataItem;
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
    protected void GridViewInventory_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int rowindex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
        
        if (e.CommandName == "Insert")
        {

            DateTime invdate;
            int invcount;
            Products prod = (Products)Session["Prod"];
            try
            {
                invdate = Convert.ToDateTime(((TextBox)GridViewInventory.FooterRow.FindControl("TextBoxInvDate")).Text);
            }
            catch
            {
                return;
            }

            try
            {
                invcount = Convert.ToInt16(((TextBox)GridViewInventory.FooterRow.FindControl("TextBoxInvCount")).Text);
            }
            catch
            {
                return;
            }

            prod.InsertInventory(invdate, invcount, Session["User"].ToString());
            DataBindInventory();

        }

        else if (e.CommandName == "Delete")
        {
            Products prod = (Products)Session["Prod"];
            DateTime deleffdate = Convert.ToDateTime(((Label)GridViewInventory.Rows[rowindex].FindControl("LabelEffDate")).Text);
            prod.DeleteInventory(deleffdate);

          
              

                if (prod.Inventory().Rows.Count > 0)
                {
                  
                    this.GridViewInventory.DataSource = prod.Inventory();
                    this.GridViewInventory.DataBind();

                }
                else
                {
                    this.GridViewInventory.DataSource = DummyDataInv();
                    this.GridViewInventory.DataBind();

                }

        }

        if (e.CommandName == "Edit")
        {

            GridViewInventory.EditIndex = rowindex;
            DataBindInventory();

        }

        else if (e.CommandName == "Cancel")
        {
            GridViewInventory.EditIndex = -1;
            DataBindInventory();

        }

        else if (e.CommandName == "Update")
        {

            Products prod = (Products)Session["Prod"];


            DateTime origEffDate = (DateTime)GridViewInventory.DataKeys[rowindex]["effdate"];
            int count = 0;
            try
            {
                count = Convert.ToInt32(((TextBox)GridViewInventory.Rows[rowindex].FindControl("TextBoxInvCountEdit")).Text);
            }
            catch
            {
                
                return;
            }

            DateTime effdate = Convert.ToDateTime(((TextBox)GridViewInventory.Rows[rowindex].FindControl("TextBoxInvDateEdit")).Text);

            int retval = prod.UpdateInventory(effdate, count, origEffDate);

            if (retval > 0)
            {
                GridViewInventory.EditIndex = -1;               
                DataBindInventory();
            }
            else
            {
               
            }


            DataBindInventory();
            
        }


    }
    protected void GridViewInventory_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView drv = (DataRowView)e.Row.DataItem;
            if (drv["effdate"].ToString() == "")
            {
                e.Row.Visible = false;
            }
        }
    }
    protected void GridViewInventory_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void GridViewInventory_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewInventory.EditIndex = e.NewEditIndex;
    }
    protected void GridViewInventory_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
    protected void GridViewInventory_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }
    protected void GridViewInventory_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewInventory.EditIndex = -1;
    }
}