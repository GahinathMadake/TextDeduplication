
<%@page import="control.time1111"%>
<%@page import="control.time111"%>
<%@page import="control.time11"%>
<%@page import="control.time1"%>
<%@page import="org.jfree.ui.RefineryUtilities"%>
<%@page import="control.time"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            time demo = new time("Graph");
             demo.pack();
        RefineryUtilities.centerFrameOnScreen(demo);
        demo.setVisible(true);
        
        time1 demo1 = new time1("Graph");
             demo1.pack();
        RefineryUtilities.centerFrameOnScreen(demo);
        demo1.setVisible(true);
        
        time11 demo11 = new time11("Graph");
             demo11.pack();
        RefineryUtilities.centerFrameOnScreen(demo11);
        demo11.setVisible(true);
        
        time111 demo111 = new time111("Graph");
             demo111.pack();
        RefineryUtilities.centerFrameOnScreen(demo111);
        demo111.setVisible(true);
        
        
        time1111 demo12 = new time1111("Graph");
             demo12.pack();
        RefineryUtilities.centerFrameOnScreen(demo12);
        demo12.setVisible(true);
        
            response.sendRedirect("home.jsp");
            
            %>
    </body>
</html>
