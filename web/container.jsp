<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>GLOBLE EDUCATION NETWORK</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <script src="js/jquery.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js" ></script>
        <style>
            .header
            {
                position: fixed;
                top:0px;
                min-height: 120px;
                width: 100%;
                background-color: #0f0f0f;
                z-index: 2;
            }
           .footer{
                position: fixed;
                bottom: 0px;
                min-height: 50px;
                width: 100%;
                background-color: #101010;
                color: #ffffff;
                padding: 10px;
            }
        </style>
        <script>
            window.history.forward();
        </script>
    </head>
    <body>
    <haeder class="header">
        <div class="row">
            <div class="col-md-4">
                <a href="#" class="navbar-brand">GLOBLE EDUCATION NETWORK</a>
            </div>
            <div class="col-md-7">
                <img src="img/hey.png" style="width: 300px;height:120px;">
            </div>
            <div class="col-md-1">
                <br><br>
                <a href="home.jsp">
                    <span class="glyphicon glyphicon-log-out"></span>
                </a>
            </div>
        </div>
    </haeder>
    <br><br><br><br><br><br>
    <div class="container">
        <h3 class="text text-center text-success">WELLCOME</h3>
        
      <div class="row">
          <div class="col-md-4">
              <div class="well">
                  <p class="bg bg-warning text-primary">Books,</p>
                  <img src="img/book3.jpg" style="width: 300px;height: 200px;"> 
                  <br><br>
                  <p class="text text-primary">Download and upload books,</p>
                  <br>
                  <a href="books.jsp"><button type="button" class="btn btn-success btn-block">Click here</button></a>
              </div>
          </div>
          <div class="col-md-4">
              <div class="well">
                   <p class="bg bg-warning text-primary">Quiz,</p>
                  <img src="img/quiz.jpg" style="width: 300px;height: 200px;"> 
                  <br>
                  <div class="text text-danger text-justify">
                  <h4> Why quiz is important?</h4>
                     <%
                      String pth=getServletContext().getRealPath("content");
                      File fp=new File(pth+"//more_quiz.txt");
                      BufferedReader br=new BufferedReader(new FileReader(fp));
                      String tmp="";
                      while((tmp=br.readLine())!=null){
                          out.print(tmp);
                      }
                      br.close();
                     %>
                  </div>
                  <br>
                  <a href="quick_quiz.jsp"><button type="button" class="btn btn-primary btn-block">Go to quiz</button></a>
              </div>
          </div>
          <div class="col-md-4">
              <div class="well">
                   <p class="bg bg-warning text-primary">Solution,</p>
                  <img src="img/sing.jpg" style="width: 300px;height: 190px;">
                  <br><br>
                  <div class="text text-danger text-justify">
                      <%
                        String path=getServletContext().getRealPath("content");
                        fp=new File(path+"//solutn.txt");
                        br=new BufferedReader(new FileReader(fp));
                        while((tmp=br.readLine())!=null){
                            out.print(tmp);
                        }
                        br.close();
                      %>
                      
<button type="button" class="btn btn-link" data-toggle="collapse" data-target="#soln">Read more</button>
<div id="soln" class="collapse">
                    <%
                        path=getServletContext().getRealPath("content");
                        fp=new File(path+"//more_soltn.txt");
                        br=new BufferedReader(new FileReader(fp));
                        while((tmp=br.readLine())!=null){
                            out.print(tmp);
                        }
                        br.close();
                    %>
</div>
<br><br>
<a href="#"><button type="button" class="btn btn-info btn-block">Go to solution</button></a>

                  </div>
              </div>
          </div>
      </div>
    </div>   
    <br><br><br>
     <footer class="footer">
         <center>&copy; 2019 GLOBLE EDUCATION NETWORK</center>  
     </footer>
    </body>
</html>
