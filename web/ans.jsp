<%@page import="constant.query"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    String v="";
                                                                                  
%>
<%
  v=request.getParameter("val");
  
    
%>
<html>
    <head>
        <title>Ans Page</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <script src="js/jquery.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js" ></script>
        <style>
            .header{
                position: fixed;
                top:0px;
                min-height: 120px;
                background-color: #0f0f0f;
                width: 100%;
                color: #ffffff;
                font-weight: bold;
                z-index: 1;
            }
            .footer{
                position: fixed;
                bottom: 0px;
                min-height: 40px;
                background-color: #245269;
                width: 100%;
                color:#ffffff;
                font-weight: bold;
                text-align: center;
                padding-top: 10px;
            }
            body{
                overflow-y: scroll;
                overflow-style: scrollbar;
            }
        </style>
        
      
        
    </head>
    <body>
        <script>
            
            function validate(v1,v2,v3){
                    
               var st=true;
               
               if(v1=="" || v2=="" || v3==""){
                   st=false;
               }
               
               return st;
            }
        </script>
        <div class="header">
            <div class="row">
                <div class="col-md-5">
                    <div class="navbar-brand" style="padding: 30px;">
                        GLOBLE EDUCATION NETWORK
                    </div>
                </div>
                <div class="col-md-4">
                    <img src="img/qq.jpg" style="width: 250px; height: 120px;">
                </div>
                <div class="col-md-3" style="padding: 30px;">
                    <a href="home.jsp">
                        <span class="glyphicon glyphicon-log-out"></span>
                    </a>
                </div>
            </div>
        </div>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
        
        <div class="container">
            <a href="#m1" data-target="#m1" data-toggle="modal">
                <p class="text text-right">
                    Add new answare <span class="glyphicon glyphicon-edit"></span>
                </p>
            </a>
            <div id="m1" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <a href="#m1" class="close" data-dismiss="modal">&times;</a>
                        
                        <div class="modal-header">
                            <br><br>
                            <p class="text text-primary"><%=v%></p>
                        </div>
                        <div class="modal-body">
                            <br>
                            <form id="fans" method="post" action="send_ans.jsp" onsubmit="return validate(fans1.value,fans2.value,fans.value)">
                            <label>Add Answare :</label>
                            <br>
                            <textarea id="fans1" cols="70" rows="5" name="ans_t"></textarea>
                            <br>
                            <label>Username :</label>
                            <br>
                            <input id="fans2"type="text" name="u" />
                            <br>
                            <label>Password :</label>
                            <br>
                            <input id="fans3" type="password" name="p" />
                            <br>
                            <input type="hidden" name="hq" value="<%=v%>" />
                            </form>    
                        </div>
                        <div class="modal-footer">
                            <button form="fans" type="submit" class="btn btn-success">POST</button>
                            <button class="btn btn-danger" data-dismiss="modal">close</button>
                        </div>
                    </div>
                </div>
            </div>
        <br>
           <div class="well">
           
            <p class="text text-right">
                <%
                  ResultSet rs=new query().qValidate(v);
                    if(rs!=null){
                        while(rs.next()){
                            String name=rs.getString("fname")+" "+rs.getString("lname");
                            String profl=rs.getString("profile");
                            out.print("<img src='"+profl+"' style='width:70px;height:50px;' class='img img-circle'>");
                            out.print(" "+name);
                            
                        }
                    }
                %>
            </p>
             <p class="text text-primary" style="font-size:20px;font-weight: bold;">
                <%=v%>
            </p>
           </div>
            <br>
            <p class="text text-danger">ANSWARES:</p>
            <br>
            <%
                ResultSet rs1=new query().getAns(v);
                if(rs1!=null)
                {
                    while(rs1.next()){
                        String name=rs1.getString("fname")+" "+rs1.getString("lname");
                        String profl=rs1.getString("profile");
                        String ans=rs1.getString("qans");
                        String dd=rs1.getString("date");
            %>
            <div class="bg bg-warning" style="position: relative;">
                <br><br>
                <img src="<%=profl%>" style="width:50px; height: 50px;" class="img img-circle">
                <br>
                <p><%=name%>&nbsp;<%=dd%></p>
                <br><br>
                <center>
                    <textarea cols="140" rows="10" style="position: relative; "><%=ans%></textarea>
                </center>
                <br><br>
            </div>
            <%
                    }
                }
            %>
        </div>
        <br><br><br><br>
        
        <div class="footer">
            &copy; 2019 GLOBLE EDUCATION NETWORK
        </div>
    </body>
</html>