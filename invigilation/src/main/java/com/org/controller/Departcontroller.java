package com.org.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.org.service.CourseService;
import com.org.service.DepartService;

import com.org.model.Classes;
@Controller
@RequestMapping("/dept")
public class Departcontroller {
	@Autowired
	private DepartService departService;
	@RequestMapping(value = "/UniquenessCheckForDept", method=RequestMethod.POST)
	@ResponseBody
	public String UniquenessCheckForDept(Integer dept_id){
		System.out.print(dept_id);
		return departService.UniquenessCheckForDept(dept_id);
	}
	
	@RequestMapping(value = "/addDept", method=RequestMethod.POST)
	@ResponseBody
	public String addDept(String Info){
		System.out.print(Info);
		return departService.addDept(Info);
	}
	
	@RequestMapping(value = "/modifyDept", method=RequestMethod.POST)
	@ResponseBody
	public String modifyDept(String Info){
		return departService.modifyDept(Info);
	}
	
	@RequestMapping(value ="/getDepartmentList", method=RequestMethod.POST)
	@ResponseBody
	public String getDepartmentList(@RequestParam(value ="dept_name")String dept_name) throws UnsupportedEncodingException{
		
		if(dept_name!=null)
			dept_name = new String(dept_name.getBytes("iso-8859-1"), "utf-8");
		
		return departService.getDepartmentList(dept_name);
	}
	@RequestMapping(value = "/getDept", method=RequestMethod.POST)
	@ResponseBody
	public String getDept(Integer dept_id){
		return departService.getDept(dept_id);
	}
	
	
	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	@ResponseBody
	public String delete(Integer dept_id){
		return departService.delete(dept_id);
	}
	@RequestMapping(value = "/getDepartList", method=RequestMethod.POST)
	@ResponseBody
	public String getDepartList(){
		return JSONObject.toJSONString(departService.getDepartList());
	}
	@RequestMapping(value = "/getClassList", method=RequestMethod.POST)
	@ResponseBody
	public String getClassList(Integer depart_id){
		try{
			List<Classes> classList = departService.getClassList(depart_id,"");
			return JSONObject.toJSONString(classList);
		}catch(Exception e){
			e.printStackTrace();
			return "falied";
		}
	}
}
