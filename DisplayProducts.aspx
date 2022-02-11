<%@ Page Title="" Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" CodeFile="DisplayProducts.aspx.cs" Inherits="DisplayProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<asp:DataList ID="DataList11" runat="server" DataKeyField="productid" DataSourceID="SqlDataSource1"
                    RepeatColumns="4" Width="100%">
                    <ItemTemplate>
                        <table align="center" cellpadding="0" cellspacing="1" width="300px">
                            <table align="center" class="style2">
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImageButton1" runat="server" Height="308px" ImageUrl='<%# Eval("productimage", "uploads/{0}") %>'
                                            PostBackUrl='<%# Eval("productid", "detailsp.aspx?pid={0}") %>' Width="229px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:LinkButton ID="LinkButton11" runat="server" Font-Underline="False" PostBackUrl='<%# Eval("productid", "detailsp.aspx?pid={0}") %>'
                                            Text='<%# Eval("productname") %>' Font-Bold="True" Font-Strikeout="False" Font-Size="Small"></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td>
                                        <span class="style7"><strong>Rs.</strong></span>
                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Black"
                                            Text='<%# Eval("rate") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                    </ItemTemplate>
                </asp:DataList>--%>
                

    <div id="colorlib-rooms" class="colorlib-light-grey">
			<div class="container">
                <asp:DataList ID="DataList1" runat="server" CssClass="row" DataKeyField="productid" DataSourceID="SqlDataSource1"
                    RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <ItemTemplate>
					    <div class="col-md-4 room-wrap animate-box">
						    <asp:ImageButton ID="ImageButton1" class="room image-popup-link" runat="server" ImageUrl='<%# Eval("productimage", "uploads/{0}") %>'/>
							<div class="desc text-center">
								<h3><a href="#!"><%# Eval("productname")%></a></h3>
                                <p class="price">
								    <span class="currency">Rs.</span>
								    <span class="price-room"><%# Eval("rate")%></span>
								    <span class="per">/ per day</span>
							    </p>
                                <div style="margin-top:10px; margin-bottom:10px;"></div>
								<p>
                                    <asp:LinkButton ID="lbtnBookNow" runat="server" CssClass="btn btn-primary btn-book" PostBackUrl='<%# Eval("productid", "detailsp.aspx?pid={0}") %>'>View Room Details</asp:LinkButton>
                                </p>
							</div>
					</div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>"
                    SelectCommand="SELECT [productid], [productname], [subcatid], [rate], [productimage] FROM [addproduct] WHERE ([subcatid] = @subcatid)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="subcatid" QueryStringField="scid" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
			</div>
		</div>

</asp:Content>

