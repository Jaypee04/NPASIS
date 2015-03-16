<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ClientInformation.aspx.vb" Inherits="ClientInformation" MaintainScrollPositionOnPostback="True"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">  </asp:ScriptManager>

    <h2> Client Information </h2>
    <br />
    <center >
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
    
    <table style = "background-color :#2461BF;" cellpadding = "4" cellspacing = "0">
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblCompany" runat="server" Text="Company Name"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            <td  ><asp:Label ID="lblCompanyValue" runat="server" Text="COMPANY" Width="435px" ForeColor = "#333333" Font-Bold = "True"></asp:Label> </td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblBranch" runat="server" Text="Branch Name"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            <td ><asp:Label ID="lblBranchValue" runat="server" Text="BRANCH" Width="400px" ForeColor = "#333333" Font-Bold = "True"></asp:Label> </td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblClient" runat="server" Text="Client Code"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            
            <td ><asp:TextBox ID="txtClientCode" runat="server" Width="102px" MaxLength="10"  Enabled="False"></asp:TextBox> </td>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblLName" runat="server" Text="Last Name" ForeColor = "#333333" Font-Bold = "True" ></asp:Label></td>
            
            <td style = "background-color :#2461BF;">
                <asp:TextBox ID="txtLName" runat="server"  Width="435px" Enabled="False" 
                    TabIndex="1"></asp:TextBox></td>
            <td style = "background-color :#2461BF;"><asp:Label ID="lblAsterisk" runat="server" 
                    Text=" *&nbsp;&nbsp;" ForeColor = "Red" Font-Bold = "True" Visible="False" ToolTip ="Value is Required"></asp:Label></td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblFName" runat="server" Text="First Name" ForeColor = "#333333" Font-Bold = "True" ></asp:Label></td>
            <td style = "background-color :#2461BF;">
                <asp:TextBox ID="txtFName" runat="server"  
                    Width="435px" Enabled="False" TabIndex="2"></asp:TextBox></td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblMName" runat="server" Text="Middle Name" ForeColor = "#333333" Font-Bold = "True" ></asp:Label></td>
            <td style = "background-color :#2461BF;">
                <asp:TextBox ID="txtMName" runat="server"  
                    Width="435px" Enabled="False" TabIndex="3"></asp:TextBox></td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblPosition" runat="server" Text="Position" ForeColor = "#333333" Font-Bold = "True" ></asp:Label></td>
            <td style = "background-color :#2461BF;">
                <asp:TextBox ID="txtPosition" 
                    runat="server"  Width="435px" Enabled="False" TabIndex="4"></asp:TextBox></td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblAddress" runat="server" Text="Address"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            
            <td class="style16">
                <asp:TextBox ID="txtAddress" runat="server" Width="435px" 
                    TextMode="MultiLine" Enabled="False" TabIndex="5"></asp:TextBox></td>
            <td style = "background-color :#2461BF;">
                <asp:Label ID="lblAsterisk1" runat="server" 
                    Text=" *&nbsp;&nbsp;" ForeColor = "Red" Font-Bold = "True" Visible="False" 
                    ToolTip ="Value is Required"></asp:Label></td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblZip" runat="server" Text="Zip Code"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            
            <td><asp:TextBox ID="txtZipCode" runat="server" Width="102px" MaxLength="8" 
                    Enabled="False" TabIndex="6"></asp:TextBox> &nbsp;&nbsp;
                <asp:Label ID="lblError" runat="server" 
                    Text="Please enter numeric values only." ForeColor = "Red" Font-Bold = "True" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblTel" runat="server" Text="Telephone Number"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            
            <td><asp:TextBox ID="txtTel" runat="server" Width="245px" MaxLength="30" 
                    Enabled="False" TabIndex="7"></asp:TextBox></td>
            <td style = "background-color :#2461BF;"><asp:Label ID="lblAsterisk2" runat="server" 
                    Text=" *&nbsp;&nbsp;" ForeColor = "Red" Font-Bold = "True" Visible="False" 
                    ToolTip ="Value is Required"></asp:Label></td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblFax" runat="server" Text="Fax Number"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            
            <td><asp:TextBox ID="txtFax" runat="server" Width="245px" 
                    MaxLength="30" Enabled="False" TabIndex="8"></asp:TextBox></td>
        </tr>
         <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblOrder" runat="server" Text="First Order (mm/yyyy)"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            <td><asp:TextBox ID="txtLastOrder" runat="server" Width="102px" MaxLength="7" 
                    Enabled="False" TabIndex="9"></asp:TextBox></td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblSector" runat="server" Text="Sector"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            <td>
            <asp:Label ID="lblSectorValue" runat="server" Text="Sector" Width="245px" ForeColor = "#333333" Font-Bold = "True"></asp:Label> 
            
            </td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;">
                <asp:Label ID="lblCode" runat="server" Text="CODE" Visible = "False" ></asp:Label> </td>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;">
                <asp:Button ID="btnAdd" runat="server" Text="ADD" Height="25px" Width="78px" />
                <asp:Button ID="btnSave" runat="server" Text="SAVE" Height="25px" Width="78px" 
                    Visible="False" TabIndex="10"/>
                <asp:Button ID="btnEdit" runat="server" Text="EDIT" Height="25px" Width="78px" 
                    TabIndex="10"/>
                <asp:Button ID="btnUpdate" runat="server" Text="UPDATE" Height="25px" 
                    Width="78px" Visible="False"/>
                <asp:Button ID="btnDelete" runat="server" Text="DELETE" Height="25px" Width="78px"/></td>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"></td>
        </tr>
        <%--<tr>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"></td>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;">&nbsp;</td>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"></td>
        </tr>--%>
    </table>
    <br />
    <br />
    <br /> 
    <br />
    </ContentTemplate>
    </asp:UpdatePanel>
    </center>
    <asp:SqlDataSource ID="SqlDataSourceInformation" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NPASISConnectionString %>" 
        SelectCommand="SELECT * FROM [COMPANYLIB]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceSector" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NPASISConnectionString %>" 
        SelectCommand="SELECT [SECCODE], [SECDESC] FROM [SECTORLIB]">
    </asp:SqlDataSource>


</asp:Content>

