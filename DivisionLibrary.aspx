<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="DivisionLibrary.aspx.vb" Inherits="DivisionLibrary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<asp:ScriptManager ID="ScriptManager1" runat="server">  </asp:ScriptManager>
    
    <h2> Division Library</h2>
    
    <h6 align="center">Add New Division </h6>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
        CellPadding="4" DataKeyNames="DIVCODE" DataSourceID="SqlDataSource1" 
        DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px" 
        Width="125px" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:TemplateField HeaderText="CODE" SortExpression="DIVCODE">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("DIVCODE") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="txtCode" runat="server" Text='<%# Bind("DIVCODE") %>' 
                        Width="80px" MaxLength="4" ToolTip="Max length is 4"></asp:TextBox>
                    &nbsp;
                    <asp:RequiredFieldValidator class="errordisplay" ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ForeColor="Red" 
                        ToolTip="Value is Required" ControlToValidate="txtCode" Display="Dynamic" 
                        ValidationGroup="DIVGroup">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span ID="idControl">DetailsView2</span> - Field[0] - DIVCODE
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="DIVISION" HeaderText="Division" SortExpression="DIVISION">
            <ControlStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="DTE" HeaderText="DTE" SortExpression="DTE" 
                Visible="False" />
            <asp:BoundField DataField="USERID" HeaderText="USERID" SortExpression="USERID" 
                Visible="False" />
            <asp:CommandField ButtonType="Button" ShowInsertButton="True" 
                ValidationGroup="DIVGroup" ShowDeleteButton="True" />
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
            DeleteCommand="DELETE FROM [DIVISIONLIB] WHERE [DIVCODE] = @DIVCODE" 
            InsertCommand="INSERT INTO [DIVISIONLIB] ([DIVCODE], [DIVISION], [DTE], [USERID]) VALUES (@DIVCODE, @DIVISION, { fn NOW() }, @USERID)" 
            SelectCommand="SELECT * FROM [DIVISIONLIB] WHERE [DIVCODE]=@DIVCODE" 
            UpdateCommand="UPDATE [DIVISIONLIB] SET [DIVCODE] = @DIVCODE, [DIVISION] = @DIVISION, [DTE] = { fn NOW() }, [USERID] = @USERID WHERE [DIVCODE] = @DIVCODE">
            <DeleteParameters>
                <asp:Parameter Name="DIVCODE" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DIVCODE" Type="String" />
                <asp:Parameter Name="DIVISION" Type="String" />
                <asp:Parameter Name="DTE" Type="DateTime" />
                <asp:SessionParameter Name="USERID" SessionField="USERID" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="DIVCODE" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="DIVCODE" Type="String" />
                <asp:Parameter Name="DIVISION" Type="String" />
                <asp:Parameter Name="DTE" Type="DateTime" />
                <asp:SessionParameter Name="USERID" SessionField="USERID" Type="String" />
                <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            </UpdateParameters> 
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NPASISConnectionString %>" 
            DeleteCommand="DELETE FROM [DIVISIONLIB] WHERE [DIVCODE] = @DIVCODE" 
            InsertCommand="INSERT INTO [DIVISIONLIB] ([DIVCODE], [DIVISION], [DTE], [USERID]) VALUES (@DIVCODE, @DIVISION, { fn NOW() }, @USERID)" 
            SelectCommand="SELECT * FROM [DIVISIONLIB]"          
            UpdateCommand="UPDATE [DIVISIONLIB] SET [DIVCODE] = @DIVCODE, [DIVISION] = @DIVISION, [DTE] = { fn NOW() }, [USERID] = @USERID WHERE [DIVCODE] = @DIVCODE">
            <DeleteParameters>
                <asp:Parameter Name="DIVCODE" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DIVCODE" Type="String" />
                <asp:Parameter Name="DIVISION" Type="String" />
                <asp:SessionParameter Name="USERID" SessionField="USERID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="DIVCODE" Type="String" />
                <asp:Parameter Name="DIVISION" Type="String" />
                <asp:SessionParameter Name="USERID" SessionField="USERID" Type="String" />
            </UpdateParameters> 
        </asp:SqlDataSource>
            

        <h6 align="center"> List of Division </h6>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="DIVCODE" DataSourceID="SqlDataSource2" ForeColor="#333333" 
                    GridLines="None" HorizontalAlign="Center" PageSize="6">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="DIVCODE" HeaderText="CODE" ReadOnly="True" 
                            SortExpression="DIVCODE" />
                        <asp:BoundField DataField="DIVISION" HeaderText="DIVISION" 
                            SortExpression="DIVISION" />
                        <asp:BoundField DataField="DTE" HeaderText="DTE" SortExpression="DTE" 
                            Visible="False" />
                        <asp:BoundField DataField="USERID" HeaderText="USERID" SortExpression="USERID" 
                            Visible="False" />
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

