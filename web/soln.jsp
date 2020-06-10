<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page  import="constant.query"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="constant.loginValidation" %>
<%!
   ResultSet rs;
%>
<html>
    <head>
        <title>GLOBLE EDUCATION NETWORK</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <script src="js/jquery.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js" ></script>
        <style>
         
            #blk{
                width: 550px;
                height: 400px;
                overflow-y: scroll;
                overflow-x: scroll;
                overflow-style: scrollbar;
            }
        .header{
            position: fixed;
            top:0px;
            min-height: 100px;
            width: 100%;
            background-color: #0f0f0f;
            color:#ffffff;
            font-weight: bold;
            font-size:50px;
            z-index: 1;
        }
        .footer{
            position: fixed;
            bottom: 0px;
            min-height: 40px;
            width:100%;
            background-color: #1b6d85;
            color: #ffffff;
            font-weight: bold;
            padding: 10px;
        }
        #f1{
            position: relative;
            width:400px;
            height: 50px;
            font-size: 25px;
        }
        #f2{
            position: absolute;
            width: 60px;
            height: 50px;
        }
    </style>
    
    </head>
    
    <body>
        
        <script>
             
              function result(val){
                  
                  var url="getRes.jsp?val="+val;
                  if(window.XMLHttpRequest){
                      req=new XMLHttpRequest();
                  }
                  req.open("GET",url);
                  req.send();
                  
                  try{
                      req.onreadystatechange=function(){
                          if(req.readyState==4){
                              var tx=req.responseText;
                              document.getElementById("res").innerHTML=tx;
                          }
                      }
                      
                  }catch(e){
                      alert(""+e);
                  }
              }
              
              function validate(v1,v2){
                  var res=true;
                  
                  if(v1=="" || v2==""){
                      res=false;
                  }
                  
                  return res;
              }
        </script>
        <div class="header">
            <div class="row">
                <div class="col-md-5">
                    <a class="navbar-brand" style="margin:10px;">
                        GLOBLE EDUCATION NETWORK
                    </a>
                </div>
                <div class="col-md-5">
                    SOLUTION
                </div>
                <div class="col-md-2" style="padding: 10px;">
                    <a href="home.jsp" class="glyphicon glyphicon-home"></a>
                </div>
            </div>
        </div>
        <br><br><br>
        <br><br><br>
        <div class="container">
            <div class="alert alert-info alert-dismissable">
                <a href="#" class="close" data-dismiss="alert">&times;</a>
                <center>
                You must search keyword for your Query
                </center>
                <br>
                eg.:How can done java postgres connection <br>
                keyword: java postgres
            </div>
            <br>
            <div class="row">
             <div class="col-md-6">
                <form method="get" class="form-inline">
                <input id="f1" type="text" name="kywd" placeholder="Search Keyword" class="form-control"/>
                <button id="f2" type="button" onclick="result(f1.value)"><span class="glyphicon glyphicon-search"></span></button>
                </form>
                <br> 
                <div class="col-md-10">
            <p id="res" class="well">
                if search result not found then post your query
            </p>
                </div>
                 <br><br>
            <label>post your query:</label>
            <form method="post" action="Upquery.jsp" onsubmit="return validate(f21.value,f22.value,f23.value,f24.value)">
                <textarea id="f21" class="form-control" style="width: 400px;height: 200px;" name="qua"></textarea>
                <br><br>
                <label>set keyword:</label>
                <input id="f24"type="text" name="kyw" class="form-control" style="width:300px;"/>
                <br><br>
                <label>username :</label>
                <input type="text" name="un" class="form-control" style="width:300px;" />
                <br><br>
                <label>Password:</label>
                <input type="password" name="pw" class="form-control" style="width:300px;"/>
                <br><br>
                <button type="submit" class="btn btn-success">POST Query</button>
                <button type="reset" class="btn btn-danger">RESET </button>
            </form>
             </div>
                <div id="blk" class="col-md-6">
                       
                       
                       <%
                           out.print("   CURRENT POSTED QUERY :  "+new SimpleDateFormat("dd/MM/yyyy").format(new Date())+"<br><br>");
                          try{
                              
                            rs= new query().getQueries();
                            
                            while(rs.next()){
                               out.print("<br><a href='"+"ans.jsp?val="+rs.getString(2)+"' >"+rs.getString(2)+"</a>");         
                            }
                      
                          }catch(Exception e){
                              out.print(""+e);
                          }
                       %>
                </div>
            </div>
            
           
            <br><br>
        </div>
        <div class="footer">
            <div class="row">
                <div class="col-md-5"></div>
                <div class="col-md-7">
                    &copy; 2019 GLOBLE EDUCATION NETWORK
                </div>
            </div>
        </div>
    </body>
    <br><br><br>
    <br><br><br>
</html>
