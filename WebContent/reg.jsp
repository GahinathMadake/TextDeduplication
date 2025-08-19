<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Cloud De-duplication</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>

<script>
	function AllowAlphabet() {
		if (!ureg.fname.value.match(/^[a-zA-Z]+$/) && ureg.fname.value != "") {
			ureg.fname.value = "";
			ureg.fname.focus();
			alert("Please Enter only alphabet in text");
		}

		if (!ureg.lname.value.match(/^[a-zA-Z]+$/) && ureg.lname.value != "") {
			ureg.lname.value = "";
			ureg.lname.focus();
			alert("Please Enter only alphabets in text");
		}

	}

	function Validate() {
		var y = document.ureg.mbnumber.value;

		if (isNaN(y) || y.indexOf(" ") != -1) {

			ureg.mbnumber.value = "";
			ureg.mbnumber.focus();
			alert("Enter Only Numeric value");
			return false;
		}
		if (y.length != 10) {
			alert("Enter only 10 Digit Number");
			return false;
		}

		if (!y.match(/^[0-9]+$/) && y != "") {
			y = "";
			ureg.mbnumber.focus();
			alert("Enter only Digits in textbox");
		}

	}

	function validEmail() {
		var mail = document.ureg.email.value;
		if (mail == "") {
			document.ureg.email.focus();
			document.ureg.email = "";
			alert("Enter Valid E-mail Id");

			return false;
		}
		if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail)) {
		} else {
			document.ureg.email.focus();
			document.ureg.email = "";
			alert("Enter Valid Email id");

			return false;
		}
	}

	function validuaernameandpass() {

		var pass = document.ureg.passwords.value;

		if (pass != "") {
			if (pass.length < 6) {
				alert("Password must contain at least 6 characters!");
				document.ureg.password.focus();
				return false;
			}
		}
	}
</script>

<link href="jquery.datepick.css" rel="stylesheet">
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="jquery.plugin.js"></script>
	<script src="jquery.datepick.js"></script>
	<script>
	$(function() {
		$('#popupDatepicker').datepick();
		$('#inlineDatepicker').datepick({
			onSelect : showDate
		});
	});
</script>

	<script type="text/javascript">
	function datetype() {
		document.getElementById("popupDatepicker").value = document
				.getElementById("h1").value;
		document.getElementById("popupDatepicker").readOnly = true;

	}
</script>
	<script type="text/javascript">
	function datetype1() {
		document.getElementById("popupDatepicker").value = "";
		document.getElementById("popupDatepicker").readOnly = false;

	}
</script>
</head>


<body>
	<div class="main">
		<div class="search">

						<h1>Text Encrypted data with Authorized Deduplication</h1>

			<div class="clr"></div>
		</div>
	</div>
	<div class="clr"></div>
	<div class="header">
		<div class="logo">
			<h1>
				<a href="index1.html"><span> </span><small> </small></a>
			</h1>
		</div>
		<div class="menu_nav">
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li class="active"><a href="reg.jsp">Registration</a></li>
				<li><a href="adminLogin.jsp">Admin</a></li>
				<!-- <li><a href="about.jsp">About US</a></li>
				<li><a href="contact.jsp">Contact Us</a></li> -->
			</ul>
			<div class="clr"></div>
		</div>
		<div class="clr"></div>
	</div>
	<div class="hbg">
		<img src="images/header_images.jpg" width="970" height="294" alt="" />
	</div>
	<div class="content">
		<div class="mainbar">
			<div class="article">
				<h2 align="center">
					Registration Form<br />
				</h2>
				<form action="./registrationController" name="ureg" method="post">

					<table align="center" cellpadding="5">
						<%
						if(request.getParameter("reg")!=null)
						{
						out.print("<script>alert('Registration Successfully')</script>");						
						
						}
						
						%>

						<tr>
							<td>First Name</td>
							<td><input type="text" class="style5" name="fname"
								id="fname" placeholder="First Name" onblur="AllowAlphabet()"
								required />&nbsp;</td>
							<td>Last Name</td>
							<td><input type="text" class="style5" name="lname"
								id="lname" placeholder="Second Name" onblur="AllowAlphabet()"
								required />&nbsp;</td>
						</tr>
						<tr>
							<td>E-mail id</td>
							<td><input type="text" class="style5" name="emid"
								placeholder="example@gmail.com" onblur="return validEmail()"
								id="email" required />&nbsp;</td>
							<td>Date of Birth</td>
							<td><input type="text" class="style5" name="dob"
								id="popupDatepicker" required placeholder="D.O.B." />&nbsp;</td>
						</tr>
						<tr>
							<td>Phone No</td>
							<td><input type="text" class="style5" name="pno"
								id="mbnumber" placeholder="Only 10 Digit"
								onblur="return Validate()" required />&nbsp;</td>
							<td>Address</td>
							<td><textarea class="style5" name="address"
									placeholder="Full Address" required></textarea>&nbsp;</td>
						</tr>

						<tr>
							<td>User Id</td>
							<td><input type="text" class="style5" name="uid"
								placeholder="username" required />&nbsp;</td>
							<td>Privileges</td>
							<td><select name="tag1" style="width: 130px;">
									<option value="Student" id="s1" name="privilege">Student</option>
									<option value="Director" id="s1" name="privilege">Director</option>
									<option value="Teacher" id="s1" name="privilege">Teacher</option>

							</select>&nbsp;</td>
						</tr>
						<tr>
							<td>Password</td>
							<td><input type="password" name="pwd" id="passwords"
								class="style5" onblur="return validuaernameandpass()"
								placeholder="Password" required />&nbsp;</td>

						</tr>
						<tr>
							<td></td>
							<td align="center"><input type="submit" value="Register"
								class="style5" style="width: 130px; height: 40px" /></td>
							<td></td>
							<td><input type="reset" value="Reset"
								style="width: 130px; height: 40px" /></td>
						</tr>
					</table>

				</form>
			</div>
			<div class="article"></div>
		</div>
		<div class="sidebar">
			<div class="gadget">
				<h2>
					<span>Sidebar</span> Menu
				</h2>
				<div class="clr"></div>
				<ul class="sb_menu">
					<li><a href="index.jsp">Home</a></li>
					<li class="active"><a href="reg.jsp">Registration</a></li>
					<li><a href="adminLogin.jsp">Admin</a></li>
				</ul>
			</div>

			<div class="clr"></div>
		</div>
		<div class="clr"></div>
		<div class="fbg">
			<div class="col c1">

				<div class="col c2"></div>
				<div class="col c3"></div>
				<div class="clr"></div>
			</div>
			<%@page import="java.sql.Connection"%>
			<%@page import="java.sql.DriverManager"%>
			<%@page import="java.sql.Statement"%>
			<%@page import="java.sql.ResultSet"%>
			<%@page import="java.sql.PreparedStatement"%>
			<%!Connection con = null;%>


		</div>
</body>
</html>