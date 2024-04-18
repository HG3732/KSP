package common;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class SemiTemplate {

	public static Connection getConnection(boolean isLocalhost) {
		Connection conn = null;
		Properties prop = new Properties();
		
		try {
			String currentPath = SemiTemplate.class.getResource("").getPath();
			prop.load(new FileReader(currentPath + "driver.properties"));
			Class.forName(prop.getProperty("jdbc.driver"));
			if(isLocalhost) {
				conn = DriverManager.getConnection(prop.getProperty("jdbc.url"), prop.getProperty("jdbc.name"), prop.getProperty("jdbc.password"));
			}else {
				conn = DriverManager.getConnection(prop.getProperty("jdbc.semi.url"), prop.getProperty("jdbc.semi.name"), prop.getProperty("jdbc.semi.password"));
			}
		} catch (IOException | ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void autocommit(Connection conn, boolean autocommit) {
		try {
			if(conn != null) {conn.setAutoCommit(autocommit);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void commit(Connection conn) {
		
			try {
				if(conn != null) {conn.commit();
				} 
			}catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	public static void rollback(Connection conn) {
		try {
			if(conn != null) {conn.rollback();
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Connection conn) {
		try {
			if(conn != null) {conn.close();}
		} catch (SQLException e) {
			e.printStackTrace();
			}
		}
	public static void close(Statement stmt) {
		try {
			if(stmt!= null)stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(ResultSet rs) {
		try {
			if(rs != null) rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
