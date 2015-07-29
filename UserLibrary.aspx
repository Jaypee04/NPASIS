<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="UserLibrary.aspx.vb" Inherits="UserLibrary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


<asp:ScriptManager ID="ScriptManager1" runat="server">  </asp:ScriptManager>
    
    <h2> User Library</h2>
    
    <h6 align="center">Add New User </h6>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
        CellPadding="4" DataKeyNames="USERID" DataSourceID="SqlDataSource1" 
        DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px" 
        Width="125px" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:TemplateField HeaderText="USER ID" SortExpression="USERID">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("USERID") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="txtUserID" runat="server" Text='<%# Bind("USERID") %>' 
                        Width="80px" MaxLength="6" ToolTip="Max length is 6"></asp:TextBox>
                    &nbsp;
                    <asp:RequiredFieldValidator class="errordisplay" ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ForeColor="Red" 
                        ToolTip="Value is Required" ControlToValidate="txtUserID" Display="Dynamic" 
                        ValidationGroup="USEGroup">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span ID="idControl">DetailsView2</span> - Field[0] - USERID
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME">
            <ControlStyle Width="200px" />
            </asp:BoundField>
            
            <asp:TemplateField HeaderText="PASSWORD">
                <EditItemTemplate>
                  <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Text='<%# Bind("Password") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                  <asp:TextBox ID="TextBox2" Enabled="false" runat="server" TextMode="Password" Text='<%# Bind("Password") %>'></asp:TextBox>
        </ItemTemplate>
      </asp:TemplateField>
            <asp:BoundField DataField="ACCESSLEVEL" HeaderText="ACCESSLEVEL" SortExpression="ACCESSLEVEL"/>
            <asp:BoundField DataField="MSOCODE" HeaderText="MSOCODE" SortExpression="MSOCODE" Visible="False" />
            <asp:CommandField ButtonType="Button" ShowInsertButton="True" ValidationGroup="USEGroup" ShowDeleteButton="True" />
        </Fields>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
    </ContentTemplate>
    </asp:UpdatePanel>
    
    <br />

         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NPASISConnectionString %>" 
            DeleteCommand="DELETE FROM [USERS] WHERE [USERID] = @USERID" 
            InsertCommand="INSERT INTO [USERS] ([USERID], [NAME], [PASS], [ACCESSLEVEL], [MSOCODE]) VALUES (@USERID, @NAME, @PASS, @ACCESSLEVEL, @MSOCODE)" 
            SelectCommand="SELECT * FROM [USERS] WHERE [MSOCODE] = @MSOCODE" 
            UpdateCommand="UPDATE [USERS] SET [USERID] = @USERID, [NAME] = @NAME, [PASS] = @PASS, [ACCESSLEVEL] = @ACCESSLEVEL WHERE [USERID] = @USERID">
            <DeleteParameters>
                <asp:Parameter Name="USERID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="USERID" Type="String" />
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="PASS" Type="String" />
                <asp:Parameter Name="ACCESSLEVEL" Type="String" />
                <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="USERID" Type="String" />
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="PASS" Type="String" />
                <asp:Parameter Name="ACCESSLEVEL" Type="String" />
            </UpdateParameters> 
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NPASISConnectionString %>" 
            DeleteCommand="DELETE FROM [USERS] WHERE [USERID] = @USERID" 
            InsertCommand="INSERT INTO [USERS] ([USERID], [NAME], [PASS], [ACCESSLEVEL], [MSOCODE]) VALUES (@USERID, @NAME, @PASS, @ACCESSLEVEL, @MSOCODE)" 
            SelectCommand="SELECT * FROM [USERS] WHERE [MSOCODE] = @MSOCODE"          
            UpdateCommand="UPDATE [USERS] SET [USERID] = @USERID, [NAME] = @NAME, [PASS] = @PASS, [ACCESSLEVEL] = @ACCESSLEVEL WHERE [USERID] = @USERID">
            <DeleteParameters>
                <asp:Parameter Name="USERID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="USERID" Type="String" />
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="PASS" Type="String" />
                <asp:Parameter Name="ACCESSLEVEL" Type="String" />
                <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            </SelectParameters> 
            <UpdateParameters>
                <asp:Parameter Name="USERID" Type="String" />
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="PASS" Type="String" />
                <asp:Parameter Name="ACCESSLEVEL" Type="String" />
            </UpdateParameters> 
        </asp:SqlDataSource>
            

        <h6 align="center"> List of User </h6>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="USERID" DataSourceID="SqlDataSource2" ForeColor="#333333" 
                    GridLines="None" HorizontalAlign="Center" PageSize="6">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="USERID" HeaderText="USERNAME" ReadOnly="True" 
                            SortExpression="USERID" />
                        <asp:BoundField DataField="NAME" HeaderText="NAME" 
                            SortExpression="NAME" />
                        <asp:BoundField DataField="ACCESSLEVEL" HeaderText="LEVEL" SortExpression="ACCESSLEVEL" />
                        <asp:BoundField DataField="MSOCODE" HeaderText="MSOCODE" SortExpression="MSOCODE" ReadOnly="True"/>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Update" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="Edit" />
                                &nbsp;<asp:Button ID="btnDelete" runat="server" CausesValidation="False" 
                                    CommandName="Delete" OnClientClick="return confirm('Delete record?')" Text="Delete" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="6" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </ContentTemplate>
    </asp:UpdatePanel>

        <div class="outsideButtonAlign">
            <asp:Button ID="btnListAll" class="outsideButton" runat="server" Text="List All " />
            <asp:Button ID="btnListby6" class="outsideButton" runat="server" Text="List by 6 " Visible="False" />
        </div>


</asp:Content>

