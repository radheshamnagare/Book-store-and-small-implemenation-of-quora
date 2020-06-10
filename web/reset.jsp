<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="constant.*" %>
<%@page session="true" %>
<%
    String sq=request.getParameter("sq");
    String ans=request.getParameter("a");
    String np=request.getParameter("np");
    String usr=session.getAttribute("user").toString();
    
   boolean st=new  loginValidation().resetP(usr, sq, ans, np);
   
     if(st){
         
         out.print("<script>"
                 + "alert('password update successfuly')"
                 + "</script>");
         out.print("<script>"
                 + "window.location.href='loginp.jsp'"
                 + "</script>");
     }else{
         
         out.print("<script>"
                 + "alert('password not update successfuly')"
                 + "</script>");
         out.print("<script>"
                 + "window.location.href='loginp.jsp'"
                 + "</script>");
     }
     
%>