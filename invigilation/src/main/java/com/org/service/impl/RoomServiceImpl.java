package com.org.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.alibaba.fastjson.JSONObject;
import com.org.dao.RoomDao;
import com.org.model.Building;
import com.org.model.Room;
import com.org.service.RoomService;
@Service
public class RoomServiceImpl implements RoomService{
	@Autowired
	RoomDao roomDao;

	public String UniquenessCheckForRoom(String room_id) {
		if(roomDao.UniquenessCheckForRoom(room_id) > 0)
			return "false";
		else
			return "ok";
	}


	public String getRoomList(String room_name) {
		return JSONObject.toJSONString(roomDao.getRoomList(room_name));
	}

	public String getRoom(Integer room_id) {
		Room  room = roomDao.getRoom(room_id);
		return JSONObject.toJSONString(room);
	}

	public String delete(Integer room_id) {
		try{
			roomDao.delete(room_id);
		}catch(Exception e){
			e.printStackTrace();
			return "false";
		}
		return "ok";
	}

	public String modifyRoom(String info) {
		JSONObject json = JSONObject.parseObject(info);
		Room room = new  Room();
		room.setRoom_id(json.getInteger("room_id"));
		room.setRoom_name(json.getString("room_name"));
		room.setAcc_number(json.getInteger("acc_number"));
		room.setIs_media(json.getInteger("is_media"));
		try{
			roomDao.modifyRoom(room);
		}catch(Exception e){
			e.printStackTrace();
			return "false";
		}
		return "ok";
	}

	public String addRoom(String info) {
		JSONObject json = JSONObject.parseObject(info);
		Room room = new  Room();
		Building building=new Building();
		building.setBuilding_id(json.getInteger("building_id"));
		room.setBuilding(building);
		room.setRoom_name(json.getString("room_name"));
		room.setAcc_number(json.getInteger("acc_number"));
		room.setIs_media(json.getInteger("is_media"));
		try{
			roomDao.addRoom(room);
		}catch(Exception e){
			e.printStackTrace();
			return "false";
		}
		return "ok";
	}
	public String getBuildingList() {
		return JSONObject.toJSONString(roomDao.getBuildingList());
	}


}
