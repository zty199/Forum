package com.forum.entity;

import java.sql.Timestamp;

public class Reply {
	
	private int Reply_id;
	private int Thread_id;
	private String Forum_big;
	private String Forum_small;
	private String Reply_content;
	private String Reply_writer;
	private Timestamp Reply_date;
	
	public int getReply_id() {
		return Reply_id;
	}
	public void setReply_id(int Reply_id) {
		this.Reply_id = Reply_id;
	}
	public int getThread_id() {
		return Thread_id;
	}
	public void setThread_id(int Thread_id) {
		this.Thread_id = Thread_id;
	}
	public String getForum_big() {
		return Forum_big;
	}
	public void setForum_big(String Forum_big) {
		this.Forum_big = Forum_big;
	}
	public String getForum_small() {
		return Forum_small;
	}
	public void setForum_small(String Forum_small) {
		this.Forum_small = Forum_small;
	}
	public String getReply_content() {
		return Reply_content;
	}
	public void setReply_content(String Reply_content) {
		this.Reply_content = Reply_content;
	}
	public String getReply_writer() {
		return Reply_writer;
	}
	public void setReply_writer(String Reply_writer) {
		this.Reply_writer = Reply_writer;
	}
	public Timestamp getReply_date() {
		return Reply_date;
	}
	public void setReply_date(Timestamp reply_date) {
		Reply_date = reply_date;
	}
}
