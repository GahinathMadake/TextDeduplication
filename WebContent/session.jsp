
<%@page import="com.sun.xml.internal.ws.wsdl.writer.UsingAddressing"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
<%@page import="java.util.*" %>
<%!Connection con=null; %>
<%

String uid= request.getParameter("uid");

String pwd= request.getParameter("pwd");
System.out.println("username is "+uid);
System.out.println("PWD is "+pwd);

out.println(uid);
out.println(pwd);

try 
{
        ServletContext sc=getServletContext();
	
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_deduplication","root","");
	
	System.out.println("Connection established");
        Statement st = con.createStatement();
        System.out.println("1");
        ResultSet rst = st.executeQuery("select * from reg where userid='"+uid+"'AND pass='"+pwd+"' ");
        System.out.println("2");
        if (rst.next()) 
        {
            out.println("user p1");
          
            session.setAttribute("username", uid);%>

            <% if (session.getAttribute("username").equals(""))
            {                
//                out.println("out of session");
//                response.sendRedirect("index.jsp");
                out.println("<center> <h5><font color=\"green\"><b>Sorry your session is expired<b></font></h5></center>");
            }
            else
                              { 
                out.println("in session");
               
                      response.sendRedirect("home.jsp");
             //  response.sendRedirect("NewServlet.java");
                } 
            } 
               else if(uid.equals("admin")&&pwd.equals("admin")){
                   response.sendRedirect("admin.jsp");
               }
                   
           else
                               {
              out.println("in else");
                   response.sendRedirect("index.jsp");
            }
   
%>

        

<% } catch (Exception e) 
{
        System.out.println("Exception caught" + e.getMessage());
} %>
    </body>
</html>
