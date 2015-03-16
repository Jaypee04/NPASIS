<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="FOAMaintenance.aspx.vb" Inherits="FOAMaintenance" MaintainScrollPositionOnPostback="True"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server">  </asp:ScriptManager>
    
    <h2> Field of Application Library</h2>
    
    <h6 align="center">Add New Field of Application </h6>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
        CellPadding="4" DataKeyNames="FOACODE" DataSourceID="SqlDataSource1" 
        DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px" 
        Width="125px" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:TemplateField HeaderText="CODE" SortExpression="FOACODE">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("FOACODE") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="txtCode" runat="server" Text='<%# Bind("FOACODE") %>' 
                        Width="80px" MaxLength="10" ToolTip="Max length is 10"></asp:TextBox>
                    &nbsp;
                    <asp:RequiredFieldValidator class="errordisplay" ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ForeColor="Red" 
                        ToolTip="Value is Required" ControlToValidate="txtCode" Display="Dynamic" 
                        ValidationGroup="FOAGroup">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span ID="idControl">DetailsView2</span> - Field[0] - FOACODE
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="FOADESC" HeaderText="Description" SortExpression="FOADESC">
            <ControlStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="DTE" HeaderText="DTE" SortExpression="DTE" 
                Visible="False" />
            <asp:BoundField DataField="USERID" HeaderText="USERID" SortExpression="USERID" 
                Visible="False" />
            <asp:CommandField ButtonType="Button" ShowInsertButton="True" 
                ValidationGroup="FOAGroup" ShowDeleteButton="True" />
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
            DeleteCommand="DELETE FROM [FOALIB] WHERE [FOACODE] = @FOACODE" 
            InsertCommand="INSERT INTO [FOALIB] ([FOACODE], [FOADESC], [DTE], [USERID]) VALUES (@FOACODE, @FOADESC, { fn NOW() }, @USERID)" 
            SelectCommand="SELECT * FROM [FOALIB] WHERE [FOACODE]=@FOACODE" 
            UpdateCommand="UPDATE [FOALIB] SET [FOACODE] = @FOACODE, [FOADESC] = @FOADESC, [DTE] = { fn NOW() }, [USERID] = @USERID WHERE [FOACODE] = @FOACODE">
            <DeleteParameters>
                <asp:Parameter Name="FOACODE" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FOACODE" Type="String" />
                <asp:Parameter Name="FOADESC" Type="String" />
                <asp:Parameter Name="DTE" Type="DateTime" />
                <asp:SessionParameter Name="USERID" SessionField="USERID" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="FOACODE" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="FOACODE" Type="String" />
                <asp:Parameter Name="FOADESC" Type="String" />
                <asp:Parameter Name="DTE" Type="DateTime" />
                <asp:SessionParameter Name="USERID" SessionField="USERID" Type="String" />
                <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            </UpdateParameters> 
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NPASISConnectionString %>" 
            DeleteCommand="DELETE FROM [FOALIB] WHERE [FOACODE] = @FOACODE" 
            InsertCommand="INSERT INTO [FOALIB] ([FOACODE], [FOADESC], [DTE], [USERID]) VALUES (@FOACODE, @FOADESC, { fn NOW() }, @USERID)" 
            SelectCommand="SELECT * FROM [FOALIB]" 
            
        UpdateCommand="UPDATE [FOALIB] SET [FOACODE] = @FOACODE, [FOADESC] = @FOADESC, [DTE] = { fn NOW() }, [USERID] = @USERID WHERE [FOACODE] = @FOACODE">
            <DeleteParameters>
                <asp:Parameter Name="FOACODE" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FOACODE" Type="String" />
                <asp:Parameter Name="FOADESC" Type="String" />
                <asp:SessionParameter Name="USERID" SessionField="USERID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FOACODE" Type="String" />
                <asp:Parameter Name="FOADESC" Type="String" />
                <asp:SessionParameter Name="USERID" SessionField="USERID" Type="String" />
            </UpdateParameters> 
        </asp:SqlDataSource>
            

        <h6 align="center"> List of Field of Application </h6>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="FOACODE" DataSourceID="SqlDataSource2" ForeColor="#333333" 
                    GridLines="None" HorizontalAlign="Center" PageSize="6">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="FOACODE" HeaderText="CODE" ReadOnly="True" 
                            SortExpression="FOACODE" />
                        <asp:BoundField DataField="FOADESC" HeaderText="DESCRIPTION" 
                            SortExpression="FOADESC" />
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
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="Edit" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
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

