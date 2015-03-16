using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductInventory : System.Web.UI.Page
{

    Products products;
    

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            //Session["MSOCODE"].toString();
            products = new Products(Session["MSOCODE"].ToString());
            Session["Prod"] = products;
           
            Display();

        }
    }

    private void Display()
    {
        Products x = (Products)Session["Prod"];

       
        this.LabelType.Text = x.Type;        
        this.LabelCode.Text = x.Code;
        this.LabelDesc.Text = x.Description;
        this.LabelScale.Text = x.Scale;
        //this.LabelDateEdited.Text = x.DTE;
        //this.LabelPrice.Text = x.GetPrice().ToString("PHP 0.00");
        //this.LabelItemCount.Text = x.GetItemCount().ToString();
        //this.LabelUsed.Text = x.GetItemUsed().ToString();
        //this.Label1.Text = x.Index.ToString();
    }
}