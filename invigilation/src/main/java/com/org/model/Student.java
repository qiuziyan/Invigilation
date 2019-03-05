package com.org.model;

import com.org.model.Classes;
import com.org.model.Department;

public class Student {
	private int stu_id;
	private String stu_name;
	private String stu_no;
	private String stu_phone;
	private String email;
	private String dom_name;
	private Classes classes;
	private User user;
	private Department depart;
	public int getStu_id() {
		return stu_id;
	}
	public void setStu_id(int stu_id) {
		this.stu_id = stu_id;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public String getStu_no() {
		return stu_no;
	}
	public void setStu_no(String stu_no) {
		this.stu_no = stu_no;
	}
	public String getStu_phone() {
		return stu_phone;
	}
	public void setStu_phone(String stu_phone) {
		this.stu_phone = stu_phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDom_name() {
		return dom_name;
	}
	public void setDom_name(String dom_name) {
		this.dom_name = dom_name;
	}
	public Classes getClasses() {
		return classes;
	}
	public void setClasses(Classes classes) {
		this.classes = classes;
	}
	public Department getDepart() {
		return depart;
	}
	public void setDepart(Department depart) {
		this.depart = depart;
	}

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Student [stu_id=" + stu_id + ", stu_name=" + stu_name + ", stu_no=" + stu_no
				+ ", stu_phone=" + stu_phone + ", email=" + email + ", dom_name=" + dom_name + ", classes=" + classes
				+ ", user=" + user + ", depart=" + depart + "]";
	}

}
