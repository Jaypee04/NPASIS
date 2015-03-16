<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="BankDeposits.aspx.vb" Inherits="BankDeposits" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style31
        {
            width: 229px;
        }
        .style32
        {
            width: 23px;
        }
        .style34
        {
            width: 129px;
        }
        .style40
        {
            width: 183px;
        }
        .style41
        {
            width: 202px;
        }
        .style42
        {
            width: 175px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<asp:ScriptManager ID="ScriptManager1" runat="server">  </asp:ScriptManager>

    <h2> Collections and Deposits </h2>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <center>
    
    <h6>DEPOSITS</h6>
    <table style = "background-color :#2461BF; width: 372px;" cellpadding = "4" 
            cellspacing = "0">
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style34"><asp:Label ID="lblDate" runat="server" Text="Date (mm/dd/yyyy)" ForeColor = "#333333" Font-Bold = "True" ></asp:Label></td>
            <td style = "background-color :#2461BF;" class="style41"> 
                <asp:TextBox ID="txtDate" runat="server" 
                    Width="129px" Enabled="False" MaxLength="10" TabIndex="1"></asp:TextBox></td>
            <td style = "background-color :#2461BF;"><asp:Label ID="lblAsterisk" runat="server" 
                    Text=" *&nbsp;&nbsp;" ForeColor = "Red" Font-Bold = "True" Visible="False" ToolTip ="Value is Required"></asp:Label></td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style34">
                <asp:Label ID="lblDeposit" runat="server" Text="R.A./Deposit Slip No."  
                    ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            
            <td class="style41">
                <asp:TextBox ID="txtDeposit" runat="server" Width="177px" 
                    Enabled="False" TabIndex="2"></asp:TextBox></td>
            <td style = "background-color :#2461BF;">
                <asp:Label ID="lblAsterisk0" runat="server" 
                    Text=" *&nbsp;&nbsp;" ForeColor = "Red" Font-Bold = "True" Visible="False" 
                    ToolTip ="Value is Required"></asp:Label></td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style34"><asp:Label ID="lblAmount" runat="server" Text="Amount"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            <td class="style41">
                <asp:TextBox ID="txtAmount" runat="server" Width="177px" 
                    Enabled="False" TabIndex="3"></asp:TextBox></td>
            <td style = "background-color :#2461BF;">
                <asp:Label ID="lblAsterisk1" runat="server" 
                    Text=" *&nbsp;&nbsp;" ForeColor = "Red" Font-Bold = "True" Visible="False" 
                    ToolTip ="Value is Required"></asp:Label></td>
        </tr>
    </table>
    <h6>COLLECTIONS</h6>
    <table style = "background-color :#2461BF; width: 372px;" cellpadding = "4" 
            cellspacing = "0">
        <tr align ="left">
            <td  style = "background-color :#D1DDF1; border-color :#D1DDF1;" 
                class="style42"><asp:Label ID="lblDate2" runat="server" Text="Date (mm/dd/yyyy)"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            
            <td class="style31">
                <asp:TextBox ID="txtFrom" runat="server" Width="82px" MaxLength="10" 
                    Enabled="False" TabIndex="4"></asp:TextBox>&nbsp;<asp:Label ID="lblDash" runat="server" Text="-"  ForeColor = "#333333" Font-Bold = "True"></asp:Label>
                    &nbsp;<asp:TextBox ID="txtTo" runat="server" Width="82px" MaxLength="10" 
                    Enabled="False" TabIndex="5"></asp:TextBox> 
                </td>
                <td style = "background-color :#2461BF;" class="style32">
                <asp:Label ID="lblAsterisk2" runat="server" 
                    Text=" *&nbsp;&nbsp;" ForeColor = "Red" Font-Bold = "True" Visible="False" 
                    ToolTip ="Value is Required"></asp:Label></td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style42">
                <asp:Label ID="lblOR" runat="server" Text="O.R. No."  ForeColor = "#333333" 
                    Font-Bold = "True"></asp:Label></td>
            
            <td class="style31">
                <asp:TextBox ID="txtORFrom" runat="server" Width="82px" 
                    Enabled="False" TabIndex="6"></asp:TextBox>&nbsp;<asp:Label ID="Label1" runat="server" Text="-"  ForeColor = "#333333" Font-Bold = "True"></asp:Label>
                    &nbsp;<asp:TextBox ID="txtORTo" runat="server" Width="82px" 
                    Enabled="False" TabIndex="7"></asp:TextBox></td>
            <td style = "background-color :#2461BF;" class="style32"><asp:Label ID="lblAsterisk3" runat="server" 
                    Text=" *&nbsp;&nbsp;" ForeColor = "Red" Font-Bold = "True" Visible="False" 
                    ToolTip ="Value is Required"></asp:Label></td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style42">
                <asp:Label ID="lblAmount2" runat="server" Text="Amount"  
                    ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            
            <td class="style31">
                <asp:TextBox ID="txtAmount2" runat="server" Width="178px" 
                    MaxLength="30" Enabled="False" TabIndex="8"></asp:TextBox></td>
            <td style = "background-color :#2461BF;" class="style32"><asp:Label ID="lblAsterisk4" runat="server" 
                    Text=" *&nbsp;&nbsp;" ForeColor = "Red" Font-Bold = "True" Visible="False" 
                    ToolTip ="Value is Required"></asp:Label></td>
        </tr>
        <tr align ="left">
        
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style42">
                <asp:Label ID="lblValue" runat="server" Text="NUM" Visible="False"></asp:Label></td>
            <td class="style31">
                <asp:RadioButton ID="rdbtnTreasury" Checked="true"  runat="server" 
                    Text="Deposited to Treasury" ForeColor="Black" 
                    GroupName="CollectionGroup" TabIndex="9"/>
                <br />
                <asp:RadioButton ID="rdbtnBank" runat="server" 
                    Text="Deposited to Authorized Government Depository Bank" 
                    ForeColor="Black" GroupName="CollectionGroup"/>
            </td>
            <td class="style32">
                <asp:Label ID="lblAsterisk5" runat="server" 
                    Text=" *&nbsp;&nbsp;" ForeColor = "Red" Font-Bold = "True" Visible="False" 
                    ToolTip ="Value is Required"></asp:Label>
            </td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style42">&nbsp;</td>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style31">
                <asp:Button ID="btnAdd" runat="server" Text="ADD" Height="25px" Width="78px" />
                <asp:Button ID="btnSave" runat="server" Text="SAVE" Height="25px" Width="78px" 
                    Visible="False" TabIndex="10"/>
                <asp:Button ID="btnCancel" runat="server" Text="CANCEL" Height="25px" 
                    Width="78px" Visible="False"/>
                </td>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style32"></td>
        </tr>
        <%--<tr>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"></td>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;">&nbsp;</td>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"></td>
        </tr>--%>
    </table>
   
    </center>
    </ContentTemplate> 
    </asp:UpdatePanel>  

    
    <asp:SqlDataSource ID="SqlDataSourceDeposits" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NPASISConnectionString %>" 
        SelectCommand="SELECT [MSO_CODE], [TYPE], CONVERT(VARCHAR, [DATE], 101) AS DATE, [SLIPNO], [AMOUNT], CONVERT(VARCHAR,[DATEFR], 101) AS DATEFR, CONVERT(VARCHAR,[DATETO], 101) AS DATETO, [ORFR], [ORTO], [COLAMT] FROM [BANKDEPOSITS] WHERE ([MSO_CODE] = @MSO_CODE)">
        <SelectParameters>
            <asp:SessionParameter Name="MSO_CODE" SessionField="MSOCODE" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
  
        <h6 align="center"> List of Collections and Deposits </h6>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:GridView ID="grdvwBank" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="MSO_CODE" DataSourceID="SqlDataSourceDeposits" ForeColor="#333333" 
                    GridLines="None" HorizontalAlign="Center" PageSize="6" Width="870px" 
                    Font-Size="XX-Small">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="MSO_CODE" HeaderText="MSO" Visible = "false" 
                            SortExpression="MSO_CODE" />
                        <asp:BoundField DataField="DATE" HeaderText="Date"
                            SortExpression="DATE" ItemStyle-Width =""/>
                        <asp:BoundField DataField="SLIPNO" HeaderText="Slip No." ReadOnly="true" 
                            SortExpression="SLIPNO" />
                        <asp:BoundField DataField="AMOUNT" HeaderText="Amount" 
                            SortExpression="AMOUNT" />
                        <%--<asp:BoundField/>
                        <asp:BoundField/>--%>
                        <asp:BoundField DataField="DATEFR" HeaderText="Date From" 
                            SortExpression="DATEFR" />
                        <asp:BoundField DataField="DATETO" HeaderText="Date To" 
                            SortExpression="DATETO" />
                        <asp:BoundField DataField="ORFR" HeaderText="O.R. From" 
                            SortExpression="ORFR" />
                        <asp:BoundField DataField="ORTO" HeaderText="O.R. To" 
                            SortExpression="ORTO" />
                        <asp:BoundField DataField="COLAMT" HeaderText="Collection Amount" 
                            SortExpression="COLAMT" />
                        <asp:BoundField DataField="DTE" HeaderText="DTE" SortExpression="DTE" 
                            Visible="False" />
                        <asp:BoundField DataField="USERID" HeaderText="USERID" SortExpression="USERID" 
                            Visible="False" />
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Update" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="Edit" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                    CommandName="Delete" OnClientClick="return confirm('Delete record?')" Text="Delete" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="6" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
             <br />
             <br />
             <br />
    </ContentTemplate>
    
    </asp:UpdatePanel>
</asp:Content>

