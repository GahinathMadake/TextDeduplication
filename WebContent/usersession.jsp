
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="control.ConnectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
        //HttpSession session=null;
 try
        {
            
     session = request.getSession(true);
            String user = request.getParameter("user");
            String password = request.getParameter("password");
            session.setAttribute("emailid", user);
            
            //Enter Your
            ConnectionManager cm = new ConnectionManager();
            Statement st = cm.statement();
            String query = "select username,password from registration where username='"+user+"' and password='"+password+"'";
            System.out.println(query);
            ResultSet res = st.executeQuery(query);
            if(res.next())
            {
                
                response.sendRedirect("homepage.jsp");                           
            }
            else if(user.equals("admin")&&password.equals("admin"))
                                                     {
                            response.sendRedirect("admin.jsp");                           
                       }
                       else{
                System.out.println("Fdshfb xzdnxfgnststg");
                       }
//            Loginbean logbean = new Loginbean();
//            logbean.setEmail(email);
//            logbean.setPassword(password);
            
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
%>
        
        
        <h1>Hello World!</h1>
    </body>
</html>
