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
  
  
  	<link rel="stylesheet" type="text/css" href="./css/style2.css">

             <script language="JavaScript">
            function valid() {
                var1 = document.f.name.value;
                var2 = document.f.password.value;
                var3 = document.f.email.value;
                var4 = document.f.mobile.value;
                var5 = document.f.addr.value;
                
                 if (var1 == "")
                {
                    alert("Enter Your Name");
                    document.f.name.value;
                    return false;
                }
                 if (var2 == "")
                {
                    alert("Enter Your Password");
                    document.f.password.value;
                    return false;
                }
                 if (var3 == "")
                {
                    alert("Enter Your email");
                    document.f.email.value;
                    return false;
                }
                
                   if (var3.indexOf("@", 0) < 0)
                {
                    alert("Please enter a valid e-mail address.");
                    document.f.email.value;
                    return false;
                }
                if (var3.indexOf(".", 0) < 0)
                {
                    alert("Please enter a valid e-mail address.");
                   document.f.email.value;
                    return false;
                }
                
                 if (var4 == "")
                {
                    alert("Enter Your phone");
                    document.f.mobile.value;
                    return false;
                }
                 if (!/^[0-9]{10}$/.test(var4)) {
                    alert("Please input exactly 10 numbers!");
                     document.f.mobile.value;
                    return false;
                }
                
                 if (var5 == "")
                {
                    alert("Enter Your Address");
                    document.f.addr.value;
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
          <li><a href="HomePage.jsp">Home</a></li>
        </ul>
        
      </div>
      <div class="clr"></div>
      <div class="header_img"> <img src="images/jpimage.jpg" alt="" width="960" height="326" /></div>
    </div>
  </div>
  <div class="clr"></div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        
          <div id="signup-form">
        
        <!--BEGIN #subscribe-inner -->
        <div id="signup-inner">
        
        	<div class="clearfix" id="header">
        	
        		<img id="signup-icon" src="./images/logo_img.gif" alt="" />
        
                        <h1 style="margin-left: 55px; font-size: 36px;color: slateblue;">Admin Registration</h1>

            
            </div> 

            
            <form name="f" action="adminReg" method="post" onSubmit="return valid();">
            	
                <p>

                <label for="name">Name </label>
                <input id="name" type="text" name="name" value="" />
                </p>
                
                <p>
                <label for="Password">PassWord </label>
                <input id="password" type="password" name="password" value="" />
                </p>
                
                <p>

                <label for="email">Email </label>
                <input id="email" type="text" name="email" value="" />
                </p>
                
                <p>

                <label for="email">Mobile </label>
                <input id="mobile" type="text" name="mobile" value="" />
                </p>

                <p>

                <label for="email">Address </label>
                <input id="addr" type="text" name="addr" value="" />
                </p>
                
                <p>

                <button id="submit" type="submit" >Submit</button>
                </p>
                
                 <p>

                     <button style="margin-left: 110px;margin-top: -50px;" id="submit" type="reset">Cancel</button>
                </p>
                
            </form>
            
		


            </div>
        
        <!--END #signup-inner -->
        </div>
        
    <!--END #signup-form -->   
    </div>
       
      </div>
      
      <div class="clr"></div>
    </div>
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
