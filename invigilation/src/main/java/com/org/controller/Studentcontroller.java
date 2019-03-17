package com.org.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import com.org.model.Student;
import com.org.service.StudentService;
@Controller
@RequestMapping(value = "student")
public class Studentcontroller {
	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value = "/getStudent")
	@ResponseBody
	public String getStudent(String stu_no){
		try{
			Student student = studentService.getStudnet(stu_no);
			
			return JSONObject.toJSONString(student);
		}catch(Exception e){
			e.printStackTrace();
			return "falied";
		}
	}
	@RequestMapping(value = "/UniquenessCheckForStudent", method=RequestMethod.POST)
	@ResponseBody
	public String UniquenessCheckForStudent(String stu_no){
		return studentService.UniquenessCheckForStudent(stu_no);
	}
	@RequestMapping(value = "/modifyStudent", method=RequestMethod.POST)
	@ResponseBody
	public String modifyStudent(String Info){
		System.out.print(Info);
		return studentService.modifyStudent(Info);
		
	}
	
}
