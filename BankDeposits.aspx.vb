Imports System.Data.SqlClient

Partial Class BankDeposits
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        Session("MSOCODE").ToString()
        'Session("USERID").ToString()

    End Sub

    Protected Sub SaveInfo()
        Dim sqlBankDepositSave As String = "INSERT INTO BANKDEPOSITS (MSO_CODE, [DATE], SLIPNO, AMOUNT, DATEFR, DATETO, ORFR, ORTO, COLAMT, TYPE, DTE, USERID) VALUES (@MSOCODE, @DEPDATE, @SLIPNO, @DEPAMOUNT, @DATEFR, @DATETO, @ORFR, @ORTO, @COLAMOUNT, @DEPOSITTO, @DTE, @USERID)"
        Dim connBankDepositSave As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
        Dim cmdBankDeposit As SqlCommand = New SqlCommand(sqlBankDepositSave, connBankDepositSave)
        With cmdBankDeposit.Parameters
            .AddWithValue("@MSOCODE", Session("MSOCODE"))
            .AddWithValue("@DEPDATE", txtDate.Text)
            .AddWithValue("@SLIPNO", txtDeposit.Text)
            .AddWithValue("@DEPAMOUNT", txtAmount.Text)
            .AddWithValue("@DATEFR", txtFrom.Text)
            .AddWithValue("@DATETO", txtTo.Text)
            .AddWithValue("@ORFR", txtORFrom.Text)
            .AddWithValue("@ORTO", txtORTo.Text)
            .AddWithValue("@COLAMOUNT", txtAmount2.Text)
            .AddWithValue("@DEPOSITTO", lblValue.Text)
            .AddWithValue("@DTE", Date.Now())
            .AddWithValue("@USERID", Session("USERID"))
        End With
        connBankDepositSave.Open()
        cmdBankDeposit.ExecuteNonQuery()
    End Sub

    Protected Sub EnableAll()
        txtDate.Enabled = True
        txtDate.Focus()
        txtDeposit.Enabled = True
        txtAmount.Enabled = True
        txtFrom.Enabled = True
        txtTo.Enabled = True
        txtORFrom.Enabled = True
        txtORTo.Enabled = True
        txtAmount2.Enabled = True

    End Sub

    Protected Sub DisableAll()
        txtDate.Enabled = False
        txtDeposit.Enabled = False
        txtAmount.Enabled = False
        txtFrom.Enabled = False
        txtTo.Enabled = False
        txtORFrom.Enabled = False
        txtORTo.Enabled = False
        txtAmount2.Enabled = False

    End Sub

    Protected Sub ClearAll()
        txtDate.Text = ""
        txtDeposit.Text = ""
        txtAmount.Text = ""
        txtFrom.Text = ""
        txtTo.Text = ""
        txtORFrom.Text = ""
        txtORTo.Text = ""
        txtAmount2.Text = ""
        rdbtnTreasury.Checked = True
        rdbtnBank.Checked = False
    End Sub

    Protected Sub rdbtnTreasury_CheckedChanged(sender As Object, e As System.EventArgs) Handles rdbtnTreasury.CheckedChanged
        rdbtnBank.Checked = False
        lblValue.Text = "1"

    End Sub

    Protected Sub rdbtnBank_CheckedChanged(sender As Object, e As System.EventArgs) Handles rdbtnBank.CheckedChanged
        rdbtnTreasury.Checked = False
        lblValue.Text = "2"
    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As System.EventArgs) Handles btnAdd.Click
        btnAdd.Visible = False
        btnSave.Visible = True
        btnCancel.Visible = True
        EnableAll()
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As System.EventArgs) Handles btnSave.Click
        If rdbtnTreasury.Checked Then
            lblValue.Text = "1"
        ElseIf rdbtnBank.Checked Then
            lblValue.Text = "2"
        End If
        If txtDate.Text = "" Then
            txtDate.Focus()
            lblAsterisk.Visible = True
        ElseIf txtDeposit.Text = "" Then
            txtDeposit.Focus()
            lblAsterisk0.Visible = True
        ElseIf txtAmount.Text = "" Then
            txtAmount.Focus()
            lblAsterisk1.Visible = True
        ElseIf txtFrom.Text = "" Or txtTo.Text = "" Then
            txtFrom.Focus()
            lblAsterisk2.Visible = True
        ElseIf txtORFrom.Text = "" Or txtORTo.Text = "" Then
            txtORFrom.Focus()
            lblAsterisk3.Visible = True
        ElseIf txtAmount2.Text = "" Then
            txtAmount2.Focus()
            lblAsterisk4.Visible = True
        Else
            SaveInfo()
            grdvwBank.DataBind()
            DisableAll()
            ClearAll()
            btnSave.Visible = False
            btnCancel.Visible = False
            btnAdd.Visible = True
        End If
        
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As System.EventArgs) Handles btnCancel.Click
        btnAdd.Visible = True
        btnSave.Visible = False
        btnCancel.Visible = False
        DisableAll()
        ClearAll()
        lblValue.Text = "1"
    End Sub
End Class
