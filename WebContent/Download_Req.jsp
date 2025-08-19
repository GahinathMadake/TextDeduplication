<%@page import="java.sql.Blob"%>
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
            System.out.println("in request file");
            String user = request.getParameter("uname");
            String id = request.getParameter("u_id");
            int u_id = Integer.parseInt(id);
            String filename = request.getParameter("filename");
            Connection con1 = null;
     Class.forName("com.mysql.jdbc.Driver");
         con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_deduplication", "root", "");
         System.out.println("Connection established in request");
                            //System.out.println("In side owner file ");
         Statement stm2 = con1.createStatement();
         Statement st = con1.createStatement();
         Blob key = null;
         String privilege = null;
         ResultSet rs = st.executeQuery("select * from k_p where id='"+u_id+"'");
         while(rs.next()){
             key = rs.getBlob("key1");
             privilege = rs.getString("privilege");
         }
         
         String sql = "insert into down_req(user_r,filename,key_s,status,privilege) values('"+user+"','"+filename+"','"+key+",'false','"+privilege+"')";
         System.out.println("sql :"+sql);
            int h = stm2.executeUpdate(sql);
            response.sendRedirect("download.jsp");
            
            %>
    </body>
</html>
