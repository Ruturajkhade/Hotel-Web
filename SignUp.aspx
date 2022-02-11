<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Luxehotel Template</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />

  <!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">

	<!-- Flexslider  -->
	<link rel="stylesheet" href="css/flexslider.css">

	<!-- Owl Carousel -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	
	<!-- Date Picker -->
	<link rel="stylesheet" href="css/bootstrap-datepicker.css">
	<!-- Flaticons  -->
	<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
    <form id="form1" runat="server">
    <nav class="colorlib-nav" role="navigation">
			<div class="top">
				<div class="container">
					<div class="row">
						<div class="col-xs-4">
							<p class="site">Welcome  <asp:Label ID="lblUsrNm" runat="server" ></asp:Label></p>
						</div>
						<div class="col-xs-8 text-right">
							<p class="num">Call: +91-123-456</p>
							<ul class="colorlib-social">
								<li><a href="#"><i class="icon-twitter"></i></a></li>
								<li><a href="#"><i class="icon-facebook"></i></a></li>
								<li><a href="#"><i class="icon-linkedin"></i></a></li>
								<li><a href="#"><i class="icon-dribbble"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="top-menu">
				<div class="container">
					<div class="row">
						<div class="col-xs-2">
							<div id="colorlib-logo"><a href="Default.aspx">Hotel</a></div>
						</div>
						<div class="col-xs-10 text-right menu-1">
							<ul>
								<li class="active"><a href="Default.aspx">Home</a></li>
                                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
								<%--<li class="has-dropdown">
									<a href="rooms-suites.html">Rooms</a>
									<ul class="dropdown">
										<li><a href="#">Web Design</a></li>
										<li><a href="#">eCommerce</a></li>
										<li><a href="#">Branding</a></li>
										<li><a href="#">API</a></li>
									</ul>
								</li>
								<li><a href="#!">Dining &amp; Bar</a></li>--%>
								<li><a href="aminities.aspx">Aminities</a></li>
								<li><a href="About.aspx">About</a></li>
								<li><a href="Contact.aspx">Contact</a></li>
                                
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
        <div class="colorlib-loader"></div>

	<div id="page">
		<div id="colorlib-blog">
			<div class="container">
				<div class="row">
                    <div class="col-md-2"></div>
					<div class="col-md-8" style="border:1px solid black;">
						<div class="aside animate-box" style="margin-top:15px;">
							<h3>Sign Up</h3>
                            <div class="colorlib-form">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>
                                                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label></label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="date">
                                                Guest name:</label>
                                            <div class="form-field">
                                                <asp:TextBox ID="txtgnm" CssClass="form-control" runat="server" MaxLength="30"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="date">
                                                Address:</label>
                                            <div class="form-field">
                                                <asp:TextBox ID="txtgadd" CssClass="form-control" runat="server" TextMode="MultiLine" MaxLength="40"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="date">
                                                City:</label>
                                            <div class="form-field">
                                                <asp:TextBox ID="txtcity" CssClass="form-control" runat="server" TextMode="SingleLine"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="date">
                                                State:</label>
                                            <div class="form-field">
                                                <asp:TextBox ID="txtstate" CssClass="form-control" runat="server" TextMode="SingleLine"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="date">
                                                Phone:</label>
                                            <div class="form-field">
                                                <asp:TextBox ID="txtphone" CssClass="form-control" runat="server" TextMode="SingleLine"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="date">
                                                Email:</label>
                                            <div class="form-field">
                                                <asp:TextBox ID="txtemail" CssClass="form-control" runat="server" TextMode="SingleLine"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="date">
                                                Gender:</label>
                                            <div class="form-field">
                                                <asp:DropDownList ID="ddlgender" runat="server" CssClass="form-control dropdown" AppendDataBoundItems="true">
                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                    <asp:ListItem Value="1">Male</asp:ListItem>
                                                    <asp:ListItem Value="2">Female</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="date">
                                                Password:</label>
                                            <div class="form-field">
                                                <asp:TextBox ID="txtpass" CssClass="form-control" runat="server" TextMode="SingleLine"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="date">
                                                Confirm Password:</label>
                                            <div class="form-field">
                                                <asp:TextBox ID="txtcpass" CssClass="form-control" runat="server" TextMode="SingleLine"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>                                    
                                    <div class="clearfix"></div>
                                    <div class="col-md-2">
                                        <asp:Button ID="btnSave" CssClass="btn btn-primary btn-block" runat="server" 
                                            Text="Submit" onclick="btnSave_Click" />
                                    </div>
                                    <div class="col-md-2">
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger btn-block" runat="server" Text="Cancel" />
                                    </div>
                                </div>
			            </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    </form>

	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.flexslider-min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
