package connexion;

import java.sql.*;

public class Connex
{
	Connection con;
	public Statement stat;
	ResultSet res;
  
	public Connex(String req)
	{
		try 
		{
			Class.forName("org.postgresql.Driver");
			this.con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/garage", "postgres", "hardi");
			
  			this.stat= this.con.createStatement();
//  			this.res=stat.executeQuery(req);
  			stat.execute(req);
     	}
    	catch(SQLException sqle)
    	{
    		sqle.printStackTrace();
    	}
       	catch (Exception e) 
       	{
       		e.printStackTrace();
       	}
                
	}
	public Connex()
	{
	
	}
        public Connex(String req,String ide)
	{
		try 
		{
			Class.forName("org.postgresql.Driver");
			this.con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/garage", "postgres", "hardi");
			
  			this.stat= this.con.createStatement();
		this.res=stat.executeQuery(req);
  		//	stat.execute(req);
     	}
    	catch(SQLException sqle)
    	{
    		sqle.printStackTrace();
    	}
       	catch (Exception e) 
       	{
       		e.printStackTrace();
       	}
                
	}
	public ResultSet getResultset()
	{
		return this.res;
	}

	public void getCommit() throws Exception
	{
      this.stat.executeQuery("commit");
	}

	public Statement getStat()
	{
		return this.stat;
	}
}

