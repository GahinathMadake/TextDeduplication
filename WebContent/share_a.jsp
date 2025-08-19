
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
                              String id = request.getParameter("id");
                               int di = Integer.parseInt(id);
                    String filename = request.getParameter("file");
                    String user = request.getParameter("user");
                    String privilege = request.getParameter("privilege");
                    System.out.println("id :"+di+"filename :"+filename);
                    try{ 
        Class.forName("com.mysql.jdbc.Driver");
         Connection con = null;
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_deduplication","root","");
    Statement st1 = con.createStatement();
    String sql = "insert into share_all(u_id,user,filename,privilege) values("+di+",'"+user+"','"+filename+"','"+privilege+"')";
    System.out.println("sql :"+sql);
        int df = st1.executeUpdate(sql);
        response.sendRedirect("share_all.jsp?share=all");
                    }catch(Exception e){
                        e.printStackTrace();
                    }
            
            %>
    </body>
</html>
