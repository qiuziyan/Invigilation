package com.org.model;

public class Department {
 private int dept_id;
 private String dept_name;
 private String dept_contact;
 private String dept_phone;
public int getDept_id() {
	return dept_id;
}
public void setDept_id(int dept_id) {
	this.dept_id = dept_id;
}
public String getDept_name() {
	return dept_name;
}
public void setDept_name(String dept_name) {
	this.dept_name = dept_name;
}
public String getDept_contact() {
	return dept_contact;
}
public void setDept_contact(String dept_contact) {
	this.dept_contact = dept_contact;
}
public String getDept_phone() {
	return dept_phone;
}
public void setDept_phone(String dept_phone) {
	this.dept_phone = dept_phone;
}
@Override
public String toString() {
	return "Department [dept_id=" + dept_id + ", dept_name=" + dept_name + ", dept_contact=" + dept_contact
			+ ", dept_phone=" + dept_phone + "]";
}
 
}
