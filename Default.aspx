<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <p align="left"     
        style="background-image: url('adminSysBackground.jpg'); background-repeat: no-repeat; background-attachment: scroll; background-position: center center; height: 342px;"> 
<%--        <br/> <br/> <strong>NAMRIA QUALITY POLICY</strong> <br/> <br/> 
        we at NAMRIA are committed to our clients&#39; utmost satisfaction <br/>
        by providing accurate and realiable geospatial information <br/> <br/>
        We will uphold proffessional and ethical standards, <br/>
        ensure  efficient utilization of resources, <br/>
        empower our employees to continually improve our <br/> 
        quality management system and respond to the needs or our <br/>
        changing time through world-class technology. <br/><br/>
        <em>Mapping the future through ISO</em>--%>

        </p>

        <div align="center">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Small" 
                Text="Department of Environment and Natural Resources"></asp:Label> <br/>
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="x-Small" 
                Text="National Mapping Resource Information Authority"></asp:Label> <br/>
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="x-Small" 
                Text="Systems Development and Programming Division"></asp:Label> <br/><br/>

            <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="x-Small">Download NPASIS Manual</asp:HyperLink> <br/>
        </div> 
</asp:Content>

