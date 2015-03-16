Imports System.Data.SqlClient

Partial Class SampleUpdate
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        Session("MSOCODE") = "BAT"
        Session("USERID") = "ONON"
        If Session("COBRANCH") <> "" Then
            LoadValues()
            btnEdit.Visible = True
            btnDelete.Visible = True
        Else
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
                End If
            Else
                btnEdit.Visible = False
                btnDelete.Visible = False
            End If

        End If
    End Sub

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
            lblSectorValue.Text = reader("SECDESC")
        End If

    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As System.EventArgs) Handles btnUpdate.Click
        
        Dim sqlCompanyBranchUpdate As String = "UPDATE COMPANYBRANCHLIB SET BRDESC = @BRDESC, ADDRESS = @ADDRESS, ZIPCD = @ZIPCD, TELNO = @TELNO, FAXNO = @FAXNO WHERE MSOCODE = @MSOCODE AND COCODE = @COCODE AND COBRANCH=@COBRANCH"
        Dim connCompanyBranchUpdate As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("NPASISConnectionString").ConnectionString)
        Dim cmdCompanyBranch As SqlCommand = New SqlCommand(sqlCompanyBranchUpdate, connCompanyBranchUpdate)
        With cmdCompanyBranch.Parameters
            '.Add("@MSOCODE", Data.SqlDbType.VarChar)
            'cmdCompanyBranch.Parameters("@MSOCODE").Value = Session("MSOCODE")
            '.Add("@COCODE", Data.SqlDbType.VarChar)
            'cmdCompanyBranch.Parameters("@COCODE").Value = Session("COCODE")
            '.Add("@COBRANCH", Data.SqlDbType.VarChar)
            'cmdCompanyBranch.Parameters("@COBRANCH").Value = Session("COBRANCH")
            '.Add("@BRDESC", Data.SqlDbType.VarChar)
            'cmdCompanyBranch.Parameters("@BRDESC").Value = txtName.Text
            '.Add("@ADDRESS", Data.SqlDbType.VarChar)
            'cmdCompanyBranch.Parameters("@ADDRESS").Value = txtAddress.Text
            '.Add("@ZIPCD", Data.SqlDbType.VarChar)
            'cmdCompanyBranch.Parameters("@ZIPCD").Value = txtZipCode.Text
            '.Add("@TELNO", Data.SqlDbType.VarChar)
            'cmdCompanyBranch.Parameters("@TELNO").Value = txtTel.Text
            '.Add("@FAXNO", Data.SqlDbType.VarChar)
            'cmdCompanyBranch.Parameters("@FAXNO").Value = txtFax.Text

            '.AddWithValue("@MSOCODE", Session("MSOCODE"))
            '.AddWithValue("@COCODE", Session("COCODE"))
            '.AddWithValue("@COBRANCH", Session("COBRANCH"))
            '.AddWithValue("@BRDESC", txtName.Text)
            '.AddWithValue("@ADDRESS", txtAddress.Text)
            '.AddWithValue("@ZIPCD", txtZipCode.Text)
            '.AddWithValue("@TELNO", txtTel.Text)
            '.AddWithValue("@FAXNO", txtFax.Text)
        End With
        connCompanyBranchUpdate.Open()
        cmdCompanyBranch.ExecuteNonQuery()
        btnUpdate.Visible = False
        btnEdit.Visible = True
        MsgBox(txtName.Text)
        MsgBox(txtAddress.Text)
        MsgBox(txtTel.Text)
    End Sub



    Protected Sub btnEdit_Click(sender As Object, e As System.EventArgs) Handles btnEdit.Click
        btnUpdate.Visible = True
        btnEdit.Visible = False
        txtName.Enabled = True
        txtName.Focus()
        txtAddress.Enabled = True
        txtZipCode.Enabled = True
        txtTel.Enabled = True
        txtFax.Enabled = True
    End Sub
End Class
