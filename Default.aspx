<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
				   				<div class="slider-text-inner text-center">
				   					<h2>Welcome to the luxehotel</h2>
				   					<h1>A Luxury Hotel</h1>
										<%--<p><a class="btn btn-primary btn-demo" href="#"></i> View Detail</a> <a class="btn btn-primary btn-learn">Know More</a></p>--%>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			   	<li style="background-image: url(images/img_bg_5.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-6 col-sm-12 col-md-offset-3 slider-text">
				   				<div class="slider-text-inner text-center">
				   					<h2>Discover &amp; Enjoy</h2>
				   					<h1>Everything you need in luxehotel</h1>
										<%--<p><a class="btn btn-primary btn-demo" href="#"></i> View Detail</a> <a class="btn btn-primary btn-learn">Know More</a></p>--%>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			   	<li style="background-image: url(images/img_bg_3.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container-fluids">
			   			<div class="row">
				   			<div class="col-md-6 col-sm-12 col-md-offset-3 slider-text">
				   				<div class="slider-text-inner text-center">
				   					<h2>You are invited</h2>
				   					<h1>We know how to please you</h1>
										<%--<p><a class="btn btn-primary btn-demo" href="#"></i> View Detail</a> <a class="btn btn-primary btn-learn">Know More</a></p>--%>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			   	<li style="background-image: url(images/img_bg_4.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-6 col-sm-12 col-md-offset-3 slider-text">
				   				<div class="slider-text-inner text-center">
				   					<h2>Come &amp; enjoy the unforgetable nights</h2>
				   					<h1>In the heart of luxehotel</h1>
										<%--<p><a class="btn btn-primary btn-demo" href="#"></i> View Detail</a> <a class="btn btn-primary btn-learn">Know More</a></p>--%>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>	   	
			  	</ul>
		  	</div>
	</aside>
    <div id="colorlib-services">
	    <div class="container">
		    <div class="row">
			    <div class="col-md-3 animate-box text-center">
				    <div class="services">
					    <span class="icon">
						    <i class="flaticon-reception"></i>
					    </span>
					    <h3>24/7 Front Desk</h3>
					    <p>Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies</p>
				    </div>
			    </div>
			    <div class="col-md-3 animate-box text-center">
				    <div class="services">
					    <span class="icon">
						    <i class="flaticon-herbs"></i>
					    </span>
					    <h3>Spa Suites</h3>
					    <p>Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies</p>
				    </div>
			    </div>
			    <div class="col-md-3 animate-box text-center">
				    <div class="services">
					    <span class="icon">
						    <i class="flaticon-car"></i>
					    </span>
					    <h3>Transfer Services</h3>
					    <p>Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies</p>
				    </div>
			    </div>
			    <div class="col-md-3 animate-box text-center">
				    <div class="services">
					    <span class="icon">
						    <i class="flaticon-cheers"></i>
					    </span>
					    <h3>Restaurant &amp; Bar</h3>
					    <p>Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies</p>
				    </div>
			    </div>
		    </div>
	    </div>
    </div>
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
                                        <asp:ImageButton ID="ImageButton1" CssClass="room image-popup-link" runat="server" ImageUrl='<%# Eval("SubCatPic", "uploads/{0}") %>'/>
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
                                SelectCommand="SELECT * FROM [addsubcat]">
                            </asp:SqlDataSource>
						</div>
					</div>
					<div class="col-md-12 text-center animate-box">
						<a href="CheckAvail.aspx">Check Room Availability<i class="icon-arrow-right3"></i></a>
					</div>
				</div>
			</div>
		</div>
</asp:Content>

