<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Utils.DbConnector"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>fastpage | About</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/arial.js"></script>
        <script type="text/javascript" src="js/cuf_run.js"></script>
        <script type="text/javascript" src="js/radius.js"></script>

        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <link rel="stylesheet" href="/resources/demos/style.css" />



    </head>


    <body>
        <% if (request.getParameter("m") != null) {
                session.setAttribute("adminUid", request.getParameter("m").toString());
                System.out.println(request.getParameter("m").toString());
            }
        %>

        <div class="main">
            <div class="header">
                <div class="header_resize">
                    <div class="logo"> <img src="images/logo_img.gif" alt="" width="51" height="48" />
                        <h2 style="width: 1000px;"><a href="#"><span style="color: #0d2c52;font-size: larger">Privacy preserving Delegated Access </span><span style="font-size: larger">Control in public Clouds</span></a></h2>
                    </div>
                    <div class="clr"></div>
                    <div class="menu_nav">
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a href="HomePage.jsp">LogOut</a></li>
                        </ul>
                        <div class="search">
                            <form id="form" name="form" method="post" action="#">
                                <span>
                                    <input name="q" type="text" class="keywords" id="textfield" maxlength="50" value="Search..." />
                                    <input name="b" type="image" src="images/search.gif" class="button" />
                                </span>
                            </form>
                        </div>
                    </div>
                    <div class="clr"></div>
                    <div class="header_img"> <img src="images/jpimage.jpg" alt="" width="960" height="326" /></div>
                </div>
            </div>
            <div class="clr"></div>
            <div class="content">
                <div class="content_resize">
                    <div class="mainbar">
                        <div class="article">
                            <h2 style="font-size: 50px;">Server Details</h2>
                            <div class="clr"></div>
                            <table  style="width:45%;position:absolute;">
                                <tr bgcolor="#FFFFCC" style="font-family:verdana;font-size:12px;">

                                    <td height="36">Host Name</td>
                                    <td>Username</td>
                                    <td>Password</td>
                                </tr>
                                <%
                                    String host = null, name = null, pass = null, mail = null, pdfass = null, mobile = null, gen = null, blood = null, dis = null, zip = null;
                                    Connection con = null;
                                    // String names = request.getParameter("name");
                                    // String mails = request.getParameter("mail");
                                    // String passs = request.getParameter("password");
                                    try {
                                        con = DbConnector.getConnection();
                                        Statement st = con.createStatement();
                                        String query1 = "select * from adserver ";//where name = '"+names+"'";// "+" AND email = '"+mail+"' ";
                                        ResultSet rs = st.executeQuery(query1);

                                        while (rs.next()) {

                                            host = rs.getString("host_name");
                                            name = rs.getString("username");
                                            pass = rs.getString("password");

                                %>
                                <tr style="font-family:verdana;font-size:12px;"> 
                                    <td> <font color="green"><%=host%></font> </td>
                                    <td> <font color="#804040"><%=name%></font> </td>
                                    <td> <font color="red"><%=pass%></font> </td>

                                    <%


                                            }


                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }


                                    %>
                            </table>
                        </div>

                    </div>
                    <div class="sidebar">
                        <div class="gadget">
                            <h2 class="star">Menu</h2>
                            <div class="clr"></div>
                            <ul class="sb_menu">
                                <li><a href="AdminPage.jsp">Back</a></li>

                            </ul>
                        </div>

                    </div>
                    <div class="clr"></div>
                </div>
            </div>
                            <div class="fbffg" style="margin-top: 300px;">

                <div class="footer">
                    <p  class="lf">Get More  from <a target="_blank" href="http://www.jpinfotech.org">JPINFOTECH</a></p>
                    <div class="clr"></div>
                </div>
            </div>
        </div>
    </body>
</html>
