<%@page language="java"%>
<%@page contentType="text/html" %>
<%@page import="java.sql.*" %>
<%@page import="org.postgresql.Driver" %>
<%@page import="org.json.*" %>

<html>
    <head>
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <script src="js/jquery.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js" ></script>
        <style>
            input[type="radio"] 
            {
                width:30px; 
            }
        </style>
    </head>
    
        
    <%!
      String ans="";
    %>        
    <%
   String vv=null;
   Connection con=null;
   PreparedStatement pst=null;
   ResultSet rs=null;
   
    vv=request.getParameter("val");
    
    if(vv!=null){
        
        try
        {
            Class.forName("org.postgresql.Driver");
            con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/db1","postgres","shubham123");
           
             if(con!=null){
              pst=con.prepareStatement("select * from "+vv+" random limit ?");
              pst.setString(1, "10");
              rs=pst.executeQuery();
              int i=1,t=1;
                while(rs.next()){
                   
                    
                    if(t==4)
                        t=1;
                    
                    out.print("<label class='form-control'>Q."+i+": "+rs.getString("qua")+"</label><br>");
                    out.print("<input type='hidden' value='"+rs.getString("qua")+"' name='"+"q"+i+"' >");
                    out.print("<ol>");
                    if(t==1){
                    out.print("<li><input type='radio' value='"+rs.getString("ans")+"'  name='"+i+"'  >"+rs.getString("ans")+"</li>");
                    }
                    out.print("<li><input type='radio' value='"+rs.getString("op2")+"'  name='"+i+"'  >"+rs.getString("op2")+"</li>");
                        if(t==2){
                    out.print("<li><input type='radio' value='"+rs.getString("ans")+"'  name='"+i+"'  >"+rs.getString("ans")+"</li>");
                    }
                    out.print("<li><input type='radio' value='"+rs.getString("op3")+"'  name='"+i+"'  >"+rs.getString("op3")+"</li>");
                        if(t==3){
                    out.print("<li><input type='radio' value='"+rs.getString("ans")+"'  name='"+i+"'  >"+rs.getString("ans")+"</li>");
                    }
                    out.print("<li><input type='radio' value='"+rs.getString("op4")+"'  name='"+i+"'  >"+rs.getString("op4")+"</li>");
                     out.print("<input type='hidden' name='"+"h"+i+"' value='"+rs.getString("ans")+"'>");
                    out.print("</ol>");
                    t++; 
                    i++;
                }
                
                rs.close();
                pst.close();
                con.close();
                
             }
        }catch(Exception e){
            out.print(""+e);
        }
    }
    
%>
            
        
 
</html>
