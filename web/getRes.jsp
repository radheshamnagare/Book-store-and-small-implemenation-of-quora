
<%@page import="constant.query"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
 ResultSet rs;
 String kywd="";
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
          try{
              kywd=request.getParameter("val");
              rs=new query().kywdQ(kywd);
              out.print("<br>Related Question<br>");
              while(rs.next()){
                  out.print("<br><a href='"+"ans.jsp?val="+rs.getString(2)+"' >"+rs.getString(2)+"</a>");
              }
          }catch(Exception e){
              
          }
        %>
    </body>
</html>
