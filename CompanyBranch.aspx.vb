Imports System.Data.SqlClient

Partial Class CompanyBranch
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("MSOCODE").ToString()
            'Session("USERID").ToString()
            If Session("COBRANCH") <> "" Then
                LoadValues()
                btnEdit.Visible = True
                btnDelete.Visible = True
            Else
                btnEdit.Text = "CANCEL"
                btnEdit.Visible = True
                btnDelete.Visible = False
                If Session("COCODE") <> "" Then
                    Dim sql As String = "SELECT SECCODE, SECDESC FROM SECTORLIB WHERE SECCODE=@SECCODE"
                    Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
                    Dim cmd As SqlCommand = New SqlCommand(sql, conn)
                    cmd.Parameters.AddWithValue("@SECCODE", Session("SECCODE"))
                    Dim reader As SqlDataReader
                    conn.Open()
                    reader = cmd.ExecuteReader()
                    If (reader.Read()) Then
                        lblSectorValue.Text = reader("SECDESC")
                    Else
                        lblSectorValue.Text = Session("SECCODE")
                    End If
                Else
                    'btnEdit.Visible = False
                    'btnDelete.Visible = False
                    Response.Redirect("~/Company.aspx")
                End If

            End If
        End If
    End Sub

    Function getlastnum() As Integer

        Dim ssql As String = "SELECT isnull(max(substring(COBRANCH,1,10)),'0000000000') as seq FROM COMPANYBRANCHLIB WHERE MSOCODE=@MSOCODE AND COCODE=@COCODE"
        'Dim ssql As String = "SELECT Max(COCODE) FROM COMPANYBRANCHLIB WHERE MSOCODE=@MSOCODE AND COCODE=@COCODE"
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
        Dim cmd As SqlCommand = New SqlCommand(ssql, conn)
        cmd.Parameters.AddWithValue("@MSOCODE", Session("MSOCODE"))
        cmd.Parameters.AddWithValue("@COCODE", Session("COCODE"))
        conn.Open()
        Dim retVal As Integer = CType(cmd.ExecuteScalar, Integer)
        Return retVal

    End Function

    Protected Sub LoadValues()
        Dim sql As String = "SELECT COMPANYBRANCHLIB.BRDESC, COMPANYBRANCHLIB.SECCODE, COMPANYBRANCHLIB.ADDRESS, COMPANYBRANCHLIB.ZIPCD, COMPANYBRANCHLIB.TELNO, COMPANYBRANCHLIB.FAXNO, COMPANYBRANCHLIB.DTE, COMPANYBRANCHLIB.USERID, SECTORLIB.SECDESC FROM COMPANYBRANCHLIB LEFT OUTER JOIN SECTORLIB ON COMPANYBRANCHLIB.SECCODE = SECTORLIB.SECCODE WHERE (COMPANYBRANCHLIB.COCODE= @COCODE) AND (COMPANYBRANCHLIB.MSOCODE = @MSOCODE) AND (COMPANYBRANCHLIB.COBRANCH = @COBRANCH)"
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
        Dim cmd As SqlCommand = New SqlCommand(sql, conn)
        cmd.Parameters.AddWithValue("@COCODE", Session("COCODE"))
        cmd.Parameters.AddWithValue("@MSOCODE", Session("MSOCODE"))
        cmd.Parameters.AddWithValue("@COBRANCH", Session("COBRANCH"))
        Dim reader As SqlDataReader
        conn.Open()
        reader = cmd.ExecuteReader()
        If (reader.Read()) Then
            txtName.Text = reader("BRDESC")
            txtAddress.Text = If(IsDBNull(reader("ADDRESS")), "", reader("ADDRESS"))
            txtZipCode.Text = If(IsDBNull(reader("ZIPCD")), "", reader("ZIPCD"))
            txtTel.Text = If(IsDBNull(reader("TELNO")), "", reader("TELNO"))
            txtFax.Text = If(IsDBNull(reader("FAXNO")), "", reader("FAXNO"))
            lblSectorValue.Text = If(IsDBNull(reader("SECDESC")), Session("SECCODE"), reader("SECDESC"))
        End If

    End Sub


    Protected Sub SaveInfo()
        Dim sqlCompanyBranchSave As String = "INSERT INTO COMPANYBRANCHLIB (MSOCODE, COCODE, COBRANCH, BRDESC, SECCODE, ADDRESS, ZIPCD, TELNO, FAXNO, DTE, USERID) VALUES (@MSOCODE, @COCODE, @COBRANCH, @BRDESC, @SECCODE, @ADDRESS, @ZIPCD, @TELNO, @FAXNO, @DTE, @USERID)"
        Dim connCompanyBranchSave As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
        Dim cmdCompanyBranch As SqlCommand = New SqlCommand(sqlCompanyBranchSave, connCompanyBranchSave)
        With cmdCompanyBranch.Parameters
            .AddWithValue("@MSOCODE", Session("MSOCODE"))
            .AddWithValue("@COCODE", Session("COCODE"))
            .AddWithValue("@COBRANCH", lblCode.Text)
            .AddWithValue("@BRDESC", txtName.Text)
            .AddWithValue("@SECCODE", Session("SECCODE"))
            .AddWithValue("@ADDRESS", txtAddress.Text)
            .AddWithValue("@ZIPCD", txtZipCode.Text)
            .AddWithValue("@TELNO", txtTel.Text)
            .AddWithValue("@FAXNO", txtFax.Text)
            .AddWithValue("@DTE", Date.Now())
            .AddWithValue("@USERID", Session("USERID"))
        End With
        connCompanyBranchSave.Open()
        cmdCompanyBranch.ExecuteNonQuery()
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

    End Sub

    Protected Sub DisableAll()
        txtName.Enabled = False
        txtAddress.Enabled = False
        txtZipCode.Enabled = False
        txtTel.Enabled = False
        txtFax.Enabled = False

    End Sub

    Protected Sub ClearAll()
        txtName.Text = ""
        txtAddress.Text = ""
        txtZipCode.Text = ""
        txtTel.Text = ""
        txtFax.Text = ""

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
            Response.Redirect("~/Company.aspx")
        End If

    End Sub

    Protected Sub btnEdit_Click(sender As Object, e As System.EventArgs) Handles btnEdit.Click
        If btnEdit.Text = "EDIT" Then
            EnableAll()
            btnEdit.Visible = False
            btnDelete.Visible = False
            btnUpdate.Visible = True
        ElseIf btnEdit.Text = "CANCEL" Then
            'DisableAll()
            'btnAdd.Visible = True
            'btnSave.Visible = False
            'btnUpdate.Visible = False
            'btnDelete.Visible = True
            'btnEdit.Text = "EDIT"
            Response.Redirect("~/Company.aspx")
        End If

    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As System.EventArgs) Handles btnUpdate.Click
        Dim sqlCompanyBranchUpdate As String = "UPDATE COMPANYBRANCHLIB SET BRDESC = @BRDESC, ADDRESS = @ADDRESS, ZIPCD = @ZIPCD, TELNO = @TELNO, FAXNO = @FAXNO, DTE=@DTE, USERID = @USERID WHERE MSOCODE = @MSOCODE AND COCODE = @COCODE AND COBRANCH=@COBRANCH"
        Dim connCompanyBranchUpdate As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
        Dim cmdCompanyBranch As SqlCommand = New SqlCommand(sqlCompanyBranchUpdate, connCompanyBranchUpdate)
        With cmdCompanyBranch.Parameters
            .AddWithValue("@MSOCODE", Session("MSOCODE"))
            .AddWithValue("@COCODE", Session("COCODE"))
            .AddWithValue("@COBRANCH", Session("COBRANCH"))
            .AddWithValue("@BRDESC", txtName.Text)
            .AddWithValue("@ADDRESS", txtAddress.Text)
            .AddWithValue("@ZIPCD", txtZipCode.Text)
            .AddWithValue("@TELNO", txtTel.Text)
            .AddWithValue("@FAXNO", txtFax.Text)
            .AddWithValue("@DTE", Date.Now())
            .AddWithValue("@USERID", Session("USERID"))
        End With
        connCompanyBranchUpdate.Open()
        cmdCompanyBranch.ExecuteNonQuery()
        DisableAll()
        btnUpdate.Visible = False
        btnEdit.Visible = True
        btnDelete.Visible = True
    End Sub

    Protected Sub btnDelete_Click(sender As Object, e As System.EventArgs) Handles btnDelete.Click
        Dim sqlCompanyBranchDelete As String = "DELETE FROM COMPANYBRANCHLIB WHERE COBRANCH = @COBRANCH AND COCODE = @COCODE AND MSOCODE = @MSOCODE"
        Dim connCompanyBranchDelete As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
        Dim cmdCompanyBranchDelete As SqlCommand = New SqlCommand(sqlCompanyBranchDelete, connCompanyBranchDelete)
        cmdCompanyBranchDelete.Parameters.AddWithValue("@COBRANCH", Session("COBRANCH"))
        cmdCompanyBranchDelete.Parameters.AddWithValue("@COCODE", Session("COCODE"))
        cmdCompanyBranchDelete.Parameters.AddWithValue("@MSOCODE", Session("MSOCODE"))
        connCompanyBranchDelete.Open()
        cmdCompanyBranchDelete.ExecuteNonQuery()
        ClearAll()
        Response.Redirect("~/Company.aspx")
    End Sub

End Class
