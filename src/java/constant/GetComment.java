package constant;
import java.sql.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.postgresql.Driver;

public class GetComment {

    public Connection con=null;
    public PreparedStatement pst=null;
    public ResultSet rs=null;
    public boolean state=false;
    public SimpleDateFormat sdf=new SimpleDateFormat("dd MMM YYYY hh:mm:ss a");
    public boolean register(){
        
         try{
             
             Class.forName("org.postgresql.Driver");
             con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/db1","postgres","shubham123");
             
              if(con!=null){
                  state=true;
              }
              else
                  state=false;
         }
         catch(Exception e){
             state=false;
         }
                
        return state;
    }
    
    public boolean validtU_P(String u,String p,String cmt){
        
        boolean st=false;
        try
        {
            boolean chk=register();
            
            if(chk){
               
                pst=con.prepareStatement("select * from usr where username=? AND password=?");
                pst.setString(1, u);
                pst.setString(2, p);
                rs=pst.executeQuery();
                String id="";
                String dd=sdf.format(new Date());
                
                while(rs.next()){
                    if(rs.getString("username").equals(u) && rs.getString("password").equals(p)){
                        
                        id=rs.getString("usr_id");
                        PreparedStatement pst1=con.prepareStatement("insert into comment(usr_id,comment,datetime) values(?,?,?)");
                        pst1.setString(1,id);
                        pst1.setString(2,cmt);
                        pst1.setString(3,dd);
                        int k=pst1.executeUpdate();
                        if(k>0){
                            st=true;
                        }
                        else
                            st=false;
                        
                        break;
                    }
                }
                
            }
        }catch(Exception e){
            st=false;
        }
        return st;
    }
    
    public ResultSet getAllComments(){
        
        try{
            
           boolean chk=register();
           if(chk){
               pst=con.prepareStatement("select comment.*,usr.fname,usr.lname,usr.profile from comment,usr where usr.usr_id=comment.usr_id");
               rs=pst.executeQuery();
               
               if(rs==null)
                   return rs=null;
           }
        }catch(Exception e){
         rs=null;
        }
        return rs;
    }
}
