Imports System.Data.SqlClient

Partial Class Company
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Session("MSOCODE").ToString()
        btnOk.Enabled = False
        btnCancel.Enabled = False
        If Session("GETCLIENT") = True Then
            btnOk.Enabled = True
            btnCancel.Enabled = True
        ElseIf Session("GETCLIENT") = False Then
            btnOk.Enabled = False
            btnCancel.Enabled = False
        End If
    End Sub

    Protected Sub GrdVwCompany_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GrdVwCompany.SelectedIndexChanged
        Dim sql As String = "SELECT COCODE, SECCODE FROM COMPANYLIB WHERE CODESC='" & GrdVwCompany.SelectedValue & "'"
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
        Dim cmd As SqlCommand = New SqlCommand(sql, conn)
        Dim reader As SqlDataReader
        conn.Open()
        reader = cmd.ExecuteReader()
        If (reader.Read()) Then
            lblCompanyCode.Text = reader("COCODE")
            Session("SECCODE") = reader("SECCODE")
            Session("COCODE") = reader("COCODE")

        End If
        btnBranch.Enabled = True
        btnAdd2.Enabled = True
        btnAdd3.Enabled = True
        btnClient.Enabled = True
        drpdwnlstBranch.Enabled = True
        drpdwnlstClient.Enabled = True
        SqlDataSourceBranch.DataBind()
        drpdwnlstBranch.DataBind()
        SqlDataSourceClient.DataBind()
        drpdwnlstClient.DataBind()
    End Sub


    Protected Sub btnCancel_Click(sender As Object, e As System.EventArgs) Handles btnCancel.Click
        Response.Redirect("~/Default.aspx")
    End Sub

    Protected Sub btnCompany_Click(sender As Object, e As System.EventArgs) Handles btnCompany.Click
        Response.Redirect("~/CompanyMaintenance.aspx")
    End Sub

    Protected Sub btnBranch_Click(sender As Object, e As System.EventArgs) Handles btnBranch.Click
        Session("COBRANCH") = drpdwnlstBranch.SelectedValue
        Response.Redirect("~/CompanyBranch.aspx")
    End Sub

    Protected Sub btnClient_Click(sender As Object, e As System.EventArgs) Handles btnClient.Click
        Session("CLIENTCODE") = drpdwnlstClient.SelectedValue
        Response.Redirect("~/ClientInformation.aspx")
    End Sub

    Protected Sub btnOk_Click(sender As Object, e As System.EventArgs) Handles btnOk.Click
        Session("CLIENTCODE") = drpdwnlstClient.SelectedValue
        Response.Redirect("~/MSOOrderSlip.aspx")
        Session("GETCLIENT") = False
    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As System.EventArgs) Handles btnAdd.Click
        Session("COCODE") = ""
        Response.Redirect("~/CompanyMaintenance.aspx")
    End Sub

    Protected Sub btnAdd2_Click(sender As Object, e As System.EventArgs) Handles btnAdd2.Click
        Session("COBRANCH") = ""
        Response.Redirect("~/CompanyBranch.aspx")
    End Sub

    Protected Sub btnAdd3_Click(sender As Object, e As System.EventArgs) Handles btnAdd3.Click
        Session("CLIENTCODE") = ""
        Response.Redirect("~/ClientInformation.aspx")
    End Sub
End Class
