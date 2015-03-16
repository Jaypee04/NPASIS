<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="SignatoryLib.aspx.vb" Inherits="SignatoryLib" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


<asp:ScriptManager ID="ScriptManager1" runat="server">  </asp:ScriptManager>
    
    <h2>Signatory Library</h2>
    
    <h6 align="center">Add New Signatory</h6>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
        CellPadding="4" DataKeyNames="ADMINN" DataSourceID="SqlDataSourceSignatory" 
        DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px" 
        Width="380px" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:TemplateField HeaderText="Official's Name" SortExpression="ADMINN">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ADMINN") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="txtOffName" runat="server" Text='<%# Bind("ADMINN") %>' 
                        Width="190px"></asp:TextBox>
                    &nbsp;
                    <asp:RequiredFieldValidator class="errordisplay" ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ForeColor="Red" 
                        ToolTip="Value is Required" ControlToValidate="txtOffName" Display="Dynamic" 
                        ValidationGroup="SigGroup">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span ID="idControl">DetailsView2</span> - Field[0] - ADMINN
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ADMINP" HeaderText="Position" SortExpression="ADMINP">
            <ControlStyle Width="190px" />
            </asp:BoundField>
            <asp:BoundField DataField="NOTEDN" HeaderText="Noted By" SortExpression="NOTEDN">
            <ControlStyle Width="190px" />
            </asp:BoundField>
            <asp:BoundField DataField="NOTEDP" HeaderText="Position" SortExpression="NOTEDP">
            <ControlStyle Width="190px" />
            </asp:BoundField>
            <asp:BoundField DataField="PREPAREN" HeaderText="Prepared By" SortExpression="PREPAREN">
            <ControlStyle Width="190px" />
            </asp:BoundField>
            <asp:BoundField DataField="PREPAREP" HeaderText="Position" SortExpression="PREPAREP">
            <ControlStyle Width="190px" />
            </asp:BoundField>
            <asp:BoundField DataField="ENCODEDN" HeaderText="Enocded By" SortExpression="ENCODEDN">
            <ControlStyle Width="190px" />
            </asp:BoundField>
            <asp:BoundField DataField="ENCODEDP" HeaderText="Position" SortExpression="ENCODEDP">
            <ControlStyle Width="190px" />
            </asp:BoundField>
            <asp:CommandField ButtonType="Button" ShowInsertButton="True" ValidationGroup="SigGroup" ShowDeleteButton="True" />
        </Fields>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
    </ContentTemplate>
    </asp:UpdatePanel>
    
    <br />

         <asp:SqlDataSource ID="SqlDataSourceSignatory" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NPASISConnectionString %>" 
            DeleteCommand="DELETE FROM [SIGNTORISLIB] WHERE [ADMINN] = @ADMINN" 
            InsertCommand="INSERT INTO [SIGNTORISLIB] ([ADMINN], [ADMINP], [NOTEDN], [NOTEDP], [PREPAREN], [PREPAREP], [ENCODEDN], [ENCODEDP], [MSOCODE]) VALUES (@ADMINN, @ADMINP, @NOTEDN, @NOTEDP, @PREPAREN, @PREPAREP, @ENCODEDN, @ENCODEDP, @MSOCODE)" 
            SelectCommand="SELECT * FROM [SIGNTORISLIB] WHERE [MSOCODE] = @MSOCODE" 
            UpdateCommand="UPDATE [SIGNTORISLIB] SET [ADMINN] = @ADMINN, [ADMINP] = @ADMINP, [NOTEDN] = @NOTEDN, [NOTEDP] = @NOTEDP, [PREPAREN] = @PREPAREN, [PREPAREP] = @PREPAREP, [ENCODEDN] = @ENCODEDN, [ENCODEDP] = @ENCODEDP WHERE [ADMINN] = @ADMINN">
            <DeleteParameters>
                <asp:Parameter Name="ADMINN" Type="String" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="ADMINN" Type="String" />
                <asp:Parameter Name="ADMINP" Type="String" />
                <asp:Parameter Name="NOTEDN" Type="String" />
                <asp:Parameter Name="NOTEDP" Type="String" />
                <asp:Parameter Name="PREPAREN" Type="String" />
                <asp:Parameter Name="PREPAREP" Type="String" />
                <asp:Parameter Name="ENCODEDN" Type="String" />
                <asp:Parameter Name="ENCODEDP" Type="String" />
                <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ADMINN" Type="String" />
                <asp:Parameter Name="ADMINP" Type="String" />
                <asp:Parameter Name="NOTEDN" Type="String" />
                <asp:Parameter Name="NOTEDP" Type="String" />
                <asp:Parameter Name="PREPAREN" Type="String" />
                <asp:Parameter Name="PREPAREP" Type="String" />
                <asp:Parameter Name="ENCODEDN" Type="String" />
                <asp:Parameter Name="ENCODEDP" Type="String" />
            </UpdateParameters> 
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NPASISConnectionString %>" 
            DeleteCommand="DELETE FROM [SIGNTORISLIB] WHERE [NOTEDN] = @NOTEDN" 
            InsertCommand="INSERT INTO [SIGNTORISLIB] ([ADMINN], [ADMINP], [NOTEDN], [NOTEDP], [PREPAREN], [PREPAREP], [ENCODEDN], [ENCODEDP]) VALUES (@ADMINN, @ADMINP, @NOTEDN, @NOTEDP, @PREPAREN, @PREPAREP, @ENCODEDN, @ENCODEDP)" 
            SelectCommand="SELECT * FROM [SIGNTORISLIB] WHERE [MSOCODE] = @MSOCODE" 
            UpdateCommand="UPDATE [SIGNTORISLIB] SET [ADMINN] = @ADMINN, [ADMINP] = @ADMINP, [NOTEDN] = @NOTEDN, [NOTEDP] = @NOTEDP, [PREPAREN] = @PREPAREN, [PREPAREP] = @PREPAREP, [ENCODEDN] = @ENCODEDN, [ENCODEDP] = @ENCODEDP WHERE [NOTEDN] = @NOTEDN">
            <DeleteParameters>
                <asp:Parameter Name="ADMINN" Type="String" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="ADMINN" Type="String" />
                <asp:Parameter Name="ADMINP" Type="String" />
                <asp:Parameter Name="NOTEDN" Type="String" />
                <asp:Parameter Name="NOTEDP" Type="String" />
                <asp:Parameter Name="PREPAREN" Type="String" />
                <asp:Parameter Name="PREPAREP" Type="String" />
                <asp:Parameter Name="ENCODEDN" Type="String" />
                <asp:Parameter Name="ENCODEDP" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ADMINN" Type="String" />
                <asp:Parameter Name="ADMINP" Type="String" />
                <asp:Parameter Name="NOTEDN" Type="String" />
                <asp:Parameter Name="NOTEDP" Type="String" />
                <asp:Parameter Name="PREPAREN" Type="String" />
                <asp:Parameter Name="PREPAREP" Type="String" />
                <asp:Parameter Name="ENCODEDN" Type="String" />
                <asp:Parameter Name="ENCODEDP" Type="String" />
                
            </UpdateParameters> 
        </asp:SqlDataSource>
            

        <h6 align="center"> List of Signatories </h6>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="ADMINN" DataSourceID="SqlDataSource2" ForeColor="#333333" 
                    GridLines="None" HorizontalAlign="Center" PageSize="6" 
                    Font-Size="XX-Small" Width="728px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="ADMINN" HeaderText="Official's Name" ReadOnly="True" 
                            SortExpression="ADMINN" />
                        <asp:BoundField DataField="NOTEDN" HeaderText="Noted By" SortExpression="NOTEDN" />
                        <asp:BoundField DataField="NOTEDP" HeaderText="Position" SortExpression="NOTEDP" />
                        <asp:BoundField DataField="PREPAREN" HeaderText="Prepared By" SortExpression="PREPAREN" />
                        <asp:BoundField DataField="PREPAREP" HeaderText="Position" SortExpression="PREPAREP" />
                        <asp:BoundField DataField="ENCODEDN" HeaderText="Encoded By" SortExpression="ENCODEDN" />
                        <asp:BoundField DataField="ENCODEDP" HeaderText="Position" SortExpression="ENCODEDP" />
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