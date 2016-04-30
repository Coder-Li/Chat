package org.InterChat.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class MyDBConn {
	public static Connection getDBConnection() {
		Connection conn = null;
		InputStream is = null;
		Properties prop = new Properties();
		try {
			is = MyDBConn.class.getResourceAsStream("LinkMySQL.properties");
			prop.load(is);
			//读数据
			String dbDriver = prop.getProperty("dbDriver");
			String dbURL = prop.getProperty("dbURL");
			String username = prop.getProperty("username");
			String password = prop.getProperty("password");
			//建立连接
			Class.forName(dbDriver);
			
			conn = DriverManager.getConnection(dbURL, username, password);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return conn;
	}

	public static void closeConn(Connection conn) {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
