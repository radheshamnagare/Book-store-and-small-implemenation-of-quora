package constant;
import java.sql.*;
import org.postgresql.Driver;
import java.io.*;

public class AdminUser {
    
    public Connection con=null;
    public PreparedStatement pst=null;
    public ResultSet rs=null;
    
    public boolean register(){
        
        try{
            Class.forName("org.postgresql.Driver");
            con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/db1","postgres","shubham123");
            
        }catch(Exception e){
            con=null;
        }
        if(con!=null)
            return true;
        else
            return false;
    }
    
    public ResultSet getAllUsr(){
        
        try{
            
            boolean chk=register();
            if(chk){
                pst=con.prepareStatement("select * from usr,permition where usr.usr_id=permition.usr_id");
                rs=pst.executeQuery();
            }
        }catch(Exception e){
            rs=null;
        }
        return rs;
    }
    
    public void UpGrant(String uid){
        
        try{
            
            boolean chk=register();
            
            if(chk){
                pst=con.prepareStatement("select * from permition");
                rs=pst.executeQuery();
                PreparedStatement pst1;
                while(rs.next()){
                   if(rs.getString("usr_id").equals(uid)){
                       if(rs.getString("grant_type").equals("grant")){
                         pst1=con.prepareStatement("update permition set grant_type=? where usr_id=?");
                         pst1.setString(1, "revoke");
                         pst1.setString(2, uid);
                         pst1.executeUpdate();
                       }else
                       {
                         pst1=con.prepareStatement("update permition set grant_type=? where usr_id=?");
                         pst1.setString(1, "grant");
                         pst1.setString(2, uid);
                         pst1.executeUpdate();  
                       }
                       break;
                   } 
                }
            }
        }catch(Exception e){
            
        }
    }
    
    public boolean Admin(String u,String p){
        boolean st=false;
        try{
            
            boolean chk=register();
            
            if(chk){
                pst=con.prepareStatement("select * from admin where uname=? and password=?");
                pst.setString(1,u);
                pst.setString(2, p);
                rs=pst.executeQuery();
                
                   while(rs.next()){
                       if(rs.getString("uname").equals(u) && rs.getString("password").equals(p)){
                           st=true;
                           break;
                       }
                   }
            }
        }catch(Exception e){
            st=false;
        }
        return st;
    }
}
