<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.json.*"%>
<%!
 String usr="";
 String sub=null;
%>
<%
   String val="";
   usr=session.getAttribute("uname").toString();
   
%>
<html>
    <head>
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <script src="js/jquery.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js" ></script>
        <style>
            #tim{
                font-size: 20px;
                float: left;
            }
            #sub{
                font-size: 40px;
                float: inside;
            }
            body{
                width:100%;
                height: 400px;
            }
            .header{
            position: fixed;
            top:0px;
            min-height: 80px;
            width: 100%;
            background-color: #222;
            color: #ffffff;
            font-size: 60px;
            font-weight: bold;
            }
            .footer{
                position: fixed;
                bottom: 0px;
                min-height: 40px;
                width: 100%;
                background-color: #23527c;
                color: #ffffff;
                padding: 10px;
                font-weight: bold;
            }
            .fixContent{
                position: fixed;
                width: 800px;
                height: 380px;
                overflow-y: scroll;
                overflow-style: scrollbar;
            }
      
        </style>
        <script>
            window.history.forward();
            
        </script>
    </head>
    <body>
        <script>
           $(document).ready(function(){
            var p= document.getElementById('q');
            p.style.pointerEvents="none";   
           });
            
            function select(x){
                       
              var y=document.getElementById(x);
              y.setAttribute("disabled","true");
              var btn=document.getElementById('st').disabled=false;
              var v=document.getElementById('sub');
              v.innerHTML=y.value;
                     
                     var url="getQuestion.jsp?val="+y.value;
                     if(window.XMLHttpRequest){
                         request=new XMLHttpRequest();
                     }
                     request.open("GET",url);
                     request.send();
                     try{
                         
                         request.onreadystatechange=function(){
                             if(request.readyState==4){
                                 var v=request.responseText;
                                 document.getElementById('q').innerHTML=v;
                             }
                         }
                     }catch(e){
                         alert('unable to connect server');
                     }
                     
              }
            function start(){
               
              document.getElementById('submt').disabled=false;  
              var p= document.getElementById('q');
                p.style.pointerEvents="auto";
                t=60;
              var x=document.getElementById('st').disabled="true";
              window.setInterval(function(){
                var x=document.getElementById('tim');
                t--; 
                if(t===0){
                   x.innerHTML="0:0:0";
                  gotof();
                  }
                 else
                 x.innerHTML="0:1:"+t;
                 
              },1000);
             
            }
            function gotof(){
                if(t==0){
                    window.clearInterval();
                    document.forms["myform"].submit();
                    }
            }
            $(document).ready(function(){
                var x=document.getElementById('st');
                x.setAttribute("disabled","true");
                document.getElementById('submt').setAttribute("disabled","true");
            });
          
        </script>

        
        <div class="header">
            <div class="col-md-4 navbar-brand">
                GLOBLE EDUCATION NETWORK
            </div>
            <div class="col-md-6">
                Quize
            </div>
            <div class="col-md-2">
                <a href="home.jsp"><span class="glyphicon glyphicon-home"></span></a>
            </div>
        </div>
        <br><br><br><br><br>
        <div class="container">
            <div class="col-md-4">
                <div class="text text-primary">Hii, <%=usr%></div>
                <br><br>
                <form>
                <label>select quiz language:</label>
                <select id="idd" name="sub" class="form-control" onchange="select('idd')">
                    <option value="null">choose subject</option>
                    <option value="html">HTML</option>
                    <option value="css">CSS</option>
                    <option value="javascript">JavaScript</option>
                </select>
              </form>
                <br>
                <img src="img/win.gif" class="img img-responsive img-rounded">
            </div>
          
            <div class="col-md-8">
                <p id="sub"></p>
                <p id="tim"></p>
                <button id="submt" style="float: right;right: 10px;" type="submit" class="btn btn-success btn-sm " onclick="document.forms['myform'].submit()">submit</button>
                <button id="st" type="button" class="btn btn-success btn-sm " onclick="start()">Start Quiz</button>
                
                <br><br><br>
                <form name="myform" method="post" action="result.jsp" id="q" class="well fixContent">
                    <p style="font-size: 30px; font-weight: bold;">select quiz and solve questions</p>   
                </form>
            </div>
        </div>
           
             
        <div class="footer">
            <center>
                &copy; 2019 GLOBLE EDUCATION NETWORK
            </center>
        </div>
    </body>
</html>
