<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

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
				   					<h2>Get in touch</h2>
				   					<h1>Contact Us</h1>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			  	</ul>
		  	</div>
	</aside>

		<div id="colorlib-contact">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 animate-box">
						<h3>Contact Information</h3>
						<div class="row contact-info-wrap">
							<div class="col-md-3">
								<p><span><i class="icon-location-2"></i></span> 198 West 21th Street, <br> Suite 721 New York NY 10016</p>
							</div>
							<div class="col-md-3">
								<p><span><i class="icon-phone3"></i></span> <a href="tel://1234567920">+ 1235 2355 98</a></p>
							</div>
							<div class="col-md-3">
								<p><span><i class="icon-paperplane"></i></span> <a href="mailto:info@yoursite.com">info@yoursite.com</a></p>
							</div>
							<div class="col-md-3">
								<p><span><i class="icon-globe"></i></span> <a href="#">luxehotel.com</a></p>
							</div>
						</div>
					</div>
					<div class="col-md-10 col-md-offset-1 animate-box">
						<h3>Get In Touch</h3>
						<form action="#">
							<div class="row form-group">
								<div class="col-md-6">
									<label for="fname">First Name</label>
                                    <asp:TextBox ID="txtFnm" runat="server" CssClass="form-control" placeholder="Your firstname"></asp:TextBox>
									<%--<input type="text" id="fname" class="form-control" placeholder="Your firstname">--%>
								</div>
								<div class="col-md-6">
									<label for="lname">Last Name</label>
									<%--<input type="text" id="lname" class="form-control" placeholder="Your lastname">--%>
                                    <asp:TextBox ID="txtLnm" runat="server" CssClass="form-control" placeholder="Your lastname"></asp:TextBox>
								</div>
							</div>

							<div class="row form-group">
								<div class="col-md-12">
									<label for="email">Email</label>
									<%--<input type="text" id="email" class="form-control" placeholder="Your email address">--%>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Your email address"></asp:TextBox>
								</div>
							</div>

							<div class="row form-group">
								<div class="col-md-12">
									<label for="subject">Subject</label>
									<%--<input type="text" id="subject" class="form-control" placeholder="Your subject of this message">--%>
                                    <asp:TextBox ID="txtSub" runat="server" CssClass="form-control" placeholder="Your subject of this message"></asp:TextBox>
								</div>
							</div>

							<div class="row form-group">
								<div class="col-md-12">
									<label for="message">Message</label>
									<%--<textarea name="message" id="message" cols="30" rows="10" class="form-control" placeholder="Say something about us"></textarea>--%>
                                    <asp:TextBox ID="txtMsg" runat="server" CssClass="form-control" placeholder="Say something about us" TextMode="MultiLine" Rows="3"></asp:TextBox>
								</div>
							</div>
							<div class="form-group text-center">
								<%--<input type="submit" value="Send Message" class="btn btn-primary">--%>
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" 
                                    Text="Submit" onclick="Button1_Click" />
							</div>

						</form>		
					</div>
				</div>
			</div>
		</div>

		<div id="map" class="colorlib-map"></div>
</asp:Content>

