<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReportInventory.aspx.cs" Inherits="ReportInventory" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
  
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" height="22px" Text="Start"></asp:Label>
&nbsp;
  
    <asp:TextBox ID="TextBoxDateFilter" runat="server" Height="22px" Width="164px"></asp:TextBox>
    <asp:CalendarExtender ID="TextBoxDateFilter_CalendarExtender" runat="server" 
        Enabled="True" TargetControlID="TextBoxDateFilter">
    </asp:CalendarExtender>
    <asp:Button ID="ButtonFilterInventory" runat="server" 
        onclick="ButtonFilterInventory_Click" Text="Filter" height="22px" />
  
    <br />
  
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="912px" 
        Height="699px" style="z-index: -1">
        <LocalReport ReportPath="ReportInventory.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="Inventory" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="DataSetInventoryTableAdapters.DataTableInventoryTableAdapter">
        <SelectParameters>
            <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            <asp:ControlParameter ControlID="TextBoxDateFilter" Name="DATEFILTER" 
                PropertyName="Text" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

