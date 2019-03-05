package com.org.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.org.dao.MessageDao;
import com.org.model.Course;
import com.org.model.Message;
import com.org.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService{
	@Autowired
	MessageDao messageDao;
	public String addMessage(String Info) {
		JSONObject json = JSONObject.parseObject(Info);
		Message msg = new  Message();
		msg.setMsg_title(json.getString("msg_title"));
		msg.setMsg_content(json.getString("msg_content"));
		msg.setUser_name(json.getString("user_name"));
		msg.setCreate_date(json.getString("create_date"));
		try{
			messageDao.addMessage(msg);
		}catch(Exception e){
			e.printStackTrace();
			return "false";
		}
		return "ok";
	}
public String getTitleList() {
		
		return JSONObject.toJSONString(messageDao.getTitleList());
	}
public String getMessage(Integer message_id) {
	Message  message = messageDao.getMessage(message_id);
	return JSONObject.toJSONString(message);
}
}
