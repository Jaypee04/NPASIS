<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="CompanyMaintenance.aspx.vb" Inherits="CompanyMaintenance" MaintainScrollPositionOnPostback="True"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<asp:ScriptManager ID="ScriptManager1" runat="server">  </asp:ScriptManager>

    <h2> Company Information </h2>
    <br />
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <center>
    <table style = "background-color :#2461BF;" cellpadding = "4" cellspacing = "0">
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblName" runat="server" Text="Company Name" ForeColor = "#333333" Font-Bold = "True" ></asp:Label></td>
            <%--<td style = "background-color :#D1DDF1;"><asp:Label ID="Label1" runat="server" Text=":" ForeColor = "#333333" Font-Bold = "True" ></asp:Label></td>--%>
            <td style = "background-color :#2461BF;"><asp:TextBox ID="txtName" runat="server" 
                    Width="500px" Enabled="False"></asp:TextBox></td>
            <td style = "background-color :#2461BF;"><asp:Label ID="lblAsterisk" runat="server" 
                    Text=" *&nbsp;&nbsp;" ForeColor = "Red" Font-Bold = "True" Visible="False" ToolTip ="Value is Required"></asp:Label></td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblAddress" runat="server" Text="Address"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            <%--<td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="Label2" runat="server" Text=":" ForeColor = "#333333" Font-Bold = "True" ></asp:Label></td>--%>
            <td class="style16"><asp:TextBox ID="txtAddress" runat="server" Width="435px" 
                    TextMode="MultiLine" Enabled="False"></asp:TextBox></td>
            <td style = "background-color :#2461BF;">
                <asp:Label ID="lblAsterisk1" runat="server" 
                    Text=" *&nbsp;&nbsp;" ForeColor = "Red" Font-Bold = "True" Visible="False" 
                    ToolTip ="Value is Required"></asp:Label></td>
        </tr>
        <tr align ="left">
            <td  style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblZip" runat="server" Text="Zip Code"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            <%--<td  style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="Label3" runat="server" Text=":" ForeColor = "#333333" Font-Bold = "True" ></asp:Label></td>--%>
            <td><asp:TextBox ID="txtZipCode" runat="server" Width="102px" MaxLength="8" 
                    Enabled="False"></asp:TextBox> &nbsp;&nbsp;
                <asp:Label ID="lblError" runat="server" 
                    Text="Please enter numeric values only." ForeColor = "Red" Font-Bold = "True" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblTel" runat="server" Text="Telephone Number"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            <%--<td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="Label4" runat="server" Text=":" ForeColor = "#333333" Font-Bold = "True" ></asp:Label></td>--%>
            <td><asp:TextBox ID="txtTel" runat="server" Width="245px" MaxLength="30" 
                    Enabled="False"></asp:TextBox></td>
            <td style = "background-color :#2461BF;"><asp:Label ID="lblAsterisk2" runat="server" 
                    Text=" *&nbsp;&nbsp;" ForeColor = "Red" Font-Bold = "True" Visible="False" 
                    ToolTip ="Value is Required"></asp:Label></td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblFax" runat="server" Text="Fax Number"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            <%--<td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="Label5" runat="server" Text=":" ForeColor = "#333333" Font-Bold = "True" ></asp:Label></td>--%>
            <td><asp:TextBox ID="txtFax" runat="server" Width="245px" 
                    MaxLength="30" Enabled="False"></asp:TextBox></td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblSector" runat="server" Text="Sector"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            <%--<td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="Label6" runat="server" Text=":" ForeColor = "#333333" Font-Bold = "True" ></asp:Label></td>--%>
            <td><asp:DropDownList ID="drpdwnlstSector" runat="server" 
                    DataSourceID="SqlDataSourceSector" DataTextField="SECDESC" 
                    DataValueField="SECCODE" Height="24px" Width="251px" Enabled="False">
                </asp:DropDownList> </td>
        </tr>
         <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="lblOrder" runat="server" Text="First Order (mm/yyyy)"  ForeColor = "#333333" Font-Bold = "True"></asp:Label></td>
            <%--<td style = "background-color :#D1DDF1; border-color :#D1DDF1;"><asp:Label ID="Label7" runat="server" Text=":" ForeColor = "#333333" Font-Bold = "True" ></asp:Label></td>--%>
            <td><asp:TextBox ID="txtFirstOrder" runat="server" Width="102px" 
                    MaxLength="7" Enabled="False"></asp:TextBox></td>
        </tr>
        <tr align ="left">
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;">
                <asp:Label ID="lblCode" runat="server" Text="CODE" Visible = "False" ></asp:Label> </td>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;">
                <asp:Button ID="btnAdd" runat="server" Text="ADD" Height="25px" Width="78px" />
                <asp:Button ID="btnSave" runat="server" Text="SAVE" Height="25px" Width="78px" 
                    Visible="False"/>
                <asp:Button ID="btnEdit" runat="server" Text="EDIT" Height="25px" Width="78px"/>
                <asp:Button ID="btnUpdate" runat="server" Text="UPDATE" Height="25px" 
                    Width="78px" Visible="False"/>
                <asp:Button ID="btnDelete" runat="server" Text="DELETE" Height="25px" Width="78px"/></td>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"></td>
        </tr>
        <%--<tr>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"></td>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;">&nbsp;</td>
            <td style = "background-color :#D1DDF1; border-color :#D1DDF1;"></td>
        </tr>--%>
    </table>
    </center>
    </ContentTemplate>
    </asp:UpdatePanel>
    
