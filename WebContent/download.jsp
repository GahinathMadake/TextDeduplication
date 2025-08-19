<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>netindustries</title>
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
		String user_id = null;
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
				<li><a href="home.jsp">Home</a></li>
				<li><a href="uploadfile.jsp">Upload File</a></li>
				<li class="active"><a href="download.jsp">Download File</a></li>
				<li><a href="share_file.jsp">Share File</a></li>
				<li><a href="operation.jsp">Operation on File</a></li>
				<li><a href="graph.jsp">Graph</a></li> 
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


				<h4 align="right">Welcome&nbsp;&nbsp;<%=user_id%></h4>
				<br />
				<h2>Choose File TO Download</h2>
				<br></br>
				<%
					String uname = new String("");
					String filename = new String("");
					String f_attributes = new String("");
					String f_policy = new String("");
					Connection con = null;
					String download_req = null;
					ServletContext sc = getServletContext();

					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection(
							"jdbc:mysql://localhost:3306/cloud_deduplication", "root",
							"");

					System.out.println("Connection established");
					System.out.println("In side download file ");
					Statement stm1 = con.createStatement();
					String pri = "";
					ResultSet rr1 = stm1
							.executeQuery("select privilege from reg where userid='"
									+ user_id + "'");
					while (rr1.next()) {
						pri = rr1.getString("privilege");
						System.out.println("privilege is : " + pri);
					}

					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery("select * from share_all");
				%>
				<table width="100%"
					style="border: 1px; width: 100%; text-align: center; border: 1px solid">
					<tr>
						<th width="15%" style="text-align: center; border: 1px solid">File
							Name</th>
						<th width="15%" style="text-align: center; border: 1px solid">Operation</th>

					</tr>
					<%
						while (rs.next()) {
							int id = rs.getInt("u_id");
							String u_id = Integer.toString(id);
							uname = rs.getString("user");
							filename = rs.getString("filename");
					%>
					<tr>
						<td style="text-align: center; border: 1px solid"><%=filename%>
						</td>
						<td style="text-align: center; border: 1px solid"><a
							href="download_file.jsp?u_id=<%=id%>&file=<%=filename%>">Download</a>
						</td>

					</tr>
					<%
						}
						Statement st = con.createStatement();
						ResultSet rss = st.executeQuery("select * from sharing_file");

						while (rss.next()) {

							int id = rss.getInt("u_id");
							String u_id = Integer.toString(id);
							uname = rss.getString("username");
							filename = rss.getString("filename");
							String privi = rss.getString("privilege");

							if (privi.equals(pri)) {
					%>

					<tr>
						<td style="text-align: center; border: 1px solid"><%=filename%>
						</td>

						<td style="text-align: center; border: 1px solid"><a
							href="download_file.jsp?u_id=<%=id%>&file=<%=filename%>">Download</a>
						</td>
					</tr>

					<%
						}
						}

						Statement ss = con.createStatement();
						ResultSet rst = ss
								.executeQuery("select * from n_file where User = '"
										+ user_id + "'");
						while (rst.next()) {

							int id = rst.getInt("u_id");
							String u_id = Integer.toString(id);
							filename = rst.getString("File_Name");
							System.out.println("n)file : " + filename);
							System.out.println("asd");
					%>

					<tr>
						<td style="text-align: center; border: 1px solid"><%=filename%>
						</td>

						<td style="text-align: center; border: 1px solid"><a
							href="download_file.jsp?u_id=<%=id%>&file=<%=filename%>">Download</a>
						</td>
					</tr>

					<%
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
					<li><a href="home.jsp">Home</a></li>
					<li><a href="uploadfile.jsp">Upload File</a></li>
					<li class="active"><a href="download.jsp">Download File</a></li>
					<li><a href="share_file.jsp">Share File</a></li>
					<li><a href="operation.jsp">Operation on File</a></li>
					<li><a href="graph.jsp">Graph</a></li> 
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
			</div>
			<div class="gadget">

				<div class="clr"></div>
			</div>
			<div class="gadget">
				
				<div class="clr"></div>
				
			</div>
		</div>
		<div class="clr"></div>
	</div>
	<div class="clr"></div>
	<div class="fbg">

		<div class="col c2"></div>
		<div class="col c3"></div>
		<div class="clr"></div>
	</div>


</body>
</html>