package com.org.service;

import org.springframework.stereotype.Service;


public interface RoomService {
	String UniquenessCheckForRoom(String room_id);

	String addRoom(String info);

	String getRoomList(String room_name);

	String  getRoom(Integer room_id);

	String delete(Integer room_id);

	String modifyRoom(String info);
	
	String getBuildingList();
}
