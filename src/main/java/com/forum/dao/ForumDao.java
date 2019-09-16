package com.forum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.forum.entity.Forum;

public class ForumDao {
	
	public List<Forum> getAllForum() {
        List<Forum> list = new ArrayList<Forum>();
        String sql = "select * from forums";
        Connection conn = DBHelper.getCon();        
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
            	Forum forum = new Forum();
            	forum.setId(rs.getInt("Forum_id"));
            	forum.setTitle(rs.getString("Forum_title"));
            	forum.setInfo(rs.getString("Forum_info"));
            	forum.setType(rs.getBoolean("Forum_type"));
                list.add(forum);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
	
	public List<Forum> getForum_big() {
        List<Forum> list = new ArrayList<Forum>();
        String sql = "select * from forums where Forum_type = 1";
        Connection conn = DBHelper.getCon();        
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
            	Forum forum = new Forum();
            	forum.setId(rs.getInt("Forum_id"));
            	forum.setTitle(rs.getString("Forum_title"));
            	forum.setInfo(rs.getString("Forum_info"));
            	forum.setType(rs.getBoolean("Forum_type"));
                list.add(forum);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
	
	public List<Forum> getForum_small() {
        List<Forum> list = new ArrayList<Forum>();
        String sql = "select * from forums where Forum_type = 0";
        Connection conn = DBHelper.getCon();        
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
            	Forum forum = new Forum();
            	forum.setId(rs.getInt("Forum_id"));
            	forum.setTitle(rs.getString("Forum_title"));
            	forum.setInfo(rs.getString("Forum_info"));
            	forum.setType(rs.getBoolean("Forum_type"));
                list.add(forum);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
	
	public Forum getInfo(int id) throws SQLException {
        String sql = "select * from forums where Forum_id = " + id;
        Connection conn = DBHelper.getCon();
        Forum forum = new Forum();
        try {
        	PreparedStatement pst = conn.prepareStatement(sql);
        	ResultSet rs = pst.executeQuery();
        	while(rs.next())
        	{
        		forum.setId(rs.getInt("Forum_id"));
        		forum.setTitle(rs.getString("Forum_title"));
        		forum.setInfo(rs.getString("Forum_info"));
        		forum.setType(rs.getBoolean("Forum_type"));
        	}
        	rs.close();
        	pst.close();
        } catch (SQLException e) {
    		e.printStackTrace();
    	}
        return forum;
    }
	
	public boolean isExisted(String title) throws SQLException {
		String sql = "select * from forums where Forum_Title = '" + title + "'";
		Connection conn = DBHelper.getCon();
		Forum forum = new Forum();
    	try {
    		PreparedStatement pst = conn.prepareStatement(sql);
    		ResultSet rs = pst.executeQuery();
    		while (rs.next()) {
    			forum.setTitle(rs.getString("Forum_Title"));
    		}
    		rs.close();
    		pst.close();
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	if(forum.getTitle() != null && forum.getTitle().equals(title))
    		return true;
    	else
    		return false;
	}
	
	public boolean addForum(Forum forum) throws SQLException {
    	String sql = "insert into forums(Forum_id,Forum_title,Forum_info,Forum_type) values (?,?,?,?)";
    	Connection conn = DBHelper.getCon();
    	try {			
    		PreparedStatement pst = conn.prepareStatement(sql);
    		pst.setInt(1, forum.getId());
    		pst.setString(2, forum.getTitle());
    		pst.setString(3, forum.getInfo());
    		pst.setBoolean(4, forum.getType());
    		int flag = pst.executeUpdate();
    		pst.close();
    		return flag > 0 ? true : false;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
	
	public boolean modifyForum(Forum forum) throws SQLException {
    	String sql = "update forums set Forum_title = ?, Forum_info = ?, Forum_type = ? where Forum_id = ?";
    	Connection conn = DBHelper.getCon();
    	try {			
    		PreparedStatement pst = conn.prepareStatement(sql);
    		pst.setString(1, forum.getTitle());
    		pst.setString(2, forum.getInfo());
    		pst.setBoolean(3, forum.getType());
    		pst.setInt(4, forum.getId());
    		int flag = pst.executeUpdate();
    		pst.close();
    		return flag > 0 ? true : false;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
	
	public boolean delForum(int id) throws SQLException {
    	String sql = "delete from forums where Forum_id = " + id;
    	Connection conn = DBHelper.getCon();
    	try {
    		PreparedStatement pst = conn.prepareStatement(sql);
    		int flag = pst.executeUpdate();
    		pst.close();
    		return flag > 0 ? true : false;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }

}
