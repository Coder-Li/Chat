package org.InterChat.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.InterChat.data.Message;
import org.InterChat.data.User;
import org.InterChat.util.MyDBConn;

public class Dao {
	/*
	 * 添加用户方法 user-> function ->boolean
	 */
	public boolean addUser(User user) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			// 建立连接
			conn = MyDBConn.getDBConnection();
			// 构造sql语句
			String sql = "insert into user (name,password,city,sex,e_mail,meCount) values(?,?,?,?,?,?)";
			// 执行sql语句
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getCity());
			pstmt.setInt(4, user.getSex().equals("man") ? 1 : 0);
			pstmt.setString(5, user.getE_mail());
			pstmt.setInt(6, 0);
			// 得到结果
			result = (pstmt.executeUpdate() > 0) ? true : false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyDBConn.closeConn(conn);
		}
		return result;
	}

	/*
	 * 检测用户名是否可以使用 可用返回真
	 */
	public boolean checkusername(String username) {
		boolean result = true;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			// 建立连接
			conn = MyDBConn.getDBConnection();
			// 构造sql语句
			String sql = "select name from user where name = '" + username
					+ "'";
			// 执行sql语句
			pstmt = conn.prepareStatement(sql);
			// 得到结果
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				if (rs.getString("name").toString().equals(username)) {
					result = false;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyDBConn.closeConn(conn);
		}
		return result;
	}

	// 登录时对数据库操作
	public boolean login(User user) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			// 建立连接
			conn = MyDBConn.getDBConnection();
			// 构造sql语句
			String sql = "select name,password from user where name = '"
					+ user.getUsername() + "'";
			// 执行sql语句
			pstmt = conn.prepareStatement(sql);

			// 得到结果
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				if (rs.getString("name").toString().equals(user.getUsername())) {
					if (rs.getString("password").equals(user.getPassword())) {
						PreparedStatement pstmt1 = null;
						pstmt1 = conn
								.prepareStatement("update user set state=1 where name='"
										+ user.getUsername() + "'");
						pstmt1.executeUpdate();
						result = true;
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBConn.closeConn(conn);
		}
		return result;
	}

	//注销时对使state 为 0
	public void lgout(String username){
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			// 建立连接
			conn = MyDBConn.getDBConnection();
			// 构造sql语句
			String sql = "update user set state = 0 where name='"
										+ username + "'";
			// 执行sql语句
			pstmt = conn.prepareStatement(sql);

			// 得到结果
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBConn.closeConn(conn);
		}
	}
	// 添加message到数据库
	public boolean setMessage(String username, String message) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		// UUID id = UUID.randomUUID();
		// 获取当前date
		SimpleDateFormat formatter_1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat formatter_2 = new SimpleDateFormat("hh-mm-ss");
		Date date = new Date();
		String today_1 = formatter_1.format(date);
		String today_2 = formatter_2.format(date);
		String time[] = today_2.split("-");
		try {
			// 建立连接
			conn = MyDBConn.getDBConnection();
			// 构造sql语句
			String sql = "insert into message (from_user,content,time,hh,mm,ss) values(?,?,?,?,?,?)";
			String sql1 = "update user set meCount = meCount+1 where name ='"
					+ username + "'";
			// 执行sql语句
			pstmt1 = conn.prepareStatement(sql1);
			pstmt = conn.prepareStatement(sql);
			// pstmt.setString(1, id.toString());
			pstmt.setString(1, username);
			pstmt.setString(2, message);
			pstmt.setDate(3, java.sql.Date.valueOf(today_1));
			pstmt.setString(4, time[0]);
			pstmt.setString(5, time[1]);
			pstmt.setString(6, time[2]);
			// 得到结果
			result = (pstmt.executeUpdate() > 0) ? true : false;
			pstmt1.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyDBConn.closeConn(conn);
		}
		return result;
	}

	public ArrayList<Message> getMessage() {
		ArrayList<Message> list_me = new ArrayList<Message>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			// 建立连接
			conn = MyDBConn.getDBConnection();
			// 构造sql语句
			String sql = "select * from message";
			// 执行sql语句
			pstmt = conn.prepareStatement(sql);
			// 得到结果
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Message me = new Message();
				me.setFrom_user(rs.getString("from_user"));
				me.setContent(rs.getString("content"));
				me.setTime(rs.getDate("time").toString());
				me.setHh(rs.getString("hh"));
				me.setMm(rs.getString("mm"));
				me.setSs(rs.getString("ss"));
				list_me.add(me);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyDBConn.closeConn(conn);
		}
		return list_me;
	}

	public User getUserInfo(String username) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		User user = new User();
		try {
			// 建立连接
			conn = MyDBConn.getDBConnection();
			// 构造sql语句
			String sql = "select * from user where name ='" + username + "'";
			// 执行sql语句
			pstmt = conn.prepareStatement(sql);
			// 得到结果
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				String name = rs.getString("name");
				user.setUsername(name);
				user.setSex(rs.getInt("sex") == 0 ? "男" : "女");
				user.setCity(rs.getString("city"));
				user.setBirthday(rs.getString("birthday"));
				user.setE_mail(rs.getString("e_mail"));
				user.setMeCount(rs.getInt("meCount"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyDBConn.closeConn(conn);
		}
		return user;
	}

	public ArrayList<String> getUserList(){
		ArrayList<String> list_user = new ArrayList<String>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			// 建立连接
			conn = MyDBConn.getDBConnection();
			// 构造sql语句
			String sql = "select name from user where state = 1";
			// 执行sql语句
			pstmt = conn.prepareStatement(sql);
			// 得到结果
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String name = new String();
				name = rs.getString("name");
				list_user.add(name);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyDBConn.closeConn(conn);
		}
		return list_user;
	}

}
