<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Simple Sign Up Form by PremiumFreeibes.eu</title>

	<!---------- CSS ------------>
	<link rel="stylesheet" type="text/css" href="./css/style2.css">

              <script language="JavaScript">
            function valid() {
                var1 = document.f.name.value;
                var2 = document.f.password.value;
                var3 = document.f.email.value;
                var4 = document.f.phone.value;
                var5 = document.f.place.value;
                
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
                    
                    return false;
                }
                if (var3.indexOf(".", 0) < 0)
                {
                    alert("Please enter a valid e-mail address.");
                  
                    return false;
                }
                
                 if (var4 == "")
                {
                    alert("Enter Your phone");
                    document.f.phone.value;
                    return false;
                }
                 if (!/^[0-9]{10}$/.test(var4)) {
                    alert("Please input exactly 10 numbers!");
                    return false;
                }
                
                 if (var5 == "")
                {
                    alert("Enter Your place");
                    document.f.place.value;
                    return false;
                }
                
              }
        </script>
</head>

    <body style="color: #2cadff ;background-color: cornflowerblue">

    <!--BEGIN #signup-form -->
    <div id="signup-form">
        
        <!--BEGIN #subscribe-inner -->
        <div id="signup-inner">
        
        	<div class="clearfix" id="header">
        	
        		<img id="signup-icon" src="./images/logo_img.gif" alt="" />
        
                        <h1 style="margin-left: 55px; font-size: 36px;color: slateblue;">Owner Registration</h1>

            
            </div>

            
            <form name="f" action="ownerReg" method="post" onSubmit="return valid();">
            	
                <p>

                <label for="name">UserName </label>
                <input id="name" type="text" name="name" value="" />
                </p>
                
                <p>
                <label for="Password">PassWord </label>
                <input id="company" type="password" name="password" value="" />
                </p>
                
                <p>

                <label for="email">Email </label>
                <input id="email" type="text" name="email" value="" />
                </p>
                
                
                <p>

                <label for="phone">Phone</label>
                <input id="phone" type="text" name="phone" value="" />
                </p>
                
                <p>
                <label for="country">Place</label>
                <input id="Country" type="text" name="place" value="" />
                </p>
                
                
                <p>

                <button id="submit" type="submit">Submit</button>
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

</body>
</html>
