package com.org.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.org.model.User;

@Mapper
public interface UserDao {
	int Login(@Param(value="ID")String ID, @Param(value="password")String password, @Param(value="type")Integer type);
	void modifyUser(User user);
	User getUser(String user_name);
}
