package com.forum.entity;

import java.util.Date;

public class User {

	private int userid;
	private String username;
    private String password;
    private String confirmpwd;
    private boolean admin;
    private Date date;
    private String phone;
    private String mail;
 
    public int getUserid() {
        return userid;
    }
    public void setUserid(int userid) {
        this.userid = userid;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPwd() {
        return password;
    }
    public void setPwd(String password) {
        this.password = password;
    }
    public String getCpwd() {
        return confirmpwd;
    }
    public void setCpwd(String confirmpwd) {
        this.confirmpwd = confirmpwd;
    }
    public boolean getAdmin() {
        return admin;
    }
    public void setAdmin(boolean admin) {
        this.admin = admin;
    }
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
    
}
