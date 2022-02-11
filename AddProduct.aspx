<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="AddProduct" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 155px;
        }
        .style4
        {
            height: 23px;
        }
        .style6
        {
            height: 26px;
        }
        .style8
        {
            width: 260px;
            height: 26px;
            font-family: Calibri;
            font-weight: bold;
        }
        .style9
        {
            width: 260px;
            height: 23px;
            font-weight: bold;
        }
        .style301
        {
            width: 260px;
        }
        .style302
        {
            font-size: large;
        }
        .style303
        {
            font-size: x-large;
        }
        .style304
        {
            width: 260px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="style302">
        <strong class="style303">Add Products</strong><asp:ScriptManager ID="ScriptManager1"
            runat="server">
        </asp:ScriptManager>
    </h1>
    <table align="center" class="style1">
        <tr>
            <td class="style304">
                Product Name
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style304">
                Choose Category
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                    DataTextField="CatName" DataValueField="CatID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>"
                    SelectCommand="SELECT [CatName], [CatID] FROM [addcat]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style304">
                Choose SubCategory
            </td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2"
                    DataTextField="SubCatName" DataValueField="SubCatID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>"
                    SelectCommand="SELECT [SubCatID], [SubCatName], [CatID] FROM [addsubcat] WHERE ([CatID] = @CatID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="CatID" PropertyName="SelectedValue"
                            Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <%--<tr>
            <td class="style304">
                Choose Brand
            </td>
            <td>
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3"
                    DataTextField="BName" DataValueField="BID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>"
                    SelectCommand="SELECT [BID], [BName] FROM [brand]"></asp:SqlDataSource>
            </td>
        </tr>--%>
        <tr>
            <td class="style304">
                Rate
            </td>
            <td>
                Rs.<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="TextBox2_FilteredTextBoxExtender" runat="server"
                    Enabled="True" FilterType="Numbers" TargetControlID="TextBox2">
                </asp:FilteredTextBoxExtender>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Discount(in Percent)
            </td>
            <td class="style6">
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="TextBox4_FilteredTextBoxExtender" runat="server"
                    Enabled="True" FilterType="Numbers" TargetControlID="TextBox4">
                </asp:FilteredTextBoxExtender>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Description
            </td>
            <td class="style6">
                <div style="height: 360">
                <cc1:Editor ID="Editor1" runat="server" Height="350px" /></div>
            </td>
        </tr>
        <tr>
            <td class="style9">
                Product Picture
            </td>
            <td class="style4">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style9">
                Max Person in room
            </td>
            <td class="style4">
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style9">
                Min Person in room
            </td>
            <td class="style4">
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style301">
                &nbsp;
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Product" />
                &emsp;&emsp;
                <asp:Button ID="Button2" runat="server" Text="Back" PostBackUrl="~/Adm_Room.aspx" />
            </td>
        </tr>
    </table>    
</asp:Content>