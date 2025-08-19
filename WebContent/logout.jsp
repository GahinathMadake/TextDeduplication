
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
   <%@page import="java.util.*" %>

<%session.invalidate();
response.sendRedirect("index.jsp?logout=done");
%>
    </body>
</html>
