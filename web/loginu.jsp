<%@page import="java.sql.*" %>
<%@page session="true" %>
<%@page import="constant.loginValidation" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>                                
<%!
    boolean un=false;
    String usr=null;
    
%>
<% 
     usr=request.getParameter("t1");
     if(usr!=null)
     {
         un=new loginValidation(usr).un;
         
         if(un)
         {
             session.setAttribute("user",usr);
             response.sendRedirect("loginp.jsp");
         }
         else
         {
             out.print("<script>"
                     + "alert('wrong username');"
                     + "</script>");
         }
     }
   
%>
<html>
    <head>
        <title>Login</title>
       <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <script src="js/jquery.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js" ></script>
        <style>
            header
            {
               position: fixed;
               top:0px;
               min-height: 80px;
               width: 100%;
               color: #ffffff;
               font-size: 50px;
               font-weight: bold;
               background-color: #0f0f0f;
            }
            footer
            {
                position: fixed;
                bottom: 0px;
                min-height: 40px;
                width: 100%;
                color:#ffffff;
                background-color: #0f0f0f;
            }
        </style>
    </head>
    <body>
     
      
        <header>
            <div class="row">
                <div class="col-xs-4">
                    <a href="#" class="navbar-brand">GLOBLE EDUCATION NETWORK</a>
                </div>
                <div class="col-xs-6">
                    LOGIN ACCOUNT
                </div>
                <div class="col-xs-2">
                    <a href="home.jsp">
                        <span class="glyphicon glyphicon-off" style="padding: 10px;"></span>
                    </a>
                </div>
            </div>
        </header>
        <br><br><br><br><br><br>
        <div class="container">
            <div class="row">
                <div class="col-xs-4"></div>
                <div class="col-xs-4">
                    <div class="well"> 
                        <img src="profile/user.jpg" style="width: 200px;" class="img img-thumbnail">
                        <br><br>
                        <form class="form-group" method="POST" action="loginu.jsp">
                        <label id="id1">Username :</label>
                        <input type="text" name="t1" class="form-control" style="width:300px;"/>
                        <br><br>
                        <button type="reset" class="btn btn-danger ">RESET</button>
                        <button type="submit" class="btn btn-success ">NEXT</button>
                        <br><br>
                        
                    </form>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <div class="row">
                <div class="col-xs-5"></div>
                <div class="col-xs-7">
                    &copy; 2019 GLOBLE EDUCATION NETWORK
                </div>
            </div>
        </footer>
     
        <script>
            window.history.forward();
        </script>      
    </body>
</html>
