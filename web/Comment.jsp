<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="constant.GetComment"%>
<%@page  language="java"%>
<%!
  String usr=null;
  String pwd=null;
  String comt=null;
  String fn="";
  String ln="";
  String profl="";
  String comment="";
  String dd="";
%>
<%
    usr=request.getParameter("un");
    pwd=request.getParameter("psw");
    comt=request.getParameter("cmt");
    
    if(usr!=null && pwd!=null && comt!=null){
        GetComment gc=new GetComment();
        boolean state=gc.validtU_P(usr, pwd, comt);
        if(state){
            out.print("<script>"
                    + "alert('Your comment is publish')"
                    + "</script>");
        }
        else{
            out.print("<script>"
                    + "alert('Error occer to publishing your comment/check username,password')"
                    + "</script>");
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comment</title>
         <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <script src="js/jquery.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js" ></script>
        <style>
            .header{
                position: fixed;
                top:0px;
                background-color: #1b6d85;
                min-height: 90px;
                width: 100%;
                font-size: 60px;
                color:#ffffff;
            }
            .footer{
                position:fixed;
                bottom: 0px;
                background-color: #0f0f0f;
                min-height: 50px;
                width: 100%;
                color: #ffffff;
                padding: 10px;
            }
            .scroll{
              overflow-y: scroll;
              overflow-style: scrollbar;
              width: 800px;
              height: 500px;
              
            }
        </style>
    </head>
    <body>
        <script>
             function userPaswd(id1,id2,id3){
                 var state=false;
                 var val1=document.getElementById(id1).value;
                 var val2=document.getElementById(id2).value;
                 var val3=document.getElementById(id3).value;
                 
                 if(val3==""){
                     alert('comment should not null');
                 }
                 if(val1=="" || val2==""){
                     alert('username/password require');
                     state=false;
                 }
                 else{
                     state=true;
                 }
                 
                 return state;
             }            
        </script>
        <div class="header">
            <div class="navbar-header col-md-4">
                <a href="#" class="navbar-brand"><font color="white">GLOBLE EDUCATION NETWORK</font></a>
            </div>
            <div class="col-md-7">
                FEEDBACK
            </div>
            <div class="col-md-1">
                <a href="home.jsp">
                    <span class="glyphicon glyphicon-home" style="padding: 10px;"></span>
                </a>
            </div>
        </div>
        <br><br>
        <br><br>
        <br><br>
        <div class="container-fluid">
            <div class="col-md-4">
                <div class="well">
                    <form class="form-group-sm" method="POST" action="Comment.jsp" onsubmit="return userPaswd('un','psw','cmt')">
                        <label for="un">Username :</label>
                        <input id="un" type="text" name="un" class="form-control"/>
                        <br>
                        <label for="psw">Password :</label>
                        <input id="psw" type="password" name="psw" class="form-control" />
                        <br>
                        <label for="cmt">Comment :</label>
                        <textarea id="cmt" col="10" rows="5" name="cmt" class="form-control"></textarea>
                        <br><br>
                        <button type="reset" class="btn btn-danger">RESET</button>
                        <button type="submit" class="btn btn-success">POST</button>
                    </form>
                </div>
            </div>
            <div class="col-md-8">
                <div class="well scroll">
                    <h4>Comments :</h4>
                    <br><br>
                    <%
                      GetComment gc=new GetComment();
                      ResultSet rs=gc.getAllComments();
                      
                      if(rs!=null){
                          while(rs.next()){
                          fn=rs.getString("fname");
                          ln=rs.getString("lname");
                          profl=rs.getString("profile");
                          comment=rs.getString("comment");
                          dd=rs.getString("datetime");
                    %>
                    <img src="<%=profl%>" style="width:60px;" class="img img-circle">
                    <br><br>
                    <div class="text text-primary text-justify">
                        <%=fn%>  <%=ln%>,<br>
                        <div class="col-md-1"></div>
                        <div class="col-md-11">
                            <%=comment%>
                            <br>
                        </div>
                        <%=dd%>
                        <br><br><br>
                    </div>
                    <%
                          }
                      }
                    %>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="col-md-5"></div>
            <div class="col-md-7">
                &copy; 2019 GLOBLE EDUCATION NETWORK
            </div>
        </div>
    </body>
        
</html>
