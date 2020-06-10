<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page session="true"%>
<%@page import="constant.AccountValidation"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  session.setAttribute("action", "all");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Regitation</title>
    </head>
    <body>
        <% 
            
           try
           {

              
               final String root=getServletContext().getRealPath("profile");
               MultipartRequest mpr=new MultipartRequest(request, root,1000000000,new FileRenamePolicy(){
                   @Override
                   public File rename(File file) {
                    int cnt=0;
                     String etns=file.getName().substring(file.getName().lastIndexOf('.'));
          
                       try{
                       File fp=new File(root+"//profl_cnt.txt");
                       if(fp.exists()){
                           BufferedReader br=new BufferedReader(new FileReader(fp));
                           String tmp="";
                          
                           while(true){
                           if((tmp=br.readLine())!=null){
                              cnt=Integer.parseInt(tmp);
                              cnt++;
                              break;
                           }}
                         
                       }}catch(Exception ee){
                         
                       }
                       return new File(root+"//profl_"+cnt+""+etns);
                   }
               });
               
               String fn=mpr.getParameter("fn");
               String ln=mpr.getParameter("ln");
               String email=mpr.getParameter("emil");
               String un=mpr.getParameter("un");
               String psw=mpr.getParameter("p1");
               String qua=mpr.getParameter("qua");
               String ans=mpr.getParameter("ans");
               
                Enumeration file=mpr.getFileNames();
                String name=(String)file.nextElement();
                String fname=mpr.getFilesystemName(name);
                
                if(qua.length()==0 || ans.length()==0 || un.length()==0 || psw.length()==0 || email.length()==0 || fn.length()==0 || ln.length()==0)
                {
                    out.print("<script>"
                             + "alert('fill complete field of form');"
                             + "</script>");
                    out.print("<script>"
                             + "window.location.href='createAC.jsp';"
                             + "</script>");
                }
                else{
                AccountValidation av=new AccountValidation();
                boolean state=av.check(un,email);
                
                if(fname==null)
                {
                  fname="profile/user.jpg";
                  int cnt=0;
                    
                       File fp1=new File(root+"//profl_cnt.txt");
                       BufferedReader br=new BufferedReader(new FileReader(fp1));
                       if(fp1.exists()){
                           
                           String tmp="";
                          
                           while(true){
                           if((tmp=br.readLine())!=null){
                              cnt=Integer.parseInt(tmp);
                              cnt--;
                              break;
                           }}
                         
                       }
                      br.close();
                       BufferedWriter bw=new BufferedWriter(new FileWriter(fp1));
                      bw.write(""+cnt);
                      bw.close();
                    
                  if(state)
                  {
                     boolean st=av.insert(fn, ln, fname, email, un, psw, qua, ans);
                     if(st)
                     {
                         out.print("<script>"
                                 + "alert('Account create successfuly');"
                                 + "</script>");
                         out.print("<script>"
                             + "window.location.href='loginu.jsp';"
                             + "</script>");
                        
                     }
                     else
                     {
                         out.print("<script>"
                                 + "alert('Account not create successfuly');"
                                 + "</script>"); 
                     }
                  }
                  else
                  {
                     out.print("<script>"
                             + "alert('username/mail id already exist');"
                             + "</script>");
                     out.print("<script>"
                             + "window.location.href='createAC.jsp';"
                             + "</script>");
                  }
                }
                else
                {
                  int cnt=0;
                    
                       File fp2=new File(root+"//profl_cnt.txt");
                       BufferedReader br=new BufferedReader(new FileReader(fp2));
                       if(fp2.exists()){
                           
                           String tmp="";
                          
                           while(true){
                           if((tmp=br.readLine())!=null){
                              cnt=Integer.parseInt(tmp);
                              cnt++;
                              break;
                           }}
                         
                       }
                      br.close();
                       BufferedWriter bw=new BufferedWriter(new FileWriter(fp2));
                      bw.write(""+cnt);
                      bw.close();
                    
                  if(state)
                  {
                      boolean st=false;
                      File fp3=new File(root+"\\"+fname);
                      if(fname.endsWith(".jpg") || fname.endsWith(".png")){
                          st=av.insert(fn, ln, "profile/"+fname, email, un, psw, qua, ans);       
                      }
                      else{
                          fp3.delete();
                           out.print("<script>"
                                 + "alert('your profile not consider because file does not have image extension');"
                                 + "</script>");
                         st=av.insert(fn, ln,"profile/user.jpg", email, un, psw, qua, ans);
                      }
                      
                     if(st)
                     {
                         out.print("<script>"
                                 + "alert('Account create successfuly');"
                                 + "</script>");
                        out.print("<script>"
                             + "window.location.href='loginu.jsp';"
                             + "</script>");
                     }
                     else
                     {
                          out.print("<script>"
                                 + "alert('Account not create successfuly');"
                                 + "</script>");
                          
                     }
                  }
                  else
                  {
                     out.print("<script>"
                             + "alert('username/mail id already exist');"
                             + "</script>");  
                       out.print("<script>"
                             + "window.location.href='createAC.jsp';"
                             + "</script>");
                  }
                    
                }
               }
           }catch(Exception e)
           {
               out.print(""+e);
           }
        %>
    </body>
</html>
