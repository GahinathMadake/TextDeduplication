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
    String user_id=null;
    System.out.println("abcd");
if (session.getAttribute("username") != null) {
    System.out.print("In upload file");
				user_id = (String) session.getAttribute("username");
                                
                                System.out.println("user_id in upload file"+user_id);
			    
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
				<a href="homepage.jsp"><span>Cloud Deduplication</span><small>Simple
						web template</small></a>
			</h1>
		</div>
		<div class="menu_nav">
			<ul>
				<li><a href="home.jsp">Home</a></li>
				<li class="active"><a href="uploadfile.jsp">Upload File</a></li>
				<!--<li><a href="dedup.jsp">Check De duplication</a></li>-->
				<li><a href="download_file.jsp">Download File</a></li>
				<li><a href="share_file.jsp">Share File</a></li>
				<li><a href="operation.jsp">Operation on File</a></li>
				<!-- <li><a href="graph.jsp">Graph</a></li> -->
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

				<h4>
					<font color="orange"> Your File has been De-duplicated</font>
				</h4>
				<h2>Choose File TO Upload</h2>
				<br></br>
				<%
           System.out.println("dedplct..");
           String msg = (String)request.getAttribute("msg");
           System.out.println("msg"+msg);
           if(msg != null){
    %>
				<font size="2" color="red"> <%= msg %></font> <br></br>


				<%
}
          
                     
%>

				<form class="form1" action="UploadServlet" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="user" value="<%=user_id%>" /> <select>
						<option value="cloud1" id="s1" name="privilege">Student</option>
						<option value="cloud1" id="s1" name="privilege">Director</option>
						<option value="cloud1" id="s1" name="privilege">Teacher</option>

					</select> <br /> Browse File: :
					<div>
						<input type="file" value="" name="path" size="30" maxlength="2048" />
					</div>
					<br /> <br />
					<div>
						<input name="submit" class="form-login" type="submit"
							title="submit" value="submit" size="30" maxlength="2048" />&nbsp;&nbsp;
					</div>
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
					<li><a href="home.jsp">Home</a></li>
					<li class="active"><a href="uploadfile.jsp">Upload File</a></li>
					<li><a href="download.jsp">Download File</a></li>
					<li><a href="share_file.jsp">Share File</a></li>
					<li><a href="operation.jsp">Operation on File</a></li>
					<!-- <li><a href="graph.jsp">Graph</a></li> -->
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
			</div>
			<div class="gadget">

				<div class="clr"></div>

			</div>
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
		<div class="col c2"></div>
		<div class="col c3"></div>
		<div class="clr"></div>
	</div>
	<div class="footer"></div>
	<%
}
    else
               {
        response.sendRedirect("index.jsp");
    }
%>
</body>
</html>
