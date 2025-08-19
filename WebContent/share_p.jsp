
<%@page import="java.sql.ResultSet"%>
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
             String s_user = (String) session.getAttribute("username");
                    System.out.println("s_user"+s_user);
                    String id = request.getParameter("id");
                    String filename = request.getParameter("file");
                    String privilege = request.getParameter("privilege");
                    System.out.println("id :"+id+"filename :"+filename);
        Class.forName("com.mysql.jdbc.Driver");
         Connection con = null;
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_deduplication","root","");
    Statement st1 = con.createStatement();
    String sql = "insert into sharing_file(u_id,username,privilege,filename) values('"+id+"','"+s_user+"','"+privilege+"','"+filename+"')";
        int df = st1.executeUpdate(sql);
        response.sendRedirect("share_privi.jsp?share=done");
            %>
    </body>
</html>
