<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReportTopSelling.aspx.cs" Inherits="ReportTopSelling" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" height="28px" Text="Top"></asp:Label>
&nbsp;
    <asp:TextBox ID="TextBoxTop" runat="server" Height="23px" Width="40px"></asp:TextBox>
&nbsp;&nbsp;
    <asp:Label ID="Label2" runat="server" height="28px" Text="Start Date"></asp:Label>
&nbsp;&nbsp;
    <asp:TextBox ID="TextBoxStartDate" runat="server" height="23px"></asp:TextBox>
    <asp:CalendarExtender ID="TextBoxStartDate_CalendarExtender" runat="server" 
        Enabled="True" TargetControlID="TextBoxStartDate">
    </asp:CalendarExtender>
&nbsp;&nbsp;
    <asp:Label ID="Label3" runat="server" height="28px" Text="End Date"></asp:Label>
&nbsp;&nbsp; <asp:TextBox ID="TextBoxEndDate" runat="server" height="23px"></asp:TextBox>
    <asp:CalendarExtender ID="TextBoxEndDate_CalendarExtender" runat="server" 
        Enabled="True" TargetControlID="TextBoxEndDate">
    </asp:CalendarExtender>
    <asp:Button ID="ButtonFilter" runat="server" onclick="ButtonFilter_Click" 
        Text="Filter" height="23px" />
&nbsp;<rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" Height="702px" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="913px">
        <LocalReport ReportPath="ReportTopSelling.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="TopSelling" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="DataSetTopSellingTableAdapters.DataTableTopSellingTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxTop" Name="TOP" PropertyName="Text" 
                Type="Int32" />
            <asp:ControlParameter ControlID="TextBoxStartDate" Name="STARTDATE" 
                PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="TextBoxEndDate" Name="ENDDATE" 
                PropertyName="Text" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</asp:Content>

