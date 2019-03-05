package com.org.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;

import com.org.service.MessageService;

@Controller
public class Messagecontroller {
	@Autowired
	private MessageService messageService;
	@RequestMapping(value = "message/addMessage", method=RequestMethod.POST)
	@ResponseBody
	public String addMessage(String Info){
		return messageService.addMessage(Info);
	}
	@RequestMapping(value ="message/getTitleList", method=RequestMethod.POST)
	@ResponseBody
	public String getTitleList() {
		return messageService.getTitleList();
	}
	@RequestMapping(value = "message/getMessage", method=RequestMethod.POST)
	@ResponseBody
	public String getMessage(Integer message_id){
		System.out.print(messageService.getMessage(message_id));
		return messageService.getMessage(message_id);
	}
}
