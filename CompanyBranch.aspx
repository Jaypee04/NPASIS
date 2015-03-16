<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="CompanyBranch.aspx.vb" Inherits="CompanyBranch" MaintainScrollPositionOnPostback="True"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<asp:ScriptManager ID="ScriptManager1" runat="server">  </asp:ScriptManager>

    <h2> Company Office/Branch Information </h2>
    <br />
    
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
    <center>
    <table style = "background-color :#2461BF;" cellpadding = "4" cellspacing = "0">
        <tr align = "left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblName" runat="server" Text="Branch Name" ForeColor = "#333333" Font-Bold = "True" ></asp:Label></td>
            
            <td style = "background-color :#2461BF;"><asp:TextBox ID="txtName" runat="server" 
                    Width="500px" Enabled="False"></asp:TextBox></td>
            <td style = "background-color :#2461BF;"><asp:Label ID="lblAsterisk" runat="server" 
                    Text=" *&nbsp;&nbsp;" ForeColor = "Red" Font-Bold = "True" Visible="False" ToolTip ="Value is Required"></asp:Label></td>
        </tr>
        <tr align = "left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblAddress" runat="server" Text="Address"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            
            <td class="style16"><asp:TextBox ID="txtAddress" runat="server" Width="435px" 
                    TextMode="MultiLine" Enabled="False"></asp:TextBox></td>
            <td style = "background-color :#2461BF;">
                <asp:Label ID="lblAsterisk1" runat="server" 
                    Text=" *&nbsp;&nbsp;" ForeColor = "Red" Font-Bold = "True" Visible="False" 
                    ToolTip ="Value is Required"></asp:Label></td>
        </tr>
        <tr align = "left">
            <td  style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblZip" runat="server" Text="Zip Code"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            
            <td><asp:TextBox ID="txtZipCode" runat="server" Width="102px" MaxLength="8" 
                    Enabled="False"></asp:TextBox> &nbsp;&nbsp;
                <asp:Label ID="lblError" runat="server" 
                    Text="Please enter numeric values only." ForeColor = "Red" Font-Bold = "True" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr align = "left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblTel" runat="server" Text="Telephone Number"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            
            <td><asp:TextBox ID="txtTel" runat="server" Width="245px" MaxLength="30" 
                    Enabled="False"></asp:TextBox></td>
            <td style = "background-color :#2461BF;"><asp:Label ID="lblAsterisk2" runat="server" 
                    Text=" *&nbsp;&nbsp;" ForeColor = "Red" Font-Bold = "True" Visible="False" 
                    ToolTip ="Value is Required"></asp:Label></td>
        </tr>
        <tr align = "left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblFax" runat="server" Text="Fax Number"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            
            <td><asp:TextBox ID="txtFax" runat="server" Width="245px" 
                    MaxLength="30" Enabled="False"></asp:TextBox></td>
        </tr>
        <tr align = "left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblSector" runat="server" Text="Sector"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            <td><asp:Label ID="lblSectorValue" runat="server" Text="Sector" Width="245px" ForeColor = "#333333" Font-Bold = "True"></asp:Label> </td>
        </tr>
        <tr align = "left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;">
                <asp:Label ID="lblCode" runat="server" Text="CODE" Visible = "False" ></asp:Label> </td>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;">
                <asp:Button ID="btnAdd" runat="server" Text="ADD" Height="25px" Width="78px" />
                <asp:Button ID="btnSave" runat="server" Text="SAVE" Height="25px" Width="78px" 
                    Visible="False"/>
                <asp:Button ID="btnEdit" runat="server" Text="EDIT" Height="25px" Width="78px"/>
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
    </center>
     
    </ContentTemplate>
    </asp:UpdatePanel>
    <asp:SqlDataSource ID="SqlDataSourceInformation" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NPASISConnectionString %>" 
        SelectCommand="SELECT * FROM [COMPANYLIB]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceSector" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NPASISConnectionString %>" 
        SelectCommand="SELECT [SECCODE], [SECDESC] FROM [SECTORLIB]">
    </asp:SqlDataSource>
</asp:Content>

