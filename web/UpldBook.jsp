<%@page import="constant.GetBOOK"%>
<%@page import="java.nio.channels.GatheringByteChannel"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page session="true"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page language="java"%>
<%!
  String usr="";
%>
<%
   
    final String path=getServletContext().getRealPath("books");
    
    MultipartRequest mrq=new MultipartRequest(request, path,1000000000,new FileRenamePolicy() {
        @Override
        public File rename(File file) {
          //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
         String etns=file.getName().substring(file.getName().lastIndexOf('.'));
          
             File fp1=new File(path+"//bk_cnt.txt");
             String nm="";
          try{
             BufferedReader br=new BufferedReader(new FileReader(fp1));
             
             int cnt=0;
             while(true){
             if((nm=br.readLine())!=null){
                 cnt=Integer.parseInt(nm);
                 cnt++;
                 nm=""+cnt;
                 break;
             }}
             br.close();
             
             BufferedWriter bw=new BufferedWriter(new FileWriter(fp1));
             bw.write(nm);
             bw.close();
             
          }catch(Exception ee){
           
          }
              return new File(path+"//"+"Book_"+nm+etns);
        }
    });
 
     Enumeration e=mrq.getFileNames();
     String name=e.nextElement().toString();
     String fname=mrq.getFilesystemName(name);
    // out.print(fname);
    if(fname.endsWith(".pdf") || fname.endsWith(".PDF") || fname.endsWith(".doc")||fname.endsWith(".DOC")){
        
       usr=session.getAttribute("user").toString();
       String bkname=mrq.getParameter("t1");
       String yy=mrq.getParameter("t2");
       String autr=mrq.getParameter("t3");
       String dsc=mrq.getParameter("t4");
       fname="books/"+fname;
       boolean st=new GetBOOK(usr).upBook(bkname,autr,yy,dsc,fname);
         
       if(st){
   
         try{
             String pth=getServletContext().getRealPath("counter");
             File f=new File(pth+"//book_upld.txt");
             BufferedReader br1=new BufferedReader(new FileReader(f));
             String tmp="";
             int no=0;
             
             while((tmp=br1.readLine())!=null)
             {
                 no=Integer.parseInt(tmp);
                 no++;
                 break;
             }
             br1.close();
             
             BufferedWriter bw1=new BufferedWriter(new FileWriter(f));
             
             bw1.write(""+no);
             bw1.close();
         }  
         catch(Exception e1)
         {
             out.print(""+e1);
         }
         
       out.print("<script>"
                + "alert('Your book upload sucessfuly...');"
                + "</script>");
       out.print("<script>"
                + "window.location.href='books.jsp';"
                + "</script>");
       }else
       {
           out.print("<script>"
                + "alert('Upload Error...');"
                + "</script>");
       out.print("<script>"
                + "window.location.href='books.jsp';"
                + "</script>");
 
       }
    }
    else
    {
        File fp=new File(path+"\\"+fname);
        boolean state=fp.delete();
        
        if(state){
            File fp1=new File(path+"//bk_cnt.txt");
           try{
             BufferedReader br=new BufferedReader(new FileReader(fp1));
             String nm="";
             int cnt=0;
             while(true){
             if((nm=br.readLine())!=null){
                 cnt=Integer.parseInt(nm);
                 if(cnt>0)
                     cnt--;
                 nm=""+cnt;
                 break;
             }}
             br.close();
             
             BufferedWriter bw=new BufferedWriter(new FileWriter(fp1));
             bw.write(nm);
             bw.close();
             
          }catch(Exception ee){
           
          }
            out.print("<script>"
                    + "alert('your document type must be .pdf or .doc /file not upload')"
                    + "</script>");
            out.print("<script>"
                    + "window.location.href='books.jsp';"
                    + "</script>");
        }
    }
%>