<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  session.setAttribute("action", "quiz");
%>
<html>
    <head>
        <title>Quiz</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <script src="js/jquery.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js" ></script>
        <style>
            .header{
             position: fixed;
             top:0px;
             min-height: 130px;
             width: 100%;
             background-color: #0f0f0f;
             color: #ffffff;
             font-size: 90px;
             font-weight: bold;
            }
            .footer{
                position: fixed;
                bottom: 0px;
                width: 100%;
                min-height: 50px;
                background-color: #101010;
                color: #ffffff;
                padding: 10px;
            }
        </style>
    </head>
    <body>
        
        <header class="header">
            <div class="row">
                <div class="col-md-4">
                    <a href="#" class="navbar-brand">GLOBLE EDUCATION NETWORK</a>
                </div>
                <div class="col-md-8">
                    Quiz
                </div>
            </div>
        </header>
        <br><br><br><br><br><br><br>
        <div class="container">
        <div class="alert alert-danger alert-dismissable">
            <a href="#notc" class="close" data-dismiss="alert">&times;</a>
            <div id="#notc">
               Before go to quiz we must singup
            </div>
        </div>
        </div>
        
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="well">
                      hii,
                      <div class="text text-primary text-justify">
                          GLOBLE EDUCATION NETWORK PROVOID QUIZ FOR
                          FOLLOWING PURPOSE:
                      <ul type="disc">
                          <li>
Quizzes are designed to promote, a fun way to study and in the process help improve 
one’s general knowledge
                          </li>
                          <li>
Quiz competitions enables students to think from different angles or simply ‘to think 
out of the box’
                          </li>
                          <li>
Quiz competitions even help build the student’s soft skills
                          </li>
                      </ul>
                      </div>
                      <br><br>
                      <a href="loginu.jsp">
                          <button type="button" class="btn btn-success">Go to Quiz</button> 
                      </a>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="well">
                        <img src="img/qiz1.jpg" style="width: 400px;height: 200px;">
                        <br>
                        <div class="text text-warning text-justify">
                           <h3> quiz</h3> 
                           <%
                            String path=getServletContext().getRealPath("content");
                            File fp=new File(path+"//quiz.txt");
                            BufferedReader br=new BufferedReader(new FileReader(fp));
                            String tmp="";
                            while((tmp=br.readLine())!=null){
                                out.print(tmp);
                            }
                           %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br><br>
        <footer class="footer">
            <center>
                &copy; 2019 GLOBLE EDUCATION NETWORK
            </center>
        </footer>
        
    </body>
</html>
