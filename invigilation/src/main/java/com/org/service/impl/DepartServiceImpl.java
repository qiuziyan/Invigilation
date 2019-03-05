package com.org.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.org.dao.CourseDao;
import com.org.dao.DepartDao;
import com.org.model.Classes;
import com.org.model.Course;
import com.org.model.Department;
import com.org.service.DepartService;
@Service
public class DepartServiceImpl implements DepartService {
	@Autowired
	DepartDao departDao;

	public String UniquenessCheckForDept(Integer dept_id) {
		if(departDao.UniquenessCheckForDept(dept_id) > 0)
			return "false";
		else
			return "ok";
	}

	public String adddept(String info) {
		JSONObject json = JSONObject.parseObject(info);
		Department dept = new  Department();
		dept.setDept_id(json.getInteger("dept_id"));
		dept.setDept_name(json.getString("dept_name"));
		dept.setDept_contact(json.getString("dept_contact"));
		dept.setDept_phone(json.getString("dept_phone"));
		try{
			departDao.addDept(dept);
		}catch(Exception e){
			e.printStackTrace();
			return "false";
		}
		return "ok";
	}

	public String getDepartmentList(String dept_name) {
	
		return JSONObject.toJSONString(departDao.getDepartmentList(dept_name));
	}

	public String getDept(Integer dept_id) {
		Department  dept = departDao.getDept(dept_id);
		return JSONObject.toJSONString(dept);
	}

	public String delete(Integer dept_id) {
		try{
			departDao.delete(dept_id);
		}catch(Exception e){
			e.printStackTrace();
			return "false";
		}
		return "ok";
	}

	public String modifyDept(String info) {
		JSONObject json = JSONObject.parseObject(info);
		Department dept= new  Department();
		dept.setDept_id(json.getInteger("dept_id"));
		dept.setDept_name(json.getString("dept_name"));
		dept.setDept_contact(json.getString("dept_contact"));
		dept.setDept_phone(json.getString("dept_phone"));
		try{
			departDao.modifyDept(dept);
		}catch(Exception e){
			e.printStackTrace();
			return "false";
		}
		return "ok";
	}

	public String addDept(String info) {
		JSONObject json = JSONObject.parseObject(info);
		Department dept= new  Department();
	//	dept.setDept_id(json.getInteger("dept_id"));
		dept.setDept_name(json.getString("dept_name"));
		dept.setDept_contact(json.getString("dept_contact"));
		dept.setDept_phone(json.getString("dept_phone"));
		try{
			departDao.addDept(dept);
		}catch(Exception e){
			e.printStackTrace();
			return "false";
		}
		return "ok";
	}
	public List<Department> getDepartList() {
		
		return departDao.getDepartList();
	}

	public List<Classes> getClassList(Integer depart_id, String class_name) {
		
		return departDao.getClassList(depart_id,class_name);
	}
}
