
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
	<%
		//    String user_id=null;
		//if (session.getAttribute("username") != null) {
		//				user_id = (String) session.getAttribute("username");
	%>
	<div class="main">
		<!-- <div class="search">
    <form method="get" id="search" action="#">
      <span>
      <input type="text" value="Search..." name="s1" id="s" />
      
      <input name="searchsubmit" type="image" src="images/search.gif" value="Go" id="searchsubmit" class="btn"  />
      </span>
    </form>
    <div class="clr"></div>
  </div> -->
		<div class="clr"></div>
		<div class="header">
			<div class="logo">
				<h1>
					<a href="home.jsp"><span> </span><small> </small></a>
				</h1>
			</div>
			<div class="menu_nav">
				<ul>
					<li><a href="admin.jsp">Home</a></li>
						<li><a href="owner.jsp">Owner</a></li>
						<li class="active"><a href="useractivation.jsp">User
								Activation</a></li>
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
				<div class="article">

					<%
 	Connection con = null;

 	ServletContext sc = getServletContext();
 	String url = sc.getInitParameter("url");
 	String driver = sc.getInitParameter("driver");
 	String password = sc.getInitParameter("password");
 	String username = sc.getInitParameter("username");
 	Class.forName(driver);
 	con = DriverManager.getConnection(
 			"jdbc:mysql://localhost:3306/cloud_deduplication", "root",
 			"");
 	System.out.println("Connection established");
 	System.out.println("In side owner file ");
 	Statement stm1 = con.createStatement();
 	ResultSet rr1;
 	rr1 = stm1.executeQuery("select * from reg where Status='Waitting'");
 	ResultSetMetaData rsmd = rr1.getMetaData();
 	String col1 = rsmd.getColumnName(3);
 	String col2 = rsmd.getColumnName(2);
 	String col3 = rsmd.getColumnName(5);
 	
 %>
						<table width="100%"
							style="border: 1px; width: 100%; text-align: center; border: 1px solid">
							<tr>
								<th width="15%" style="text-align: center; border: 1px solid">First
									Name</th>
								<th width="15%" style="text-align: center; border: 1px solid">Last
									Name</th>
								<th width="15%" style="text-align: center; border: 1px solid">Email
									ID</th>
								<th width="15%" style="text-align: center; border: 1px solid">Privilege</th>

								<th width="15%" style="text-align: center; border: 1px solid">Actvation
									Request</th>
							</tr>

							<%
								while (rr1.next()) {
									int id = rr1.getInt("id");
									String fname = rr1.getString("fname");
									String lname = rr1.getString("lname");
									String emailid = rr1.getString("emailid");
									//   out.println(user);
									String privilege = rr1.getString("privilege");
									String status = rr1.getString("status");

									//out.println(filename);
							%>
							<tr>
								<td style="text-align: center; border: 1px solid"><%=fname%>
								</td>
								<td style="text-align: center; border: 1px solid"><%=lname%>
								</td>
								<td style="text-align: center; border: 1px solid"><%=emailid%>
								</td>
								<td style="text-align: center; border: 1px solid"><%=privilege%>

								</td>
								<%
									if (status.equals("Waitting")) {
								%>

								<td style="text-align: center; border: 1px solid"><a
									href="useractive.jsp?fname=<%=fname%>&lname=<%=lname%>&id=<%=id%>&emailid=<%=emailid%>&privilege=<%=privilege%>">Active</a>&nbsp
								</td>



								<%
									} else {
								%>

								<td style="text-align: center; border: 1px solid">Active</td>

								<%
									//     out.println("Approved");
										}
									}
								%>
							</tr>
						</table>





						</center>
				</div>
				<!--<div class="pagenavi"><span class="pages">Page 1 of 2</span><span class="current">1</span><a href="#">2</a><a href="#" >&raquo;</a></div>-->
			</div>
			<div class="sidebar">
				<div class="gadget">
					<h2>
						<span>Sidebar</span> Menu
					</h2>
					<div class="clr"></div>
					<ul class="sb_menu">
						<li><a href="admin.jsp">Home</a></li>
						<li><a href="owner.jsp">Owner</a></li>
						<li class="active"><a href="useractivation.jsp">User
								Activation</a></li>
						<li><a href="logout.jsp">Logout</a></li>
					</ul>
				</div>


			</div>
			<%
				//}
				//    else
				//               {
				//        response.sendRedirect("index.jsp");
				//    }
			%>
		
</body>
</html>