<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReportTopSectotalClients.aspx.cs" Inherits="ReportTopSectotalClients" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
    .style16
    {}
    .style18
    {
        width: 30px;
    }
    .style19
    {
        width: 86px;
    }
    .style20
    {
        width: 14px;
    }
    .style21
    {
        width: 77px;
    }
    .style22
    {
        width: 142px;
    }
    .style23
    {
        width: 70px;
    }
    .style24
    {
        width: 127px;
    }
    .style25
    {
        width: 146px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style16">
    <tr>
        <td class="style18">
            <asp:Label ID="Label1" runat="server" Text="Top"></asp:Label>
        </td>
        <td class="style19">
            <asp:TextBox ID="TextBoxTop" runat="server" Height="23px" 
                style="margin-right: 0px" Width="100%"></asp:TextBox>
        </td>
        <td class="style20">
            &nbsp;</td>
        <td class="style21">
            STARTDATE</td>
        <td class="style22">
            <asp:TextBox ID="TextBoxStartDate" runat="server" Height="21px" Width="100%"></asp:TextBox>
            <asp:CalendarExtender ID="TextBoxStartDate_CalendarExtender" runat="server" 
                Enabled="True" TargetControlID="TextBoxStartDate">
            </asp:CalendarExtender>
        </td>
        <td>
            &nbsp;</td>
        <td class="style23">
            END DATE</td>
        <td class="style25">
            <asp:TextBox ID="TextBoxEndDate" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="TextBoxEndDate_CalendarExtender" runat="server" 
                Enabled="True" TargetControlID="TextBoxEndDate">
            </asp:CalendarExtender>
        </td>
        <td class="style24">
            <asp:Button ID="ButtonFilter" runat="server" onclick="ButtonFilter_Click" 
                Text="Filter" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
<rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
    Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
    WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="934px" 
        Height="696px">
    <LocalReport ReportPath="ReportTopSectoralClients.rdlc">
        <DataSources>
            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" 
                Name="TopSectoralClients" />
        </DataSources>
    </LocalReport>
</rsweb:ReportViewer>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
    TypeName="TopSectoralClientsTableAdapters.TableAdapterTopSectoralClient">
    <SelectParameters>
        <asp:ControlParameter ControlID="TextBoxTop" Name="TOP" PropertyName="Text" 
            Type="Int32" />
        <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
        <asp:ControlParameter ControlID="TextBoxStartDate" Name="STARTDATE" 
            PropertyName="Text" Type="DateTime" />
        <asp:ControlParameter ControlID="TextBoxEndDate" Name="ENDDATE" 
            PropertyName="Text" Type="DateTime" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
</asp:Content>

