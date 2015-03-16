<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReportProduct.aspx.cs" Inherits="ReportProduct" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    &nbsp;&nbsp;
    <asp:Label ID="Label2" runat="server" height="25px" Text="Start Date"></asp:Label>
&nbsp;
    <asp:TextBox ID="TextBoxStartDate" runat="server" height="25px"></asp:TextBox>
    <asp:CalendarExtender ID="TextBoxStartDate_CalendarExtender" runat="server" 
        Enabled="True" TargetControlID="TextBoxStartDate" Format="MMMM dd, yyyy">
    </asp:CalendarExtender>
    &nbsp;
    <asp:Label ID="Label1" runat="server" height="25px" Text="End Date"></asp:Label>
&nbsp;
    <asp:TextBox ID="TextBoxEndDate" runat="server" Height="25px"></asp:TextBox>
    <asp:CalendarExtender ID="TextBoxEndDate_CalendarExtender" runat="server" 
        Enabled="True" TargetControlID="TextBoxEndDate" Format="MMMM dd, yyyy">
    </asp:CalendarExtender>
&nbsp;&nbsp;
    <asp:Button ID="buttonOK" runat="server" Height="25px" onclick="buttonOK_Click" 
        Text="Filter" Width="79px" />
    &nbsp;&nbsp;
    <br />
&nbsp;<rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="926px" 
        Height="678px">
        <LocalReport ReportPath="ReportProductInventory.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" 
                    Name="DataSet1" />
            </DataSources>
        </LocalReport>
</rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="DataSetXTableAdapters.ProductInventoryTableTableAdapter">
        <SelectParameters>
            <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            <asp:ControlParameter ControlID="TextBoxStartDate" Name="STARTDATE" 
                PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="TextBoxEndDate" Name="ENDDATE" 
                PropertyName="Text" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </asp:Content>

