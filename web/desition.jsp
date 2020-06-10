<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   session.setAttribute("action", "all");
   response.sendRedirect("loginu.jsp");
%>

