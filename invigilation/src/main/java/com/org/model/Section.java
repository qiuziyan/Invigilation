package com.org.model;

public class Section {
private int section_id;
private Department depart;
private String section_name;
public int getSection_id() {
	return section_id;
}
public void setSection_id(int section_id) {
	this.section_id = section_id;
}
public Department getDepart() {
	return depart;
}
public void setDepart(Department depart) {
	this.depart = depart;
}
public String getSection_name() {
	return section_name;
}
public void setSection_name(String section_name) {
	this.section_name = section_name;
}
@Override
public String toString() {
	return "Section [section_id=" + section_id + ", depart=" + depart + ", section_name=" + section_name + "]";
}

}
