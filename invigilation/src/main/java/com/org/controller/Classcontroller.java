package com.org.controller;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import com.org.service.ClassService;
@Controller
public class Classcontroller {
	@Autowired
	private ClassService classService;
	
	@RequestMapping(value = "class/UniquenessCheckForClass", method=RequestMethod.POST)
	@ResponseBody
	public String UniquenessCheckForClass(Integer class_id){
		return classService.UniquenessCheckForClass(class_id);
	}
	
	@RequestMapping(value = "class/addClass", method=RequestMethod.POST)
	@ResponseBody
	public String addClass(String Info){
		return classService.addClass(Info);
	}
	
	@RequestMapping(value = "class/modifyClass", method=RequestMethod.POST)
	@ResponseBody
	public String modifyClass(String Info){
		return classService.modifyClass(Info);
	}
	
	@RequestMapping(value = "class/getClassList", method=RequestMethod.POST)
	@ResponseBody
	public String getClassList(@RequestParam(value = "class_name")String class_name) throws UnsupportedEncodingException{
		if(class_name!=null)
			class_name = new String(class_name.getBytes("iso-8859-1"), "utf-8");
		return JSONObject.toJSONString(classService.getClassList(class_name));
	}

	@RequestMapping(value = "class/getClass", method=RequestMethod.POST)
	@ResponseBody
	public String getClass(Integer class_id){
		return classService.getClass(class_id);
	}
	
	@RequestMapping(value = "class/delete", method=RequestMethod.POST)
	@ResponseBody
	public String delete(Integer class_id){
		return classService.delete(class_id);
	}
}
