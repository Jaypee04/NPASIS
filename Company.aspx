<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Company.aspx.vb" Inherits="Company" MaintainScrollPositionOnPostback="True"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">  </asp:ScriptManager>

     <h2> COMPANY</h2>
    <table cellpadding = "4" cellspacing = "0">
        
        <tr>
            <td>&nbsp;&nbsp;<h6>COMPANY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<center><asp:Button ID="btnAdd" runat="server" 
                    Text="ADD" TabIndex="4" />&nbsp;&nbsp;<asp:Button ID="btnCompany" runat="server" 
                    Text="EDIT" TabIndex="4" /></center></h6>
            &nbsp;&nbsp;
                <asp:GridView ID="GrdVwCompany" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataSourceID="SqlDataSourceCompany" ForeColor="#333333" 
                    GridLines="None" HorizontalAlign="Left" PageSize="6" 
                Width="400px" DataKeyNames="CODESC" TabIndex="1">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True">
                <ControlStyle Font-Names="Arial" Font-Size="X-Small" />
                </asp:CommandField>
                    <asp:BoundField DataField="CODESC" HeaderText="Company Name" 
                    SortExpression="CODESC" />
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
            </td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;<h6>BRANCH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <asp:Button ID="btnAdd2" runat="server" Text="ADD" TabIndex="5" Enabled="False"/> 
            <asp:Button ID="btnBranch" runat="server" Text="EDIT" TabIndex="5" 
                    Enabled="False" /></h6>
            <br />
            &nbsp;&nbsp;<asp:DropDownList ID="drpdwnlstBranch" runat="server" 
                        DataSourceID="SqlDataSourceBranch" Height="29px" Width="422px" 
                        DataTextField="BRDESC" DataValueField="COBRANCH" TabIndex="2" 
                        AutoPostBack="True" Enabled="False">
                      </asp:DropDownList>
                      <br />
                      &nbsp;&nbsp;&nbsp;&nbsp;<h6>CLIENT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;
                      <asp:Button ID="btnAdd3" runat="server" Text="ADD" TabIndex="6" 
                        Enabled="False" /> 
                      <asp:Button ID="btnClient" runat="server" Text="EDIT" TabIndex="6" 
                        Enabled="False" /></h6>
                      <br />
          &nbsp;&nbsp;<asp:DropDownList ID="drpdwnlstClient" runat="server" 
                        DataSourceID="SqlDataSourceClient" Height="29px" Width="422px" 
                        TabIndex="3" DataTextField="FULLNAME" DataValueField="CLIENTCODE" 
                        AutoPostBack="True" Enabled="False">
                      </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;<asp:Label ID="lblCompanyCode" runat="server" Text="Company" 
                    Visible="False"></asp:Label></td>
            <td align ="center"><asp:Button ID="btnOk" runat="server" Text="OK" Width="78px" 
                    Enabled="False" />&nbsp;
            <asp:Button ID="btnCancel" runat="server" Text="CANCEL" Enabled="False" /></td>
        </tr>
    </table>

    <br />
    <br />
    
    
    <asp:SqlDataSource ID="SqlDataSourceCompany" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NPASISConnectionString %>" 
        
        SelectCommand="SELECT [CODESC] FROM [COMPANYLIB] WHERE ([MSOCODE] = @MSOCODE)">
        <SelectParameters>
            <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
   <asp:SqlDataSource ID="SqlDataSourceBranch" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NPASISConnectionString %>" 
        SelectCommand="SELECT DISTINCT COBRANCH, BRDESC FROM
        COMPANYBRANCHLIB WHERE MSOCODE=@MSOCODE AND COCODE = @CompanyCode">
       <SelectParameters>
           <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" />
           <asp:ControlParameter ControlID="lblCompanyCode" Name="CompanyCode" 
               PropertyName="Text" />
       </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceClient" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NPASISConnectionString %>" 
        SelectCommand="SELECT DISTINCT CLIENTCODE, COCODE,
        LASTNAME + ', ' + FIRSTNAME AS FULLNAME FROM CLIENTLIB
        WHERE MSOCODE=@MSOCODE AND COCODE = @CompanyCode">
        <SelectParameters>
            <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String"/>
            <asp:ControlParameter ControlID="lblCompanyCode" Name="CompanyCode" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>