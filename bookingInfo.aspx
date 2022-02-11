<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true"
    CodeFile="bookingInfo.aspx.cs" Inherits="CheckAvail" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="colorlib-blog">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="aside animate-box">
                        <h3>
                            Search Room</h3>
                        <div class="colorlib-form">
                            <hr />
                            <div class="row">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                                        CellPadding="4" ForeColor="Black" GridLines="Vertical" OnRowCommand="GridView1_RowCommand"
                                        OnRowCreated="GridView1_RowCreated">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField ItemStyle-Width="150px" DataField="RoomNo" HeaderText="Room No">
                                                <ItemStyle Width="150px"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField ItemStyle-Width="150px" DataField="dtStart" HeaderText="Book From">
                                                <ItemStyle Width="150px"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField ItemStyle-Width="150px" DataField="dtEnd" HeaderText="Book Till">
                                                <ItemStyle Width="150px"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField ItemStyle-Width="150px" DataField="RoomPrice" HeaderText="Amount">
                                                <ItemStyle Width="150px"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField ItemStyle-Width="150px" DataField="CheckIn" HeaderText="Check-In">
                                                <ItemStyle Width="150px"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField ItemStyle-Width="150px" DataField="RoomStatus" HeaderText="Booking Status">
                                                <ItemStyle Width="150px"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField ItemStyle-Width="150px" DataField="PayStatus" HeaderText="Payment Status">
                                                <ItemStyle Width="150px"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField ItemStyle-Width="150px" DataField="CustomerName" HeaderText="Customer Name">
                                                <ItemStyle Width="150px"></ItemStyle>
                                            </asp:BoundField>                                            
                                        </Columns>
                                        <FooterStyle BackColor="#CCCC99" />
                                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                        <RowStyle BackColor="#F7F7DE" />
                                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                        <SortedAscendingHeaderStyle BackColor="#848384" />
                                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                        <SortedDescendingHeaderStyle BackColor="#575357" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
