package com.org.service;

import org.springframework.stereotype.Service;

@Service
public interface loginService {
	String Login(String ID, String password, Integer type);
	String modifyUser(String info);
	String  getUser(String user_name);
}
