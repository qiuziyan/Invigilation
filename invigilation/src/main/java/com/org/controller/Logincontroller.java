package com.org.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.org.service.loginService;
@Controller
public class Logincontroller {
	@Autowired
	loginService loginService;
	@RequestMapping(value="/login",method = RequestMethod.POST)
	@ResponseBody
	public String login(String ID,String password,Integer type) throws Throwable {
		try {	
					return loginService.Login(ID, password,type);	
		} catch (Exception e) {
			 e.printStackTrace();
			 return "falied";
		}
	}
	@RequestMapping(value = "user/modifyUser", method=RequestMethod.POST)
	@ResponseBody
	public String modifyUser(String Info){
		return loginService.modifyUser(Info);
	}
	@RequestMapping(value = "user/getUser", method=RequestMethod.POST)
	@ResponseBody
	public String getUser(String user_name){
		return loginService.getUser(user_name);
	}
	
}
