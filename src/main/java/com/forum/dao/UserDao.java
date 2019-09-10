package com.forum.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import com.forum.entity.User;

import com.forum.dao.DBHelper;

public class UserDao {

	public User getInfo(String username) throws SQLException {
        String sql = "select * from users where User_name = '" + username + "'";
        Connection conn = DBHelper.getCon();
        User user = new User();
        try {
        	PreparedStatement pst = conn.prepareStatement(sql);
        	ResultSet rs = pst.executeQuery();
        	while(rs.next())
        	{
        		user.setUsername(rs.getString("User_name"));
        		user.setDate(rs.getDate("Register_date"));
        		user.setPhone(rs.getString("Phone_number"));
        		user.setMail(rs.getString("E_mail"));
        	}
        	rs.close();
        	pst.close();
        } catch (SQLException e) {
    		e.printStackTrace();
    	}
        return user;
    }
	
	public boolean isRegistered(String username) throws SQLException {
		String sql = "select * from users where User_name = '" + username + "'";
		Connection conn = DBHelper.getCon();
		User user = new User();
    	try {
    		PreparedStatement pst = conn.prepareStatement(sql);
    		ResultSet rs = pst.executeQuery();
    		while (rs.next()) {
    			user.setUsername(rs.getString("User_name"));
    		}
    		rs.close();
    		pst.close();
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	if(user.getUsername() != null && user.getUsername().equals(username))
    		return true;
    	else
    		return false;
	}
	
	public boolean isValid(String username, String password) throws SQLException {
		String sql = "select * from users where User_name = '" + username + "'";
		Connection conn = DBHelper.getCon();
		User user = new User();
    	try {
    		PreparedStatement pst = conn.prepareStatement(sql);
    		ResultSet rs = pst.executeQuery();
    		while (rs.next()) {
    			user.setUsername(rs.getString("User_name"));
    			user.setPwd(rs.getString("User_pwd"));
    		}
    		rs.close();
    		pst.close();
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	if(user.getUsername() != null && user.getUsername().equals(username) && user.getPwd().equals(password))
    		return true;
    	else
    		return false;
	}
	
	public boolean isAdmin(String username) throws SQLException {
		String sql = "select Admin from users where User_name = '" + username + "'";
		Connection conn = DBHelper.getCon();
		User user = new User();
    	try {
    		PreparedStatement pst = conn.prepareStatement(sql);
    		ResultSet rs = pst.executeQuery();
    		while (rs.next()) {
    			user.setAdmin(rs.getBoolean("Admin"));
    		}
    		rs.close();
    		pst.close();
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	return user.getAdmin();
	}
	
	public boolean addUser(User user) throws SQLException {
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(System.currentTimeMillis());
		System.out.println(formatter.format(date));
    	String sql = "insert into users(User_name,User_pwd,Admin,Register_date) values (?,?,0,?)";
    	Connection conn = DBHelper.getCon();
    	try {			
    		PreparedStatement pst = conn.prepareStatement(sql);
    		pst.setString(1, user.getUsername());
    		pst.setString(2, user.getPwd());
    		pst.setDate(3, date);
    		int flag = pst.executeUpdate();
    		pst.close();
    		return flag > 0 ? true : false;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
	
	public boolean modifyUser(User user, String temp) throws SQLException {
    	String sql = "update users set User_name = ?, User_pwd = ?, Phone_number = ?, E_mail = ? where User_name = ? and User_id >= 0;";
    	Connection conn = DBHelper.getCon();
    	try {			
    		PreparedStatement pst = conn.prepareStatement(sql);
    		pst.setString(1, user.getUsername());
    		pst.setString(2, user.getPwd());
    		pst.setString(3, user.getPhone());
    		pst.setString(4, user.getMail());
    		pst.setString(5, temp);
    		int flag = pst.executeUpdate();
    		pst.close();
    		return flag > 0 ? true : false;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
	
}
