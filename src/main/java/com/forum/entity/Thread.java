package com.forum.entity;

import java.sql.Timestamp;

public class Thread {
	private String Forum_big;
	private String Forum_small;
    private int Thread_id;
    private String Thread_title;
    private String Thread_content;
    private String Thread_writer;
    private Timestamp Thread_date;

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
    public int getThread_id() {
        return Thread_id;
    }
    public void setThread_id(int Thread_id) {
        this.Thread_id = Thread_id;
    }
    public String getThread_title() {
        return Thread_title;
    }
    public void setThread_title(String Thread_title) {
        this.Thread_title = Thread_title;
    }
    public String getThread_content() {
        return Thread_content;
    }
    public void setThread_content(String Thread_content) {
        this.Thread_content = Thread_content;
    }
    public String getThread_writer() {
        return Thread_writer;
    }
    public void setThread_writer(String Thread_writer) {
        this.Thread_writer = Thread_writer;
    }
    public Timestamp getThread_date() {
        return Thread_date;
    }
	public void setThread_date(Timestamp Thread_date) {
		this.Thread_date = Thread_date;
	}
}
