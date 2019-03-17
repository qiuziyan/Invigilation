package com.org.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.org.service.SemesterService;
@Controller
public class Semestercontroller {
	@Autowired
	private SemesterService semesterService;
	@RequestMapping(value = "semester/getSemesterList", method=RequestMethod.POST)
	@ResponseBody
	public String getSemesterList(){
		return JSONObject.toJSONString(semesterService.getSemesterList());
	}
	@RequestMapping(value = "semester/getTypeList", method=RequestMethod.POST)
	@ResponseBody
	public String getTypeList(){
		return JSONObject.toJSONString(semesterService.getTypeList());
	}
}
