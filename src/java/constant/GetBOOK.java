package constant;
import java.sql.*;
import org.postgresql.Driver;

public class GetBOOK 
{
    
    public Connection con=null;
    public ResultSet rs=null;
    public PreparedStatement pst=null;
    public String usr="";
    public int col=0;
    
    public GetBOOK(String usr)
    {
       this.usr=usr;    
    }
    
    public boolean register()
    {
        boolean chk=false;
        try
        {
            Class.forName("org.postgresql.Driver");
            con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/db1","postgres","shubham123");
        }
        catch(Exception e)
        {
           chk=false;    
        }
        
        if(con!=null)
            chk=true;
        else
            chk=false;
        
        return chk;
    }
    
    public boolean myBook()
    {
        boolean chk=register();
        boolean state=false;
        
        try
        {
            if(chk)
            {
                pst=con.prepareStatement("select book.* from usr,book where usr.usr_id=book.usr_id and username=?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                pst.setString(1,usr);
                rs=pst.executeQuery();
                rs.last();
                col=rs.getRow();
                rs.first();
                 if(col>0)
                     state=true;
                 else
                     state=false;
            }
           
        }catch(Exception e)
        {
            state=false;
        }
                
        return state;
    }
    
    public boolean allBook()
    {
        boolean chk=register();
        boolean state=false;
        
        try
        {
            if(chk)
            {
                pst=con.prepareStatement("select * from book",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                rs=pst.executeQuery();
                rs.last();
                col=rs.getRow();
                rs.first();
                 if(col>0)
                     state=true;
                 else
                     state=false;
            }
           
        }catch(Exception e)
        {
            state=false;
        }
                
        return state;
    }
    public boolean searchBook(String bk)
    {
        boolean chk=register();
        boolean state=false;
        
        try
        {
            if(chk)
            {
                pst=con.prepareStatement("select * from book where book_name like ?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                pst.setString(1, "%"+bk+"%");
                rs=pst.executeQuery();
                rs.last();
                col=rs.getRow();
                rs.first();
                 if(col>0)
                     state=true;
                 else
                     state=false;
            }
           
        }catch(Exception e)
        {
            state=false;
        }
                
        return state;
    }
    
    public boolean upBook(String v1,String v2,String v3,String v4,String v5){
        
        boolean st=false;
        
        try{
            boolean chk=register();
            
            if(chk){
            pst=con.prepareStatement("select usr_id from usr where username=?");
            pst.setString(1,usr);
            rs=pst.executeQuery();
            String id="";
            while(rs.next()){
                id=rs.getString("usr_id");
                break;
            }
            
            pst=con.prepareStatement("insert into book(usr_id,book_name,author,year,discription,book)values(?,?,?,?,?,?)");
            pst.setString(1, id);
            pst.setString(2, v1);
            pst.setString(3, v2);
            pst.setString(4, v3);
            pst.setString(5, v4);
            pst.setString(6, v5);
            
            int k=pst.executeUpdate();
            if(k>0)
                st=true;
            }else{
                st=false;
            }
        }
        catch(Exception e){
            st=false;
        }
        return st;
    }
}
