<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="constant.query"%>
<%

     String un=request.getParameter("u");
     String psw=request.getParameter("p");
     String ans=request.getParameter("ans_t").toString();
     String hq=request.getParameter("hq").toString();
     
       try{
           
         String id=new query().uId(un,psw);
         if(id.length()!=0){
            String qid=new query().qId(hq);
            if(qid.length()!=0 ){
               
               // out.print(""+qid+"<br> "+ans+" <br>"+id);
               boolean res=new query().upAns(qid, ans, id);
               
                if(res)
                {
                  out.print("<script>"
                          + "alert('Your answare is uploaded')"
                          + "</script>");
                  out.print("<script>"
                         + "window.location.href='ans.jsp?val="+hq+"'"
                         + "</script>"); 
                }
                else
                {
                    out.print("<script>"
                          + "alert('something error in answare uploaded')"
                          + "</script>");
                  out.print("<script>"
                         + "window.location.href='ans.jsp?val="+hq+"'"
                         + "</script>"); 
                }
            }else{
                out.print("<script>"
                          + "window.location.href='soln.jsp'"
                          + "</script>");
            }
         }
         else{
                    out.print("<script>"
                          + "alert('username/password wrong your ans not post')"
                          + "</script>");
                  out.print("<script>"
                         + "window.location.href='ans.jsp?val="+hq+"'"
                         + "</script>");
         }
       }catch(Exception e){
           out.print(""+e);
       }
     
%>