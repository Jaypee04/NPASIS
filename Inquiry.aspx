<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Inquiry.aspx.cs" Inherits="Inquiry" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<script language="javascript" type="text/javascript">
// <![CDATA[

      

// ]]>
    </script>
    <style type="text/css">
                
       
        
       
        
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <center>
        <div id="divPageHeader" class= "pageheader">
            Product and Services
        </div>

        <div id="divSearch" class="sidebar">
        <h2>Search</h2>
        
            &nbsp;&nbsp;&nbsp;&nbsp; Search&nbsp;&nbsp;
        
        
            <asp:TextBox ID="TextBoxSearch" runat="server" Height="20px" 
                ontextchanged="TextBox1_TextChanged" Width="231px"></asp:TextBox>
            <asp:DropDownExtender ID="TextBoxSearch_DropDownExtender" runat="server" 
                DynamicServicePath="" Enabled="True" TargetControlID="TextBoxSearch">
            </asp:DropDownExtender>
            &nbsp;&nbsp;
            <asp:Button ID="Search" runat="server" onclick="Search_Click" Text="OK" />
        
        
            <br />

        
       <!-- <div style="overflow: hidden; width: 100%; Height: 310px; border: 1px solid">-->

   

           
            &nbsp;<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AlternatingRowStyle-CssClass="even" AutoGenerateColumns="False" 
                AutoGenerateSelectButton="True" CellPadding="3" 
                DataKeyNames="i_rank" 
                onpageindexchanging="GridView1_PageIndexChanging" 
                onrowdatabound="GridView1_RowDataBound" 
                onselectedindexchanged="GridView1_SelectedIndexChanged" 
                ShowHeaderWhenEmpty="True" BackColor="White" BorderColor="#E7E7FF" 
                BorderStyle="None" BorderWidth="1px" Width="90%" PageSize="3">
                <AlternatingRowStyle BackColor="#F7F7F7" CssClass="even" />
                <Columns>
                    <asp:BoundField DataField="Code" HeaderText="Code" ReadOnly="True" 
                        SortExpression="Code" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TYPE" HeaderText="Type" ReadOnly="True" 
                        SortExpression="TYPE" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DESCRIPTION" HeaderText="Description" 
                        ReadOnly="True" SortExpression="DESCRIPTION" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Count" HeaderText="Stocks" ReadOnly="True" 
                        SortExpression="Count" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" 
                    Position="Bottom" PreviousPageText="Prev" />
                <PagerStyle Font-Size="Medium" ForeColor="#4A3C8C" 
                    HorizontalAlign="Center" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" Wrap="False" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>

        
        
        &nbsp;</div>
            <br />
        <!--</div>-->

        <div id="divContent" class="maincontent">
        
        <h2>Product</h2>
        
            <br />

        
            <asp:Label ID="LabelCounter" runat="server" ForeColor="#999999"></asp:Label>
            <br />
            <asp:Label ID="LabelType" runat="server" style="font-weight: 700" 
                Text="Product Type "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownListTypes" runat="server" Enabled="False" 
                height="22px" Width="294px">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="LabelCode" runat="server" style="font-weight: 700" 
                Text="Sheet No. / Code"></asp:Label>
            &nbsp;&nbsp;
            <asp:TextBox ID="TextBoxProductCode" runat="server" height="22px" 
                ReadOnly="True" Width="294px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="LabelCode0" runat="server" style="font-weight: 700" 
                Text="Description"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBoxProductDescription" runat="server" height="22px" 
                ReadOnly="True" Width="294px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="LabelCode1" runat="server" style="font-weight: 700" 
                Text="Scale / Sub-Class"></asp:Label>
            &nbsp;&nbsp;
            <asp:TextBox ID="TextBoxProductScale" runat="server" height="22px" 
                ReadOnly="True" Width="294px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="LabelDateEdited" runat="server" Text="Date Edited" 
                ForeColor="Silver"></asp:Label>
            <br />
            <asp:Label ID="Notification" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <br />

        
        
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            </div>
        
            <br />
           <div id="divprice" class="maincontent">
           <h2>Price</h2>
            <asp:Label ID="Label2" runat="server" Text="Effectivity Date"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <asp:TextBox ID="TextBoxEffDate" runat="server" 
                ontextchanged="TextBoxEffDate_TextChanged" Width="298px"></asp:TextBox>
            &nbsp;<br />
            <asp:Label ID="Label3" runat="server" Text="Price/Unit"></asp:Label>
               &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<asp:TextBox 
                   ID="TextBoxPrice" runat="server" Width="115px" 
                   Font-Bold="True" ForeColor="#3366FF" Font-Size="Medium" Height="25px"></asp:TextBox>
            
                <ContentTemplate>
                    <br />
                    <br />
                </ContentTemplate>
            
        
            <asp:Label ID="LabelPriceMsg" runat="server"></asp:Label>
        </div>    
        
            <br />
          
            
        
           
            &nbsp;<br />
            </center>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <br />
    </asp:Content>