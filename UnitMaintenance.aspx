<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UnitMaintenance.aspx.cs" Inherits="UnitMaintenance" EnableEventValidation="false"%>

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
    <h2>Unit Maintenance</h2>
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <center>
                <h6 align="center">Unit Library</h6>
                
                <asp:GridView ID="gvUnitLib" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UNITCODE" ForeColor="#333333"
                    PageSize="7" TabIndex="1" Width="720px" OnRowDataBound="gvUnitLib_RowDataBound"
                    OnRowCancelingEdit="gvUnitLib_RowCancelingEdit" OnRowCommand="gvUnitLib_RowCommand"
                    OnRowEditing="gvUnitLib_RowEditing" OnRowUpdating="gvUnitLib_RowUpdating"
                    OnSelectedIndexChanged="gvUnitLib_SelectedIndexChanged" OnPageIndexChanging="gvUnitLib_PageIndexChanging"
                    OnRowDeleting="gvUnitLib_RowDeleting" ShowFooter="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="Unit Code">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtUnitCode" Text='<%# Bind("UNITCODE") %>' runat="server" Width="70px"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtUnitCodeInsert" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblUnitCode" runat="server" Text='<%# Bind("UNITCODE") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("UNITDESCRIPTION") %>' Width="120px"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtDescriptionInsert" runat="server"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("UNITDESCRIPTION") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Unit Type">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtType" runat="server" Text='<%# Bind("UNITTYPE") %>' Width="50px"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtTypeInsert" runat="server" ></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblType" runat="server" Text='<%# Bind("UNITTYPE") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="80px" />
                        </asp:TemplateField>
                        
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" Width="60px" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" Width="60px" />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Button ID="btnInsert" runat="server" onclick="btnInsert_Click" 
                                    Text="Insert" />
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" Visible="False"
                                    Width="60px" />
                                <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" Visible="False" CssClass="btnDelete"
                                    Width="60px" />
                            </ItemTemplate>
                            <ItemStyle Width="150px" />
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