package rcm.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DataBaseUtils {
	public static Connection getConnection(){
		 
		Connection conn = null;
		try 
		{
			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
			} catch (InstantiationException e) {e.printStackTrace();
			} catch (IllegalAccessException e) {e.printStackTrace();}
			conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/rcm?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull","root","root");//1q2w3e4r5t 
			
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static Statement createStmt(Connection conn) {
		Statement stmt = null;
		try 
		{
			stmt = conn.createStatement();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return stmt;
	}
	
	public static ResultSet executeQuery(Statement stmt, String sql) {
		ResultSet rs = null;
		try 
		{
			rs = stmt.executeQuery(sql);
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return rs;
	}
	
	public static ResultSet executeQuery(PreparedStatement preparedstmt)
	{
		ResultSet rs = null;
		try {
			rs = preparedstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
	public static PreparedStatement prepareStmt(Connection conn, String sql) {
		PreparedStatement pstmt = null;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return pstmt;
	}
	public static void close(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(Statement stmt) {
		if (stmt != null) 
		{
			try 
			{
				stmt.close();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
	}
	
	public static void close(ResultSet rs) 
	{
		if (rs != null) 
		{
			try {
				rs.close();
				}
			catch (SQLException e) 
				{
				e.printStackTrace();
				}
		}
	}
}
