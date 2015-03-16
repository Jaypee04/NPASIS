
Partial Class UserLibrary
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Session("MSOCODE").toString()
        'Session("User").toString()
    End Sub

    Protected Sub btnListAll_Click(sender As Object, e As System.EventArgs) Handles btnListAll.Click
        GridView2.AllowPaging = False
        SqlDataSource2.DataBind()

        btnListby6.Visible = True
        btnListAll.Visible = False
        'Response.Redirect("~/default.aspx")
    End Sub

    Protected Sub btnListby6_Click(sender As Object, e As System.EventArgs) Handles btnListby6.Click
        'Response.Redirect("default.aspx")
        GridView2.AllowPaging = True
        SqlDataSource2.DataBind()

        btnListby6.Visible = False
        btnListAll.Visible = True
    End Sub

End Class
