<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReportMapFlowDetailed.aspx.cs" Inherits="ReportMapFlowDetailed" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
  
   
    <asp:RadioButton ID="rdbtnJanToJun" Checked="true"  runat="server" 
         Text="January to June" ForeColor="Black" GroupName="MonthsGroup" 
        oncheckedchanged="rdbtnJanToJun_CheckedChanged"/>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
         <asp:Label ID="Label1" runat="server" Text="Select Year :"></asp:Label>
         <asp:DropDownList ID="DropDownList1" runat="server" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>
    &nbsp;&nbsp;
    <asp:Button ID="ButtonFilterInventory" runat="server" 
        onclick="ButtonFilterInventory_Click" Text="Filter" />
    &nbsp;&nbsp;<asp:Label ID="lblValue" runat="server" Text="Label" 
        Visible="False"></asp:Label>
                <br />
    <asp:RadioButton ID="rdbtnJulToDec" runat="server" 
         Text="July to December" ForeColor="Black" GroupName="MonthsGroup" 
        oncheckedchanged="rdbtnJulToDec_CheckedChanged"/>
     
    
     
    &nbsp;&nbsp;
    <asp:Label ID="Label2" runat="server" Text="Select Type :"></asp:Label>
    <asp:DropDownList ID="DropDownList2" runat="server" 
        DataSourceID="SqlDataSourceType" DataTextField="TYPEDESC" 
        DataValueField="TYPEDESC" 
        onselectedindexchanged="DropDownList2_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NPASISConnectionString %>" 
        SelectCommand="SELECT [TYPE], [TYPEDESC] FROM [PRODTYPELIB]">
    </asp:SqlDataSource>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="912px" 
        Height="629px" style="z-index: -1">
        <LocalReport ReportPath="ReportMapFlowDetailed.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" 
                    Name="DataSetMapFlowDET" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
     <rsweb:ReportViewer ID="ReportViewer2" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="912px" 
        Height="629px" style="z-index: -1" Visible="False">
        <LocalReport ReportPath="ReportMapFlowJulToDec.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DataSetMapFlowDETJD" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="InventoryJanToJunTableAdapters.JanToJunTableAdapter">
        <SelectParameters>
            <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            <asp:ControlParameter ControlID="DropDownList2" Name="TYPEDESC" 
                PropertyName="SelectedValue" Type="STRING" />
            <asp:ControlParameter ControlID="DropDownList1" Name="YEAR" 
                PropertyName="SelectedValue" Type="Decimal" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="InventoryJulToDecTableAdapters.JulToDecTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList2" Name="TYPEDESC" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DropDownList1" Name="YEAR" 
                PropertyName="SelectedValue" Type="Decimal" />
            <asp:Parameter Name="MSOCODE" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>