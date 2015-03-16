
Partial Class DivisionLib
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Session("USERID").ToString()
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnListAll.Click
        GridView2.AllowPaging = False
        SqlDataSource2.DataBind()

        btnListby6.Visible = True
        btnListAll.Visible = False
        'Response.Redirect("~/default.aspx")
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnListby6.Click
        'Response.Redirect("default.aspx")
        GridView2.AllowPaging = True
        SqlDataSource2.DataBind()

        btnListby6.Visible = False
        btnListAll.Visible = True
    End Sub

End Class
