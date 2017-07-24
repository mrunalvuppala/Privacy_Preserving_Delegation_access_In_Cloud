
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
                    Statement st = conn.createStatement();
                    String qqq = "select * from filereq where fname= '" + f + "' ";
                    ResultSet rs1 = st.executeQuery(qqq);

                    if (rs1.next()) {
                        String c = rs1.getString("status");
                        //System.out.println(b);
                        if (c.equalsIgnoreCase("response sent")) {
                            response.sendRedirect("fileD.jsp?uu=" + f);
                        } else {
                            response.sendRedirect("Utrans.jsp?oo=request not activated..");
                        }
                    }
        %>

    </body>
</html>s