<%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        CellPadding="4" DataKeyNames="TYPE" DataSourceID="SqlDataSourceInformation" 
        DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px" 
        Width="650px" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:TemplateField HeaderText="Company Name" SortExpression="CODESC">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("CODESC") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="txtCompany" runat="server" Text='<%# Bind("CODESC") %>' 
                        Width="480px" MaxLength="100" ToolTip="Company Name"></asp:TextBox> &nbsp;
                    <asp:RequiredFieldValidator class="errordisplay" ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ForeColor="Red" 
                        ToolTip="Value is Required" ControlToValidate="txtCompany" Display="Dynamic" 
                        ValidationGroup="CompanyGroup">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span ID="idControl">DetailsView2</span> - Field[0] - CODESC
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ADDRESS" HeaderText="Address" 
                SortExpression="ADDRESS">
            <ControlStyle Width="480px"/>
            </asp:BoundField>
            <asp:BoundField DataField="ZIPCD" HeaderText="Zip Code" 
                SortExpression="ZIPCD">
            <ControlStyle Width="100px"/>
            </asp:BoundField>
            <asp:BoundField DataField="TELNO" HeaderText="Telephone Number" 
                SortExpression="TELNO">
            <ControlStyle Width="150px"/>
            </asp:BoundField>
            <asp:BoundField DataField="FAXNO" HeaderText="Fax Number" 
                SortExpression="FAXNO">
            <ControlStyle Width="150px"/>
            </asp:BoundField>
            <asp:BoundField DataField="SECCODE" HeaderText="Sector" 
                SortExpression="SECCODE">
            <ControlStyle Width="150px"/>
            </asp:BoundField>
            <asp:BoundField DataField="DTE" HeaderText="DTE" SortExpression="DTE" 
                Visible="False" />
            <asp:BoundField DataField="USERID" HeaderText="USERID" SortExpression="USERID" 
                Visible="False" />
            <asp:CommandField ButtonType="Button" ShowInsertButton="True" 
                ValidationGroup="CompanyGroup" />
            <asp:CommandField ButtonType="Button" ShowEditButton="True" />
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
        </Fields>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
    </ContentTemplate>
    </asp:UpdatePanel>--%>

    <asp:SqlDataSource ID="SqlDataSourceInformation" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NPASISConnectionString %>" 
        SelectCommand="SELECT * FROM [COMPANYLIB]"> 
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceSector" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NPASISConnectionString %>" 
        SelectCommand="SELECT [SECCODE], [SECDESC] FROM [SECTORLIB]">
    </asp:SqlDataSource>
</asp:Content>