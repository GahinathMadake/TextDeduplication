
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
   try{
             String s_user = (String) session.getAttribute("username");
                    System.out.println("s_user"+s_user);
        Class.forName("com.mysql.jdbc.Driver");
         Connection con = null;
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_deduplication","root","");
    Statement st1 = con.createStatement();
    
String id= request.getParameter("id") ;//
  String fil_name = request.getParameter("file");
String user = request.getParameter("user");
      String size = request.getParameter("size");
      
      String priv = request.getParameter("tag1");
      System.out.println("dfv : "+priv);
      int ij = Integer.parseInt(id);
      String que = "insert into sharing_file(u_id,username,filename,privilege) value("+ij+",'"+user+"','"+fil_name+"','"+priv+"')";
      System.out.println("que :  "+que);
      int h = st1.executeUpdate(que);

   }
   catch(Exception e)
   {
       e.printStackTrace();
   }
            
response.sendRedirect("shared_f_o.jsp?share=done");
%>
        <h1>Hello World!</h1>
    </body>
</html>
