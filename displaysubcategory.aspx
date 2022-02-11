<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="displaysubcategory.aspx.cs" Inherits="displaysubcategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<aside id="colorlib-hero">
			<div class="flexslider">
				<ul class="slides">
			   	<li style="background-image: url(images/img_bg_5.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-6 col-sm-12 col-md-offset-3 slider-text">
				   				<div class="slider-text-inner slider-text-inner2 text-center">
				   					<h2>Choose our Best</h2>
				   					<h1>Rooms &amp; Suites</h1>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			  	</ul>
		  	</div>
		</aside>

    <div id="colorlib-rooms" class="colorlib-light-grey">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-md-offset-3 text-center colorlib-heading animate-box">
						<span><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i><i class="icon-star-full"></i></span>
						<h2>Rooms &amp; Suites</h2>
						<p>We love to tell our successful far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 animate-box">
						<div class="">
                            
                            <asp:DataList ID="DataList1" runat="server" CssClass="owl-carousel owl-carousel2" DataKeyField="SubCatID" DataSourceID="SqlDataSource1"
                                RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <ItemTemplate>
                                    <div class="item">
                                        <%--<a href="images/room-1.jpg" class="room image-popup-link" style="background-image: url(images/room-1.jpg);"></a>--%>
                                        <asp:ImageButton ID="ImageButton1" class="room image-popup-link" runat="server" ImageUrl='<%# Eval("SubCatPic", "uploads/{0}") %>'/>
								        <div class="desc text-center">
									        <h3><a href="#!"><%# Eval("SubCatName") %></a></h3>
                                            <div style="margin-top:10px; margin-bottom:10px;"></div>
									        <p><asp:LinkButton ID="lbtnBookNow" runat="server" CssClass="btn btn-primary btn-book" PostBackUrl='<%# Eval("SubCatID", "displayproducts.aspx?scid={0}") %>'>View Rooms</asp:LinkButton>
                                                <%--<a class="btn btn-primary btn-book">Book now!</a>--%>
                                            </p>
								        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>"
                                SelectCommand="SELECT * FROM [addsubcat] WHERE ([CatID] = @CatID)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="CatID" QueryStringField="cid" Type="Decimal" />
                                </SelectParameters>
                            </asp:SqlDataSource>
						</div>
					</div>
					<div class="col-md-12 text-center animate-box">
						<a href="#!">View all rooms <i class="icon-arrow-right3"></i></a>
					</div>
				</div>
			</div>
		</div>
</asp:Content>

