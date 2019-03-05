package com.org.model;

public class Semester {
	private String semester_id;
	private String semester_name;
	public String getSemester_id() {
		return semester_id;
	}
	public void setSemester_id(String semester_id) {
		this.semester_id = semester_id;
	}
	public String getSemester_name() {
		return semester_name;
	}
	public void setSemester_name(String semester_name) {
		this.semester_name = semester_name;
	}
	@Override
	public String toString() {
		return "Semester [semester_id=" + semester_id + ", semester_name=" + semester_name + "]";
	}
	
}
