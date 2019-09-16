package com.forum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.forum.entity.Reply;

public class ReplyDao {
	
	public List<Reply> getAllReply(int id)  throws SQLException {
		List<Reply> list =new ArrayList<Reply>();
    	String sql = "select Reply_content,Reply_writer,Reply_date from replies where Thread_id = " + id;
    	Connection conn = DBHelper.getCon();			
    	try {
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
            	Reply reply = new Reply();
            	reply.setReply_content(rs.getString("Reply_content"));
            	reply.setReply_writer(rs.getString("Reply_writer"));
            	reply.setReply_date(rs.getTimestamp("Reply_date"));
            	list.add(reply);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        return list;
    }
	
	public boolean addReply(Reply Reply) throws SQLException {
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
    	String sql = "insert into replies(Forum_big,Forum_small,Thread_id,Reply_content,Reply_writer,Reply_date) values (?,?,?,?,?,?)";
    	Connection conn = DBHelper.getCon();
    	try {			
    		PreparedStatement pst = conn.prepareStatement(sql);
    		pst.setString(1, Reply.getForum_small());
    		pst.setString(2, Reply.getForum_small());
    		pst.setInt(3, Reply.getThread_id());
    		pst.setString(4, Reply.getReply_content());
    		pst.setString(5, Reply.getReply_writer());
    		pst.setTimestamp(6, timestamp);
    		int flag = pst.executeUpdate();
    		pst.close();
    		return flag > 0 ? true : false;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
	
	public boolean delAllReply(int id) throws SQLException {
    	String sql = "delete from replies where Thread_id = " + id + " and Reply_id >= 0";
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
	
	/*public Reply getInfo(int id) throws SQLException {
        String sql = "select * from Replys where Reply_id = " + id;
        Connection conn = DBHelper.getCon();
        Reply reply = new Reply();
        try {
        	PreparedStatement pst = conn.prepareStatement(sql);
        	ResultSet rs = pst.executeQuery();
        	while(rs.next())
        	{
        		reply.setReply_id(id);
        		reply.setForum_big(rs.getString("Forum_big"));
        		reply.setForum_small(rs.getString("Forum_small"));
        		reply.setThread_id(rs.getInt("Thread_id"));
        		reply.setReply_content(rs.getString("Reply_content"));
        		reply.setReply_writer(rs.getString("Reply_writer"));
        		reply.setReply_date(rs.getTimestamp("Reply_date"));
        	}
        	rs.close();
        	pst.close();
        } catch (SQLException e) {
    		e.printStackTrace();
    	}
        return Reply;
    }
	
	public boolean modifyReply(int id) throws SQLException {
    	String sql = "update replies set Reply_content = ? where Reply_id =" + id;
    	Connection conn = DBHelper.getCon();
    	Reply reply = new Reply();
    	try {			
    		PreparedStatement pst = conn.prepareStatement(sql);
    		pst.setString(1, reply.getReply_content());
    		int flag = pst.executeUpdate();
    		pst.close();
    		return flag > 0 ? true : false;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
	
	public boolean delReply(int id) throws SQLException {
    	String sql = "delete from replies where Id = " + id;
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
    }*/

}
