package com.forum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.forum.entity.Thread;

public class ThreadDao {
	
	public List<Thread> getAllThread() throws SQLException {
        List<Thread> list = new ArrayList<Thread>();
        String sql = "select * from threads";
        Connection conn = DBHelper.getCon();        
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
            	Thread thread = new Thread();
            	thread.setThread_id(rs.getInt("Thread_id"));
            	thread.setForum_big(rs.getString("Forum_big"));
        		thread.setForum_small(rs.getString("Forum_small"));
        		thread.setThread_title(rs.getString("Thread_title"));
        		thread.setThread_content(rs.getString("Thread_content"));
        		thread.setThread_writer(rs.getString("Thread_writer"));
        		thread.setThread_date(rs.getTimestamp("Thread_date"));
                list.add(thread);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
	
	public Thread getInfo(int id) throws SQLException {
        String sql = "select * from threads where Thread_id = " + id;
        Connection conn = DBHelper.getCon();
        Thread thread = new Thread();
        try {
        	PreparedStatement pst = conn.prepareStatement(sql);
        	ResultSet rs = pst.executeQuery();
        	while(rs.next())
        	{
        		thread.setThread_id(id);
        		thread.setForum_big(rs.getString("Forum_big"));
        		thread.setForum_small(rs.getString("Forum_small"));
        		thread.setThread_title(rs.getString("Thread_title"));
        		thread.setThread_content(rs.getString("Thread_content"));
        		thread.setThread_writer(rs.getString("Thread_writer"));
        		thread.setThread_date(rs.getTimestamp("Thread_date"));
        	}
        	rs.close();
        	pst.close();
        } catch (SQLException e) {
    		e.printStackTrace();
    	}
        return thread;
    }
	
	public boolean addThread(Thread thread) throws SQLException {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
    	String sql = "insert into threads(Forum_big,Forum_small,Thread_title,Thread_content,Thread_writer,Thread_date) values (?,?,?,?,?,?)";
    	Connection conn = DBHelper.getCon();
    	try {			
    		PreparedStatement pst = conn.prepareStatement(sql);
    		pst.setString(1, thread.getForum_big());
    		pst.setString(2, thread.getForum_small());
    		pst.setString(3, thread.getThread_title());
    		pst.setString(4, thread.getThread_content());
    		pst.setString(5, thread.getThread_writer());
    		pst.setTimestamp(6, timestamp);
    		int flag = pst.executeUpdate();
    		pst.close();
    		return flag > 0 ? true : false;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
	
	
	/*public boolean modifyThread(int id) throws SQLException {
    	String sql = "update threads set Forum_big = ?, Forum_small = ?, Thread_title = ?, Thread_content = ? where Thread_id =" + id;
    	Connection conn = DBHelper.getCon();
    	Thread thread = new Thread();
    	try {			
    		PreparedStatement pst = conn.prepareStatement(sql);
    		pst.setString(1, thread.getForum_big());
    		pst.setString(2, thread.getForum_small());
    		pst.setString(3, thread.getThread_title());
    		pst.setString(4, thread.getThread_content());
    		int flag = pst.executeUpdate();
    		pst.close();
    		return flag > 0 ? true : false;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }*/
	
	public boolean delThread(int id) throws SQLException {
    	String sql = "delete from threads where Thread_id = " + id;
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
