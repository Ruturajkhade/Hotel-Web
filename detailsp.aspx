<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="detailsp.aspx.cs" Inherits="detailsp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="colorlib-blog">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<article class="animate-box">
                            <%--<aside id="colorlib-hero" style="height:250px;">
                                <div class="flexslider">
                                    <ul class="slides">
                                        <li style="background-image: url(images/img_bg_5.jpg);">
                                            <div class="overlay">
                                            </div>
                                        </li>
                                        <li style="background-image: url(images/img_bg_5.jpg);">
                                            <div class="overlay">
                                            </div>
                                        </li>
                                        <li style="background-image: url(images/img_bg_3.jpg);">
                                            <div class="overlay">
                                            </div>
                                        </li>
                                        <li style="background-image: url(images/img_bg_4.jpg);">
                                            <div class="overlay">
                                            </div>
                                        </li>
                                    </ul>
                                </div>
	                        </aside>--%>
							<div class="blog-img" id="divImg" runat="server"></div>
							<div class="desc">
								<div class="meta">
									<p>
										<span>Rate: <asp:Label ID="lblRate" runat="server" Text=""></asp:Label></span>
										<span>Discount: <asp:Label ID="lblDiscount" runat="server" Text=""></asp:Label></span>
										<span><a href="#!">Check In Time: 12PM</a></span>
                                        <span><a href="#!">Check Out Time: 12PM</a></span>
									</p>
								</div>
								<h2><a href="#"><asp:Label ID="lblRoomName" runat="server" Text=""></asp:Label></a></h2>
								<p><asp:Label ID="lblRoomDesc" runat="server" Text=""></asp:Label> </p>
                                <asp:Button ID="btnRedirect" CssClass="btn btn-primary" runat="server" Text="Check Availability" OnClick="btnRedirect_Click" />
							</div>
						</article>
					</div>
				</div>
			</div>
		</div>
</asp:Content>