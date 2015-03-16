Imports System.Data.SqlClient

Partial Class CompanyMaintenance
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("MSOCODE").ToString()
            'Session("USERID").ToString()
            btnEdit.Visible = False
            btnDelete.Visible = False
            If Session("COCODE") <> "" Then
                LoadValues()
                btnEdit.Visible = True
                btnDelete.Visible = True
            Else
                btnEdit.Text = "CANCEL"
                btnEdit.Visible = True
            End If
        End If
    End Sub

    Function getlastnum() As Integer

        'Dim x As Integer = 1234

        'x = x + 1

        'MsgBox(Format(x, "0000000000"))


        Dim ssql As String = "SELECT isnull(max(substring(COCODE,1,10)),'0000000000') as seq FROM COMPANYLIB WHERE MSOCODE =@MSOCODE"
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
        Dim cmd As SqlCommand = New SqlCommand(ssql, conn)
        cmd.Parameters.AddWithValue("@MSOCODE", Session("MSOCODE"))
        conn.Open()

        Dim retVal As Integer = CType(cmd.ExecuteScalar, Integer)
        Return retVal

    End Function

    Protected Sub LoadValues()
        Dim sql As String = "SELECT COMPANYLIB.CODESC, COMPANYLIB.ADDRESS, COMPANYLIB.SECCODE, COMPANYLIB.ZIPCD,  COMPANYLIB.TELNO, COMPANYLIB.FAXNO, COMPANYLIB.WHENFIRST, COMPANYLIB.DTE, COMPANYLIB.USERID, SECTORLIB.SECDESC, SECTORLIB.SECCODE FROM COMPANYLIB LEFT OUTER JOIN SECTORLIB ON COMPANYLIB.SECCODE = SECTORLIB.SECCODE WHERE (COMPANYLIB.COCODE= @COCODE) AND (COMPANYLIB.MSOCODE = @MSOCODE)"
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
        Dim cmd As SqlCommand = New SqlCommand(sql, conn)
        cmd.Parameters.AddWithValue("@COCODE", Session("COCODE"))
        cmd.Parameters.AddWithValue("@MSOCODE", Session("MSOCODE"))
        Dim reader As SqlDataReader
        conn.Open()
        reader = cmd.ExecuteReader()
        If (reader.Read()) Then
            txtName.Text = reader("CODESC")
            txtAddress.Text = If(IsDBNull(reader("ADDRESS")), "", reader("ADDRESS"))
            txtZipCode.Text = If(IsDBNull(reader("ZIPCD")), "", reader("ZIPCD"))
            txtTel.Text = If(IsDBNull(reader("TELNO")), "", reader("TELNO"))
            txtFax.Text = If(IsDBNull(reader("FAXNO")), "", reader("FAXNO"))
            txtFirstOrder.Text = If(IsDBNull(reader("WHENFIRST")), "", reader("WHENFIRST"))
            drpdwnlstSector.SelectedValue = If(IsDBNull(reader("SECCODE")), Session("SECCODE"), reader("SECCODE"))


        End If

    End Sub


    Protected Sub SaveInfo()
        Dim sqlCompanySave As String = "INSERT INTO COMPANYLIB (MSOCODE, COCODE, CODESC, SECCODE, ADDRESS, ZIPCD, TELNO, FAXNO, WHENFIRST, DTE, USERID) VALUES (@MSOCODE, @COCODE, @CODESC, @SECCODE, @ADDRESS, @ZIPCD, @TELNO, @FAXNO, @WHENFIRST, @DTE, @USERID)"
        Dim connCompanySave As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
        Dim cmdCompany As SqlCommand = New SqlCommand(sqlCompanySave, connCompanySave)
        With cmdCompany.Parameters
            .AddWithValue("@MSOCODE", Session("MSOCODE"))
            .AddWithValue("@COCODE", lblCode.Text)
            .AddWithValue("@CODESC", txtName.Text)
            .AddWithValue("@SECCODE", drpdwnlstSector.SelectedValue)
            .AddWithValue("@ADDRESS", txtAddress.Text)
            .AddWithValue("@ZIPCD", txtZipCode.Text)
            .AddWithValue("@TELNO", txtTel.Text)
            .AddWithValue("@FAXNO", txtFax.Text)
            .AddWithValue("@WHENFIRST", txtFirstOrder.Text)
            .AddWithValue("@DTE", Date.Now())
            .AddWithValue("@USERID", Session("USERID"))
        End With
        connCompanySave.Open()
        cmdCompany.ExecuteNonQuery()
        ClearAll()
        DisableAll()
    End Sub
    Protected Sub EnableAll()
        txtName.Enabled = True
        txtName.Focus()
        txtAddress.Enabled = True
        txtZipCode.Enabled = True
        txtTel.Enabled = True
        txtFax.Enabled = True
        txtFirstOrder.Enabled = True
        drpdwnlstSector.Enabled = True
    End Sub

    Protected Sub DisableAll()
        txtName.Enabled = False
        txtAddress.Enabled = False
        txtZipCode.Enabled = False
        txtTel.Enabled = False
        txtFax.Enabled = False
        txtFirstOrder.Enabled = False
        drpdwnlstSector.Enabled = False
    End Sub

    Protected Sub ClearAll()
        txtName.Text = ""
        txtAddress.Text = ""
        txtZipCode.Text = ""
        txtTel.Text = ""
        txtFax.Text = ""
        txtFirstOrder.Text = ""
        drpdwnlstSector.SelectedValue = "AC-126-001"
    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As System.EventArgs) Handles btnAdd.Click
        EnableAll()
        ClearAll()
        btnAdd.Visible = False
        btnSave.Visible = True
        btnEdit.Text = "CANCEL"
        btnEdit.Visible = True
        btnDelete.Visible = False
        btnUpdate.Visible = False
        Dim val As String
        val = Format(getlastnum() + 1, "0000000000")
        'lblCode.Visible = True
        lblCode.Text = val
        drpdwnlstSector.SelectedValue = "AC-126-001"
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As System.EventArgs) Handles btnSave.Click
        If txtName.Text = "" Then
            lblAsterisk.Visible = True
        ElseIf txtAddress.Text = "" Then
            lblAsterisk1.Visible = True
        ElseIf txtTel.Text = "" Then
            lblAsterisk2.Visible = True
        ElseIf IsNumeric(txtZipCode.Text) = False Then
            lblError.Visible = True
        Else
            SaveInfo()
            btnSave.Visible = False
            btnAdd.Visible = True
        End If

    End Sub

    Protected Sub btnEdit_Click(sender As Object, e As System.EventArgs) Handles btnEdit.Click
        If btnEdit.Text = "EDIT" Then
            EnableAll()
            drpdwnlstSector.Enabled = False
            btnEdit.Visible = False
            btnDelete.Visible = False
            btnUpdate.Visible = True

        ElseIf btnEdit.Text = "CANCEL" Then
            Response.Redirect("~/Company.aspx")
        End If
       
    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As System.EventArgs) Handles btnUpdate.Click
        Dim sqlCompanyUpdate As String = "UPDATE COMPANYLIB SET CODESC = @CODESC, ADDRESS = @ADDRESS, ZIPCD = @ZIPCD, TELNO = @TELNO, FAXNO = @FAXNO, WHENFIRST = @WHENFIRST, DTE=@DTE, USERID=@USERID WHERE MSOCODE = @MSOCODE AND COCODE = @COCODE"
        Dim connCompanyUpdate As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
        Dim cmdCompany As SqlCommand = New SqlCommand(sqlCompanyUpdate, connCompanyUpdate)
        With cmdCompany.Parameters
            .AddWithValue("@MSOCODE", Session("MSOCODE"))
            .AddWithValue("@COCODE", Session("COCODE"))
            .AddWithValue("@CODESC", txtName.Text)
            .AddWithValue("@ADDRESS", txtAddress.Text)
            .AddWithValue("@ZIPCD", txtZipCode.Text)
            .AddWithValue("@TELNO", txtTel.Text)
            .AddWithValue("@FAXNO", txtFax.Text)
            .AddWithValue("@WHENFIRST", txtFirstOrder.Text)
            .AddWithValue("@DTE", Date.Now())
            .AddWithValue("@USERID", Session("USERID"))
        End With
        connCompanyUpdate.Open()
        cmdCompany.ExecuteNonQuery()
        DisableAll()
        btnUpdate.Visible = False
        btnEdit.Visible = True
        btnDelete.Visible = True
    End Sub

    Protected Sub btnDelete_Click(sender As Object, e As System.EventArgs) Handles btnDelete.Click
        Dim sqlCompanyDelete As String = "DELETE FROM COMPANYLIB WHERE COCODE = @COCODE AND MSOCODE = @MSOCODE"
        Dim connCompanyDelete As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
        Dim cmdCompanyDelete As SqlCommand = New SqlCommand(sqlCompanyDelete, connCompanyDelete)
        cmdCompanyDelete.Parameters.AddWithValue("@COCODE", Session("COCODE"))
        cmdCompanyDelete.Parameters.AddWithValue("@MSOCODE", Session("MSOCODE"))
        connCompanyDelete.Open()
        cmdCompanyDelete.ExecuteNonQuery()
        ClearAll()
        Response.Redirect("~/Company.aspx")
    End Sub
End Class
