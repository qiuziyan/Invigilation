package com.org.service;

import org.springframework.stereotype.Service;

@Service
public interface MessageService {
	String addMessage(String Info);
	String getTitleList();
	String  getMessage(Integer message_id);
}
