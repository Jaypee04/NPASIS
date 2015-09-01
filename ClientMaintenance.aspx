<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ClientMaintenance.aspx.cs" Inherits="ClientMaintenance" EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="App_Themes/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <script src="App_Themes/jquery-ui.min.js" type="text/javascript"></script>
    <script src="jquery-2.1.4.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True">
    </asp:ScriptManager>
    <div id="divConfMessage" runat="server" style="border-right: black thin solid; border-top: black thin solid;
        display: none; z-index: 200; border-left: black thin solid; border-bottom: black thin solid">
        <div style="background-color: #6699cc; text-align: center" id="confirmText">
        </div>
        <div style="z-index: 105; height: 2%; background-color: white; text-align: center">
        </div>
        <div style="z-index: 105; background-color: white; text-align: center">
            <asp:Button ID="btnConfOK" runat="server" Text="OK"></asp:Button>
            <asp:Button ID="btnConfCancel" runat="server" Text="Cancel"></asp:Button>
        </div>
    </div>
    <h2>Client Maintenance</h2>
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <center>
                <h6 align="center">Companies</h6>
                <div style="width:100%; overflow: scroll;">
                <asp:GridView ID="gvCompany" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MSOCODE,COCODE" ForeColor="#333333"
                    PageSize="7" TabIndex="1" Width="1200px" OnRowDataBound="gvCompany_RowDataBound"
                    OnRowCancelingEdit="gvCompany_RowCancelingEdit" OnRowCommand="gvCompany_RowCommand"
                    OnRowEditing="gvCompany_RowEditing" OnRowUpdating="gvCompany_RowUpdating"
                    OnSelectedIndexChanged="gvCompany_SelectedIndexChanged" OnPageIndexChanging="gvCompany_PageIndexChanging"
                    OnRowDeleting="gvCompany_RowDeleting" ShowFooter="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="Company Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCODESC" Text='<%# Bind("CODESC") %>' runat="server" Width="150px"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtCompanyInsert" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCompany" runat="server" Text='<%# Bind("CODESC") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sector">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlSector" runat="server" AutoPostBack="True" 
                                OnSelectedIndexChanged="ddlSector_SelectedIndexChanged" Width="130px">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlSectorInsert" runat="server" AutoPostBack="True" 
                                    OnSelectedIndexChanged="ddlSector_SelectedIndexChanged" Width="130px">
                                </asp:DropDownList>
                            </FooterTemplate>
                            
                            <ItemTemplate>
                                <asp:Label ID="lblSector" runat="server" Text='<%# Bind("SECCODE") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("ADDRESS") %>' Width="100px"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtAddressInsert" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("ADDRESS") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ZIP Code">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtZIP" runat="server" Text='<%# Bind("ZIPCD") %>' Width="100px"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtZIPInsert" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblZIP" runat="server" Text='<%# Bind("ZIPCD") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tel No">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtTelNo" runat="server" Text='<%# Bind("TELNO") %>' Width="100px"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtTelNoInsert" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblTelNo" runat="server" Text='<%# Bind("TELNO") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fax No">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtFaxNo" runat="server" Text='<%# Bind("FAXNO") %>' Width="100px"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFaxNo" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblFaxNo" runat="server" Text='<%# Bind("FAXNO") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="First Order">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtFirstOrder" runat="server" Text='<%# Bind("WHENFIRST") %>' Width="70px"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFirstInsert" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblFirstOrder" runat="server" Text='<%# Bind("WHENFIRST") %>' ></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" Width="60px" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" Width="60px" />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Button ID="btnInsert" runat="server" Text="Insert" />
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" Visible="False"
                                    Width="60px" />
                                <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" Visible="False" CssClass="btnDelete"
                                    Width="60px" />
                            </ItemTemplate>
                            <ItemStyle Width="300px" />
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
                </div>
                <h6 align="center">Client(s)</h6>
                <div style="width:100%; overflow: scroll;">
                <asp:GridView ID="gvClients" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" ForeColor="#333333" TabIndex="1" Width="1200px"
                    OnRowDataBound="gvClients_RowDataBound" OnRowDeleting="gvClients_RowDeleting"
                    OnSelectedIndexChanged="gvClients_SelectedIndexChanged" PageSize="7" 
                    onrowediting="gvClients_RowEditing" 
                    onrowcancelingedit="gvClients_RowCancelingEdit" 
                    onrowupdating="gvClients_RowUpdating" 
                    onrowcommand="gvClients_RowCommand" ShowFooter="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="First Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtFName" Text='<%# Bind("FIRSTNAME") %>' runat="server" Width="150px"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFNameInsert" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblFName" runat="server" Text='<%# Bind("FIRSTNAME") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Middle Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtMName" Text='<%# Bind("MIDDLENAME") %>' runat="server" Width="150px"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtMNameInsert" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblMName" runat="server" Text='<%# Bind("MIDDLENAME") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtLName" Text='<%# Bind("LASTNAME") %>' runat="server" Width="150px"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtLNameInsert" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblLName" runat="server" Text='<%# Bind("LASTNAME") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Position">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPosition" runat="server" Text='<%# Bind("POSITION") %>' Width="100px"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtPositionInsert" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPosition" runat="server" Text='<%# Bind("POSITION") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("ADDRESS") %>' Width="100px"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtAddressInsert" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("ADDRESS") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ZIP Code">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtZIP" runat="server" Text='<%# Bind("ZIPCD") %>' Width="100px"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtZIPInsert" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblZIP" runat="server" Text='<%# Bind("ZIPCD") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tel No">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtTelNo" runat="server" Text='<%# Bind("TELNO") %>' Width="100px"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtTelNoInsert" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblTelNo" runat="server" Text='<%# Bind("TELNO") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fax No">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtFaxNo" runat="server" Text='<%# Bind("FAXNO") %>' Width="100px"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFaxNo" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblFaxNo" runat="server" Text='<%# Bind("FAXNO") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Order">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtFirstOrder" runat="server" Text='<%# Bind("WHENLAST") %>' Width="70px"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFirstInsert" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblFirstOrder" runat="server" Text='<%# Bind("WHENLAST") %>' ></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" Width="60px" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" Width="60px" />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Button ID="btnInsert" runat="server" Text="Insert" />
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" Visible="False"
                                    Width="60px" />
                                <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" Visible="False"
                                    Width="60px" />
                            </ItemTemplate>
                            <ItemStyle Width="300px" />
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
                </div>
                <br />
                <asp:Button ID="btnBack" runat="server" Text="Back" onclick="btnBack_Click" />
                
                <br />
                <br />
            </center>
            
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
    

        $("#dialog").dialog({
   autoOpen: false,
   modal: true,
   buttons : {
        "Confirm" : function() {
            alert("You have confirmed!");            
        },
        "Cancel" : function() {
          $(this).dialog("close");
        }
      }
    });

$("#MainContent_Button1").on("click", function(e) {
    e.preventDefault();
    $("#dialog").dialog("open");
});

        }
    </script>
</asp:Content>
