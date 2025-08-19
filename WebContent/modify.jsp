
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
    String user_id=null;
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
				<li class="active"><a href="operation.jsp">Back</a></li>
				<li><a href="insert.jsp">Insertion</a></li>
				<!--<li><a href="dedup.jsp">Check De duplication</a></li>-->
				<li><a href="modify.jsp">Modification</a></li>
				<!--<li><a href="share_file.jsp">Share File</a></li>-->
				<li><a href="delete.jsp">Deletion</a></li>
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
				<form class="form1" action="modify_1.jsp" method="post">
					<%
           String s_user = (String) session.getAttribute("username");
                    System.out.println("s_user"+s_user);
        Class.forName("com.mysql.jdbc.Driver");
         Connection con = null;
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_deduplication","root","");
    Statement st1 = con.createStatement();
      ResultSet rr;
                 rr = st1.executeQuery("select * from n_file where User= '"+s_user+"'");
                 %>

					<select name="tag1" required>
						<%
                 
          while(rr.next()){
              int u_id = rr.getInt("u_id");
              String filename = rr.getString("File_Name");
              %>


						<option value=<%=u_id%> id="s1" name="privilege"><%=filename%></option>


						<%
          }
          
          %>

					</select> <input type="submit" name="submit" value="Next" /><br />
				</form>

				<form class="form1" action="modify_2.jsp" method="post">
					<h4 align="left">DeDuplicated Files</h4>
					<select name="gat1" required>

						<%
          Statement st = con.createStatement();
          String sql = "select * from dedup_data where userid ='"+s_user+"' ";
          ResultSet rs = st.executeQuery(sql);
          String fname = null;
          while(rs.next()){
              int id = rs.getInt("ref_ptr");
              fname = rs.getString("filename");
              %>

						<option value=<%=id%> id="s1" name="privilege"><%=fname%></option>

						<%
          }
          %>
					</select> <input type="submit" name="submit" value="Next" />
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
					<li class="active"><a href="home.jsp">Home</a></li>
					<li class="active"><a href="operation.jsp">Back</a></li>
					<li><a href="insert.jsp">Insertion</a></li>
					<!--<li><a href="dedup.jsp">Check De duplication</a></li>-->
					<li><a href="modify.jsp">Modification</a></li>
					<!--<li><a href="share_file.jsp">Share File</a></li>-->
					<li><a href="delete.jsp">Deletion</a></li>
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
			</div>
			<div class="gadget"></div>
			<div class="gadget">

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
	</div>
	<%
}
    else
               {
        response.sendRedirect("index.jsp");
    }
%>
</body>
</html>

