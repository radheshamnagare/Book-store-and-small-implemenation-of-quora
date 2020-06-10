<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="constant.query"%>
<%!
  String qua="";
  String kywd="";
  String un="";
  String pswd="";
%>
<%

     qua=request.getParameter("qua");
     kywd=request.getParameter("kyw");
     un=request.getParameter("un");
     pswd=request.getParameter("pw");
     boolean res=false; 
  
    if(qua.length()!=0 && kywd.length()!=0 && un.length()!=0 && pswd.length()!=0){
        
        String id=new query().uId(un, pswd);
        if(id.length()!=0){
          
         res=new query().upQuery(qua, kywd,id);
        }
        if(res){
             out.print("<script>alert('Your Query upload succesfuly')</script>");
             out.print("<script>window.location.href='soln.jsp'</script>");
         }else{
             out.print("<script>alert('Your Query not Upload check username/password')</script>");
             out.print("<script>window.location.href='soln.jsp'</script>"); 
         }
    }
%>