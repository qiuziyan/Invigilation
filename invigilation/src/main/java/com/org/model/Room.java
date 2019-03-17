package com.org.model;

public class Room {
	private int room_id;
	private Building building;
	private String room_name;
	private int acc_number;
	private int is_media;
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public int getAcc_number() {
		return acc_number;
	}
	public void setAcc_number(int acc_number) {
		this.acc_number = acc_number;
	}
	public int getIs_media() {
		return is_media;
	}
	public void setIs_media(int is_media) {
		this.is_media = is_media;
	}
	public Building getBuilding() {
		return building;
	}
	public void setBuilding(Building building) {
		this.building = building;
	}
	@Override
	public String toString() {
		return "Room [room_id=" + room_id + ", building=" + building + ", room_name=" + room_name + ", acc_number="
				+ acc_number + ", is_media=" + is_media + "]";
	}
	

}
