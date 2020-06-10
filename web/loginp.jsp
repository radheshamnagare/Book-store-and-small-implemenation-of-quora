<%@page session="true" %>
<%@page import="java.sql.*" %>
<%@page import="constant.loginValidation" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>                                
<%!
    boolean psw=false;
    String pd=null;
    String prf="";
    String usr="";
    String action="";
%>
<% 
     pd=request.getParameter("t1");
     loginValidation l=new loginValidation();
     prf=l.profile(session.getAttribute("user").toString());
     usr=l.user;
     session.setAttribute("uname", usr);
     if(pd!=null)
     {
         psw=new loginValidation(session.getAttribute("user").toString(),pd).psw;
         
         if(psw)
         {
            
             action=session.getAttribute("action").toString();
             if(action.equals("book"))
             response.sendRedirect("books.jsp");
             if(action.equals("quiz"))
             response.sendRedirect("quick_quiz.jsp");
             if(action.equals("all"))
                 response.sendRedirect("container.jsp");
         }
         else
         {
             out.print("<script>"
                     + "alert('wrong password');"
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
        <script>
             function setProfile()
             {
                 y="<%=prf%>";
                x = document.getElementById("prf");
                x.setAttribute("src",y);
             }
        </script>
      
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
                        <h2>Hii,<%= usr%></h2>
                        <br>
                        <br>
                        <img id="prf"  style="width: 150px;" class="img img-circle">
                        <br><br>
                        <form class="form-group" method="POST" action="loginp.jsp">
                        <label id="id1">Password :</label>
                        <input type="password" name="t1" class="form-control" style="width:300px;"/>
                        <br>
                        <a href="#forgate" data-toggle="modal" data-target="#forgate">forgate password ?</a>
                        <br><br>
                        <button type="reset" class="btn btn-danger ">RESET</button>
                        <button type="submit" class="btn btn-success ">NEXT</button>
                        <br><br>
                    </form>
                    </div>
                </div>
            </div>
        </div>
                        <div class="container">
                        <div id="forgate" class="modal fade">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        Forgate Password
                                        <a href="#"class="close" data-dismiss="modal">&times;</a>
                                    </div>
                                    <div class="modal-body">
                                        <%
                                          String q=new loginValidation().securityQ(session.getAttribute("user").toString());
                                        %>
                                        <form id="fp" method="post" action="reset.jsp">
                                            <label>Your Security Question :</label>
                                            <input class="form-control" type="text" name="sq" value="<%=q%>"  style="pointer-events:none;"/>
                                            <label>Answare :</label>
                                            <input class="form-control" type="password" name="a" style="width: 300px;">
                                            <label>New Password :</label>
                                            <input class="form-control" type="password" name="np" style="width:300px;"/>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button form="fp" type="submit" class="btn btn-success">submit</button>
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">close</button>
                                    <br>
                                    </div>
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
        <%
            out.print("<script>"
                    + "setProfile();"
                    + "</script>");
        %>
        <script>
            window.history.forward();
        </script>
    </body>
</html>
