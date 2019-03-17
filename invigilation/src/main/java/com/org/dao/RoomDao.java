package com.org.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.org.model.Building;
import com.org.model.Room;
@Mapper
public interface RoomDao {
	int UniquenessCheckForRoom(String room_id);
	void modifyRoom(Room room);
	void delete(Integer room_id);
	Room getRoom(Integer room_id);
	List<Room> getRoomList(@Param(value = "room_name")String room_name);
	void addRoom(Room room);
	List<Building> getBuildingList();
}
