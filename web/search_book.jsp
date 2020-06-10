<%@page import="constant.GetBOOK"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page session="true"%>

<%!
   String usr="";
   String usr1="";
   String book="";
   String v1="",v2="",v3="",v4="",v5="",down="",prv="";
%>
<%
 usr=session.getAttribute("user").toString();
 book=request.getParameter("val");
%>

   
    <table class="table table-hover">
                    <thead>
                      <th>Book No</th>  
                      <th>Book Name</th>
                      <th>Year</th>
                      <th>author</th>
                      <th>other details</th>
                      <th>download</th>
                      <th>preview</th>
                    </thead>
                    <%
                    GetBOOK bk1=new GetBOOK(usr);
                    boolean state1=bk1.searchBook(book);
                         if(state1)
                         {
                            
                            for(int i=1;i<=bk1.col;i++){
                                 bk1.rs.absolute(i);
                                  v1=bk1.rs.getString("book_no");
                                  v2=bk1.rs.getString("book_name");
                                  v3=bk1.rs.getString("year");
                                  v4=bk1.rs.getString("author");
                                  v5=bk1.rs.getString("discription");
                                  down=bk1.rs.getString("book");
                     %>
                     
                         <tr>
                             <td><%= v1%></td>
                             <td><%= v2%></td>
                             <td><%= v3%></td>
                             <td><%= v4%></td>
                             <td>
                                 <button type="button" class="btn btn-success btn-sm" data-toggle="collapse" data-target="<%= "#b"+i%>">Read more</button>
                                 <div id="<%= "b"+i%>" class="collapse">
                                     <%= v5%>
                                 </div>
                             </td>
                             <td>
                                 <a href="<%=down%>" download="<%= "download"+i%>">
                                     <span class="glyphicon glyphicon-download-alt"></span>
                                 </a>
                             </td>
                             <td>
                                 <button onclick="newWin('<%=down%>');">
                                     <span class="glyphicon glyphicon-file"></span>
                                 </button>
                             </td>
                         </tr>
                    
                     <%
                         
                         }}
                         else
                         {
                    %>
                      
                    <tbody>
                        <tr style="width: 100%;">
                            <td>
                               no book available
                            </td>
                        </tr>
                    </tbody>
                    <%   
                         }
                    %>
                    
                </table>
