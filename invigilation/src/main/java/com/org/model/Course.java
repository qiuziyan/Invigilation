package com.org.model;

public class Course {
	int course_id;
	String course_name;
	int is_examed;
	public int getCourse_id() {
		return course_id;
	}
	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public int getIs_examed() {
		return is_examed;
	}
	public void setIs_examed(int is_examed) {
		this.is_examed = is_examed;
	}
	@Override
	public String toString() {
		return "Course [course_id=" + course_id + ", course_name=" + course_name + ", is_examed=" + is_examed + "]";
	}

}
