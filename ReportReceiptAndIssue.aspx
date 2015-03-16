<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReportReceiptAndIssue.aspx.cs" Inherits="ReportReceiptAndIssue" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">

    .style20
    {
        width: 14px;
    }
    .style24
    {
        width: 127px;
    }
        .style16
        {
            height: 37px;
            width: 326px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style16">
    <tr>
        <td class="style20" valign="top">
            Month</td>
        <td class="style24" valign="top">
            <asp:ComboBox ID="ComboBoxMonth" runat="server" AutoPostBack="True" 
                DropDownStyle="DropDownList">
                <asp:ListItem Value="1">January</asp:ListItem>
                <asp:ListItem Value="2">February</asp:ListItem>
                <asp:ListItem Value="3">March</asp:ListItem>
                <asp:ListItem Value="4">April</asp:ListItem>
                <asp:ListItem Value="5">May</asp:ListItem>
                <asp:ListItem Value="6">June</asp:ListItem>
                <asp:ListItem Value="7">July</asp:ListItem>
                <asp:ListItem Value="8">August</asp:ListItem>
                <asp:ListItem Value="9">September</asp:ListItem>
                <asp:ListItem Value="10">October</asp:ListItem>
                <asp:ListItem Value="11">November</asp:ListItem>
                <asp:ListItem Value="12">December</asp:ListItem>
            </asp:ComboBox>
        </td>
        <td class="style24" valign="top">
            <asp:Button ID="ButtonFilter" runat="server" onclick="ButtonFilter_Click" 
                Text="OK" />
        </td>
    </tr>
</table>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" Height="697px" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="913px">
        <LocalReport ReportPath="ReportReceiptAndIssueOfCharts.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" 
                    Name="ReceiptAndissue" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="ReceiptAndIssueTableAdapters.ReceiptAndIssueTableAdapter">
        <SelectParameters>
            <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            <asp:Parameter Name="STARTDATE" Type="DateTime" />
            <asp:Parameter Name="ENDDATE" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</asp:Content>

