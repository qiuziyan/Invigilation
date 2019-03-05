package com.org.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.org.model.Message;

@Mapper
public interface MessageDao {
	void addMessage(Message message);
	List<Message> getTitleList();
	Message getMessage(Integer message_id);
}
