package com.org.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.org.dao.UserDao;
import com.org.model.Course;
import com.org.model.User;
import com.org.service.loginService;
import com.org.service.impl.loginServiceImpl;

@Service
public class loginServiceImpl implements loginService{
	@Autowired
	private	UserDao loginDao;
	private static final int success = 1;
	public String Login(String ID, String password,Integer type) {
		if(success == loginDao.Login(ID, password,type))
		{	if(type==0)
				return "admin";
		    if(type==1)
		    	return "teacher";
		    if(type==2)
		    	return "student";
		}
			return "ID or password is error";
	}
	public String modifyUser(String info) {
		JSONObject json = JSONObject.parseObject(info);
		User user= new  User();
		user.setUser_name(json.getString("user_name"));
		user.setPassword(json.getString("password"));
		try{
			loginDao.modifyUser(user);
		}catch(Exception e){
			e.printStackTrace();
			return "false";
		}
		return "ok";
	}
	public String getUser(String user_name) {
		User  user = loginDao.getUser(user_name);
		return JSONObject.toJSONString(user);
	}
}
