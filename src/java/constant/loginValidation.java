package constant;
import org.postgresql.Driver;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class loginValidation 
{
    public static Connection con=null;
    public static ResultSet rs=null;
    public static PreparedStatement pst;
    public boolean un=false,psw=false;
    public String user="";
    
    public loginValidation(){
    }
    public static boolean register()
    {
        try
        {
         Class.forName("org.postgresql.Driver");  
         con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/db1","postgres","shubham123");
             
        }
        catch(Exception e)
        {
            System.out.print(""+e);
           con=null;
        }
        
        if(con!=null)
            return true;
        else
            return false;
    }
    public loginValidation(String data)
    {
            un=validU(data);
    }
    public loginValidation(String un,String pd)
    {
            psw=validP(un,pd);
    }
    static boolean validU(String u)
    {
        boolean rst=false;
        try
        {
            boolean chk=register();
            int f=0;
            if(chk==true)
            {
                
                pst=con.prepareStatement("select * from usr,permition where username=? and usr.usr_id=permition.usr_id");
                pst.setString(1,u);
                rs=pst.executeQuery();
                while(rs.next())
                {
                    if(!rs.getString("grant_type").equals("grant"))
                    {
                        f=0;
                        break;
                    }
                    if(rs.getString("username").equals(u))
                    {  
                        f=1;
                        rst=true;
                        break;
                    }
                   
                }
                if(f==0)
                    rst=false;
            }
            else
                System.out.print("connection problem");
        }
        catch(Exception e)
        {
            rst=false;
            System.out.print(""+e);
        }
        return rst;
    }
    public static boolean validP(String u,String p)
    {
        
        boolean rst=false;
        try
        {
            boolean chk=register();
            int f=0;
            if(chk==true)
            {
                pst=con.prepareStatement("select * from usr where username=? AND password=?");
                pst.setString(1,u);
                pst.setString(2,p);
                rs=pst.executeQuery();
                while(rs.next())
                {
                    if(rs.getString("username").equals(u) && rs.getString("password").equals(p))
                    {  
                        f=1;
                        rst=true;
                        break;
                    }
                   
                }
                if(f==0)
                    rst=false;
            }
           
        }
        catch(Exception e)
        {
            rst=false;
            System.out.print(""+e);
        }
        return rst;
    }
    public String profile(String u)
    {
     
        String prf="profile/user.jpg";
          try
          {
          boolean chk=register();
          int f=0;
          if(chk)
          {
              pst=con.prepareStatement("select * from usr where username=?");
              pst.setString(1, u);
              rs=pst.executeQuery();
              while(rs.next())
              {
                  if(rs.getString("username").equals(u))
                  {
                      f=1;
                      prf=rs.getString("profile");
                      user=rs.getString("fname")+" "+rs.getString("lname");
                      break;
                  }
              }
          }
          }
          catch(Exception e)
          {
              System.out.print(""+e);
          }
        return prf;
    }
    
    public String securityQ(String u){
        String q="";
        try{
            
            boolean chk=register();
            if(chk){
                
              pst=con.prepareStatement("select qua from usr where username=?");
              pst.setString(1,u);
              rs=pst.executeQuery();
              
              while(rs.next()){
                q=rs.getString("qua");
                break;
              }
            }
        }catch(Exception e){
            q="";
        }
        
        return q;
    }
    
    public boolean resetP(String u,String q,String a,String np){
        boolean st=false;
        try{
            
            boolean chk=register();
            
            if(chk){
                
                pst=con.prepareStatement("update usr set password=? where username=? and qua=? and ans=?");
                pst.setString(1, np);
                pst.setString(2, u);
                pst.setString(3,q);
                pst.setString(4, a);
                
                int k=pst.executeUpdate();
                
                if(k>0){
                    st=true;
                }
                
            }
        }catch(Exception e){
            st=false;
        }
        
        return st;
    }
}
