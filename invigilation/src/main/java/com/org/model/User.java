package com.org.model;

public class User {
	  private String user_name;
	  private String password;
	  private int user_teach_id;
	  private int user_type;
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getUser_teach_id() {
		return user_teach_id;
	}
	public void setUser_teach_id(int user_teach_id) {
		this.user_teach_id = user_teach_id;
	}
	public int getUser_type() {
		return user_type;
	}
	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}
	@Override
	public String toString() {
		return "User [user_name=" + user_name + ", password=" + password + ", user_teach_id=" + user_teach_id
				+ ", user_type=" + user_type + "]";
	}
}
