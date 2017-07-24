<%@page import="java.sql.Blob"%>
<%@page import="Utils.DbConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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

        <link rel="stylesheet" href="css/style3.css" />
        <script src="js/jq1.js"></script>
        <script src="js/jq2.js"></script>
        <link rel="stylesheet" href="/resources/demos/style.css" />
        <script>
            $(function() {
                $( "#tabs" ).tabs();
            });
        </script>
    </head>
    <body>
        <div class="main">
            <div class="header">
                <div class="header_resize">
                    <div class="logo"> <img src="images/logo_img.gif" alt="" width="51" height="48" />
                        <h2 style="width: 1000px;"><a href="#"><span style="color: #0d2c52;font-size: larger">Privacy preserving Delegated Access </span><span style="font-size: larger">Control in public Clouds</span></a></h2>
                    </div>
                    <div class="clr"></div>
                    <div class="menu_nav">
                        <ul>
                            <li><a href="userHome.jsp">Home</a></li>
                            <li><a href="read.jsp">Back</a></li>
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
           
            
            <div class="clr"></div>


            <div id="tabs" style="">
                <ul>
                    <li><a href="#tabs-3"><strong>File Data</strong></a></li>
                </ul>
           

                <div id="tabs-1">

 
               
                <%
                Connection con1 = null;
                Blob blob=null;
                String names = request.getParameter("getName");
                System.out.println("param value "+names);
                try {
                            con1 = DbConnector.getConnection();
                            Statement st1 = con1.createStatement();
                            String query11 = "select * from upload  where name = '"+names +"'  ";// "+" AND email = '"+mail+"' ";
                            ResultSet rs1 = st1.executeQuery(query11);

                            while (rs1.next()) {

                              blob  = rs1.getBlob("data");
                              
                               }
                            byte a[] = blob.getBytes(1, (int) blob.length());
                           String s = new String(a);
                            out.write(s+"\n");
                           }catch (Exception e) {
                                e.printStackTrace();
                               }
                            %>
                

                </div>
                 
                 
            </div>





           
        </div>
    </body>
</html>
