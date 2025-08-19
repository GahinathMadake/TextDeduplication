
<%@page import="control.AESFile"%>
<%@page import="java.sql.Blob"%>
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

			<h1>Cloud De-duplication</h1>
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


				<form class="form1" action="UpdateServlet" method="post">



					<%
          String uid = request.getParameter("tag1");
          System.out.println("uid :"+uid);
          Class.forName("com.mysql.jdbc.Driver");
         Connection con = null;
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_deduplication","root","");
    Statement st1 = con.createStatement();
    int id = Integer.parseInt(uid);
    String sql = "select * from k_p where id = "+uid+"";
    System.out.println("sql :"+sql);
         ResultSet rs = st1.executeQuery(sql);
         Blob hash_data = null;
         byte[] db_enc_data=null;
         while(rs.next()){
             hash_data = rs.getBlob("key1");
             System.out.println("hash_data :"+hash_data);
         }
          db_enc_data = hash_data.getBytes(1,(int)hash_data.length());           
                               

                 System.out.println("db_enc_data"+db_enc_data);
         AESFile ae = new AESFile();

                            ae.generateKey(db_enc_data, "AES");
                            String sf = "select * from n_file where u_id = "+uid+"";
                            Statement ss = con.createStatement();
                            String filec = null;
                            String filename = null;
                            ResultSet rr = ss.executeQuery(sf);
                            while(rr.next()){
                                filec = rr.getString("file");
                                System.out.println("prev :"+filec);
                                filename = rr.getString("File_Name");
                            }
                             String decryptedText = AESFile.decrypt(filec);
                            System.out.println("decryptedText :"+decryptedText);
                            String url_prm=decryptedText.replaceAll(" ", "%20");
          
          %>
					<textarea name="data" rows="10" cols="40"></textarea>
					<input type="hidden" name="id" value=<%=uid%> /> <input
						type="hidden" name="decryptedText" value=<%=url_prm%> /> <input
						type="submit" value="Insert" />


				</form>


			</div>
			<div class="article">

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
		<div class="footer"></div>
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
