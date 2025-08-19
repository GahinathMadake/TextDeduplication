
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	
</script>
</head>
<body>
<%
if(request.getParameter("share")!=null)
{
	out.print("<script>alert('File Share Successfully')</script>");
}

%>

	<%
		String user_id = null;
		if (session.getAttribute("username") != null) {
			user_id = (String) session.getAttribute("username");
	%>
	<div class="main">
		<div class="search">

			<h1>Text Encrypted data with Authorized Deduplication</h1>

			<div class="clr"></div>
		</div>
	</div>

	<div class="clr"></div>
	<div class="header">

		<div class="menu_nav">
			<ul>
				<li class="active"><a href="home.jsp">Home</a></li>
				<li class="active"><a href="share_file.jsp">Back</a></li>
				<li><a href="share_privi.jsp">Share File With Privileges</a></li>
				<li><a href="share_all.jsp">Share File To All</a></li>
				<li><a href="shared_f_o.jsp">Shared File to Other</a></li>
				<li><a href="shared_file.jsp">Shared File</a></li>

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
			<div class="article">
				<h4 align="right">
					Welcome
					<%=user_id%></h4>
				<br />
				<%
					String s_user = (String) session.getAttribute("username");
						System.out.println("s_user" + s_user);
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = null;
						con = DriverManager.getConnection(
								"jdbc:mysql://localhost:3306/cloud_deduplication",
								"root", "");
						Statement st1 = con.createStatement();
						ResultSet rr;
						rr = st1.executeQuery("select * from reg where userid= '"
								+ s_user + "'");
						String pri = "";
						while (rr.next()) {
							pri = rr.getString("privilege");
							System.out.println("privilege is : " + pri);
						}
				%>
				<table width="100%"
					style="border: 1px; width: 100%; text-align: center; border: 1px solid">
					<tr>
						<th width="15%" style="text-align: center; border: 1px solid">File
							Name</th>
						<th width="15%" style="text-align: center; border: 1px solid">Privilege</th>
						<th width="15%" style="text-align: center; border: 1px solid">Operation</th>
					</tr>



					<%
						Statement stt1 = con.createStatement();
							ResultSet rss1 = stt1
									.executeQuery("select * from n_file where User = '"
											+ s_user + "'");//("select * from n_file where u_id = "+id_k+"");  
							while (rss1.next()) {
								int id = rss1.getInt("u_id");
								String filename = rss1.getString("File_Name");
								Statement ss = con.createStatement();
					%>
					<tr>
						<td style="text-align: center; border: 1px solid"><%=filename%>
						</td>
						<td style="text-align: center; border: 1px solid"><%=pri%></td>
						<td style="text-align: center; border: 1px solid"><a
							href="share_p.jsp?id=<%=id%>&file=<%=filename%>&user=<%=s_user%>&privilege=<%=pri%>">Share
								Request</a></td>
					</tr>




					<%
						}
					



					

							}
					%>








				</table>


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
					<li class="active"><a href="home.jsp">Home</a></li>
					<li class="active"><a href="share_file.jsp">Back</a></li>
					<li><a href="share_privi.jsp">Share File With Privileges</a></li>
					<li><a href="share_all.jsp">Share File To All</a></li>
					<li><a href="shared_f_o.jsp">Shared File to Other</a></li>
					<li><a href="shared_file.jsp">Shared File</a></li>
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
			</div>
			<div class="gadget"></div>
			<div class="gadget">
				<div class="clr"></div>
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
	</div>
</body>
</html>
