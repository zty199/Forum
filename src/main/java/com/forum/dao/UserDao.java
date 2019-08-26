package com.forum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.forum.entity.User;

import com.forum.dao.DBHelper;

public class UserDao {

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
	
	public boolean addUser(User user) throws SQLException {
    	String sql = "insert into users(User_name,User_pwd,Admin) values (?,?,0)";
    	Connection conn = DBHelper.getCon();
    	try {			
    		PreparedStatement pst = conn.prepareStatement(sql);
    		pst.setString(1, user.getUsername());
    		pst.setString(2, user.getPwd());
    		int flag = pst.executeUpdate();
    		pst.close();
    		return flag > 0 ? true : false;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
	
}
