<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page  language="java" %>
<%@page  session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
 int crct=0;
 int uncrt=0;
 int mark=0;
 String usr="";
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz Result</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <script src="js/jquery.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js" ></script>
        <script>
            window.history.forward();
        </script>
        <style>
            .header{
                position: fixed;
                top:0px;
                min-height: 80px;
                background-color: #101010;
                width: 100%;
                color: #ffffff;
                font-size: 40px;
                font-weight: bold;
            }
            .footer{
                position: fixed;
                bottom: 0px;
                min-height: 50px;
                background-color: #1b6d85;
                width: 100%;
                color: #ffffff;
                font-weight: bold;
                font-size: 15px;
                padding: 10px;
            }
        </style>
    </head>
    <body>
        
        <%
          usr=session.getAttribute("uname").toString();
          String nm[]=new String[10];
          String qua[]=new String[10];
          String ans[]=new String[10];
          String tmp="";
          int cnt1=0,cnt2=0;
          for(int i=0;i<10;i++){
              qua[i]=request.getParameter("q"+(i+1));
          } 
          for(int i=1;i<=10;i++){
              if((tmp=request.getParameter(""+i))!=null){
                  nm[cnt1]=tmp;
                  cnt1++;
              }
              if((tmp=request.getParameter("h"+i))!=null){
                ans[cnt2]=tmp;
                cnt2++;
              }
          }
          crct=0;
          uncrt=0;
          mark=0;
          for(int i=0;i<nm.length;i++){
              if(nm[i]!=null){
               
                  if(ans[i].equals(nm[i])){
                      crct++;
                      mark+=10;
                  }
                  else{
                      uncrt++;
                  }
              }
               else{
                      uncrt++;
                  }
          }
          
         
        %>
        
       
            <div class="header">
                <div class="row">
                    <div class="col-md-5">
                        <a href="#" class="navbar-brand">GLOBLE EDUCATION NETWORK</a>
                    </div>
                    <div class="col-md-4">
                        Quiz Score
                    </div>
                    <div class="col-md-3" style="top:10px;">
                        <a href="home.jsp">
                            <span class="glyphicon glyphicon-log-out"></span>
                        </a>
                    </div>
                </div>
            </div>
        <br><br><br><br><br>
        
        <div class="container text-primary">
            Hii,  <%=usr%>
            <br>
            &nbsp;&nbsp; I hope you enjoying the quiz,
            thank you for playing quiz...
        </div> 
        <br><br><br>
        <div class="container">
            <table class="table table-bordered">
                <thead>
                    <tr class="bg bg-primary">
                        <th>No of Qua</th>
                        <th>No of correct Qua</th>
                        <th>No of Wrong Qua</th>
                        <th>Score</th>
                        <th>outof</th>
                    </tr>
                </thead>
                <tbody>
                         <td>10</td>
                         <td><%=crct%></td>
                         <td><%=uncrt%></td>
                         <td><%=mark%></td>
                         <td>100</td>
                         
                </tbody>
            </table>
        </div>
        <br><br>
        <div class="container">
            <center>
               <%
                   if(mark==0 || mark<=20){
                       out.print("<h3>Oops</h3>");
               out.print(" <img src='img/oops.jpg' class='img img-responsive' style='width:300px;'>");
                   
                   }else{
                       if(mark<=50 && mark>20)
                       out.print("<h3>Good !</h3>");
                       else if(mark<=70 && mark>50)
                       out.print("<h3>Very Good !</h3>");
                       else
                           out.print("<h3>Excelant !</h3>");
                       out.print(" <img src='img/tropy.gif' class='img img-responsive' style='width:300px;'>");
                   }
               %>
            </center>
        </div>
            <br><br>
        <div class="container">
            <div class="row">
            <div class="col-md-4">
                    <a href="#mdl1" data-target="#mdl1" data-toggle="modal">
                    Correct Anware Preview ?
                    </a>
                
                    <div id="mdl1" class="modal fade">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <a href="#" class="close" data-dismiss="modal">&times;</a>
                                <div class="modal-header">
                                    <h4 class="modal-title">Preview Question Answare</h4>
                                </div>
                                <div class="modal-body">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr class="bg bg-success">
                                                <th>Qua No</th>
                                                <th>Question</th>
                                                <th>Answare</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                             for(int i=0;i<10;i++){
                                            %>
                                            <tr>
                                                <td><%=(i+1)%></td>
                                                <td><%=qua[i]%></td>
                                                <td><%=ans[i]%></td>
                                            </tr>
                                             <%
                                                 }
                                             %>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">close</button>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
            <div class="mol-md-4"></div>
            <div class="col-md-4">
                <div class="progress" >
                  Uncorrect Answare <%=uncrt%>
                    <a href="#mdl2" data-target="#mdl2" data-toggle="modal">
                    <div class="progress-bar progress-bar-danger progress-bar-striped active" style="width:<%=uncrt*10+"%"%>;"></div>
                    </a>
                </div>
                    <div id="mdl2" class="modal fade">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                       <a href="#" class="close" data-dismiss="modal">&times;</a>
                                <div class="modal-header">
                                    <h4 class="modal-title">Wrong Answare Question</h4>    
                                </div>
                                <div class="modal-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr class="bg bg-danger">
                        <th>Qua no</th>
                        <th>Question</th>
                        <th>Wrong answare filled/not attempt qua</th>
                    </tr>
                    </thead>
                    <tbody>
                       <%
                        try{   
                         for(int i=0;i<nm.length;i++){
                          if(nm[i]==null)  { 
                       %>
                       <tr>
                           <td><%=(i+1)%></td>
                           <td><%=qua[i]%></td>
                           <td><%=nm[i]%></td>
                       </tr>
                       <%
                           }
                           else if(!nm[i].equals(ans[i]))
                           {
                         %>
                       <tr>
                           <td><%=(i+1)%></td>
                           <td><%=qua[i]%></td>
                           <td><%=nm[i]%></td>
                       </tr>
                          <%

                           }
                         }
                         }catch(Exception e){
                            out.print(""+e);
                         }
                         
                        %>
                    </tbody>
                </table>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                                        close
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
            </div>
        </div>
        
            <div class="footer">
            <div class="row">
                <div class="col-md-5"></div>
                <div class="col-md-7">
                    &copy; 2019 GLOBLE EDUCATION EDUCATION
                </div>
            </div>
            </div>
        <br><br><br><br>
    </body>
</html>
<%

     try
     {
         String path=getServletContext().getRealPath("counter");
         File f=new File(path+"//quiz_play.txt");
         String temp="";
         int no=0;
         
         if(f.exists())
         {
             BufferedReader br=new BufferedReader(new FileReader(f));
             while((temp=br.readLine())!=null)
             {
                 no=Integer.parseInt(temp);
                 no++;
                 break;
             }
             br.close();
             
             BufferedWriter bw=new BufferedWriter(new FileWriter(f));
             bw.write(""+no);
             bw.close();
         }
     }
     catch(Exception e)
     {
         out.print(""+e);
     }
%>