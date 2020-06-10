<%@page import="java.io.FileReader"%>
<%@page import="java.io.Reader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page session="true"%>
<%@page import="constant.GetBOOK" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
   String usr="";
   String usr1="";
   String v1="",v2="",v3="",v4="",v5="",down="",prv="";
   
%>
<%
  usr=session.getAttribute("user").toString();
  usr1=session.getAttribute("uname").toString();
%>
<html>
    <head>
        <title>Books</title>
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
                z-index: 2;
            }
            .footer{
                position: fixed;
                bottom: 0px;
                min-height: 50px;
                width: 100%;
                background-color: #101010;
                color: #ffffff;
            }
            .navbarFix
            {
                position: fixed;
                z-index: 2;
            }
            
        </style>
        <script>
            window.history.forward();
        </script>
    </head>
    <body data-spy="scroll" data-target=".nav" data-offset="10">
        <script>
            
            
            function search_bk(v){
                var url="search_book.jsp?val="+v;
                if(window.XMLHttpRequest){
                    req=new XMLHttpRequest();
                }
                req.open("GET",url);
                req.send();
                
                try{
                      req.onreadystatechange=function(){
                          if(req.readyState==4){
                              var tx=req.responseText;
                              document.getElementById("search").innerHTML=tx;
                          }
                      }
                      
                  }catch(e){
                      alert(""+e);
                  }
            }
            function newWin(x)
            {
                alert(""+x);
                window.open(x);
            }
            function year(y,id){
                
                 if(y<1900){
                    alert("year greater equal 1900");
                    var x=document.getElementById(id);
                    x.value="";
                   }
            }
            function charVdn(val,id){
                
                exp=/^[A-Za-z0-9 ]+$/;
                if(!val.match(exp)){
                    alert('special symbol not allow');
                    var x=document.getElementById(id);
                    x.value="";
                }
            }
            function authr(val,id){
                
                expn=/^[A-Za-z. ]+$/;
                if(!val.match(expn)){
                    alert('special symbol not allow');
                    var x=document.getElementById(id);
                    x.value="";
                }
            }
            function formVdtn(id1,id2,id3,id4,id5){
               var state=false;
               var x=document.getElementById(id1);
               var v1=x.value;
               x=document.getElementById(id2);
               var v2=x.value;
               x=document.getElementById(id3);
               var v3=x.value;
               x=document.getElementById(id4);
               var v4=x.value;
               var y=document.getElementById(id5);
               var v5=y.value;
              
               if(v1=="" || v2=="" || v3=="" || v4=="" || v5==""){
               alert('fill complete field');
               state=false;
               }
               else{
                   state=true;
               }
               
               return state;
            }
            
           
          
        </script>
        
        <header class="header">
            <div class="row">
                <div class="col-xs-4">
                    <a href="#" class="navbar-brand">
                        GLOBLE EDUCATION NETWORK
                    </a>
                </div>
                <div class="col-xs-6">
                    BOOKS
                    <img src="img/book1.jpg" style="width:200px;height: 80px;" />
                </div>
                <div class="col-xs-2">
                    <a href="home.jsp">
                        <span class="glyphicon glyphicon-log-out" style="padding: 10px;"></span>
                    </a>
                </div>
            </div>
        </header>
        <br>
        <div class="nav nav-tabs">
            <ul class="nav navbar-nav navbarFix">
                <li class="active"><a href="#m1" >Uploaded Books</a></li>
                <li><a href="#m3">Download Books</a></li>
                <li><a href="#m2">Upload Book</a></li>
            </ul>
        </div>
        <br><br><br><br>
        <div class="container">
            <div class="row">
                <div class="col-xs-4">
                    <h4 class="text text-primary">Hii,<%=usr1%></h4>
                </div>
                <div class="col-xs-8">
                    <img src="img/book2.jpg" class="img img-rounded" style="width: 200px;height: 200px;">
                </div>
            </div>
                <br><br><br><br><br><br><br>
                <section id="m1">
                <h1 class="text text-success text-center bg-primary">Uploaded Books</h1>
                <br><br>
                <table class="table table-hover">
                    <thead>
                      <th>Book No</th>  
                      <th>Book Name</th>
                      <th>Year</th>
                      <th>author</th>
                      <th>other details</th>
                    </thead>
                    <%
                    GetBOOK bk=new GetBOOK(usr);
                    boolean state=bk.myBook();
                         if(state)
                         {
                            
                            for(int i=1;i<=bk.col;i++){
                                 bk.rs.absolute(i);
                                  v1=bk.rs.getString("book_no");
                                  v2=bk.rs.getString("book_name");
                                  v3=bk.rs.getString("year");
                                  v4="author:"+bk.rs.getString("author");
                                  v5=bk.rs.getString("discription");
                                  
                     %>
                     
                         <tr>
                             <td><%= v1%></td>
                             <td><%= v2%></td>
                             <td><%= v3%></td>
                             <td><%= v4%></td>
                             <td>
                                 <button type="button" class="btn btn-success btn-sm" data-toggle="collapse" data-target="<%= "#"+i%>">Read more</button>
                                 <div id="<%=i%>" class="collapse">
                                     <%= v5%>
                                 </div>
                             </td>
                         </tr>
                    
                     <%
                         
                         }}
                         else
                         {
                    %>
                      
                    <tbody>
                        <tr style="width: 100%;">
                            <td>
                               Books not uploaded your account
                            </td>
                        </tr>
                    </tbody>
                    <%   
                         }
                    %>
                    
                </table>
                </section>
                <br><br><br><br><br><br>
                <section id="m2">
                    <h2 class="text text-success text-center bg-primary">Upload Books</h2>
                    <div class="well">
                        <form method="POST" action="UpldBook.jsp" enctype="multipart/form-data" onsubmit="return formVdtn('bk','y','aur','dscr','fil')">
                        <br>
                        <label for="bk">Book Name :</label>
                        <input id="bk" type="txet" name="t1" class="form-control" placeholder="book name" style="width:400px;" onkeyup="charVdn(this.value,'bk');"/>
                        <br>
                        <label for="y">Year :</label>
                        <input id="y" type="number" name="t2" class="form-control" placeholder="2019" style="width:400px;" onblur="year(this.value,'y');"/>
                        <br>
                        <label for="aur">Author :</label>
                        <input id="aur" type="txet" name="t3" class="form-control" placeholder="author" style="width:400px;" onkeyup="authr(this.value,'aur');"/>
                        <br>
                        <label for="dscr">Discription :</label>
                        <textarea id="dscr" rows="5" name="t4" class="form-control" style="width:400px;"></textarea>
                        <br>
                        <label for="fil">Upload book/.pdf/.doc</label>
                        <input id="fil" type="file" name="t5" class="form-control" style="width: 400px;"/>
                        <br><br> 
                        <button type="reset" class="btn btn-danger">RESET</button>
                        <button type="submit" class="btn btn-success">SUBMIT</button>
                    </form>
                    </section>
                <br><br><br>
                    <section id="m3"> 
                        <h1 class="text text-success text-center bg-primary">Download Books</h1>
                    <br><br><br>
                     <label>search Books :</label>
                     <input type="search" name="srh" class="form-control" style="width: 400px;" onkeyup="search_bk(this.value)" placeholder="search by book name">
                     <br>   
                    <div id="search">
                          
                    </div>
                    <br><br>
                    <table class="table table-hover">
                    <thead>
                      <th>Book No</th>  
                      <th>Book Name</th>
                      <th>Year</th>
                      <th>author</th>
                      <th>other details</th>
                      <th>download</th>
                      <th>preview</th>
                    </thead>
                    <%
                    GetBOOK bk1=new GetBOOK(usr);
                    boolean state1=bk1.allBook();
                         if(state1)
                         {
                            
                            for(int i=1;i<=bk1.col;i++){
                                 bk1.rs.absolute(i);
                                  v1=bk1.rs.getString("book_no");
                                  v2=bk1.rs.getString("book_name");
                                  v3=bk1.rs.getString("year");
                                  v4=bk1.rs.getString("author");
                                  v5=bk1.rs.getString("discription");
                                  down=bk1.rs.getString("book");
                     %>
                     
                         <tr>
                             <td><%= v1%></td>
                             <td><%= v2%></td>
                             <td><%= v3%></td>
                             <td><%= v4%></td>
                             <td>
                                 <button type="button" class="btn btn-success btn-sm" data-toggle="collapse" data-target="<%= "#b"+i%>">Read more</button>
                                 <div id="<%= "b"+i%>" class="collapse">
                                     <%= v5%>
                                 </div>
                             </td>
                             <td>
                                 <a href="<%=down%>" download="<%= "download"+i%>" >
                                     <span class="glyphicon glyphicon-download-alt" ></span>
                                 </a>
                             </td>
                             <td>
                                 <button onclick="newWin('<%=down%>')">
                                     <span class="glyphicon glyphicon-file"></span>
                                 </button>
                             </td>
                         </tr>
                    
                     <%
                         
                         }}
                         else
                         {
                    %>
                      
                    <tbody>
                        <tr style="width: 100%;">
                            <td>
                               no book available
                            </td>
                        </tr>
                    </tbody>
                    <%   
                         }
                    %>
                    
                </table>
                    </section>
                </div>
        </div>
                    
                <br><br><br>
        <footer class="footer">
            <div class="row">
                <div class="col-xs-5"></div>
                <div class="col-xs-7">
                    <div class="navbar-brand">
                        &copy; 2019 GLOBLE EDUCATION NETWORK
                    </div>
                </div>
            </div>  
        </footer>
    </body>
</html>
