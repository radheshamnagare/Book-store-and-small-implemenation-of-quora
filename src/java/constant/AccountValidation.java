
package constant;
import java.sql.*;
import org.postgresql.Driver;
import java.io.*;

public class AccountValidation {
    
    public Connection con=null;
    public PreparedStatement pst=null;
    public ResultSet rs=null;
   
    
    public boolean register()
    {
        try
        {
            Class.forName("org.postgresql.Driver");
            con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/db1","postgres","shubham123");
        }    
        catch(Exception e)
        {
            return false;
        }
        
        if(con!=null)
            return true;
        else
            return false;
    }
   
    
    public boolean check(String u,String email)
    {
        boolean chk1=false;
        try
        {
            boolean chk=register();
                        
            if(chk)
            {
            int f=0;
            pst=con.prepareStatement("select * from usr where username=?");
            pst.setString(1,u);
            rs=pst.executeQuery();
            
            while(rs.next())
            {
  
                if(rs.getString("username").equals(u)){
                    f=1;
                   break;
                }
            }
            pst.close();
            rs.close();
            
            if(f==0){
                chk1=true;
                pst=con.prepareStatement("select email from usr");
                rs=pst.executeQuery();
                while(rs.next()){
                    if(rs.getString("email").equals(email)){
                        chk1=false;
                        break;
                    }
                }
            }
            else{
                
                pst=con.prepareStatement("select email from usr");
                rs=pst.executeQuery();
                while(rs.next()){
                    if(rs.getString("email").equals(email)){
                        chk1=false;
                        break;
                    }
                }
            }
               
            }
        }
        catch(Exception e)
        {
            return false;
        }
        return chk1;
    }
    
    public boolean insert(String fn,String ln,String fname,String email,String un,String psw,String qua,String ans)
    {
     boolean chk1=false;
        try
        {
        boolean chk=register();
        if(chk)
        {
          pst=con.prepareStatement("insert into usr(fname,lname,profile,email,username,password,qua,ans) values(?,?,?,?,?,?,?,?)");
          pst.setString(1, fn);
          pst.setString(2, ln);
          pst.setString(3, fname);
          pst.setString(4, email);
          pst.setString(5, un);
          pst.setString(6, psw);
          pst.setString(7, qua);
          pst.setString(8, ans);
          int k=pst.executeUpdate();
            if(k>0){
                chk1=true;
              pst=con.prepareStatement("select * from usr where username=?");
              pst.setString(1, un);
              rs=pst.executeQuery();
              String id="";
                 while(rs.next()){
                     id=rs.getString("usr_id");
                     break;
                 }
                 if(id.length()!=0){
                     pst=con.prepareStatement("insert into permition(usr_id,grant_type)values(?,?)");
                     pst.setString(1, id);
                     pst.setString(2, "grant");
                     pst.executeUpdate();
                 }
            }
            else
                chk1=false;
        }
        
        }
        catch(Exception e)
        {
            chk1=false;
        }
        return chk1;
    }
}
