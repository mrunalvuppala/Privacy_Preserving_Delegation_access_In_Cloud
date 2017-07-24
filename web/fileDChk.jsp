
<%@page import="Utils.DbConnector"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="actionS.mailAction"%>
<html>
    <head>
        <title>fastpage | About</title>
        <script language="JavaScript">

        </script>
    </head>

    <body>
        <%



                    //String us = session.getAttribute("userId").toString();
                    //System.out.println(us);

                    String f = request.getQueryString();
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DbConnector.getConnection();

                    Statement stmt = conn.createStatement();
                    System.out.println("File is : " + f);
                    System.out.println((String) session.getAttribute("userMailID"));
                    ResultSet rs = stmt.executeQuery("select * from adowner where mail = (select mail from upload where file_name = '"+f+"')");
                    mailAction ma = new mailAction();
                    String receipents[] = new String[1];
                    receipents[0] = "";
                    if (rs.next()) {
                        System.out.println((String) session.getAttribute("userMailID"));
                        ma.postMail(receipents, "Owner Key", rs.getInt("key"), "", (String) session.getAttribute("userMailID"));
                        session.setAttribute("OwnerKey", String.valueOf(rs.getInt("key")));
                        response.sendRedirect("userDOChk.jsp?fileName="+f);
                    }
        %>

    </body>
</html>