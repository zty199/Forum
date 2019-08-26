package com.forum.entity;

public class User {

	private int userid;
	private String username;
    private String password;
    private String confirmpwd;
 
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
    
}
