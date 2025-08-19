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
            String uid = request.getParameter("id");
            int u_id = Integer.parseInt(uid);
            String file = request.getParameter("file");
            System.out.println("uid :"+uid+"file :"+file);
              Class.forName("com.mysql.jdbc.Driver");
         Connection con = null;
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_deduplication","root","");
    Statement st1 = con.createStatement();
//    String sql = "UPDATE dedup_data SET userid ='NULL' WHERE ref_ptr = "+u_id+"";
            String sql = "delete from dedup_data where ref_ptr = "+u_id+" ";
           System.out.println("sql :"+sql);
            int gh = st1.executeUpdate(sql);
             String delsa = "delete from share_all where u_id = "+u_id+" ";
            Statement dels = con.createStatement();
            int sdf = dels.executeUpdate(delsa);
            String delsa1 = "delete from sharing_file where u_id = "+u_id+" ";
            Statement dels1 = con.createStatement();
            int sdf1 = dels1.executeUpdate(delsa1);
            System.out.println("deletion completed");
            response.sendRedirect("delete.jsp");
            %>
    </body>
</html>
