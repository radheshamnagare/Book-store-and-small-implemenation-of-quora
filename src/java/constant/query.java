package constant;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.postgresql.Driver;


public class query {
    
    private Connection con=null;
    private ResultSet rs;
    private PreparedStatement pst;
    
    private boolean register(){
        
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
    
    public ResultSet getQueries(){
        
        try{
            
            boolean chk=register();
            if(chk){
               
                pst=con.prepareStatement("select * from queries where date=?");
                pst.setString(1,""+new SimpleDateFormat("dd/MM/yyyy").format(new Date()));
                rs=pst.executeQuery();
                
            }
        }catch(Exception e){
            
        }
        
        return rs;
    }
   
    public boolean upQuery(String q,String kyw,String id){
      boolean state=false; 
         try{
           
             boolean chk=register();
             
             if(chk){
                 
              
                int k=0;
                
                pst=con.prepareStatement("insert into queries(query,keyword,date,usr_id) values(?,?,?,?)");
                pst.setString(1,q);
                pst.setString(2, kyw);
                pst.setString(3, ""+new SimpleDateFormat("dd/MM/yyyy").format(new Date()));
                pst.setString(4,id);
                k=pst.executeUpdate();
                
                if(k>0)
                    state=true;
             }
         }catch(Exception e){
             
         }
       return state;
    }
    
    public ResultSet kywdQ(String kywd){
    
         try{
             
             boolean chk=register();
             
             if(chk){
                 pst=con.prepareStatement("select * from queries where keyword like ?");
                 pst.setString(1,"%"+kywd+"%");
                 rs=pst.executeQuery();
                 
             }
         }catch(Exception e){
             rs=null;
         }
        return rs;
    }
    
    public String uId(String u,String p){
        String id="";
       try{
           
           boolean chk=register();
           if(chk){
               pst=con.prepareStatement("select usr_id from usr where username=? and password=?");
               pst.setString(1, u);
               pst.setString(2, p);
               rs=pst.executeQuery();
               
               while(rs.next()){
                   id=rs.getString("usr_id");
                   break;
               }
           }
       }catch(Exception e){
           id="";
       }
       return id;
    }
    
    public ResultSet qValidate(String q){
        
        try{
            String id="";
            boolean chk=register();
            if(chk){
              
              
                pst=con.prepareStatement("select * from usr,queries where query=? and queries.usr_id=usr.usr_id");
                pst.setString(1,q);
                rs=pst.executeQuery();
                
            }
        }catch(Exception e){
            rs=null;
        }
        return rs;
    }
    
    public ResultSet getAns(String q){
        
        try{
            String id="";
            boolean chk=register();
            if(chk){
                pst=con.prepareStatement("select qid from queries where query=?");
                pst.setString(1,q);
                rs=pst.executeQuery();
                while(rs.next()){
                    id=rs.getString("qid");
                    break;
                }
                rs.close();
                pst.close();
              
                pst=con.prepareStatement("select * from usr,ans where ans.qid=? and usr.usr_id=ans.usr_id");
                pst.setString(1,id);
                rs=pst.executeQuery();
                
            }
        }catch(Exception e){
            rs=null;
        }
        return rs;
    }
    
    public String qId(String q){
        
        String id="";
        
        try{
            boolean chk=register();
            if(chk){
                pst=con.prepareStatement("select qid from queries where query=?");
                pst.setString(1, q);
                rs=pst.executeQuery();
                while(rs.next()){
                    id=rs.getString("qid");
                    break;
                }
            }
        }catch(Exception e){
            id="";
        }
        return id;
    }
    
    public boolean upAns(String qid,String ans,String uid){
        boolean res=false;
        
        try{
            
            boolean chk=register();
            if(chk){
                String dd="";
                SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
                dd=sdf.format(new Date());
                pst=null;
                pst=con.prepareStatement("insert into ans(qid,qans,date,usr_id)values(?,?,?,?)");
                pst.setString(1,qid);
                pst.setString(2,""+ans);
                pst.setString(3,dd);
                pst.setString(4,uid);
                
                int k=pst.executeUpdate();
                
                if(k>0)
                    res=true;
            }   
            
        }catch(Exception e){
          
        }
        return res;
    }
}
