package com.org.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.org.dao.StudentDao;
import com.org.model.Course;
import com.org.model.Student;
import com.org.service.StudentService;
@Service
public class StudentServiceImpl implements StudentService{
	@Autowired
	private StudentDao studentDao;

	public Student getStudnet(String stu_no) {
		
		return studentDao.getStudent(stu_no);
	}
	public String UniquenessCheckForStudent(String stu_no) {
		if(studentDao.UniquenessCheckForStudent(stu_no) > 0)
			return "false";
		else
			return "ok";
	}
	public String modifyStudent(String info) {
		JSONObject json = JSONObject.parseObject(info);
		Student stu= new  Student();
		stu.setStu_no(json.getString("stu_no"));
		stu.setStu_name(json.getString("stu_name"));
		stu.setStu_phone(json.getString("stu_phone"));
		stu.setEmail(json.getString("email"));
		stu.setDom_name(json.getString("dom_name"));
		try{
			studentDao.modifyStudent(stu);
		}catch(Exception e){
			e.printStackTrace();
			return "false";
		}
		return "ok";
	}
}
