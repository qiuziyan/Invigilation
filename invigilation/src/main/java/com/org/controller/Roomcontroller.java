package com.org.controller;


import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.org.model.Room;
import com.org.service.RoomService;
import com.org.util.ExcelUtils;
@Controller
public class Roomcontroller {
	@Autowired
	private RoomService roomService;
	
	@RequestMapping(value = "room/UniquenessCheckForRoom", method=RequestMethod.POST)
	@ResponseBody
	public String UniquenessCheckForroom(String room_id){
		return roomService.UniquenessCheckForRoom(room_id);
	}
	
	@RequestMapping(value = "room/addRoom", method=RequestMethod.POST)
	@ResponseBody
	public String addRoom(String Info){
		return roomService.addRoom(Info);
	}
	
	@RequestMapping(value = "room/modifyRoom", method=RequestMethod.POST)
	@ResponseBody
	public String modifyRoom(String Info){
		return roomService.modifyRoom(Info);
	}
	
	@RequestMapping(value = "room/getRoomList", method=RequestMethod.POST)
	@ResponseBody
	public String getRoomList(@RequestParam(value = "room_name")String room_name) throws UnsupportedEncodingException{
		if(room_name!=null)
			room_name = new String(room_name.getBytes("iso-8859-1"), "utf-8");
		return roomService.getRoomList(room_name);
	}

	@RequestMapping(value = "room/getRoom", method=RequestMethod.POST)
	@ResponseBody
	public String getroom(Integer room_id){
		return roomService.getRoom(room_id);
	}
	
	
	@RequestMapping(value = "room/delete", method=RequestMethod.POST)
	@ResponseBody
	public String delete(Integer room_id){
		return roomService.delete(room_id);
	}
	@RequestMapping(value ="room/getBuildingList", method=RequestMethod.POST)
	@ResponseBody
	public String getBuildingList(){
		System.out.print(roomService.getBuildingList());
		return roomService.getBuildingList();
	}
	//上传文件 批量导入教室
	@RequestMapping(value = "room/AddRooms", method=RequestMethod.POST)
	@ResponseBody
	public String AddRooms(@RequestParam("file") MultipartFile file){
		System.out.println(file.getOriginalFilename());
		List<Room> roomList = new ExcelUtils().getExcelInfo(file.getOriginalFilename(), file);
		System.out.println(roomList);
		return "上传成功";
	}
}
