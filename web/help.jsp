<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Help Page</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <script src="js/jquery.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js" ></script>
        <style>
            .header{
                position: fixed;
                top:0px;
                width: 100%;
                min-height: 90px;
                background-color: #0f0f0f;
                color: #ffffff;
                font-weight: bold;
                font-size: 40pt;
                z-index: 1;
            }
            .footer{
                position: fixed;
                bottom: 0px;
                width: 100%;
                min-height: 40px;
                background-color: #265a88;
                color: #ffffff;
                font-weight: bold;
            }
            p{
                font-weight: bold;
                font-size: 20px;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div class="row">
                <div class="col-md-5">
                    <div class="navbar-brand">
                        GLOBLE EDUCATION NETWORK
                    </div>
                </div>
                <div class="col-md-5">
                    Help 
                </div>
                <div class="col-md-2">
                    <a href="home.jsp">
                    <span class="glyphicon glyphicon-home" style="padding: 10px;"></span>
                    </a>
                </div>
            </div>
            
        </div>
        <br><br><br>
        <br><br><br>
        
        <div class="container">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <br>
                    <p class="text-primary ">How to create user account ?</p>
                    <br><br>
                    <video muted controls="true" height="400px" width="100%">
                        <source src="help/help1.mp4" type="video/mp4"></source>
                    </video>
                    <br><br>
                    <p class="text-primary ">How to login account ?</p>
                    <br><br>
                    <video muted controls="true" height="400px" width="100%">
                        <source src="help/help2.mp4" type="video/mp4"></source>
                    </video>
                    <br><br><br>
                </div>
                <div class="col-md-2"></div>
            </div>
            
        </div>
        
        <div class="footer">
            <center> 
                <p style="padding: 10px;">&copy; 2019 GLOBLE EDUCATION NETWORK</p>
            </center>
        </div>
        <br><br><br>
    </body>
</html>
