<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReportDetailedCollection.aspx.cs" Inherits="ReportDetailedCollection" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    Start date
    <asp:TextBox ID="TextBoxStartDate" runat="server"></asp:TextBox>
    <asp:CalendarExtender ID="TextBoxStartDate_CalendarExtender" runat="server" 
        Enabled="True" TargetControlID="TextBoxStartDate" Format="MMMM dd, yyyy">
    </asp:CalendarExtender>
&nbsp; End date&nbsp;&nbsp;
    <asp:TextBox ID="TextBoxEndDate" runat="server"></asp:TextBox>
    <asp:CalendarExtender ID="TextBoxEndDate_CalendarExtender" runat="server" 
        Enabled="True" TargetControlID="TextBoxEndDate" Format="MMMM dd, yyyy">
    </asp:CalendarExtender>
&nbsp;&nbsp;
    <asp:Button ID="buttonOK" runat="server" Height="22px" onclick="buttonOK_Click" 
        Text="OK" Width="79px" />
    &nbsp;&nbsp;
    <asp:ImageButton ID="ImageButtonPrint" runat="server" Height="17px" 
        onclick="ImageButton1_Click" Width="58px" />
    <br />
    <br />
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="926px" 
        Height="578px" SizeToReportContent="True">
        <LocalReport ReportPath="ReportDetailedCollection.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" 
                    Name="DSDetailedCollection" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="DetailedCollectionTableAdapters.ORDERFLTableAdapter">
        <SelectParameters>
            <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            <asp:ControlParameter ControlID="TextBoxStartDate" Name="STARTDATE" 
                PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="TextBoxEndDate" Name="ENDDATE" 
                PropertyName="Text" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </asp:Content>