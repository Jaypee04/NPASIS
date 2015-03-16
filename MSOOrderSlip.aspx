<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MSOOrderSlip.aspx.vb" Inherits="MSOOrderSlip" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<h2> Client  Order Slip </h2>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NPASISConnectionString %>" 
        SelectCommand="SELECT * FROM [ORDERFL]"></asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" 
        Width="218px">
        <EditItemTemplate>
            MSOCODE:
            <asp:TextBox ID="MSOCODETextBox" runat="server" Text='<%# Bind("MSOCODE") %>' />
            <br />
            ORDERNO:
            <asp:TextBox ID="ORDERNOTextBox" runat="server" Text='<%# Bind("ORDERNO") %>' />
            <br />
            ORDERTYPE:
            <asp:TextBox ID="ORDERTYPETextBox" runat="server" 
                Text='<%# Bind("ORDERTYPE") %>' />
            <br />
            ORDERDATE:
            <asp:TextBox ID="ORDERDATETextBox" runat="server" 
                Text='<%# Bind("ORDERDATE") %>' />
            <br />
            SECCODE:
            <asp:TextBox ID="SECCODETextBox" runat="server" Text='<%# Bind("SECCODE") %>' />
            <br />
            CLIENTCODE:
            <asp:TextBox ID="CLIENTCODETextBox" runat="server" 
                Text='<%# Bind("CLIENTCODE") %>' />
            <br />
            PROJECT:
            <asp:TextBox ID="PROJECTTextBox" runat="server" Text='<%# Bind("PROJECT") %>' />
            <br />
            DIVCODE:
            <asp:TextBox ID="DIVCODETextBox" runat="server" Text='<%# Bind("DIVCODE") %>' />
            <br />
            MSOCODETO:
            <asp:TextBox ID="MSOCODETOTextBox" runat="server" 
                Text='<%# Bind("MSOCODETO") %>' />
            <br />
            REMARK:
            <asp:TextBox ID="REMARKTextBox" runat="server" Text='<%# Bind("REMARK") %>' />
            <br />
            DTE:
            <asp:TextBox ID="DTETextBox" runat="server" Text='<%# Bind("DTE") %>' />
            <br />
            USERID:
            <asp:TextBox ID="USERIDTextBox" runat="server" Text='<%# Bind("USERID") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            MSOCODE:
            <asp:TextBox ID="MSOCODETextBox" runat="server" Text='<%# Bind("MSOCODE") %>' />
            <br />
            ORDERNO:
            <asp:TextBox ID="ORDERNOTextBox" runat="server" Text='<%# Bind("ORDERNO") %>' />
            <br />
            ORDERTYPE:
            <asp:TextBox ID="ORDERTYPETextBox" runat="server" 
                Text='<%# Bind("ORDERTYPE") %>' />
            <br />
            ORDERDATE:
            <asp:TextBox ID="ORDERDATETextBox" runat="server" 
                Text='<%# Bind("ORDERDATE") %>' />
            <br />
            SECCODE:
            <asp:TextBox ID="SECCODETextBox" runat="server" Text='<%# Bind("SECCODE") %>' />
            <br />
            CLIENTCODE:
            <asp:TextBox ID="CLIENTCODETextBox" runat="server" 
                Text='<%# Bind("CLIENTCODE") %>' />
            <br />
            PROJECT:
            <asp:TextBox ID="PROJECTTextBox" runat="server" Text='<%# Bind("PROJECT") %>' />
            <br />
            DIVCODE:
            <asp:TextBox ID="DIVCODETextBox" runat="server" Text='<%# Bind("DIVCODE") %>' />
            <br />
            MSOCODETO:
            <asp:TextBox ID="MSOCODETOTextBox" runat="server" 
                Text='<%# Bind("MSOCODETO") %>' />
            <br />
            REMARK:
            <asp:TextBox ID="REMARKTextBox" runat="server" Text='<%# Bind("REMARK") %>' />
            <br />
            DTE:
            <asp:TextBox ID="DTETextBox" runat="server" Text='<%# Bind("DTE") %>' />
            <br />
            USERID:
            <asp:TextBox ID="USERIDTextBox" runat="server" Text='<%# Bind("USERID") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            MSOCODE:
            <asp:Label ID="MSOCODELabel" runat="server" Text='<%# Bind("MSOCODE") %>' />
            <br />
            ORDERNO:
            <asp:Label ID="ORDERNOLabel" runat="server" Text='<%# Bind("ORDERNO") %>' />
            <br />
            ORDERTYPE:
            <asp:Label ID="ORDERTYPELabel" runat="server" Text='<%# Bind("ORDERTYPE") %>' />
            <br />
            ORDERDATE:
            <asp:Label ID="ORDERDATELabel" runat="server" Text='<%# Bind("ORDERDATE") %>' />
            <br />
            SECCODE:
            <asp:Label ID="SECCODELabel" runat="server" Text='<%# Bind("SECCODE") %>' />
            <br />
            CLIENTCODE:
            <asp:Label ID="CLIENTCODELabel" runat="server" 
                Text='<%# Bind("CLIENTCODE") %>' />
            <br />
            PROJECT:
            <asp:Label ID="PROJECTLabel" runat="server" Text='<%# Bind("PROJECT") %>' />
            <br />
            DIVCODE:
            <asp:Label ID="DIVCODELabel" runat="server" Text='<%# Bind("DIVCODE") %>' />
            <br />
            MSOCODETO:
            <asp:Label ID="MSOCODETOLabel" runat="server" Text='<%# Bind("MSOCODETO") %>' />
            <br />
            REMARK:
            <asp:Label ID="REMARKLabel" runat="server" Text='<%# Bind("REMARK") %>' />
            <br />
            DTE:
            <asp:Label ID="DTELabel" runat="server" Text='<%# Bind("DTE") %>' />
            <br />
            USERID:
            <asp:Label ID="USERIDLabel" runat="server" Text='<%# Bind("USERID") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>
    
    </asp:Content>

