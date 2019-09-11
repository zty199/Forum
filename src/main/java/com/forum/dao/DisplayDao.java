package com.forum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.forum.entity.Reply;

public class DisplayDao {
	
     public ArrayList<Reply> getlist(int id)  throws SQLException {
    	String sql = "select Reply_content,Reply_writer from replies where Thread_id = " + id;
    	ArrayList<Reply> list =new ArrayList<Reply>();
    	Connection conn = DBHelper.getCon();			
    	try {
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next())
            {
            	Reply reply = new Reply();
            	reply.setReply_content(rs.getString("Reply_content"));
            	reply.setReply_writer(rs.getString("Reply_writer"));
            	list.add(reply);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        return list;
    }
}