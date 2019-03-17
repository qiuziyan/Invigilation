package com.org.model;

import com.org.model.Section;

public class Teacher {
	private int teacher_id;
	private Section section;
	private String teacher_name;
	private String teacher_no;
	private String teacher_phone;
	private String email;
	private Department depart;
	private int number;
	public int getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(int teacher_id) {
		this.teacher_id = teacher_id;
	}

	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public String getTeacher_no() {
		return teacher_no;
	}
	public void setTeacher_no(String teacher_no) {
		this.teacher_no = teacher_no;
	}
	public String getTeacher_phone() {
		return teacher_phone;
	}
	public void setTeacher_phone(String teacher_phone) {
		this.teacher_phone = teacher_phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Section getSection() {
		return section;
	}
	public void setSection(Section section) {
		this.section = section;
	}
	
	public Department getDepart() {
		return depart;
	}
	public void setDepart(Department depart) {
		this.depart = depart;
	}
	@Override
	public String toString() {
		return "Teacher [teacher_id=" + teacher_id + ", section=" + section + ", teacher_name=" + teacher_name
				+ ", teacher_no=" + teacher_no + ", teacher_phone=" + teacher_phone + ", email=" + email + ", depart="
				+ depart + "]";
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}

	
}
