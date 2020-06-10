<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="constant.*" %>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%!
 File fp=null;
 String path="";
 String au="",ap="";
%>
<%
    try{
        
        au=request.getParameter("au");
        ap=request.getParameter("ap");
        
        if(au.length()!=0 && ap.length()!=0){
            boolean st=new AdminUser().Admin(au, ap);
            if(st)
                out.print("<script>"
                        + "window.location.href='admin.jsp'"
                        + "</script>");
        }
    }catch(Exception e){
        
    }
%>
<html>
    <head>
        <title>GLOBLE EDUCATION NETWORK</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <script src="js/jquery.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js" ></script>
        <style>
            
         
            .footer
            {
                position: fixed;
                bottom: 0px;
                min-height:20px;
                width:100%;
                background-color:#0f0f0f;
                color: #ffffff;
            }
            
            
        </style>
        
    </head>
    <body data-spy="scroll" data-target=".navbar" data-offset="50">  
        <script>
            function validate(v1,v2){
                if(v1=="" || v2=="" || v1==null || v2==null)
                    return false;
                else
                    return true;
            }
        </script>
        <div class="container-fluid">
            <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu1">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div class="navbar-brand">Globle Education Network</div>
                </div>
                <div id="menu1" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#" >Home</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                Technology<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#techno1">HTML</a></li>
                                    <li><a href="#" class="divider"></a></li>
                                    <li><a href="#techno2">CSS</a></li>
                                    <li><a href="#" class="divider"></a></li>
                                    <li><a href="#techno3">JavaScript</a></li>
                                </ul>
                        </li>
                        <li class="active"><a href="#tech" >About</a></li>
                        <li class="active">
                            <a href="#admin" data-toggle="modal" data-target="#admin">Admin</a>
                        </li>
                        <li class="active">
                            <a href="#reprt" data-toggle="modal" data-target="#reprt">Report</a>
                        </li>
                    </ul>
                </div>
            </div>    
        </div>
    <br><br><br><br>
    <div class="container">
        <div id="admin" class="modal fade">
           
                <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <a class="close" data-dismiss="modal">&times;</a>
                        <p class="modal-title">ADMIN</p>
                       </div>
                        <div class="modal-body">
                            <form id="admin_form" method="post" action="home.jsp" onsubmit="return validate(au.value,ap.value)">
                                <label>username :</label>
                                <input class="form-control" type="text" name="au" style="width:300px;s" />
                                <br>
                                <label>Password :</label>
                                <input class="form-control" type="password" name="ap" style="width:300px;" />
                                <br><br>
                            </form>
                        </div> 
                        <div class="modal-footer">
                            <button form="admin_form" type="submit" class="btn btn-success">submit</button>
                            <button class="btn btn-danger" data-dismiss="modal">close</button>
                        </div>
                    </div>
                </div>
            
        </div>
    </div>
    <div class="container">
        <div id="reprt" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a href="#" class="close" data-dismiss="modal">&times;</a>
                        <h4 class="text text-primary">Report</h4>
                        <br><hr>
                        <%
                          try
                          {
                              String path=getServletContext().getRealPath("counter");
                              File f;
                              f=new File(path+"//book_download.txt");
                              BufferedReader br;
                              br=new BufferedReader(new FileReader(f));
                              String tmp="";
                            
                              
                              f=new File(path+"//book_upld.txt");
                              br=new BufferedReader(new FileReader(f));
                              if(f.exists())
                              {
                                    while((tmp=br.readLine())!=null)
                                    {
                                        out.print("<br><p class='text text-danger'>Total Book Upload :"+tmp+"</p>");
                                        break;
                                    }
                              }
                              f=new File(path+"//quiz_play.txt");
                              br=new BufferedReader(new FileReader(f));
                              if(f.exists())
                              {
                                    while((tmp=br.readLine())!=null)
                                    {
                                        out.print("<br><p class='text text-danger'>Total Quiz play :"+tmp+"</p>");
                                        break;
                                    }
                              }
                              
                          }catch(Exception e)
                          {
                              out.print(""+e);
                          }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
      <div class="row"> 
          <div class="col-xs-2 bg-success">
              <table class="table table-striped table-responsive" style="background-color:ghostwhite;position:fixed;height:72%;width:15%;">
                            <tr>
                                <td class="text text-warning">
                                    <a href="help.jsp">HELP <span class="glyphicon glyphicon-question-sign"></span></a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="createAC.jsp">
                                        CREATE ACCOUNT <span class="glyphicon glyphicon-user"></span>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="desition.jsp">
                                        LOGIN <span class="glyphicon glyphicon-log-in"></span>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="quiz.jsp">
                                    QUIZ <span class="glyphicon glyphicon-time">
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="freebooks.jsp">
                                       FREE BOOKS <span class="glyphicon glyphicon-book">
                                   </a>    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="soln.jsp">
                                    SOLUTION <span class="glyphicon glyphicon-ok">
                                    </a>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                   <a href="Comment.jsp"> 
                                      FEEDBACK <span class="glyphicon glyphicon-comment">
                                    </a>   
                                </td>
                            </tr>
              </table>
          </div>   
          <div class="col-xs-10 bg-success">
        <div id="caro1" class="carousel slide" data-ride="carousel">
            <div class="carousel-indicators">
                <li data-target="#caro1" data-slide-to="0" class="active"></li>
                <li data-target="#caro1" data-slide-to="1"></li>
                <li data-target="#caro1" data-slide-to="2" ></li>
            </div>
            <div class="carousel-inner">
                <div class="item active">
                    <img src="img/img1.jpg" style="width:100%;">
                    <div class="carousel-caption">
                        GLOBLE EDUCATION NETWORK Provoid online free
                        books you can upload and download books 
                    </div>
                </div>
                <div class="item ">
                    <img src="img/img2.jpg" style="width:100%;">
                    <div class="carousel-caption">
                        GLOBLE EDUCATION NETWORK Provoid online quiz
                        for create knowledege and chalenges
                    </div>
                </div>
                <div class="item ">
                    <img src="img/img3.jpg" style="width:100%;">
                    <div class="carousel-caption">
                        GLOBLE EDUCATION NETWORK Provoid online help
                        for technical questionaries ?
                        find more solution
                    </div>
                </div>
            </div>
             <a class="left carousel-control" href="#caro1" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
    </a>
    <a class="right carousel-control" href="#caro1" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
    </a>
    </div>
    </div>
      </div>
    </div>
    
       <br><br><br><br>
       <div class="container">
           <div class="row">
               <div class="col-md-3"></div>
               <div class="col-md-9">
                   <div id="tech">
                       <h1>
                           <p style="font-weight:bold" class="text text-primary bg bg-info">WELCOME TO GLOBLE EDUCATION NETWORK</p>
                       </h1>
                       <br><br>
                       <div class="well">
                           <img style="width: 400px;" src="img/them.jpg" class="img-thumbnail">
                           <br><br>
                           <div class="text">
                           <%
                           try{
                                 path=getServletContext().getRealPath("content");
                                 fp=new File(path+"//about.txt");
                                 BufferedReader br=new BufferedReader(new FileReader(fp));
                                 while(true)
                                 {
                                    String tmp="";
                                    if((tmp=br.readLine())!=null){
                                        if(tmp=="<br>")
                                            out.print("<br>");
                                        else
                                        out.print(tmp);
                                    }else{
                                        break;
                                    }
                                 }
                                 br.close();
                                   }catch(Exception e){
                                       out.print(""+e);
                                   }
                                   %>
                           </div>
                       </div>
                   </div>
                   <br><br><br><br>
                   <br><br>
                   <h2 class="text-success bg-danger" style="font-weight: bold;">TECHOLOGY</h2>
                   <div id="techno1">
                       <div class="well">
                           <img style="width:400px;" src="img/html.jpg" class="img img-thumbnail">
                           <br><br>
                           <div class="text-primary text-justify">
                               <h3><u>GLOBLE EDUCATION NETWORK PROVOID HTML Questionary in Quiz</u></h3>
                               <br><br>
                               <%
                                   try{
                                 path=getServletContext().getRealPath("content");
                                 fp=new File(path+"//html.txt");
                                 FileInputStream fp1=new FileInputStream(fp);
                                 while(true)
                                 {
                                     int ch=fp1.read();
                                     if(ch==-1)
                                         break;
                                     out.print((char)ch);
                                 }
                                 fp1.close();
                                   }catch(Exception e){
                                       out.print(""+e);
                                   }
                                       
                               %>
                               <br><br><br>
                          </div>
                       </div>                    
                   </div>
                   <br><br><br>
                   <div id="techno2">
                       <div class="well">
                           <img style="width:400px;" src="img/css.png" class="img img-thumbnail">
                           <br><br>
                           <div class="text-success text-justify">
                               <h3><u>GLOBLE EDUCATION NETWORK PROVOID CSS Questionary in Quiz</u></h3
                               <br><br>
                               <%
                               try{
                                 path=getServletContext().getRealPath("content");
                                 fp=new File(path+"//css.txt");
                                 FileInputStream fp1=new FileInputStream(fp);
                                 while(true)
                                 {
                                     int ch=fp1.read();
                                     if(ch==-1)
                                         break;
                                     out.print((char)ch);
                                 }
                                 fp1.close();
                                   }catch(Exception e){
                                       out.print(""+e);
                                   }
                                   
                               %>
                               <br><br>
                           </div>
                       </div>
                   </div>
                   <div id="techno3">
                       <div class="well">
                           <img style="width:400px;" src="img/javascript.png" class="img img-thumbnail">
                           <br><br>
                           <div class="text-info text-justify">
                               <h4><u>GLOBLE EDUCATION NETWORK PROVOID JavaScript questionary in Quiz:</u></h4><br>
                               <%
                               try{
                                   fp=new File(path+"//javascript.txt");
                                   BufferedReader br=new BufferedReader(new FileReader(fp));
                                   
                                   while(true){
                                      String tmp=br.readLine();
                                       if(tmp!=null)
                                       out.print(tmp);
                                       else
                                           break;
                                   }
                                   br.close();
                               }catch(Exception e){
                                   out.print(""+e);
                               }
                               %>
             
                           </div>
                       </div>
                   </div>
               </div>    
           </div>
       </div>
    </body>
   <br><br><br><br>

   <% 
       String s=(String)session.getAttribute("cnt");
       if(s==null)
       {
           s="0";
           session.setAttribute("cnt","0");
       }
       int no=Integer.parseInt(s);
       no++;
       session.setAttribute("cnt",""+no);
   %>
   <h3 class="text-center text-primary" style="font-weight:bold;">Number of unique visitors <span class="badge"> <%= no%></span></h3>
   <br><br><br><br>
    <div class="footer" >
        <center>
        <p style="font-weight:bold;"><br>&copy; 2019 GLOBLE EDUCATION NETWORK</p>
        </center>    
    </div>
    
</html>
