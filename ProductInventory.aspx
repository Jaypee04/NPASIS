<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductInventory.aspx.cs" Inherits="ProductInventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style16
        {
            width: 30px;
        }
        .style17
        {
            width: 92px;
            height: 20px;
        }
        .style18
        {
            width: 30px;
            height: 20px;
        }
        .style19
        {
            height: 20px;
        }
        .style20
        {
            height: 20px;
            width: 288px;
        }
        .style21
        {
            height: 20px;
            width: 372px;
        }
        .style22
        {
            width: 30px;
            height: 21px;
        }
        .style23
        {
            height: 21px;
        }
        .style24
        {
            height: 20px;
            width: 107px;
        }
        .style25
        {
            height: 20px;
            width: 11px;
        }
        .style26
        {
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style22">
                </td>
            <td colspan="6" class="style23">
                <b>PRODUCT INVENTORY MAINTENANCE</b></td>
            <td class="style23">
                </td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
            </td>
            <td class="style17">
                Product Type</td>
            <td class="style20">
                <asp:Label ID="LabelType" runat="server" CssClass="style26" Text="Label"></asp:Label>
            </td>
            <td class="style19">
            </td>
            <td class="style24">
                Sheet No. / Code</td>
            <td class="style21">
                <asp:Label ID="LabelCode" runat="server" CssClass="style26" Text="Label"></asp:Label>
            </td>
            <td class="style25">
            </td>
            <td class="style19">
            </td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td class="style17">
                Description</td>
            <td class="style20">
                <asp:Label ID="LabelDesc" runat="server" CssClass="style26" Text="Label"></asp:Label>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style24">
                Scale</td>
            <td class="style21">
                <asp:Label ID="LabelScale" runat="server" CssClass="style26" Text="Label"></asp:Label>
            </td>
            <td class="style25">
                &nbsp;</td>
            <td class="style19">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
            <td class="style20">
                &nbsp;</td>
            <td class="style19">
                &nbsp;</td>
            <td class="style24">
                &nbsp;</td>
            <td class="style21">
                &nbsp;</td>
            <td class="style25">
                &nbsp;</td>
            <td class="style19">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td class="style17">
                Effectivity Date</td>
            <td class="style20">
                <asp:TextBox ID="TextBox5" runat="server" Width="251px"></asp:TextBox>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style24">
                Date</td>
            <td class="style21">
                <asp:TextBox ID="TextBox7" runat="server" Width="236px"></asp:TextBox>
            </td>
            <td class="style25">
                &nbsp;</td>
            <td class="style19">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td class="style17">
                Count</td>
            <td class="style20">
                <asp:TextBox ID="TextBox6" runat="server" Width="248px"></asp:TextBox>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style24">
                By</td>
            <td class="style21">
                <asp:TextBox ID="TextBox8" runat="server" Width="234px"></asp:TextBox>
            </td>
            <td class="style25">
                &nbsp;</td>
            <td class="style19">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td colspan="6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

