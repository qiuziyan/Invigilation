package com.org.model;

import java.util.List;

public class Req {
private int req_id;
private Type type;
private Course course;
private Teacher teacher;
private String req_date;
private int status;
private List<String> classes;
private List<String> classnames;
public int getReq_id() {
	return req_id;
}
public void setReq_id(int req_id) {
	this.req_id = req_id;
}
public Type getType() {
	return type;
}
public void setType(Type type) {
	this.type = type;
}
public Course getCourse() {
	return course;
}
public void setCourse(Course course) {
	this.course = course;
}
public Teacher getTeacher() {
	return teacher;
}
public void setTeacher(Teacher teacher) {
	this.teacher = teacher;
}
public List<String> getClasses() {
	return classes;
}
public void setClasses(List<String> classes) {
	this.classes = classes;
}
public List<String> getClassnames() {
	return classnames;
}
public void setClassnames(List<String> classnames) {
	this.classnames = classnames;
}
@Override
public String toString() {
	return "Req [req_id=" + req_id + ", type=" + type + ", course=" + course + ", teacher=" + teacher + ", req_date=" + req_date
			+ ", status=" + status + ", classes=" + classes + ", classnames=" + classnames + "]";
}
public String getReq_date() {
	return req_date;
}
public void setReq_date(String req_date) {
	this.req_date = req_date;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
}
