Imports System.Data.SqlClient

Partial Class MapSalesOffice
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        'Session("USERID").ToString()
        Session("MSOCODE").ToString()
    End Sub

    'Protected Sub CheckCode()
    '    Dim sqlMSOCODE As String = "SELECT * FROM MSOLIB WHERE MSOCODE=@MSOCODE"
    '    Dim connMSOCODE As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
    '    Dim cmdMSOCODE As SqlCommand = New SqlCommand(sqlMSOCODE, connMSOCODE)
    '    Dim reader As SqlDataReader
    '    cmdMSOCODE.Parameters.AddWithValue("@MSOCODE", txtCode.Text)
    '    connMSOCODE.Open()
    '    reader = cmdMSOCODE.ExecuteReader()
    '    If (reader.Read()) Then
    '        If reader("MSOCODE") = txtCode.Text Then
    '            lblAsterisk.Visible = True
    '            txtCode.Focus()
    '        Else
    '            SaveInfo()
    '        End If
    '    End If
    'End Sub

    Protected Sub SaveInfo()
        Dim sqlMSO As String = "INSERT INTO MSOLIB (MSOCODE, MSODESC, ADDRESS, ZIPCD, TELNO, FAXNO, DTE, USERID) VALUES (@MSOCODE, @MSODESC, @ADDRESS, @ZIPCD, @TELNO, @FAXNO, @DTE, @USERID)"
        Dim connMSO As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
        Dim cmdMSO As SqlCommand = New SqlCommand(sqlMSO, connMSO)
        With cmdMSO.Parameters
            .AddWithValue("@MSOCODE", txtCode.Text)
            .AddWithValue("@MSODESC", txtName.Text)
            .AddWithValue("@ADDRESS", txtAddress.Text)
            .AddWithValue("@ZIPCD", txtZipCode.Text)
            .AddWithValue("@TELNO", txtTel.Text)
            .AddWithValue("@FAXNO", txtFax.Text)
            .AddWithValue("@DTE", Date.Now())
            .AddWithValue("@USERID", Session("USERID"))
        End With
        connMSO.Open()
        cmdMSO.ExecuteNonQuery()
    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As System.EventArgs) Handles btnAdd.Click
        btnAdd.Visible = False
        btnSave.Visible = True
        btnCancel.Visible = True
        txtCode.Enabled = True
        txtName.Enabled = True
        txtAddress.Enabled = True
        txtZipCode.Enabled = True
        txtTel.Enabled = True
        txtFax.Enabled = True
        txtCode.Focus()
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As System.EventArgs) Handles btnSave.Click

        If txtCode.Text = "" Then
            lblAsterisk.Visible = True
            txtCode.Focus()
        ElseIf txtName.Text = "" Then
            lblAsterisk0.Visible = True
            txtName.Focus()
        ElseIf txtAddress.Text = "" Then
            lblAsterisk1.Visible = True
            txtAddress.Focus()
        ElseIf IsNumeric(txtZipCode.Text) = False Then
            lblError.Visible = True
            txtZipCode.Focus()
        ElseIf txtTel.Text = "" Then
            lblAsterisk2.Visible = True
            txtTel.Focus()
        Else

            SaveInfo()
            GridView2.DataBind()
            btnAdd.Visible = True
            btnSave.Visible = False
            btnCancel.Visible = False
            txtCode.Enabled = False
            txtName.Enabled = False
            txtAddress.Enabled = False
            txtZipCode.Enabled = False
            txtTel.Enabled = False
            txtFax.Enabled = False
            lblAsterisk.Visible = False
            lblAsterisk0.Visible = False
            lblAsterisk1.Visible = False
            lblAsterisk2.Visible = False
            lblError.Visible = False
            txtCode.Text = ""
            txtName.Text = ""
            txtAddress.Text = ""
            txtZipCode.Text = ""
            txtTel.Text = ""
            txtFax.Text = ""
        End If

    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As System.EventArgs) Handles btnCancel.Click
        btnCancel.Visible = False
        btnAdd.Visible = True
        btnSave.Visible = False
        txtCode.Enabled = False
        txtName.Enabled = False
        txtAddress.Enabled = False
        txtZipCode.Enabled = False
        txtTel.Enabled = False
        txtFax.Enabled = False

        txtCode.Text = ""
        txtName.Text = ""
        txtAddress.Text = ""
        txtZipCode.Text = ""
        txtTel.Text = ""
        txtFax.Text = ""
    End Sub

    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles btnListAll.Click
        GridView2.AllowPaging = False
        SqlDataSource2.DataBind()

        btnListby6.Visible = True
        btnListAll.Visible = False
        'Response.Redirect("~/default.aspx")
    End Sub

    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles btnListby6.Click
        'Response.Redirect("default.aspx")
        GridView2.AllowPaging = True
        SqlDataSource2.DataBind()

        btnListby6.Visible = False
        btnListAll.Visible = True
    End Sub


End Class
