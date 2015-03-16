<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductInquiry.aspx.cs" Inherits="ProductInquiry" %>



<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script language="javascript" type="text/javascript">
// <![CDATA[

      

// ]]>
    </script>
    <style type="text/css">
            
         
       
                
        .searchdiv
        {
            /*float: top;*/
            width:425px;   
           
            height: 735px;
            border-style: solid;            
            background: #ffffff;            
            color: Black;
            float: left;  
            margin-left: 0;
            margin-right: 0;
            margin-top: 0;
            margin-bottom: 0
               
              
            
        }
        
        .productdiv
        {
            /*float: top;*/
            width:459px;  
            
            min-height: 100%;
            border-style: solid;            
            background: #ffffff;           
            color: Black;
            float: right;
            margin-bottom: 10px;
            padding: 10px;
            height: 179px;
            margin-left: 0;
            margin-right: 0;
            margin-top: 0;
            margin-bottom: 0
        }
        
        .productprice
        {
            /*float: top;*/
            width:459px;  
             float: right;
            min-height: 100%;
            border-style: solid;            
            background: #ffffff;           
            color: Black;            
            margin-bottom: 10px;
            padding: 10px;
            height: 311px;
            margin-left: 0;
            margin-right: 0;
            margin-top: 0;
            margin-bottom: 0
        }
        
        .productinv
        {
            /*float: top;*/
            width:459px;  
             float: right;
            min-height: 100%;
            border-style: solid;            
            background: #ffffff;           
            color: Black;
            margin-bottom: 10px;
            padding: 10px;
            height: 171px;
            margin-left: 0;
            margin-right: 0;
            margin-top: 0;
            margin-bottom: 0
        }
        
        .footer
        {
            clear: both;
        }
        
         .gridview
        {
            margin: 0;
            
        }
        
       
        
        .style16
        {
            width: 100%;
            height: 29px;
        }
        .style19
        {
            width: 306px;
        }
        .style20
        {
            width: 129px;
        }
        .style21
        {
            width: 29px;
        }
        .style23
        {
            width: 127px;
        }
        .style25
        {
            width: 290px;
        }
                
       
        
       
        
        .style26
        {
            width: 6px;
        }
                
       
        input[type=text]  
        {
         padding-left: 10px;
         
            
        }
       
        
        .style27
        {
            width: 35px;
        }
        .style28
        {
            width: 209px;
        }
        .style29
        {
            width: 19px;
        }
       
        
        </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    
        <ContentTemplate>
      

        <div id="divSearch" class="searchdiv" align="center" style="overflow: auto">
            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
        
        
            <br />
            <table class="style16">
                <tr>
                    <td class="style29">
                        &nbsp;</td>
                    <td class="style27">
                        <asp:Label ID="LabelType0" runat="server" style="font-weight: 700" 
                            Text="Search "></asp:Label>
                    </td>
                    <td class="style28">
                        <asp:TextBox ID="TextBoxSearch" runat="server" Height="17px" 
                            ontextchanged="TextBox1_TextChanged" Width="205px"></asp:TextBox>
                    </td>
                    <td align="left">
                        <asp:Button ID="Search" runat="server" onclick="Search_Click" Text="OK" 
                            Height="28px" Width="77px" />
                    </td>
                </tr>
            </table>
        
        
       <!-- <div style="overflow: hidden; width: 100%; Height: 310px; border: 1px solid">-->

   

           
            &nbsp;<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AlternatingRowStyle-CssClass="even" AutoGenerateColumns="False" 
                AutoGenerateSelectButton="True" CellPadding="3" 
                DataKeyNames="i_rank" 
                onpageindexchanging="GridView1_PageIndexChanging" 
                onrowdatabound="GridView1_RowDataBound" 
                onselectedindexchanged="GridView1_SelectedIndexChanged" 
                ShowHeaderWhenEmpty="True" BackColor="White" BorderColor="#E7E7FF" 
                BorderStyle="Solid" BorderWidth="1px" Width="90%" PageSize="20" 
                ShowFooter="True">
                <AlternatingRowStyle BackColor="#F7F7F7" CssClass="even" />
                <Columns>
                    <asp:BoundField DataField="Code" HeaderText="Code" ReadOnly="True" 
                        SortExpression="Code" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Type" HeaderText="Type" ReadOnly="True" 
                        SortExpression="Type" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DESCRIPTION" HeaderText="Description" 
                        ReadOnly="True" SortExpression="DESCRIPTION" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Scale" HeaderText="Scale" ReadOnly="True" 
                        SortExpression="Scale" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
               <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="6" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            </asp:GridView>

        
        
        &nbsp;</div>
        <!--</div>-->

        <div id="divContent" class="productdiv">
        
        <h2 style="overflow: auto">Product</h2>
            <table class="style16">
                <tr>
                    <td class="style26">
                        &nbsp;</td>
                    <td class="style20">
                        <asp:Label ID="LabelType" runat="server" style="font-weight: 700" 
                            Text="Product Type "></asp:Label>
                    </td>
                    <td class="style19">
                        <asp:DropDownList ID="DropDownListTypes" runat="server" Enabled="False" 
                            height="23px" Width="310px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style26">
                        &nbsp;</td>
                    <td class="style20">
                        <asp:Label ID="LabelCode" runat="server" style="font-weight: 700" 
                            Text="Sheet No. / Code"></asp:Label>
                    </td>
                    <td class="style19">
                        <asp:TextBox ID="TextBoxProductCode" runat="server" height="22px" 
                            ReadOnly="True" Width="294px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style26">
                        &nbsp;</td>
                    <td class="style20">
                        <asp:Label ID="LabelCode0" runat="server" style="font-weight: 700" 
                            Text="Description"></asp:Label>
                    </td>
                    <td class="style19">
                        <asp:TextBox ID="TextBoxProductDescription" runat="server" height="22px" 
                            ReadOnly="True" Width="294px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style26">
                        &nbsp;</td>
                    <td class="style20">
                        <asp:Label ID="LabelCode1" runat="server" style="font-weight: 700" 
                            Text="Scale / Sub-Class"></asp:Label>
                    </td>
                    <td class="style19">
                        <asp:TextBox ID="TextBoxProductScale" runat="server" height="22px" 
                            ReadOnly="True" Width="294px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:Label ID="LabelDateEdited" runat="server" Text="Date Edited" 
                ForeColor="Silver"></asp:Label>
            <br />

        
        
            </div>
        
            <br />
           <div id="divprice" class="productprice">
           <h2>Price</h2>
               <ContentTemplate>
                    <br />
                    <table class="style16">
                        <tr>
                            <td class="style21">
                                &nbsp;</td>
                            <td class="style23">
                                <asp:Label ID="Label2" runat="server" Text="Effectivity Date"></asp:Label>
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="TextBoxEffDate" runat="server" Height="22px" 
                                    ontextchanged="TextBoxEffDate_TextChanged" Width="294px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style21">
                                &nbsp;</td>
                            <td class="style23">
                                <asp:Label ID="Label3" runat="server" Text="Price/Unit"></asp:Label>
                            </td>
                            <td class="style25">
                                <asp:TextBox ID="TextBoxPrice" runat="server" Font-Bold="True" 
                                    Font-Size="Medium" ForeColor="#3366FF" Height="25px" Width="294px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                    <br />
                    <asp:GridView ID="GridViewPrices" runat="server" AutoGenerateColumns="False" 
                        BorderColor="#E7E7FF" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
                        DataKeyNames="effdate" Font-Size="Small" 
                        onrowcancelingedit="GridViewPrices_RowCancelingEdit" 
                        onrowcommand="GridViewPrices_RowCommand" 
                        onrowdatabound="GridViewPrices_RowDataBound1"                         
                        onrowediting="GridViewPrices_RowEditing" 
                        onrowupdated="GridViewPrices_RowUpdated" 
                        onrowupdating="GridViewPrices_RowUpdating1" 
                        onselectedindexchanged="GridViewPrices_SelectedIndexChanged" ShowFooter="True" 
                        ShowHeaderWhenEmpty="True" Width="100%" 
                        onrowdeleting="GridViewPrices_RowDeleting" BackColor="White" 
                        EmptyDataText="xxx" AllowPaging="True" PageSize="3">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:TemplateField HeaderText="Date of Effectivity">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBoxEditEffDate" runat="server" 
                                        Text='<%# Eval("effdate") %>'></asp:TextBox>
                                    <asp:CalendarExtender ID="TextBoxEditEffDate_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="TextBoxEditEffDate">
                                    </asp:CalendarExtender>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelEffDate" runat="server" Text='<%# Bind("effdate","{0:MMM dd, yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="50%" />
                                <ItemStyle HorizontalAlign="Center" />
                                <FooterTemplate>
                                    &nbsp;&nbsp;
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBoxPrice" runat="server" Text='<%# Eval("Price") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    &nbsp;&nbsp;
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="6" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                    <br />
                </ContentTemplate>
            
        
            <asp:Label ID="LabelPriceMsg" runat="server"></asp:Label>
        </div>    
        
            <br />
          
            
        <div id="divinventory" class="productinv">
        <h2>Inventory</h2>
            <asp:GridView ID="GridViewInventory" runat="server" CellPadding="3" 
                BackColor="White" BorderColor="#E7E7FF" 
                BorderStyle="None" BorderWidth="1px" ShowFooter="True" Width="100%" 
                AutoGenerateColumns="False" onrowcommand="GridViewInventory_RowCommand" 
                onselectedindexchanged="GridViewInventory_SelectedIndexChanged" 
                onrowdatabound="GridViewInventory_RowDataBound" 
                onrowdeleting="GridViewInventory_RowDeleting" DataKeyNames="effdate" 
                onrowcancelingedit="GridViewInventory_RowCancelingEdit" 
                onrowediting="GridViewInventory_RowEditing" 
                onrowupdated="GridViewInventory_RowUpdated" 
                onrowupdating="GridViewInventory_RowUpdating">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:TemplateField HeaderText="Date">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxInvDateEdit" runat="server" Text='<%# Eval("effdate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelEffDate" runat="server"  Text='<%# Bind("effdate","{0:MMM dd, yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterStyle HorizontalAlign="Center" />
                        <HeaderStyle Width="50%" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                        
                    <asp:TemplateField HeaderText="Count">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxInvCountEdit" runat="server" Text='<%# Eval("count") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelCount" runat="server" Text='<%# Bind("count") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Right" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="6" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            </asp:GridView>
            
        
        </div>
           
           
        </ContentTemplate>
       

    </asp:UpdatePanel>
    
    
    </asp:Content>
   


