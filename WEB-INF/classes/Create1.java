import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.io.*;
import java.sql.*;

public class CreateTables
{
	
	public static void main(String args[])throws Exception
	{
		Connection c = null;
		Statement stmt = null;
		try 
		{
			
			Class.forName("org.postgresql.Driver");
			c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eventmanage","postgres", "mcasc05");
			System.out.println("Opened database successfully");
			stmt = c.createStatement();
			String sql = "CREATE TABLE FOOTBALL " +
						 "(VID SERIAL PRIMARY KEY," +
						 "VNAME VARCHAR(80),"+
						 "VCAPACITY VARCHAR(10),"+
						 "VADDRESS VARCHAR(80),"+
						 "VSTATE VARCHAR(30),"+
						 "VDISTRICT VARCHAR(30),"+
						 "VCITY VARCHAR(30),"+
						 "VAREA VARCHAR(80),"+
						 "VPREFERABLE_FOR VARCHAR(30),"+
						 "VRATE VARCHAR(20),"+
						 "VPHONE VARCHAR(10),"+
						 "VEMAIL VARCHAR(60))";
			stmt.executeUpdate(sql);
	stmt.close();
			c.close();
		}catch (Exception e) 
		{
			System.err.println( e.getClass().getName()+": "+ e.getMessage() );
			System.exit(0);
			e.printStackTrace();
		}
		System.out.println("Table created successfully");
	}
}