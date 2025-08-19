<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="control.Connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                    String s_user = (String) session.getAttribute("username");
                    System.out.println("s_user"+s_user);
            System.out.println("IN APPROVAL");
            String id = request.getParameter("id");
            System.out.println("id"+id);
            
            String fname = request.getParameter("fname");
            System.out.println("user name "+fname);
            String lname = request.getParameter("lname");
            System.out.println("user last name "+lname);
            String emailid = request.getParameter("emailid");
            System.out.println("user email id "+emailid);
           
            String privileg = request.getParameter("privilege");
            System.out.println("privileg :"+privileg);
             String driver = "com.mysql.jdbc.Driver";
            Connection con = null;
            String pri=null;
            String pri1=null;
             Class.forName(driver);
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_deduplication","root","");
  Statement stm1 = con.createStatement();
                 
                           
                String sql = "update reg set status='Accept' where id = '"+id+"' and fname='"+fname+"' and lname = '"+lname+"' and emailid = '"+emailid+"' and privilege = '"+privileg+"'  ";
                
                out.println("sql :"+sql);
                int h = stm1.executeUpdate(sql);
                out.println("Update Success");
                
                   //}            
//            Connect cn = new Connect();
//            cn.sendData(id, user,filename,s_user);
            
           response.sendRedirect("useractivation.jsp");
            //response.sendRedirect("owner.jsp");
            
            %>
    </body>
</html>
