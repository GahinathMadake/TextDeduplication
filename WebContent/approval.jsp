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
            String id = request.getParameter("u_id");
            System.out.println("id"+id);
            
            String filename = request.getParameter("fname");
            System.out.println("filename1"+filename);
            
            String user = request.getParameter("user");
            System.out.println("userinfo"+user);
            String privileg = request.getParameter("privilege");
            System.out.println("privileg :"+privileg);
             String driver = "com.mysql.jdbc.Driver";
            Connection con = null;
            String pri=null;
            String pri1=null;
             Class.forName(driver);
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_deduplication","root","");
  Statement st1 = con.createStatement();
                 ResultSet rr;
                 rr = st1.executeQuery("select * from reg where userid= '"+s_user+"'");

                 
                Statement st = con.createStatement();
                Statement stm1 = con.createStatement();
                             ResultSet rr1 ;
                                 rr1= st.executeQuery("select * from k_p where id = '"+id+"'");
                                 

                            System.out.println("rr1.privilege"+pri1);   
                //   if(pri.equals(pri1)) {        
                           
                String sql = "update share_all set status='true' where filename = '"+filename+"' and User='"+user+"' and u_id = '"+id+"' and privilege = '"+privileg+"'  ";
                
                out.println("sql :"+sql);
                int h = stm1.executeUpdate(sql);
                out.println("Update Success");
                
                   //}            
//            Connect cn = new Connect();
//            cn.sendData(id, user,filename,s_user);
            
           response.sendRedirect("owner.jsp?aproval=done");
            //response.sendRedirect("owner.jsp");
            
            %>
    </body>
</html>
