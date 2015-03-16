<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductsAndServices.aspx.cs" Inherits="ProductsAndServices" EnableSessionState="True" %>

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
            margin: 0;
            width:425px;   
           
            height: 777px;
            border-style: solid;            
            background: #ffffff;            
            color: Black;
            float: left;
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
            margin: 0;
            width:459px;  
            float: right;
            
            border-style: solid;            
            background: #ffffff;           
            color: Black;            
            padding: 10px;
            height: 273px;
            }
        
        .productinv
        {
            /*float: top;*/
            margin: 0;
            width:459px;  
             float: right;
            
            border-style: solid;            
            background: #ffffff;           
            color: Black;
            padding: 10px;
          
            }
        
        .footer
        {
            clear: both;
        }
        
         .gridview
        {
            margin: 0;
            
        }
        
       
        
        input[type=text]  
        {
         padding-left: 10px;
         
            
        }
       
        
        .gridviewProduct
        {}
        .style16
        {
            width: 100%;
            font-weight: 700;
        }
        .style17
        {
            height: 26px;
            font-weight: 700;
        }
        
       
        
        .style18
        {
            width: 100%;
        }
        
       
        
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

        <div id="divPageHeader" class= "pageheader">
            Product and Services
        </div>

        <div id="divSearch" class="searchdiv">
        <h2>&nbsp; Search</h2>
        
            &nbsp;&nbsp;&nbsp;&nbsp; Search&nbsp;&nbsp;
        
        
            <asp:TextBox ID="TextBoxSearch" runat="server" Height="20px" 
                ontextchanged="TextBox1_TextChanged" Width="231px" BorderStyle="Solid"></asp:TextBox>
            <asp:DropDownExtender ID="TextBoxSearch_DropDownExtender" runat="server" 
                DynamicServicePath="" Enabled="True" TargetControlID="TextBoxSearch">
            </asp:DropDownExtender>
            &nbsp;&nbsp;
            <asp:Button ID="Search" runat="server" onclick="Search_Click" Text="OK" />
        
        
            <br />

        
       <!-- <div style="overflow: hidden; width: 100%; Height: 310px; border: 1px solid">-->

   

           
            &nbsp;<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AlternatingRowStyle-CssClass="even" AutoGenerateColumns="False" 
                AutoGenerateSelectButton="True" CellPadding="4" 
                DataKeyNames="i_rank" 
                onpageindexchanging="GridView1_PageIndexChanging" 
                onrowdatabound="GridView1_RowDataBound" 
                onselectedindexchanged="GridView1_SelectedIndexChanged" 
                ShowHeaderWhenEmpty="True" Width="99%" PageSize="27" ForeColor="#333333" 
                GridLines="None" Font-Size="Small">
                <AlternatingRowStyle BackColor="White" CssClass="even" />
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
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" 
                    Position="Bottom" PreviousPageText="Prev" />
                <PagerStyle Font-Size="Medium" ForeColor="White" 
                    HorizontalAlign="Center" BackColor="#2461BF" />
                <RowStyle BackColor="#EFF3FB" Wrap="False" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>

        
        
        &nbsp;</div>
        <!--</div>-->

        <div id="divContent" class="productprice">
        
        <h2>Product<asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            </h2>
        <div id="prodToolbar">
        
            <asp:Button ID="ButtonProdAdd" runat="server"
                onclick="ButtonProdAdd_Click" Text="Add"  CssClass="buttonx" />
            <asp:Button ID="ButtonProdEdit" runat="server"  
                onclick="ButtonProdEdit_Click1" Text="Edit" 
                CssClass="buttonx" />
            <asp:Button ID="ButtonProdDelete" runat="server"  
                onclick="ButtonProdDelete_Click" 
                OnClientClick="return confirm('Are you sure you want to delete this record.')" 
                Text="Delete"  CssClass="buttonx" />
            <asp:Button ID="ButtonSave" runat="server"  
                onclick="ButtonSave_Click" Text="Save" Visible="False"  
                CssClass="buttonx" />
            <asp:Button ID="ButtonCancel" runat="server"  
                onclick="ButtonCancel_Click" Text="Cancel" Visible="False" 
                CssClass="buttonx" />
        
            <asp:Button ID="ButtonPrevious" runat="server" CssClass="buttonx" 
                onclick="Previous_Click" Text="Prev" />
            <asp:Button ID="ButtonNext" runat="server" CssClass="buttonx" 
                onclick="ButtonNext_Click" Text="Next" UseSubmitBehavior="False" />
        
        </div>
        
            <br />

        
            <asp:Label ID="LabelCounter" runat="server" ForeColor="#999999"></asp:Label>
            <br />
            <br />
            <table class="style16">
                <tr>
                    <td class="style17">
                        Product Type</td>
                    <td class="style17">
                        <asp:DropDownList ID="DropDownListTypes" runat="server" Enabled="False" 
                            height="22px" Width="294px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: 700">
                        Sheet No. / Code</td>
                    <td>
                        <asp:TextBox ID="TextBoxProductCode" runat="server" height="25px" 
                            ReadOnly="True" Width="294px" BorderStyle="Solid"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-weight: 700">
                        Description</td>
                    <td>
                        <asp:TextBox ID="TextBoxProductDescription" runat="server" height="25px" 
                            ReadOnly="True" Width="294px" BorderStyle="Solid"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Scale / Sub-Class</td>
                    <td>
                        <asp:TextBox ID="TextBoxProductScale" runat="server" height="26px" 
                            ReadOnly="True" Width="294px" BorderStyle="Solid"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Label ID="LabelDateEdited" runat="server" Text="Date Edited" 
                ForeColor="Silver"></asp:Label>
            <br />
            <asp:Label ID="Notification" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <br />

        
        
            </div>
        
           
           <div id="divprice" class="productprice">
           <h2>Price</h2>
            
                <ContentTemplate>
                    <table class="style18">
                        <tr>
                            <td>
                                <b>Effectivity Date</b></td>
                            <td>
                                <asp:TextBox ID="TextBoxEffDate" runat="server" 
                                    ontextchanged="TextBoxEffDate_TextChanged" Width="298px" 
                                    BorderStyle="Solid" Height="27px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Price</b></td>
                            <td>
                                <asp:TextBox ID="TextBoxPrice" runat="server" Font-Bold="True" 
                                    Font-Size="Medium" ForeColor="Black" Height="25px" Width="115px" 
                                    BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridViewPrices" runat="server" AutoGenerateColumns="False" CellPadding="4" 
                        DataKeyNames="effdate" Font-Size="Small" 
                        onrowcancelingedit="GridViewPrices_RowCancelingEdit" 
                        onrowcommand="GridViewPrices_RowCommand" 
                        onrowdatabound="GridViewPrices_RowDataBound1"                         
                        onrowediting="GridViewPrices_RowEditing" 
                        onrowupdated="GridViewPrices_RowUpdated" 
                        onrowupdating="GridViewPrices_RowUpdating1" 
                        onselectedindexchanged="GridViewPrices_SelectedIndexChanged" ShowFooter="True" 
                        ShowHeaderWhenEmpty="True" Width="456px" 
                        onrowdeleting="GridViewPrices_RowDeleting" 
                        EmptyDataText="xxx" Height="23px" AllowPaging="True" ForeColor="#333333" 
                        GridLines="None" PageSize="3">
                        <AlternatingRowStyle BackColor="White" />
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
                                <ItemStyle HorizontalAlign="Center" />
                                <FooterTemplate>
                                    &nbsp;<asp:TextBox ID="TextBoxEffDate" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="TextBoxEffDate_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="TextBoxEffDate">
                                    </asp:CalendarExtender>
                                    &nbsp;
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBoxPrice" runat="server" Text='<%# Eval("Price") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    &nbsp;<asp:TextBox ID="TextBoxInsertPrice" runat="server"></asp:TextBox>
                                    &nbsp;
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkUpdate" runat="server" CausesValidation="False" 
                                        CommandArgument='<%# Eval("effdate") %>' CommandName="Update" 
                                        Text="Update"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkCancel" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:LinkButton ID="LinkInsert" runat="server" CausesValidation="True" 
                                        CommandName="Insert" ForeColor="White" Text="Insert"></asp:LinkButton>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkEdit" runat="server" CausesValidation="False" 
                                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    <asp:LinkButton ID="LinkDelete" runat="server" CausesValidation="False" 
                                        CommandArgument='<%# Eval("effdate") %>' CommandName="Delete" 
                                        Text="Delete" 
                                        OnClientClick='return confirm("Are you sure you want to Delete this?");'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </ContentTemplate>
            
        
            <asp:Label ID="LabelPriceMsg" runat="server"></asp:Label>
        </div>   
        <div id="divinventory" class="productinv">
        <h2>Inventory</h2>
            <asp:GridView ID="GridViewInventory" runat="server" CellPadding="4" 
                CssClass="gridviewProduct" ShowFooter="True" Width="455px" 
                AutoGenerateColumns="False" onrowcommand="GridViewInventory_RowCommand" 
                onselectedindexchanged="GridViewInventory_SelectedIndexChanged" 
                onrowdatabound="GridViewInventory_RowDataBound" 
                onrowdeleting="GridViewInventory_RowDeleting" DataKeyNames="effdate" 
                onrowcancelingedit="GridViewInventory_RowCancelingEdit" 
                onrowediting="GridViewInventory_RowEditing" 
                onrowupdated="GridViewInventory_RowUpdated" 
                onrowupdating="GridViewInventory_RowUpdating" Height="16px" 
                AllowPaging="True" ForeColor="#333333" GridLines="None" PageSize="3">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Date">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxInvDateEdit" runat="server" Text='<%# Eval("effdate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="TextBoxInvDate" runat="server"></asp:TextBox>
                            
                            <asp:CalendarExtender ID="TextBoxInvDate_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="TextBoxInvDate">
                            </asp:CalendarExtender>
                            
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelEffDate" runat="server"  Text='<%# Bind("effdate","{0:MMM dd, yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                        
                    <asp:TemplateField HeaderText="Count">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxInvCountEdit" runat="server" Text='<%# Eval("count") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="TextBoxInvCount" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelCount" runat="server" Text='<%# Bind("count") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButtonInvUpdate" runat="server" CommandName="Update">Update</asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonInvCancel" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                        </EditItemTemplate>
                        <FooterTemplate>
                            &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="LinkButtonInvInsert" runat="server" CommandName="Insert">Insert</asp:LinkButton>
                        </FooterTemplate>
                    <ItemTemplate>
                                    <asp:LinkButton ID="LinkEditInv" runat="server" CausesValidation="True" 
                                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    <asp:LinkButton ID="LinkDeleteInv" runat="server" CausesValidation="True" 
                                        CommandName="Delete" Text="Delete" OnClientClick='return confirm("Are you sure you want to Delete this?");'></asp:LinkButton>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            
        
        </div>
           
            &nbsp;<br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <br />
    </asp:Content>

