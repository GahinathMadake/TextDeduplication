<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
</head>
<body>

	<div class="main">
		<div class="search">
			<form method="get" id="search" action="#">
				<span> <input type="text" value="Search..." name="s1" id="s" />

					<input name="searchsubmit" type="image" src="images/search.gif"
					value="Go" id="searchsubmit" class="btn" />
				</span>
			</form>
			<div class="clr"></div>
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
					<li class="active"><a href="home.jsp">Home</a></li>
					<li><a href="owner.jsp">Owner</a></li>
					<!--<li><a href="dedup.jsp">Check De duplication</a></li>-->
					<li><a href="user.jsp">User</a></li>
					<li><a href="logout.jsp">Logout</a></li>
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
				<div class="article"></div>
			</div>
			<div class="article"></div>
		</div>
	</div>
	<div class="sidebar">
		<div class="gadget">
			<h2>
				<span>Sidebar</span> Menu
			</h2>
			<div class="clr"></div>
			<ul class="sb_menu">
				<li class="active"><a href="home.jsp">Home</a></li>
				<li><a href="owner.jsp">Owner</a></li>
				<!--<li><a href="dedup.jsp">Check De duplication</a></li>-->
				<li><a href="user.jsp">User</a></li>
				<li><a href="logout.jsp">Logout</a></li>
			</ul>
		</div>
		<div class="gadget"></div>
		<div class="gadget">
			<h2 class="grey">
				
			</h2>
			<div class="clr"></div>
			<div class="testi">
				
			</div>
		</div>
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
		<%
 
 String fnm = request.getParameter("filename");
                    System.out.println("fnm"+fnm);
                    String user = request.getParameter("user");
                    System.out.println("user"+user);


response.sendRedirect("admininfo.jsp");         
%>
	</div>

</body>
</html>






