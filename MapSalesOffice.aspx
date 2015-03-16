<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MapSalesOffice.aspx.vb" Inherits="MapSalesOffice" MaintainScrollPositionOnPostback="True"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style16
        {
            width: 77px;
        }
        .style17
        {
            width: 99px;
        }
        .style18
        {
            width: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<asp:ScriptManager ID="ScriptManager1" runat="server">  </asp:ScriptManager>
    
    <h2> Map Sales Office</h2>
    
    <h6 align="center">Add New Map Sales Office </h6>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
    <center>
    <table style = "background-color :#2461BF;" width="500px" cellpadding = "4" cellspacing = "0">
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style17"><asp:Label ID="lblMSOCODE" runat="server" Text="Code" ForeColor = "#333333" Font-Bold = "True" ></asp:Label></td>
            <%--<td style = "background-color :#D1DDF1;"><asp:Label ID="Label1" runat="server" Text=":" ForeColor = "#333333" Font-Bold = "True" ></asp:Label></td>--%>
            <td style = "background-color :#2461BF;">
                <asp:TextBox ID="txtCode" runat="server" 
                    Width="71px" Enabled="False" MaxLength="6" TabIndex="1"></asp:TextBox></td>
            <td style = "background-color :#2461BF;" class="style18"><asp:Label ID="lblAsterisk" runat="server" 
                    Text=" *&nbsp;&nbsp;" ForeColor = "Red" Font-Bold = "True" Visible="False" ToolTip ="Value is Required"></asp:Label></td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style17"><asp:Label ID="lblName" runat="server" Text="Description" ForeColor = "#333333" Font-Bold = "True" ></asp:Label></td>
            <%--<td style = "background-color :#D1DDF1;"><asp:Label ID="Label1" runat="server" Text=":" ForeColor = "#333333" Font-Bold = "True" ></asp:Label></td>--%>
            <td style = "background-color :#2461BF;">
                <asp:TextBox ID="txtName" runat="server" 
                    Width="348px" Enabled="False" TabIndex="2"></asp:TextBox></td>
            <td style = "background-color :#2461BF;" class="style18"><asp:Label ID="lblAsterisk0" runat="server" 
                    Text=" *&nbsp;&nbsp;" ForeColor = "Red" Font-Bold = "True" Visible="False" ToolTip ="Value is Required"></asp:Label></td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style17"><asp:Label ID="lblAddress" runat="server" Text="Address"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            <%--<td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="Label2" runat="server" Text=":" ForeColor = "#333333" Font-Bold = "True" ></asp:Label></td>--%>
            <td class="style16">
                <asp:TextBox ID="txtAddress" runat="server" Width="348px" 
                    TextMode="MultiLine" Enabled="False" TabIndex="3"></asp:TextBox></td>
            <td style = "background-color :#2461BF;" class="style18">
                <asp:Label ID="lblAsterisk1" runat="server" 
                    Text=" *&nbsp;&nbsp;" ForeColor = "Red" Font-Bold = "True" Visible="False" 
                    ToolTip ="Value is Required"></asp:Label></td>
        </tr>
        <tr align ="left">
            <td  style = "background-color :#D1DDF1; border-color :#D1DDF1;" 
                class="style17"><asp:Label ID="lblZip" runat="server" Text="Zip Code"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            <%--<td  style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="Label3" runat="server" Text=":" ForeColor = "#333333" Font-Bold = "True" ></asp:Label></td>--%>
            <td><asp:TextBox ID="txtZipCode" runat="server" Width="102px" MaxLength="8" 
                    Enabled="False" TabIndex="4"></asp:TextBox> &nbsp;&nbsp;
                <asp:Label ID="lblError" runat="server" 
                    Text="Please enter numeric values only." ForeColor = "Red" Font-Bold = "True" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style17"><asp:Label ID="lblTel" runat="server" Text="Telephone Number"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            <%--<td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="Label4" runat="server" Text=":" ForeColor = "#333333" Font-Bold = "True" ></asp:Label></td>--%>
            <td><asp:TextBox ID="txtTel" runat="server" Width="245px" MaxLength="30" 
                    Enabled="False" TabIndex="5"></asp:TextBox></td>
            <td style = "background-color :#2461BF;" class="style18"><asp:Label ID="lblAsterisk2" runat="server" 
                    Text=" *&nbsp;&nbsp;" ForeColor = "Red" Font-Bold = "True" Visible="False" 
                    ToolTip ="Value is Required"></asp:Label></td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style17"><asp:Label ID="lblFax" runat="server" Text="Fax Number"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            <%--<td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="Label5" runat="server" Text=":" ForeColor = "#333333" Font-Bold = "True" ></asp:Label></td>--%>
            <td><asp:TextBox ID="txtFax" runat="server" Width="245px" 
                    MaxLength="30" Enabled="False" TabIndex="6"></asp:TextBox></td>
            <td style = "background-color :#2461BF;" class="style18"></td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style17">
                &nbsp;</td>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;">
                <asp:Button ID="btnAdd" runat="server" Text="ADD" Height="25px" Width="78px" />
                <asp:Button ID="btnSave" runat="server" Text="SAVE" Height="25px" Width="78px" 
                    Visible="False"/>
                <asp:Button ID="btnCancel" runat="server" Text="CANCEL" Height="25px" 
                    Width="78px" Visible="False"/>
                </td>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style18"></td>
        </tr>
        <%--<tr>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style17"></td>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;">&nbsp;</td>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;" class="style18"></td>
        </tr>--%>
    </table>
    </center>
    <%--<asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
        CellPadding="4" DataKeyNames="MSOCODE" DataSourceID="SqlDataSource1" 
        DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px" 
        Width="500px" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:TemplateField HeaderText="CODE" SortExpression="MSOCODE">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("MSOCODE") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="txtCode" runat="server" Text='<%# Bind("MSOCODE") %>' 
                        Width="80px" MaxLength="6" ToolTip="Max length is 6"></asp:TextBox>
                    &nbsp;
                    <asp:RequiredFieldValidator class="errordisplay" ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ForeColor="Red" 
                        ToolTip="Value is Required" ControlToValidate="txtCode" Display="Dynamic" 
                        ValidationGroup="MSOGroup">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span ID="idControl">DetailsView2</span> - Field[0] - MSOCODE
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MSODESC" HeaderText="Description" SortExpression="MSODESC">
            <ControlStyle Width="350px" />
            </asp:BoundField>
             <asp:BoundField DataField="ADDRESS" HeaderText="Address" SortExpression="ADDRESS">
            <ControlStyle Width="350px" />
            </asp:BoundField>
             <asp:BoundField DataField="ZIPCD" HeaderText="ZIP Code" SortExpression="ZIPCD">
            <ControlStyle Width="100px" />
            </asp:BoundField>
             <asp:BoundField DataField="TELNO" HeaderText="Telephone Number" SortExpression="TELNO">
            <ControlStyle Width="150px" />
            </asp:BoundField>
             <asp:BoundField DataField="FAXNO" HeaderText="Fax Number" SortExpression="FAXNO">
            <ControlStyle Width="150px" />
            </asp:BoundField>
            <asp:BoundField DataField="DTE" HeaderText="DTE" SortExpression="DTE" 
                Visible="False" />
            <asp:BoundField DataField="USERID" HeaderText="USERID" SortExpression="USERID" 
                Visible="False" />
            <asp:CommandField ButtonType="Button" ShowInsertButton="True" 
                ValidationGroup="MSOGroup" ShowDeleteButton="True" />
        </Fields>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>--%>
    </ContentTemplate>
    </asp:UpdatePanel>
    
    <br />

         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NPASISConnectionString %>" 
            DeleteCommand="DELETE FROM [MSOLIB] WHERE [MSOCODE] = @MSOCODE" 
            InsertCommand="INSERT INTO [MSOLIB] ([MSOCODE], [MSODESC], [ADDRESS], [ZIPCD], [TELNO], [FAXNO], [DTE], [USERID]) VALUES (@MSOCODE, @MSODESC, @ADDRESS, @ZIPCD, @TELNO, @FAXNO, { fn NOW() }, @USERID)" 
            SelectCommand="SELECT * FROM [MSOLIB] WHERE [MSOCODE]=@MSOCODE" 
            UpdateCommand="UPDATE [MSOLIB] SET [MSODESC] = @MSODESC, [ADDRESS] = @ADDRESS, [ZIPCD] = @ZIPCD, [TELNO] = @TELNO, [FAXNO] = @FAXNO, [DTE] = { fn NOW() }, [USERID] = @USERID WHERE [MSOCODE] = @MSOCODE">
            <DeleteParameters>
                <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
                <asp:Parameter Name="MSODESC" Type="String" />
                <asp:Parameter Name="ADDRESS" Type="String" />
                <asp:Parameter Name="ZIPCD" Type="String" />
                <asp:Parameter Name="TELNO" Type="String" />
                <asp:Parameter Name="FAXNO" Type="String" />
                <asp:Parameter Name="DTE" Type="DateTime" />
                <asp:SessionParameter Name="USERID" SessionField="USERID" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="MSODESC" Type="String" />
                <asp:Parameter Name="ADDRESS" Type="String" />
                <asp:Parameter Name="ZIPCD" Type="String" />
                <asp:Parameter Name="TELNO" Type="String" />
                <asp:Parameter Name="FAXNO" Type="String" />
                <asp:Parameter Name="DTE" Type="DateTime" />
                <asp:SessionParameter Name="USERID" SessionField="USERID" Type="String" />
            </UpdateParameters> 
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NPASISConnectionString %>" 
            DeleteCommand="DELETE FROM [MSOLIB] WHERE [MSOCODE] = @MSOCODE" 
            InsertCommand="INSERT INTO [MSOLIB] ([MSOCODE], [MSODESC], [ADDRESS], [ZIPCD], [TELNO], [FAXNO], [DTE], [USERID]) VALUES (@MSOCODE, @MSODESC, @ADDRESS, @ZIPCD, @TELNO, @FAXNO, { fn NOW() }, @USERID)" 
            SelectCommand="SELECT * FROM [MSOLIB] WHERE [MSOCODE]=@MSOCODE" 
            UpdateCommand="UPDATE [MSOLIB] SET [MSODESC] = @MSODESC, [ADDRESS] = @ADDRESS, [ZIPCD] = @ZIPCD, [TELNO] = @TELNO, [FAXNO] = @FAXNO, [DTE] = { fn NOW() }, [USERID] = @USERID WHERE [MSOCODE] = @MSOCODE">
            <DeleteParameters>
                <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
                <asp:Parameter Name="MSODESC" Type="String" />
                <asp:Parameter Name="ADDRESS" Type="String" />
                <asp:Parameter Name="ZIPCD" Type="String" />
                <asp:Parameter Name="TELNO" Type="String" />
                <asp:Parameter Name="FAXNO" Type="String" />
                <asp:Parameter Name="DTE" Type="DateTime" />
                <asp:SessionParameter Name="USERID" SessionField="USERID" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="MSOCODE" SessionField="MSOCODE" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="MSODESC" Type="String" />
                <asp:Parameter Name="ADDRESS" Type="String" />
                <asp:Parameter Name="ZIPCD" Type="String" />
                <asp:Parameter Name="TELNO" Type="String" />
                <asp:Parameter Name="FAXNO" Type="String" />
                <asp:Parameter Name="DTE" Type="DateTime" />
                <asp:SessionParameter Name="USERID" SessionField="USERID" Type="String" />
            </UpdateParameters> 
        </asp:SqlDataSource>
            

        <h6 align="center"> List of Map Sales Office </h6>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="MSOCODE" DataSourceID="SqlDataSource2" ForeColor="#333333" 
                    GridLines="None" HorizontalAlign="Center" PageSize="6" Width ="930px" 
                    Font-Size="XX-Small">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="MSOCODE" HeaderText="CODE" ReadOnly="True" 
                            SortExpression="MSOCODE"/>
                        <asp:BoundField DataField="MSODESC" HeaderText="DESCRIPTION" 
                            SortExpression="MSODESC"/>
                        <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" 
                            SortExpression="ADDRESS"/>
                             <asp:BoundField DataField="ZIPCD" HeaderText="ZIP CODE" 
                            SortExpression="ZIPCD"/>
                             <asp:BoundField DataField="TELNO" HeaderText="TEL NO" 
                            SortExpression="TELNO"/>
                             <asp:BoundField DataField="FAXNO" HeaderText="FAX NO" 
                            SortExpression="FAXNO"/>
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

