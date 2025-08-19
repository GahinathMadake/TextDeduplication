
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
if(request.getParameter("aproval")!=null)
{
	out.print("<script>alert('Request Aproved Successfully')</script>");
}

%>


	<div class="main">
		<div class="search">

					<h1>Text Encrypted data with Authorized Deduplication</h1>

			<div class="clr"></div>
		</div>
	</div>
	</div>
	<div class="clr"></div>
	<div class="header">
		<div class="logo">
			<h1>
				<a href="home.jsp"><span> </span><small> </small></a>
			</h1>
		</div>
		<div class="menu_nav">
			<ul>
				<li><a href="home.jsp">Home</a></li>
					<li class="active"><a href="owner.jsp">Owner</a></li>
					<li ><a href="useractivation.jsp">User
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

				<h2>File TO Approval</h2>
				<br>
					<h1>Share To All Files</h1> <%
                        Connection con = null;
  						
                            ServletContext sc = getServletContext();
                            String url = sc.getInitParameter("url");
                            String driver = sc.getInitParameter("driver");
                            String password = sc.getInitParameter("password");
                            String username = sc.getInitParameter("username");
        Class.forName(driver);
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_deduplication","root","");
         System.out.println("Connection established");
                            System.out.println("In side owner file ");
                            Statement stm1 = con.createStatement();
                             ResultSet rr1 ;
                                     rr1= stm1.executeQuery("select * from share_all");
                             ResultSetMetaData rsmd = rr1.getMetaData();
                                String col1 = rsmd.getColumnName(3);
                                    //out.println(col1);
                             
                              String col2 = rsmd.getColumnName(2);
                                    //out.println(col2);
                                     String col3 = rsmd.getColumnName(5);
                                    //out.println(col3);
    %>
					<table width="100%"
						style="border: 1px; width: 100%; text-align: center; border: 1px solid">
						<tr>
							<th width="15%" style="text-align: center; border: 1px solid">User
								name</th>
							<th width="15%" style="text-align: center; border: 1px solid">Privilege</th>
							<th width="15%" style="text-align: center; border: 1px solid">File
								Name</th>
							<th width="15%" style="text-align: center; border: 1px solid">Approval
								Request</th>
						</tr>

						<%
                                     while(rr1.next())
                                     {
                                         int u_id = rr1.getInt("u_id");
                                         String id = Integer.toString(u_id);
                                         String user = rr1.getString("User");
                                      //   out.println(user);
                                         String privilege = rr1.getString("privilege");
                                         String filename = rr1.getString("filename");
                                         //out.println(filename);
                                         String status = rr1.getString("status");
                                         %>
						<tr>
							<td style="text-align: center; border: 1px solid"><%=user%>
							</td>
							<td style="text-align: center; border: 1px solid"><%=privilege%>

							</td>
							<td style="text-align: center; border: 1px solid"><%=filename%>

							</td>





							<%
                                         if(status.equals("false"))
                                         {
                                             %>

							<td style="text-align: center; border: 1px solid"><a
								href="approval.jsp?fname=<%=filename%>&user=<%=user%>&u_id=<%=id%>&privilege=<%=privilege%>">Need
									Approval</a>&nbsp</td>
							


							<%
                                         }
                                         else
                                         {%>

							<td style="text-align: center; border: 1px solid">Approved</td>

							<%
                                         //     out.println("Approved");
                                         }
                                     }
                                    
                                    %>
						</tr>
					</table> <br></br>
					<h1>Share With Privileges Files</h1>
					



					<table width="100%"
						style="border: 1px; width: 100%; text-align: center; border: 1px solid">
						<tr>
							<th width="15%" style="text-align: center; border: 1px solid">User
								name</th>
								<th width="15%" style="text-align: center; border: 1px solid">Privilege
								Name</th>
							<th width="15%" style="text-align: center; border: 1px solid">File Name</th>


						</tr>
						<%
                                     
                                      Statement st2 = con.createStatement();
                                     ResultSet rs3 = st2.executeQuery("select * from sharing_file");
                                        while(rs3.next()){
                                            
                                            String username1 = rs3.getString("username");
                                            String privilege1 = rs3.getString("privilege");
                                            String filename1 = rs3.getString("filename");
                                            
                                            %>

						<tr>
							<td style="text-align: center; border: 1px solid"><%=username1%>
							</td>
							                                <td style="text-align: center;border: 1px solid"><%=privilege1 %>
                                    
                                </td>
							<td style="text-align: center; border: 1px solid"><%=filename1%>

							</td>


							<%
                                        }

%>
						</tr>
					</table> <br></br>
					<h1>Uploaded Files</h1>



					<table width="100%"
						style="border: 1px; width: 100%; text-align: center; border: 1px solid">
						<tr>
							<th width="15%" style="text-align: center; border: 1px solid">User
								name</th>

							<th width="15%" style="text-align: center; border: 1px solid">File
								Name</th>

						</tr>
						<%
                                     
                                      Statement st3 = con.createStatement();
                                     ResultSet rs4 = st3.executeQuery("select * from n_file");
                                        while(rs4.next()){
                                            
                                            String username1 = rs4.getString("User");
                                            String privilege1 = rs4.getString("File_Name");
                                           // String filename1 = rs4.getString("filename");
                                            
                                            %>

						<tr>
							<td style="text-align: center; border: 1px solid"><%=username1%>
							</td>
							<td style="text-align: center; border: 1px solid"><%=privilege1%>

							</td>

							<%
                                        }
%>
						</tr>
					</table>
					<br/>
					<br/>

					</center>
			</div>
		</div>
		<div class="sidebar">
			<div class="gadget">
				<h2>
					<span>Sidebar</span> Menu
				</h2>
				<div class="clr"></div>
				<ul class="sb_menu">
					<li><a href="home.jsp">Home</a></li>
					<li class="active"><a href="owner.jsp">Owner</a></li>
					<li ><a href="useractivation.jsp">User
								Activation</a></li>
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