Imports System.Data.SqlClient

Partial Class ClientInformation
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("MSOCODE").ToString()
            'Session("USERID").ToString()
            If Session("CLIENTCODE") <> "" Then
                LoadValues()
                btnEdit.Visible = True
                btnDelete.Visible = True
            Else
                btnEdit.Text = "CANCEL"
                btnEdit.Visible = True
                btnDelete.Visible = False
                If Session("COCODE") <> "" Then
                    'company
                    Dim sqlCompany As String = "SELECT CODESC FROM COMPANYLIB WHERE COCODE=@COCODE AND MSOCODE=@MSOCODE"
                    Dim connCompany As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
                    Dim cmdCompany As SqlCommand = New SqlCommand(sqlCompany, connCompany)
                    cmdCompany.Parameters.AddWithValue("@COCODE", Session("COCODE"))
                    cmdCompany.Parameters.AddWithValue("@MSOCODE", Session("MSOCODE"))
                    Dim readerCompany As SqlDataReader
                    connCompany.Open()
                    readerCompany = cmdCompany.ExecuteReader()
                    If (readerCompany.Read()) Then
                        lblCompanyValue.Text = readerCompany("CODESC")
                    End If
                    'sector
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
                    Response.Redirect("~/Company.aspx")
                End If

            End If
        End If
    End Sub

    Function getlastnum() As Integer

        Dim ssql As String = "SELECT isnull(max(substring(CLIENTCODE,1,10)),'0000000000') as seq FROM CLIENTLIB WHERE MSOCODE=@MSOCODE"
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
        Dim cmd As SqlCommand = New SqlCommand(ssql, conn)
        cmd.Parameters.AddWithValue("@MSOCODE", Session("MSOCODE"))
        cmd.Parameters.AddWithValue("@COCODE", Session("COCODE"))
        conn.Open()
        Dim retVal As Integer = CType(cmd.ExecuteScalar, Integer)
        Return retVal

    End Function

    Protected Sub LoadValues()
        Dim sql As String = "SELECT CLIENTLIB.MSOCODE, CLIENTLIB.CLIENTCODE, COMPANYLIB.CODESC, COMPANYBRANCHLIB.BRDESC, SECTORLIB.SECDESC, CLIENTLIB.LASTNAME, CLIENTLIB.FIRSTNAME, " +
        "CLIENTLIB.MIDDLENAME, CLIENTLIB.POSITION, CLIENTLIB.ADDRESS, CLIENTLIB.ZIPCD, CLIENTLIB.TELNO, CLIENTLIB.FAXNO, CLIENTLIB.WHENLAST, CLIENTLIB.DTE, CLIENTLIB.USERID " +
        "FROM CLIENTLIB LEFT OUTER JOIN " +
        "COMPANYBRANCHLIB ON CLIENTLIB.COBRANCH = COMPANYBRANCHLIB.COBRANCH LEFT OUTER JOIN " +
        "COMPANYLIB ON CLIENTLIB.COCODE = COMPANYLIB.COCODE LEFT OUTER JOIN " +
        "SECTORLIB ON CLIENTLIB.SECCODE = SECTORLIB.SECCODE " +
        "WHERE (CLIENTLIB.MSOCODE = @MSOCODE) AND (CLIENTLIB.COCODE = @COCODE) AND (CLIENTLIB.CLIENTCODE = @CCODE) " +
        "AND (CLIENTLIB.MSOCODE = COMPANYLIB.MSOCODE)"
        Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
        Dim cmd As SqlCommand = New SqlCommand(sql, conn)
        cmd.Parameters.AddWithValue("@COCODE", Session("COCODE"))
        cmd.Parameters.AddWithValue("@CCODE", Session("CLIENTCODE"))
        cmd.Parameters.AddWithValue("@MSOCODE", Session("MSOCODE"))
        'cmd.Parameters.AddWithValue("@COBRANCH", Session("COBRANCH"))
        Dim reader As SqlDataReader
        conn.Open()
        reader = cmd.ExecuteReader()
        If (reader.Read()) Then
            txtClientCode.Text = reader("CLIENTCODE")
            lblCompanyValue.Text = reader("CODESC")
            lblBranchValue.Text = If(IsDBNull(reader("BRDESC")), "", reader("BRDESC"))
            txtLName.Text = If(IsDBNull(reader("LASTNAME")), "", reader("LASTNAME"))
            txtFName.Text = If(IsDBNull(reader("FIRSTNAME")), "", reader("FIRSTNAME"))
            txtMName.Text = If(IsDBNull(reader("MIDDLENAME")), "", reader("MIDDLENAME"))
            txtPosition.Text = If(IsDBNull(reader("POSITION")), "", reader("POSITION"))
            txtAddress.Text = If(IsDBNull(reader("ADDRESS")), "", reader("ADDRESS"))
            txtZipCode.Text = If(IsDBNull(reader("ZIPCD")), "", reader("ZIPCD"))
            txtTel.Text = If(IsDBNull(reader("TELNO")), "", reader("TELNO"))
            txtFax.Text = If(IsDBNull(reader("FAXNO")), "", reader("FAXNO"))
            txtLastOrder.Text = If(IsDBNull(reader("WHENLAST")), "", reader("WHENLAST"))
            lblSectorValue.Text = If(IsDBNull(reader("SECDESC")), Session("SECCODE"), reader("SECDESC"))
        End If

    End Sub


    Protected Sub SaveInfo()
        Dim sqlClientSave As String = "INSERT INTO CLIENTLIB (MSOCODE, COCODE, CLIENTCODE, LASTNAME, FIRSTNAME, MIDDLENAME, SECCODE, POSITION, ADDRESS, ZIPCD, TELNO, FAXNO, WHENLAST, DTE, USERID) VALUES (@MSOCODE, @COCODE, @CLIENTCODE, @LASTNAME, @FIRSTNAME, @MIDDLENAME, @SECCODE, @POSITION, @ADDRESS, @ZIPCD, @TELNO, @FAXNO, @WHENLAST, @DTE, @USERID)"
        Dim connClientSave As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
        Dim cmdClient As SqlCommand = New SqlCommand(sqlClientSave, connClientSave)
        With cmdClient.Parameters
            .AddWithValue("@MSOCODE", Session("MSOCODE"))
            .AddWithValue("@COCODE", Session("COCODE"))
            .AddWithValue("@CLIENTCODE", lblCode.Text)
            .AddWithValue("@LASTNAME", txtLName.Text)
            .AddWithValue("@FIRSTNAME", txtFName.Text)
            .AddWithValue("@MIDDLENAME", txtMName.Text)
            .AddWithValue("@SECCODE", Session("SECCODE"))
            .AddWithValue("@ADDRESS", txtAddress.Text)
            .AddWithValue("@POSITION", txtPosition.Text)
            .AddWithValue("@ZIPCD", txtZipCode.Text)
            .AddWithValue("@TELNO", txtTel.Text)
            .AddWithValue("@FAXNO", txtFax.Text)
            .AddWithValue("@WHENLAST", txtLastOrder.Text)
            .AddWithValue("@DTE", Date.Now())
            .AddWithValue("@USERID", Session("USERID"))
        End With
        connClientSave.Open()
        cmdClient.ExecuteNonQuery()
        ClearAll()
        DisableAll()
    End Sub

    Protected Sub EnableAll()
        txtLName.Enabled = True
        txtLName.Focus()
        txtFName.Enabled = True
        txtMName.Enabled = True
        txtPosition.Enabled = True
        txtAddress.Enabled = True
        txtZipCode.Enabled = True
        txtTel.Enabled = True
        txtFax.Enabled = True
        txtLastOrder.Enabled = True

    End Sub

    Protected Sub DisableAll()
        txtLName.Enabled = False
        txtLName.Focus()
        txtFName.Enabled = False
        txtMName.Enabled = False
        txtPosition.Enabled = False
        txtAddress.Enabled = False
        txtZipCode.Enabled = False
        txtTel.Enabled = False
        txtFax.Enabled = False
        txtLastOrder.Enabled = False
        lblSectorValue.Text = ""

    End Sub

    Protected Sub ClearAll()
        txtFName.Text = ""
        txtMName.Text = ""
        txtLName.Text = ""
        txtPosition.Text = ""
        txtAddress.Text = ""
        txtZipCode.Text = ""
        txtTel.Text = ""
        txtFax.Text = ""
        txtLastOrder.Text = ""
        lblSectorValue.Text = ""
    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As System.EventArgs) Handles btnAdd.Click
        EnableAll()
        ClearAll()
        Dim sql As String = "SELECT SECDESC FROM SECTORLIB WHERE SECCODE = @SECCODE"
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
        txtClientCode.Text = val
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As System.EventArgs) Handles btnSave.Click
        If txtLName.Text = "" Then
            lblAsterisk.Visible = True
        ElseIf txtAddress.Text = "" Then
            lblAsterisk1.Visible = True
        ElseIf IsNumeric(txtZipCode.Text) = False Then
            lblError.Visible = True
        ElseIf txtTel.Text = "" Then
            lblAsterisk2.Visible = True
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
            Response.Redirect("~/Company.aspx")
        End If

    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As System.EventArgs) Handles btnUpdate.Click
        Dim sqlClientUpdate As String = "UPDATE CLIENTLIB SET LASTNAME = @LASTNAME, FIRSTNAME=@FIRSTNAME, MIDDLENAME=@MIDDLENAME, SECCODE=@SECCODE, ADDRESS=@ADDRESS, POSITION=@POSITION, ZIPCD=@ZIPCD, TELNO=@TELNO, FAXNO=@FAXNO, WHENLAST=@WHENLAST, DTE=@DTE, USERID=@USERID WHERE MSOCODE = @MSOCODE AND CLIENTCODE = @CLIENTCODE"
        Dim connClientUpdate As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
        Dim cmdClient As SqlCommand = New SqlCommand(sqlClientUpdate, connClientUpdate)
        With cmdClient.Parameters
            .AddWithValue("@MSOCODE", Session("MSOCODE"))
            .AddWithValue("@COCODE", Session("COCODE"))
            .AddWithValue("@CLIENTCODE", lblCode.Text)
            .AddWithValue("@LASTNAME", txtLName.Text)
            .AddWithValue("@FIRSTNAME", txtFName.Text)
            .AddWithValue("@MIDDLENAME", txtMName.Text)
            .AddWithValue("@SECCODE", Session("SECCODE"))
            .AddWithValue("@ADDRESS", txtAddress.Text)
            .AddWithValue("@POSITION", txtPosition.Text)
            .AddWithValue("@ZIPCD", txtZipCode.Text)
            .AddWithValue("@TELNO", txtTel.Text)
            .AddWithValue("@FAXNO", txtFax.Text)
            .AddWithValue("@WHENLAST", txtLastOrder.Text)
            .AddWithValue("@DTE", Date.Now())
            .AddWithValue("@USERID", Session("USERID"))
        End With
        connClientUpdate.Open()
        cmdClient.ExecuteNonQuery()
        DisableAll()
        btnUpdate.Visible = False
        btnEdit.Visible = True
        btnDelete.Visible = True
    End Sub

    Protected Sub btnDelete_Click(sender As Object, e As System.EventArgs) Handles btnDelete.Click
        Dim sqlClientDelete As String = "DELETE FROM CLIENTLIB WHERE MSOCODE = @MSOCODE AND CLIENTCODE = @CLIENTCODE"
        Dim connClientDelete As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
        Dim cmdClientDelete As SqlCommand = New SqlCommand(sqlClientDelete, connClientDelete)
        cmdClientDelete.Parameters.AddWithValue("@CLIENTCODE", Session("CLIENTCODE"))
        cmdClientDelete.Parameters.AddWithValue("@MSOCODE", Session("MSOCODE"))
        connClientDelete.Open()
        cmdClientDelete.ExecuteNonQuery()
        ClearAll()
        Response.Redirect("~/Company.aspx")
    End Sub


End Class
