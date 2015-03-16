<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MSOPersonnel.aspx.vb" Inherits="MSOPersonnel" MaintainScrollPositionOnPostback="True"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style18
        {
            width: 54px;
        }
        .style19
        {
            width: 11px;
        }
        .style20
        {
            width: 236px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<asp:ScriptManager ID="ScriptManager1" runat="server">  </asp:ScriptManager>
    
    <h2> MSO Personnel Library</h2>
    
    <h6 align="center">Add New Personnel </h6>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>

    <center>
    <table style = "background-color :#2461BF; width: 301px;" cellpadding = "4" 
            cellspacing = "0">
        <tr align = "left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style18">
                <asp:Label ID="lblName" runat="server" Text="Name" ForeColor = "#333333" 
                    Font-Bold = "True" ></asp:Label></td>
            
            <td style = "background-color :#2461BF;" class="style20">
                <asp:TextBox ID="txtName" runat="server" 
                    Width="198px" Enabled="False" TabIndex="1"></asp:TextBox></td>
            <td style = "background-color :#2461BF;" class="style19"><asp:Label ID="lblAsterisk" runat="server" 
                    Text=" *&nbsp;&nbsp;" ForeColor = "Red" Font-Bold = "True" Visible="False" ToolTip ="Value is Required"></asp:Label></td>
        </tr>
        <tr align = "left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style18">
                <asp:Label ID="lblAddress" runat="server" Text="Position"  
                    ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            
            <td class="style20">
                <asp:TextBox ID="txtPosition" runat="server" Width="197px" 
                    Enabled="False" TabIndex="2"></asp:TextBox></td>
            <td style = "background-color :#2461BF;" class="style19">
                <asp:Label ID="lblAsterisk1" runat="server" 
                    Text=" *&nbsp;&nbsp;" ForeColor = "Red" Font-Bold = "True" Visible="False" 
                    ToolTip ="Value is Required"></asp:Label></td>
        </tr>
        <tr align = "left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style18">&nbsp;</td>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style20">
                <asp:Button ID="btnAdd" runat="server" Text="ADD" Height="25px" Width="78px" />
                <asp:Button ID="btnSave" runat="server" Text="SAVE" Height="25px" Width="78px" 
                    Visible="False" TabIndex="3"/>
                <asp:Button ID="btnCancel" runat="server" Text="CANCEL" Height="25px" 
                    Width="78px" Visible="False"/>
                </td>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style19"></td>
        </tr>
        <%--<tr>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style18"></td>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style20">&nbsp;</td>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style19"></td>
        </tr>--%>
    </table>
    </center>


<%--    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
        CellPadding="4" DataKeyNames="MSOCODE" DataSourceID="SqlDataSource1" 
        DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px" 
        Width="125px" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>' 
                        Width="175px"></asp:TextBox>
                    &nbsp;
                    <asp:RequiredFieldValidator class="errordisplay" ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ForeColor="Red" 
                        ToolTip="Value is Required" ControlToValidate="txtName" Display="Dynamic" 
                        ValidationGroup="MSOPERGROUP">*</asp:RequiredFieldValidator>
                        <br />
                
                
                
                    
                </InsertItemTemplate>   
            </asp:TemplateField>
            <asp:BoundField DataField="MSOCODE" HeaderText="MSOCODE" SortExpression="MSOCODE" 
                Visible="False" />
           <asp:BoundField DataField="POSITION" HeaderText="Position" SortExpression="POSITION">
            <ControlStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="DTE" HeaderText="DTE" SortExpression="DTE" 
                Visible="False" />
            <asp:BoundField DataField="USERID" HeaderText="USERID" SortExpression="USERID" 
                Visible="False" />
            <asp:CommandField ButtonType="Button" ShowInsertButton="True" ValidationGroup="MSOPERGROUP"/>
        </Fields>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>--%>
    </ContentTemplate>
    </asp:UpdatePanel>
    
    <br />

         <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NPASISConnectionString %>" 
            DeleteCommand="DELETE FROM [MSOPERLIB] WHERE [MSOCODE] = @MSOCODE AND [NAME] = @NAME" 
            InsertCommand="INSERT INTO [MSOPERLIB] ([MSOCODE], [NAME], [POSITION], [DTE], [USERID]) VALUES (@MSOCODE, @NAME, @POSITION, { fn NOW() }, @USERID)" 
            SelectCommand="SELECT * FROM [MSOPERLIB] WHERE [MSOCODE]=@MSOCODE" 
            UpdateCommand="UPDATE [MSOPERLIB] SET [NAME] = @NAME, [POSITION] = @POSITION, [DTE] = { fn NOW() }, [USERID] = @USERID WHERE [NAME] = @NAME">
            <DeleteParameters>
                <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
                <asp:Parameter Name="NAME" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="POSITION" Type="String" />
                <asp:Parameter Name="DTE" Type="DateTime" />
                <asp:SessionParameter Name="USERID" SessionField="USERID" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="POSITION" Type="String" />
                <asp:Parameter Name="DTE" Type="DateTime" />
                <asp:SessionParameter Name="USERID" SessionField="USERID" Type="String" />
                <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            </UpdateParameters> 
        </asp:SqlDataSource>--%>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NPASISConnectionString %>" 
        DeleteCommand="DELETE FROM MSOPERLIB WHERE (NAME = @NAME) AND (MSOCODE = @MSOCODE)"
        SelectCommand="SELECT * FROM [MSOPERLIB] WHERE [MSOCODE]=@MSOCODE" 
        
        UpdateCommand="UPDATE [MSOPERLIB] SET [NAME]=@NAME, [POSITION] = @POSITION, [DTE] = { fn NOW() }, [USERID] = @USERID WHERE [NAME] = @NAME AND MSOCODE = @MSOCODE">
            <DeleteParameters>
                <asp:Parameter Name="NAME" Type="String" />
                <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="POSITION" Type="String" />
                <asp:SessionParameter Name="USERID" SessionField="USERID" Type="String" />
                <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            </UpdateParameters> 
    </asp:SqlDataSource>
            

        <h6 align="center"> List of MSO Personnel </h6>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="MSOCODE" DataSourceID="SqlDataSource2" ForeColor="#333333" 
                    GridLines="None" HorizontalAlign="Center" PageSize="6">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="MSOCODE" HeaderText="Code" ReadOnly="True" 
                            SortExpression="MSOCODE" />
                        <asp:BoundField DataField="NAME" HeaderText="Name"
                            SortExpression="NAME" />
                        <asp:BoundField DataField="POSITION" HeaderText="Position" 
                            SortExpression="POSITION" />
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

