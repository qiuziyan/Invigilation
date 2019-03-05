package com.org.model;

public class Freetime {
private int id;
private int teacher_id;
private int week;
private String starttime;
private String endtime;
public int getTeacher_id() {
	return teacher_id;
}
public void setTeacher_id(int teacher_id) {
	this.teacher_id = teacher_id;
}
public int getWeek() {
	return week;
}
public void setWeek(int week) {
	this.week = week;
}
public String getStarttime() {
	return starttime;
}
public void setStarttime(String starttime) {
	this.starttime = starttime;
}
public String getEndtime() {
	return endtime;
}
public void setEndtime(String endtime) {
	this.endtime = endtime;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
@Override
public String toString() {
	return "Freetime [id=" + id + ", teacher_id=" + teacher_id + ", week=" + week + ", starttime=" + starttime
			+ ", endtime=" + endtime + "]";
}


}
