<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>
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
<script type="text/javascript">
 function validateFileExtension(fld) 
 {
	 
    if(!/(\.txt|\.docx|\.doc|\.pdf)$/i.test(fld.value)) {
        alert("Invalid file type.");      
        fld.form.reset();
        fld.focus();        
        return false;   
    }   
    return true; 
 } </script>
</head>
<%
if(request.getParameter("uplaod")!=null)
{
	out.print("<script>alert('File Upload Successfully')</script>");
	//D:
}
if(request.getParameter("alredy")!=null)
{
	out.print("<script>alert('File is Duplicated')</script>");
}

%>
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

			<h1>Text Encrypted data with Authorized Deduplication</h1>
	
		</div>
	</div>

	</div>
	<div class="clr"></div>
	<div class="header">
	
		<div class="menu_nav">
			<ul>
				<li><a href="home.jsp">Home</a></li>
				<li class="active"><a href="uploadfile.jsp">Upload File</a></li>
				<li><a href="download.jsp">Download File</a></li>
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


				<h4 align="right">
					Welcome&nbsp;&nbsp;<%=user_id%></h4>
				<br />
				<h2>Choose File To Upload</h2>
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
					<input type="hidden" name="user" value="<%=user_id%>" />
					<!--<input type="text" name="privilege" value=" "/>-->
					<select name="tag1">
						<option value="Student" id="s1" name="privilege">Student</option>
						<option value="Director" id="s1" name="privilege">Director</option>
						<option value="Teacher" id="s1" name="privilege">Teacher</option>

					</select> <br /> Browse File: :
					<div>
						<input type="file" value="" name="path" size="30" maxlength="2048"
							onchange="return validateFileExtension(this)"
							accept=".txt,
           application/pdf,
           application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,
           application/vnd.ms-excel,
           application/vnd.openxmlformats-officedocument.wordprocessingml.document,
           application/msword" />
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
					<li><a href="graph.jsp">Graph</a></li> 
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
			</div>
			<div class="gadget">

				<div class="clr"></div>

			</div>
			<div class="gadget">
				<!-- <h2 class="grey"><span>Wise Words</span></h2> -->
				<div class="clr"></div>
				<div class="testi"></div>
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
	<%
}
    else
               {
        response.sendRedirect("index.jsp");
    }
%>
</body>
</html>