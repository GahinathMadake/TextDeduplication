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
            String uid = request.getParameter("id");
            int u_id = Integer.parseInt(uid);
            String file = request.getParameter("file");
            System.out.println("uid :"+uid+"file :"+file);
              Class.forName("com.mysql.jdbc.Driver");
         Connection con = null;
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_deduplication","root","");
    Statement st1 = con.createStatement();
//    String sql = "UPDATE n_file SET USER ='NULL' WHERE u_id = "+u_id+"";
    String dck = "select * from dedup_data where ref_ptr = "+u_id+" ";
    Statement stck = con.createStatement();
    ResultSet rsck = stck.executeQuery(dck);
    if(rsck.next()){
        String userid = rsck.getString("userid");
        String pri = rsck.getString("privilege");
//        String filename = rsck.getString("")
        String sqlu = "update n_file set User = '"+userid+"' where u_id = "+u_id+"";
        Statement stnu = con.createStatement();
        int ou = stnu.executeUpdate(sqlu);
        String flower = "update k_p set privilege = '"+pri+"' where id = "+u_id+"";
        Statement kitten = con.createStatement();
        int oye = kitten.executeUpdate(flower);
        
        String del = "delete from dedup_data where ref_ptr = "+u_id+"";
                                       Statement stdel = con.createStatement();
                                       int delt = stdel.executeUpdate(del);
        
        
    }else{
        String sql = "delete from n_file where u_id = "+u_id+" ";
            System.out.println("sql :"+sql);
            int gh = st1.executeUpdate(sql);
            
            String delsa12 = "delete from k_p where id = "+u_id+" ";
            Statement dels12 = con.createStatement();
            int sdf12 = dels12.executeUpdate(delsa12);
            
            
            String delsa = "delete from share_all where u_id = "+u_id+" ";
            Statement dels = con.createStatement();
            int sdf = dels.executeUpdate(delsa);
            String delsa1 = "delete from sharing_file where u_id = "+u_id+" ";
            Statement dels1 = con.createStatement();
            int sdf1 = dels1.executeUpdate(delsa1);
            
            System.out.println("deletion completed");
    }
    
    
    
    
    
    
            
            response.sendRedirect("delete.jsp");
            %>
    </body>
</html>
