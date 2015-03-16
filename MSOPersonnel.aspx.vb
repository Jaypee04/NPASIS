Imports System.Data.SqlClient

Partial Class MSOPersonnel
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Session("MSOCODE").ToString()
        'Session("USERID").ToString()
    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As System.EventArgs) Handles btnAdd.Click
        txtName.Enabled = True
        txtPosition.Enabled = True
        txtName.Focus()
        btnAdd.Visible = False
        btnSave.Visible = True
        btnCancel.Visible = True
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As System.EventArgs) Handles btnCancel.Click
        btnSave.Visible = False
        txtName.Enabled = False
        txtPosition.Enabled = False
        btnAdd.Visible = True
        btnCancel.Visible = False
        txtName.Text = ""
        txtPosition.Text = ""
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As System.EventArgs) Handles btnSave.Click
        If txtName.Text = "" Then
            lblAsterisk.Visible = True
        ElseIf txtPosition.Text = "" Then
            lblAsterisk1.Visible = True
        Else
            SaveInfo()
            txtName.Text = ""
            txtPosition.Text = ""
            GridView2.DataBind()
        End If
    End Sub

    Protected Sub SaveInfo()
        Dim sqlMSOPerLibSave As String = "INSERT INTO [MSOPERLIB] ([MSOCODE], [NAME], [POSITION], [DTE], [USERID]) VALUES (@MSOCODE, @NAME, @POSITION, @DTE, @USERID)"
        Dim connMSOPerLibSave As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
        Dim cmdMSOPerLib As SqlCommand = New SqlCommand(sqlMSOPerLibSave, connMSOPerLibSave)
        With cmdMSOPerLib.Parameters
            .AddWithValue("@MSOCODE", Session("MSOCODE"))
            .AddWithValue("@NAME", txtName.Text)
            .AddWithValue("@POSITION", txtPosition.Text)
            .AddWithValue("@DTE", Date.Now())
            .AddWithValue("@USERID", Session("USERID"))
        End With
        connMSOPerLibSave.Open()
        cmdMSOPerLib.ExecuteNonQuery()
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
