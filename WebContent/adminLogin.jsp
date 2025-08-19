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
<%
	

if(request.getParameter("logout")!=null)
{
	out.print("<script>alert('Logout Successfully')</script>");
}
%>
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
				<li><a href="reg.jsp">Registration</a></li>
				<li class="active"><a href="adminLogin.jsp">Admin</a></li>
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
					Admin Login <br />
				</h2>
				<form action="UserLogin" name="f1" id="f1" method="post">
					<table align="center" cellpadding="5">
						<tr>
							<td>User Id</td>
							<td><input type="text" class="style5" name="uid" required />&nbsp;&nbsp;</td>

						</tr>

						<tr>
							<td>Password</td>
							<td><input type="password" name="pwd" id="pwd" required />&nbsp;&nbsp;</td>

						</tr>
						<tr></tr>
						<tr>
							<td></td>
							<td align="center"><input type="submit" value="Login"
								style="width: 100px; height: 35px;" onclick="checkButton()" /></td>

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
					<li><a href="reg.jsp">Registration</a></li>
					<li class="active"><a href="adminLogin.jsp">Admin</a></li>
				</ul>
			</div>
			<div class="gadget"></div>

			<div class="clr"></div>
		</div>
		<div class="clr"></div>
		<div class="fbg">
			<div class="col c1">
				<div class="col c2"></div>
				<div class="col c3"></div>
				<div class="clr"></div>
			</div>
		</div>
</body>
</html>