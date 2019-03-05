package com.org.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;

import com.org.dao.ClassDao;
import com.org.model.Department;
import com.org.service.ClassService;
import com.org.model.Classes;
@Service
public class ClassServiceImpl implements ClassService{
	@Autowired
	ClassDao classDao;

	public String UniquenessCheckForClass(Integer class_id) {
		if(classDao.UniquenessCheckForClass(class_id) > 0)
			return "false";
		else
			return "ok";
	}

	public String addClass(String Info) {
		JSONObject json = JSONObject.parseObject(Info);
		Classes classes = new  Classes();
	//	classes.setClass_id(json.getInteger("class_id"));
		classes.setClass_name(json.getString("class_name"));
		classes.setClass_grade(json.getInteger("class_grade"));
		classes.setClass_contact(json.getString("class_contact"));
		classes.setClass_phone(json.getString("class_phone"));
		Department depart = new Department();
		depart.setDept_id(json.getInteger("dept_id"));
		classes.setDepart(depart);
		try{
			classDao.addClass(classes);
		}catch(Exception e){
			e.printStackTrace();
			return "false";
		}
		return "ok";
	}

	public List<Classes> getClassList(String class_name) throws UnsupportedEncodingException {
		return classDao.getClassList(class_name);
	}

	public String getClass(Integer class_id) {
		Classes classes = classDao.getClass(class_id);
		return JSONObject.toJSONString(classes);
	}

	public String delete(Integer class_id) {
		try{
			classDao.delete(class_id);
		}catch(Exception e){
			e.printStackTrace();
			return "false";
		}
		return "ok";
	}

	public String modifyClass(String Info) {
		JSONObject json = JSONObject.parseObject(Info);
		Classes classes = new  Classes();
		classes.setClass_id(json.getInteger("class_id"));
		classes.setClass_name(json.getString("class_name"));
		classes.setClass_grade(json.getInteger("class_grade"));
		classes.setClass_contact(json.getString("class_contact"));
		classes.setClass_phone(json.getString("class_phone"));
		Department depart = new Department();
		depart.setDept_id(json.getInteger("dept_id"));
		classes.setDepart(depart);
		try{
			classDao.modifyClass(classes);
		}catch(Exception e){
			e.printStackTrace();
			return "false";
		}
		return "ok";
	}


	
}
