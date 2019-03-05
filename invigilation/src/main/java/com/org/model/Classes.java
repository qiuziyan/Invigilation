package com.org.model;

import com.org.model.Department;

public class Classes {
	private int class_id;
	private Department depart;
	private String class_name;
	private int class_grade;
	private String class_contact;
	private String class_phone;
	public int getClass_id() {
		return class_id;
	}
	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public int getClass_grade() {
		return class_grade;
	}
	public void setClass_grade(int class_grade) {
		this.class_grade = class_grade;
	}
	public String getClass_contact() {
		return class_contact;
	}
	public void setClass_contact(String class_contact) {
		this.class_contact = class_contact;
	}
	public String getClass_phone() {
		return class_phone;
	}
	public void setClass_phone(String class_phone) {
		this.class_phone = class_phone;
	}
	public Department getDepart() {
		return depart;
	}
	public void setDepart(Department depart) {
		this.depart = depart;
	}
	@Override
	public String toString() {
		return "Classes [class_id=" + class_id + ", depart=" + depart + ", class_name=" + class_name + ", class_grade="
				+ class_grade + ", class_contact=" + class_contact + ", class_phone=" + class_phone + "]";
	}

}
