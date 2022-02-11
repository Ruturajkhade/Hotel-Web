<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AdminPanel.aspx.cs" Inherits="AdminPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style301
        {
            width: 242px
        }
        .style302
        {
            font-size: large;
        }
        .fontsize
        {
            font-size:large;	
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%">
        <tr>
            <td class="style301">
                <h1>
                <br /><br />
                    <strong class="style302">Welcome Admin</strong></h1>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style301">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style301">
                <li>
                    <asp:LinkButton ID="LinkButton11" runat="server" OnClick="LinkButton11_Click" CssClass="fontsize">Add Category</asp:LinkButton></li>
            </td>
            <td>
                <li>
                    <asp:LinkButton ID="LinkButton12" runat="server" OnClick="LinkButton12_Click" CssClass="fontsize">Add Sub Category</asp:LinkButton></li>
            </td>
        </tr>
        <tr>
            <td class="style301">
                <li>
                    <asp:LinkButton ID="LinkButton13" runat="server" OnClick="LinkButton13_Click" CssClass="fontsize">Add New Room</asp:LinkButton></li>
            </td>
            <td class="style304">
                <li>
                    <asp:LinkButton ID="LinkButton14" runat="server" OnClick="LinkButton14_Click" CssClass="fontsize">Add Room Pictures</asp:LinkButton></li>
            </td>
        </tr>
        <tr>
            <td class="style301" colspan="2">
                <li>
                    <asp:LinkButton ID="LinkButton16" runat="server" OnClick="LinkButton16_Click" CssClass="fontsize">Update SubCategory</asp:LinkButton></li>
            </td>
        </tr>
        <tr>
            <td class="style301">
                <li>
                    <asp:LinkButton ID="LinkButton18" runat="server" OnClick="LinkButton18_Click" CssClass="fontsize">Update Room</asp:LinkButton></li>
            </td>
            <td class="style306">
                <li>
                    <asp:LinkButton ID="LinkButton20" runat="server" OnClick="LinkButton20_Click" CssClass="fontsize">View Orders</asp:LinkButton>
                </li>
            </td>
        </tr>
    </table>
</asp:Content>

