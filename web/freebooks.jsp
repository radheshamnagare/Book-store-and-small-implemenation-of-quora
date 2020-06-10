<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@page import="constant.loginValidation" %>
<%
    session.setAttribute("action", "book");
%>
<html>
    <head>
        <title>Free Books</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <script src="js/jquery.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js" ></script>
        
        <style>
            .header{
                position: fixed;
                top: 0px;
                min-height: 80px;
                width: 100%;
                font-size: 40PX;
                color: #ffffff;
                background-color: #101010;
            }
            .footer{
                position: fixed;
                bottom: 0px;
                min-height: 50px;
                width: 100%;
                background-color: #101010;
                color: #ffffff;
            }
        </style>
    </head>
    <body>
        <header class="header">
            <div class="row">
                <div class="col-xs-4">
                    <a href="#" class="navbar-brand">
                        GLOBLE EDUCATION NETWORK
                    </a>
                </div>
                <div class="col-xs-7">
                    BOOKS
                    <img src="img/bk.jpg" style="width:200px;height: 80px;" />
                </div>
                <div class="col-xs-1">
                    <a href="home.jsp">
                        <span class="glyphicon glyphicon-home" style="padding-top: 10px;"></span>
                    </a>
                </div>
            </div>
        </header>
        <br><br><br><br><br>
        <div class="container">
            <div class="alert alert-danger alert-dismissable">
                <a href="#" class="close" data-dismiss="alert">&times;</a>
                You must login and download more free books
            </div>
            <br><br>
            <div class="row">
                <div class="col-xs-6">
                    <div class="well">
                      hii,<br>
                      <div class="text-justify text-primary">
                      GLOBLE EDUCATION NETWORK PROVOID MORE BOOKS FOR
                      EDUCATION PURPOSE, MANY PEOPLE DOWNLOAD ADN UPLOAD BOOKS.
                      MAIN AIM OF THESE COMUNITY TO HELP STUDENT IN IT'S EDUCATION LIFE.
                      </div>
                      <br><br>
                      <p class='text-warning'>click on singup button and download,upload books</p>
                      <br>
                      <a href="loginu.jsp"><button type="button" class='btn btn-success'>login</button></a>
                     </div>
                </div>
                <div class="col-xs-6">
                    <div class="well">
                    <img src="img/book.jpg" class="img img-rounded" style="width: 400px;height: 200px;">
                    <br><br>
                    <h3 class="text text-primary bg-info">Need of Book?</h3>
                    <br>
                    <div class="text text-primary text-justify">
                         Books plays an important role in in our life. It is said that books are our best companions.
 Books are our friends in a real sense. They demand nothing from us. They give us plenty of
 joy. We also learn a lot from them. They take us into a different world of imagination.
 <br>
 <button type="button" class="btn btn-success btn-sm" data-toggle="collapse" data-target="#bk">Read more</button>
<div id="bk" class="collapse"> 
 A books consists of long written work.Good books improve our standard of living. They tone up our intellectual
 taste they make our outlook broad.Books encourage us when we are defeated. They inspire us to work hard with hope and courage.
 They remove our ignorance and add to our knowledge. Books enrich our experience and sharpen
 our intellect. Thus a good book is our true friend.
</div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br><br>
        <footer class="footer">
            <div class="row">
                <div class="col-xs-5"></div>
                <div class="col-7">
                    <div class="navbar-brand">
                        &copy; 2019 GLOBLE EDUCATION NETWORK
                    </div>
                </div>
            </div>  
        </footer>
    </body>
</html>
