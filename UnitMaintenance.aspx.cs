using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;


public partial class UnitMaintenance : System.Web.UI.Page
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
            gvUnitLib.RowStyle.Height = 30;
            gvUnitLib.SelectRow(0);
            prevPage = Request.UrlReferrer.ToString();
        }

    }

    private void BindGrid()
    {
        gvUnitLib.DataSource = Helper.LoadUnitLib();
        gvUnitLib.DataBind();

    }


    protected void gvUnitLib_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView gv = (GridView)sender;
        if (e.Row.RowType == DataControlRowType.DataRow && ((GridView)sender).EditIndex == -1)
        {
            e.Row.Attributes["onmouseover"] = "this.style.cursor='hand';this.style.textDecoration='none';";
            e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";
            e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(gv, "Select$" + e.Row.RowIndex);

        }
        
    }

    //
    protected void gvUnitLib_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView gv = (GridView)sender;
        if (gv.EditIndex == -1)
        {
            foreach (GridViewRow row in gv.Rows)
            {
                Button btnDelete = (Button)row.FindControl("btnDelete");
                Button btnEdit = (Button)row.FindControl("btnEdit");
                string key = gv.DataKeys[row.RowIndex]["UNITCODE"].ToString();
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

        
    }

    //EDITING
    protected void gvUnitLib_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView gv = (GridView)sender;
        gv.EditIndex = e.NewEditIndex;
        BindGrid();

    }
    protected void gvUnitLib_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    //CANCELLING
    protected void gvUnitLib_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView gv = (GridView)sender;
        gv.EditIndex = -1;
        BindGrid();
    }

    //ROW UPDATING
    protected void gvUnitLib_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridView gv = (GridView)sender;
        string unitcode = gv.DataKeys[e.RowIndex]["UNITCODE"].ToString();
        string newunitcode = ((TextBox)gv.Rows[e.RowIndex].FindControl("txtUnitCode")).Text;
        string description = ((TextBox)gv.Rows[e.RowIndex].FindControl("txtDescription")).Text;
        string type = ((TextBox)gv.Rows[e.RowIndex].FindControl("txtType")).Text;
        string user = Session["User"].ToString();

        Helper.UpdateUnitDetails(unitcode, newunitcode, description, type, user);
        gv.EditIndex = -1;
        BindGrid();
        ScriptManager.RegisterStartupScript(this, typeof(Page), "UpdateUnit", @"$(document).ready(function(){alertify.success('Unit details updated successfully!');});", true);
    }

    //PAGE INDEX CHANGE
    protected void gvUnitLib_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        ((GridView)sender).PageIndex = e.NewPageIndex;
        BindGrid();

    }

    
    //DELETE
    protected void gvUnitLib_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView gv = (GridView)sender;
        string unitcode = gv.DataKeys[e.RowIndex]["UNITCODE"].ToString();
        Helper.DeleteUnitDetails(unitcode);
        ScriptManager.RegisterStartupScript(this, typeof(Page), "DeleteUnit", @"$(document).ready(function(){alertify.success('Unit details deleted successfully!');});", true);
        gv.EditIndex = -1;
        BindGrid();
        gv.SelectRow(0);
    }


    protected void btnInsert_Click(object sender, EventArgs e)
    {
        GridView gv = gvUnitLib;
        string unitcode = ((TextBox)gv.FooterRow.FindControl("txtUnitCodeInsert")).Text;
        string description = ((TextBox)gv.FooterRow.FindControl("txtDescriptionInsert")).Text;
        string type = ((TextBox)gv.FooterRow.FindControl("txtTypeInsert")).Text;
        string user = Session["User"].ToString();
        Helper.InsertUnitDetails(unitcode, description, type, user);
        ScriptManager.RegisterStartupScript(this, typeof(Page), "InsertUnit", @"$(document).ready(function(){alertify.success('Unit details added successfully!');});", true);
        gv.EditIndex = -1;
        BindGrid();
    }
    
}