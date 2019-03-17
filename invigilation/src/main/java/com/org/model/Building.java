package com.org.model;

public class Building {
private int building_id;
private String building_name;
private String phone;
public int getBuilding_id() {
	return building_id;
}
public void setBuilding_id(int building_id) {
	this.building_id = building_id;
}
public String getBuilding_name() {
	return building_name;
}
public void setBuilding_name(String building_name) {
	this.building_name = building_name;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
@Override
public String toString() {
	return "Building [building_id=" + building_id + ", building_name=" + building_name + ", phone=" + phone + "]";
}

}
