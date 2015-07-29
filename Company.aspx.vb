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
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
        Try
            Dim sql As String = "SELECT COCODE, SECCODE FROM COMPANYLIB WHERE CODESC='" & GrdVwCompany.SelectedValue & "'"
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
            btnSelect1.Enabled = True
            btnSelect2.Enabled = True
        Finally
            conn.Close()
        End Try



    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As System.EventArgs) Handles btnCancel.Click
        If Session("GETCLIENT") = "1" Then
            Response.Redirect("~/ClientOrderSlip.aspx")
        ElseIf Session("GETCLIENT") = "2" Then
            Response.Redirect("~/Client Feedback.aspx")
        ElseIf Session("GETCLIENT") = "3" Then
            Response.Redirect("~/ICSU Order Slip.aspx")
        End If
        'Response.Redirect("~/Default.aspx")
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
        If lblBranch.Text <> "" Then
            Session("CLIENTCODE") = drpdwnlstBranch.SelectedValue
            Session("COCODE") = lblCompanyCode.Text
            Session("COBRANCH") = lblBranch.Text
            Session("CLIENT") = ""
        ElseIf lblClient.Text <> "" Then
            Session("CLIENTCODE") = drpdwnlstClient.SelectedValue
            Session("COCODE") = lblCompanyCode.Text
            Session("COBRANCH") = lblBranch.Text
            Session("CLIENT") = lblClient.Text
        ElseIf GrdVwCompany.SelectedValue <> "" Then
            Session("CLIENTCODE") = GrdVwCompany.SelectedValue
            Session("COCODE") = lblCompanyCode.Text
            Session("COBRANCH") = ""
            Session("CLIENT") = ""
        End If

        If Session("GETCLIENT") = "1" Then
            Response.Redirect("~/ClientOrderSlip.aspx")
        ElseIf Session("GETCLIENT") = "2" Then
            Response.Redirect("~/Client Feedback.aspx")
        ElseIf Session("GETCLIENT") = "3" Then
            Response.Redirect("~/ICSU Order Slip.aspx")
        End If

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

    Protected Sub btnSelect1_Click(sender As Object, e As System.EventArgs) Handles btnSelect1.Click
        drpdwnlstBranch.SelectedIndex = 0
        drpdwnlstBranch.Enabled = True
        lblBranch.Text = drpdwnlstBranch.SelectedValue.ToString()
        drpdwnlstBranch.DataBind()
        'SqlDataSourceBranch.DataBind()
    End Sub

    Protected Sub btnSelect2_Click(sender As Object, e As System.EventArgs) Handles btnSelect2.Click
        drpdwnlstClient.SelectedIndex = 0
        drpdwnlstClient.Enabled = True
        lblClient.Text = drpdwnlstClient.SelectedValue.ToString()
        drpdwnlstClient.DataBind()
        'SqlDataSourceClient.DataBind()

    End Sub

    Protected Sub drpdwnlstClient_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles drpdwnlstClient.SelectedIndexChanged
        lblClient.Text = drpdwnlstClient.SelectedValue.ToString()
        'Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
        'Try
        '    Dim sql As String = "SELECT DISTINCT CLIENTCODE, COCODE, LASTNAME + ', ' + FIRSTNAME AS FULLNAME FROM CLIENTLIB WHERE CLIENTCODE='" & drpdwnlstClient.SelectedValue & "' AND MSOCODE=@MSOCODE AND COCODE = '" & lblCompanyCode.Text & "'"
        '    Dim cmd As SqlCommand = New SqlCommand(sql, conn)
        '    cmd.Parameters.AddWithValue("@MSOCODE", Session("MSOCODE"))
        '    Dim reader As SqlDataReader
        '    conn.Open()
        '    reader = cmd.ExecuteReader()
        '    If (reader.Read()) Then
        '        lblClient.Text = reader("FULLNAME")
        '    End If
        'Finally
        '    conn.Close()
        'End Try
    End Sub

    Protected Sub drpdwnlstBranch_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles drpdwnlstBranch.SelectedIndexChanged
        lblBranch.Text = drpdwnlstBranch.SelectedValue.ToString()
    End Sub
End Class
