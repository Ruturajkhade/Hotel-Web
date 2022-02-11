<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="aminities.aspx.cs" Inherits="aminities" %>

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
				   					<h2>Accomodation</h2>
				   					<h1>Our Amenities</h1>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			  	</ul>
		  	</div>
		</aside>
		<div id="colorlib-amenities">
			<div class="container">
				<div class="row">
					<div class="amenities-flex">
						<div class="amenities-img animate-box" style="background-image: url(images/amenities-1.jpg);"></div>
						<div class="desc animate-box">
							<h2><a href="#">Airport Shuttle &amp; Parking Lot</a></h2>
							<p class="price">
								<span class="free">Free</span>
							</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi voluptates eius, nam laudantium, quasi laborum cumque asperiores totam est perferendis itaque id esse quidem recusandae sequi aut? Ratione, enim, consequatur!</p>
						</div>
						<div class="desc animate-box">
							<h2><a href="#">Room Service </a></h2>
							<p class="price">
								<span class="free">Free</span>
							</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi voluptates eius, nam laudantium, quasi laborum cumque asperiores totam est perferendis itaque id esse quidem recusandae sequi aut? Ratione, enim, consequatur!</p>
						</div>
						<div class="amenities-img animate-box" style="background-image: url(images/room-5.jpg);"></div>
					</div>
				</div>
			</div>
		</div>
</asp:Content>

