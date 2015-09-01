using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

public partial class ClientMaintenance : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["NPASISConnectionString"].ConnectionString);
    static string prevPage = String.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["MSOCODE"] == null)
            {
                Session["MSOCODE"] = "BAT";
            }
            BindGrid();
            gvCompany.RowStyle.Height = 30;
            gvClients.RowStyle.Height = 30;
            gvCompany.SelectRow(0);
            prevPage = Request.UrlReferrer.ToString();
        }

    }

    private void BindGrid()
    {
        this.gvCompany.DataSource = Helper.LoadCompany(Session["MSOCODE"].ToString());
        this.gvCompany.DataKeyNames = new string[] { "MSOCODE", "COCODE" };
        this.gvCompany.DataBind();
        DropDownList ddlSectorInsert = (DropDownList)gvCompany.FooterRow.FindControl("ddlSectorInsert");
        ddlSectorInsert.DataSource = Helper.LoadSector();
        ddlSectorInsert.DataTextField = "SECDESC";
        ddlSectorInsert.DataValueField = "SECCODE";
        ddlSectorInsert.DataBind();
    }

    private void BindGridClients()
    {
        string companyCode = gvCompany.SelectedDataKey.Values["COCODE"].ToString();
        string msocode = Session["MSOCODE"].ToString();
        gvClients.DataSource = Helper.LoadClients(msocode, companyCode);
        gvClients.DataKeyNames = new string[] { "MSOCODE", "COCODE", "CLIENTCODE" };
        gvClients.DataBind();
    
    }


    protected void gvCompany_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView gv = (GridView)sender;
        if (e.Row.RowType == DataControlRowType.DataRow && ((GridView)sender).EditIndex == -1)
        {
            e.Row.Attributes["onmouseover"] = "this.style.cursor='hand';this.style.textDecoration='none';";
            e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";
            e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(gv, "Select$" + e.Row.RowIndex);

        }
        //if Editing
        if ((e.Row.RowState == (DataControlRowState.Edit | DataControlRowState.Selected) || e.Row.RowState == (DataControlRowState.Edit | DataControlRowState.Selected | DataControlRowState.Alternate)) && e.Row.RowType == DataControlRowType.DataRow)
        {
            DropDownList ddlSector = (DropDownList)e.Row.FindControl("ddlSector");
            ddlSector.DataSource = Helper.LoadSector();
            ddlSector.DataTextField = "SECDESC";
            ddlSector.DataValueField = "SECCODE";
            ddlSector.DataBind();

        }
    }

    //
    protected void gvCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView gv = (GridView)sender;
        if (gv.EditIndex == -1)
        {
            foreach (GridViewRow row in gv.Rows)
            {
                Button btnDelete = (Button)row.FindControl("btnDelete");
                Button btnEdit = (Button)row.FindControl("btnEdit");
                string key = gv.DataKeys[row.RowIndex]["COCODE"].ToString();
                if (row.RowIndex == gv.SelectedIndex && key != "")
                {
                    btnDelete.Attributes.Add("onClick", @"alertify.defaults.glossary.title='NPASIS';alertify.confirm('Are you sure you want to delete this record?',
                                                function(){
                                                    __doPostBack($('.btnDelete').attr('name'),'OnClick');
                                                });  return false;");
                    btnDelete.Visible = true;
                    btnEdit.Visible = true;
                }
                else
                {
                    btnDelete.Visible = false;
                    btnEdit.Visible = false;
                }
            }
        }

        gvClients.EditIndex = -1;
        BindGridClients();
        

    }

    //EDITING
    protected void gvCompany_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView gv = (GridView)sender;
        gv.EditIndex = e.NewEditIndex;
        BindGrid();

    }
    protected void gvCompany_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    //CANCELLING
    protected void gvCompany_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView gv = (GridView)sender;
        gv.EditIndex = -1;
        BindGrid();
    }

    //ROW UPDATING
    protected void gvCompany_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridView gv = (GridView)sender;
        gv.EditIndex = -1;
        BindGrid();
    }

    //PAGE INDEX CHANGE
    protected void gvCompany_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        ((GridView)sender).PageIndex = e.NewPageIndex;
        BindGrid();

    }

    protected void ddlSector_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddl = (DropDownList)sender;
        GridViewRow row = (GridViewRow)ddl.Parent.Parent;
        int idx = row.RowIndex;

        DropDownList ddlSector = (DropDownList)row.FindControl("ddlSector");
        ddlSector.DataSource = Helper.LoadSector();
        ddlSector.DataTextField = "SECDESC";
        ddlSector.DataValueField = "SECCODE";
        ddlSector.DataBind();

    }

    //DELETE
    protected void gvCompany_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView gv = (GridView)sender;
        //DataTable dt = (DataTable)ViewState["dtOrders"];
        string msocode = Session["MSOCODE"].ToString();
        //string orderno = dt.Rows[e.RowIndex]["ORDERNO"].ToString();
        //Helper.DeleteOrder(msocode, orderno);
        gv.EditIndex = -1;
        BindGrid();
        gv.SelectRow(0);
    }


    protected void gvClients_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView gv = (GridView)sender;
        if (e.Row.RowType == DataControlRowType.DataRow && ((GridView)sender).EditIndex == -1)
        {
            e.Row.Attributes["onmouseover"] = "this.style.cursor='hand';this.style.textDecoration='none';";
            e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";
            e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(gv, "Select$" + e.Row.RowIndex);

        }
    }
    protected void gvClients_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView gv = (GridView)sender;
        if (gv.EditIndex == -1)
        {
            foreach (GridViewRow row in gv.Rows)
            {
                Button btnDelete = (Button)row.FindControl("btnDelete");
                Button btnEdit = (Button)row.FindControl("btnEdit");
                string key = gv.DataKeys[row.RowIndex]["CLIENTCODE"].ToString();
                if (row.RowIndex == gv.SelectedIndex && key != "")
                {
                    btnDelete.Attributes.Add("onClick", "return confirm('Are you sure?');");
                    btnDelete.Visible = true;
                    btnEdit.Visible = true;
                }
                else
                {
                    btnDelete.Visible = false;
                    btnEdit.Visible = false;
                }
            }
        }
    }
    
    protected void gvClients_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView gv = (GridView)sender;
        gv.EditIndex = -1;
        BindGrid();
    }
    protected void gvClients_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    
    protected void gvClients_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void gvClients_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView gv = (GridView)sender;
        gv.EditIndex = e.NewEditIndex;
        BindGrid();
    }
    protected void gvClients_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect(prevPage);
    }
}