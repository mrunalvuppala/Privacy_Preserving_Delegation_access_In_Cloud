<%--
    Document   : transAction
    Created on : Aug 12, 2013, 5:35:52 PM
    Author     : jp
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="Utils.DbConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%

        Connection con = DbConnector.getConnection();
        Statement st = con.createStatement();
        int u = st.executeUpdate("update filereq set status ='Request Sent' where fname = '"+request.getQueryString()+"'");
        if(u!=0){
            response.sendRedirect("trans.jsp");
        }


      %>
    </body>
</html>
