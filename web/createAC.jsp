
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
     <title>CREATE ACCOUNT</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <script src="js/jquery.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js" ></script>
        <style>
            .header
            {
                position: fixed;
                top:0px;
                width: 100%;
                height: 80px;
                color: #ffffff;
                background-color: #080808;
                z-index: 2;
            }
            .footer
            {
                
                position: fixed;
                bottom: 0px;
                width: 100%;
                color:#ffffff;
                min-height:50px;
                background-color: #080808;   
            }
            h1
            {
                font-weight: bold;
                color:#ffffff;
                font-size: 30px;
            }
          
        </style>
        <script>
            window.history.forward();
        </script>
    </head>
    <body>
        <script>
            function validation(val,x)
            {
                
                var i=/^[a-zA-Z]+$/;
                var a=val;
                
                 if(!a.match(i)){
                   alert('this field allow only charecter');   
                      p=document.getElementById(x);
                      p.value="";
                   }
            }
            function passwordValidation(val,x)
            {
                var i=/^[0-9A-Za-z!@$%*]+$/;
                
                if(!val.match(i))
                {
                    alert('password allow 0-9,@,%,$,*,a-z,A-Z');
                    p=document.getElementById(x);
                    p.value="";
                }
            }
        </script>
           <div class="header">
               <div class="row">
                   <div class="col-xs-4">
                      
                           <a href="#" class="navbar-brand">GLOBLE EDUCATION NETWORK</a>
                   </div>
                   <div class="col-xs-4">
                       <h1>CREATE ACCOUNT</h1>
                   </div>
                   <div col-xs-4>
                       <a href="home.jsp">
                           <span class="glyphicon glyphicon-home" style="padding: 30px;left:300px;"></span>
                       </a>
                   </div>
               </div>
            </div>  
        <br><br><br><br><br>
        <div class="container">
            <div class="alert alert-danger alert-dismissable"  >
                        <a href="#" class="close" data-dismiss="alert">&times;</a>
                        <div>
                            Pleaze Fill Proper Information
                        </div>
             </div>
            <div class="row">
                
                <div class="col-xs-12">
                    
                    <form method="POST" action="reg.jsp" enctype="multipart/form-data">
                        <div class="well col-md-6">
                        <label for="id1">First Name :</label>
                        <input id="id1" class="form-control" type="text" name="fn" style="width:400px;" placeholder="first name" maxlength="20"onkeyup="validation(this.value,'id1');"/>
                        <br>
                        <label for="id2">Last Name:</label>
                        <input id="id2" class="form-control" type="text" name="ln" style="width: 400px;" placeholder="last name" maxlength="20" onkeyup="validation(this.value,'id2');"/>
                        <br>
                        <label>Upload Your Profile :</label>
                        <input type="file" class="form-control" name="profl" style="width: 400px;" placeholder="upload profile"/>
                        <br>
                        <label for="id3">Email :</label>
                        <input id="id3" class="form-control" type="email" name="emil" style="width: 400px;" placeholder="example@gmail.com"/>
                        <br>
                        </div>
                       
                        <div class="well col-md-6">
                        <label for="id4">Username :</label>
                        <input id="id4" class="form-control" type="text" name="un" style="width: 400px;" placeholder="root" maxlength="12" onkeyup="validation(this.value,'id4');"/>
                        <br>
                        <label for="id5">Password :</label>
                        <input id="id5" class="form-control" type="password" name="p1" style="width: 400px;" placeholder="root@123" maxlength="12" onkeyup="passwordValidation(this.value,'id5');"/>
                        <br>
                        <label for="id6">Set Security Quation :</label>
                        <select id="id6" class="form-control" style="width: 400px;" name="qua">
                            <option>what is your nickname ?</option>
                            <option>what is your favorate start?</option>
                            <option></option>
                            <option></option>
                        </select>
                        <br>
                        <label for="id7">Answar :</label>
                        <input id="id7" class="form-control" type="password" name="ans" style="width: 400px;" placeholder="root@123" maxlength="12" onkeyup="validation(this.value,'id7');"/>
                        <br>
                        </div>
                        <br><br>
                        <div class="col-md-4"></div>
                        <div class="col-md-8">
                        <button type="reset" class="btn btn-danger">RESET</button>
                        <button type="submit" class="btn btn-success">SUBMIT</button>
                        </center>
                        </div>
                   </form>
                        
                </div>
            </div>
        </div>
        <br><br>
        <footer class="footer">
            <div class="row">
                <div class="col-xs-5"></div>
                <div class="col-xs-4">
                    <a href="#" class="navbar-brand">&copy; 2019 GLOBLE EDUCATION NETWORK</a>
                </div>
            </div>
        </footer>
    </body>
</html>
