package com.org.model;

import java.util.List;

import com.org.model.Room;

public class Exam {
private int exam_id;
private String exam_name;
private String user_name;
private String create_date;
private String start_date;
private String end_date;
private int status;
private Req req;
private int week;
private Room room;
private Course course;
private Type type;
private List<String> classes;
private List<String> className;
private Semester semester;
private List<String> teachers;
private List<String> teachersName;
public int getExam_id() {
	return exam_id;
}
public void setExam_id(int exam_id) {
	this.exam_id = exam_id;
}
public String getExam_name() {
	return exam_name;
}
public void setExam_name(String exam_name) {
	this.exam_name = exam_name;
}
public int getWeek() {
	return week;
}
public void setWeek(int week) {
	this.week = week;
}
public Room getRoom() {
	return room;
}
public void setRoom(Room room) {
	this.room = room;
}
public Course getCourse() {
	return course;
}
public void setCourse(Course course) {
	this.course = course;
}
public Type getType() {
	return type;
}
public void setType(Type type) {
	this.type = type;
}

public List<String> getTeachers() {
	return teachers;
}
public void setTeachers(List<String> teachers) {
	this.teachers = teachers;
}
public List<String> getTeachersName() {
	return teachersName;
}
public void setTeachersName(List<String> teachersName) {
	this.teachersName = teachersName;
}
public String getStart_date() {
	return start_date;
}
public void setStart_date(String start_date) {
	this.start_date = start_date;
}
public String getEnd_date() {
	return end_date;
}
public void setEnd_date(String end_date) {
	this.end_date = end_date;
}

public Semester getSemester() {
	return semester;
}
public void setSemester(Semester semester) {
	this.semester = semester;
}
public List<String> getClasses() {
	return classes;
}
public void setClasses(List<String> classes) {
	this.classes = classes;
}
public List<String> getClassName() {
	return className;
}
public void setClassName(List<String> className) {
	this.className = className;
}
@Override
public String toString() {
	return "Exam [exam_id=" + exam_id + ", exam_name=" + exam_name + ", user_name=" + user_name + ", start_date="
			+ start_date + ", end_date=" + end_date + ", week=" + week + ", room=" + room + ", course=" + course
			+ ", type=" + type + ", classes=" + classes + ", className=" + className + ", semester=" + semester
			+ ", teachers=" + teachers + ", teachersName=" + teachersName + "]";
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
public String getUser_name() {
	return user_name;
}
public void setUser_name(String user_name) {
	this.user_name = user_name;
}
public Req getReq() {
	return req;
}
public void setReq(Req req) {
	this.req = req;
}
public String getCreate_date() {
	return create_date;
}
public void setCreate_date(String create_date) {
	this.create_date = create_date;
}



}
