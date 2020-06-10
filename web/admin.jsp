<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="constant.*"%>
<%!
   ResultSet rs;
   String val="";
   
%>
<%
    try{
   
    val=request.getParameter("usr");
    if(val.length()!=0)
    {
       new AdminUser().UpGrant(val);
       
    }
    }catch(Exception e){
      
    }
%>
<html>
    <head>
        <title>Admin</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <script src="js/jquery.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js" ></script>
        <style>
            .header{
                position: fixed;
                top:0px;
                min-height: 80px;
                width: 98%;
                background-color: #204d74;
                text-align: center;
                font-size: 50px;
                color: #ffffff;
                font-weight: bold;
            }
            .footer{
                position: fixed;
                bottom: 0px;
                min-height: 40px;
                width: 100%;
                background-color: #080808;
                text-align: center;
                font-size: 10pt;
                font-weight: bold;
                color: #ffffff;
                padding: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="header">
                Admin
            </div>
            <br><br>
            <br><br>
            <br><br>
        </div>
        <div class="container">
            <center><p class="text text-center text-primary" style="font-size:50px;font-weight:bold;">User Details</p></center>
            <br><br>
            <table class="table table-hover">
                <thead class="bg bg-primary">
                  <th>usr_id</th>
                  <th>Name</th>
                  <th>email</th>
                  <th>username</th>
                  <th>action</th>
                </thead>
                <tbody>
                   <%
                       try{
                     rs=new AdminUser().getAllUsr();
                     
                     while(rs.next()){
                         String usr_id=rs.getString("usr_id");
                         out.print("<tr>"
                                 + "<td>"+rs.getString("usr_id")+"</td>"
                                 + "<td>"+rs.getString("fname")+" "+rs.getString("lname")+"</td>"
                                 + "<td>"+rs.getString("email")+"</td>"
                                 + "<td>"+rs.getString("username")+"</td>");
                         if(rs.getString("grant_type").equals("grant"))
                          out.print("<td><a href='"+"admin.jsp?usr="+usr_id+"' >"+"Revoke"+"</a></td>"); 
                         else        
                         out.print("<td><a href='"+"admin.jsp?usr="+usr_id+"' >"+"Grant"+"</a></td>");
                     
                     }
                       }catch(Exception e){
                           
                       }
                   %>    
                </tbody>
            </table>
        </div>
        <div class="footer">
            &copy; 2019 GLOBLE EDUCATION NETWORK
        </div>
    </body>
</html>
