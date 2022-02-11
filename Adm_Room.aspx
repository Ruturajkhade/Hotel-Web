<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Adm_Room.aspx.cs" Inherits="Adm_Room" %>

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
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style301">
                <li>
                    <asp:LinkButton ID="LinkButton11" runat="server" CssClass="fontsize" PostBackUrl="~/AddProduct.aspx">Add New Room</asp:LinkButton></li>
            </td>
            <td class="style301">
                <li>
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="fontsize" PostBackUrl="~/UpdateProduct.aspx">Edit Room</asp:LinkButton></li>
            </td>
        </tr>
    </table>
</asp:Content>

