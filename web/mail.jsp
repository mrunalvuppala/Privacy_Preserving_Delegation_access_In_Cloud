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

<script>
    function check(){
        var a = document.f.toA.value;
       if(a=="") {
                    alert("Enter Your email");
                    document.f.toA.value;
                    return false;
                }
                   if (a.indexOf("@", 0) < 0)
                {
                    alert("Please enter a valid e-mail address.");
                    document.f.toA.value;
                    return false;
                }
                if (a.indexOf(".", 0) < 0)
                {
                    
                    alert("Please enter a valid e-mail address.");
                  document.f.toA.value;
                    return false;
                }
    }
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
  
  <div id="splash"style="margin-left:280px;">
                    &nbsp;&nbsp;&nbsp; <span style="font-size: 22px;">Compose Mail</span>
                  <%if (request.getParameter("msg") != null) {
                                out.println(request.getParameter("msg"));
                            }%>
                        
                            <form method="post" name="f" action="mailAction" onSubmit="return check();">
                        <table width="90%"
                               border="20" style="width: 250px; color: royalblue;border-style:solid;
border-color:turquoise turquoise;">
                          
                                   
                              
                            <tr style="height: 40px;"><td><strong>To:</strong></td><td><input type="text" name="to" id="toA" style="width: 300px; height: 32px;font-size: 18px;font-weight:bold;"/></td></tr>
                                
                            <tr style="height: 40px;"><td><strong>Subject:</strong></td><td> <input type="text"  name="subject" style="width: 300px; height: 32px;font-size: 18px;font-weight:bold;"/></td> </tr>
                            
                            <tr style="height: 40px;"><td><strong>Message:</strong></td><td> <input type="text" name="message" style="width: 300px; height: 32px;font-size: 18px;font-weight:bold;"/></td> </tr>
                                 
                            <tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input  type="submit" value="Send" style="font-size: 20px;"/>
                                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="Cancel" style="font-size: 20px;"/></td></tr>
                                   
                                   
                                    
                                    
                        </table>
                    </form>
                                  
                                  

                </div>
  
  

  <div class="fbg">
  
    <div class="footer">
        <p  class="lf">Get More  from <a target="_blank" href="http://www.jpinfotech.org">JPINFOTECH</a></p>
      <div class="clr"></div>
    </div>
  </div>
</div>
</body>
</html>
