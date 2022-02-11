<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="row justify-content-center" style="padding-top:15px; padding-bottom:15px;">
                    <asp:Label ID="Label30" runat="server" Text="Select Payment Method" CssClass="detailsorder"></asp:Label>
                </div>
                <div class="row justify-content-center">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table class="table" style="width:100%;">
                                <tr>
                                    <td>
                                        <asp:RadioButton ID="RadioButton1" runat="server" AutoPostBack="True" 
                                            oncheckedchanged="RadioButton1_CheckedChanged" GroupName="Payment" 
                                            CssClass="rounded-circle" Height="40px" Width="40px" /><asp:Label ID="Label21" runat="server" Text="Cod" ></asp:Label>
                                    </td>
                                    <td>
                                        <asp:RadioButton ID="RadioButton2" runat="server" AutoPostBack="True" 
                                            GroupName="Payment" oncheckedchanged="RadioButton2_CheckedChanged"  /><asp:Label ID="Label20" runat="server" Text="Debit Card"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Panel2" runat="server" Width="500px" CssClass="justify-content-center">
                                <asp:Label ID="Label22" runat="server" CssClass="subtitle" Text="Proceed To place Order...."></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Panel3" runat="server" Width="500px">
                            
                                 <table class="table table-hover" style="width:100%;">
                                <tr align="center">
                                    <div class="form-group">
                                    <td colspan="2">
                                        <asp:Label ID="Label23" runat="server" CssClass="detailsorder" Text="Enter Your Card Details"></asp:Label>
                                    </td>
                                    </div>
                                </tr>
                                <tr>
                                    <div class="form-group">
                                    <td>
                                        <asp:Label ID="Label24" runat="server" Text="Acc Holder Name"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox7" runat="server" TextMode="SingleLine" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    </div>
                                </tr>
                                <tr>
                                    <div class="form-group">
                                    <td>
                                        <asp:Label ID="Label25" runat="server" Text="Card Number"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox8" runat="server"  TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    </div>
                                </tr>
                                <tr>
                                    <div class="form-group">
                                    <td>
                                        <asp:Label ID="Label26" runat="server" Text="CVV NO."></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox9" runat="server" TextMode="SingleLine" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    </div>
                                </tr>
                                <tr align="center">
                                    <div class="form-group">
                                    <td colspan="2">
                                        <asp:Label ID="Label29" runat="server" Text="Enter Expiry Date of card"></asp:Label>
                                    </td>
                                    </div>
                                </tr>
                                <tr>
                                    <div class="form-group">
                                    <td align="center">
                                        <asp:Label ID="Label27" runat="server" Text=" Month"></asp:Label>
                                        <asp:DropDownList ID="DropDownList4" runat="server">
                                            <asp:ListItem> 1</asp:ListItem>
                                            <asp:ListItem> 2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                            <asp:ListItem>7</asp:ListItem>
                                            <asp:ListItem>8</asp:ListItem>
                                            <asp:ListItem>9</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                            <asp:ListItem>11</asp:ListItem>
                                            <asp:ListItem>12</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td align="center">
                                        <asp:Label ID="Label28" runat="server" Text="Year"></asp:Label>
                                        <asp:DropDownList ID="DropDownList5" runat="server">
                                            <asp:ListItem>2020</asp:ListItem>
                                            <asp:ListItem>2021</asp:ListItem>
                                            <asp:ListItem>2022</asp:ListItem>
                                            <asp:ListItem>2023</asp:ListItem>
                                            <asp:ListItem>2024</asp:ListItem>
                                            <asp:ListItem>2025</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    </div>
                                </tr>
                                <tr>
                                    <div class="form-group">
                                    <td colspan="2" align="center">
                                        <asp:Button ID="Button4" runat="server" Text="Pay Now.." Height="35px" CssClass="btn btn-success border-dark form-control" Font-Size="Large" />
                                    </td>
                                    </div>
                                </tr>
                            </table>
                            </asp:Panel>
                            </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
    </div>
</asp:Content>

