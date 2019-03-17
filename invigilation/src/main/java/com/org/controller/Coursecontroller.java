package com.org.controller;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.org.service.CourseService;
@Controller
public class Coursecontroller {
	@Autowired
	private CourseService courseService;
	@RequestMapping(value = "course/UniquenessCheckForCourse", method=RequestMethod.POST)
	@ResponseBody
	public String UniquenessCheckForCourse(Integer course_id){
		return courseService.UniquenessCheckForCourse(course_id);
	}
	
	@RequestMapping(value = "course/addCourse", method=RequestMethod.POST)
	@ResponseBody
	public String addCourse(String Info){
		System.out.print(Info);
		return courseService.addCourse(Info);
	}
	
	@RequestMapping(value = "course/modifyCourse", method=RequestMethod.POST)
	@ResponseBody
	public String modifyCourse(String Info){
		return courseService.modifyCourse(Info);
	}
	
	@RequestMapping(value ="course/getCourseList", method=RequestMethod.POST)
	@ResponseBody
	public String getCourseList(@RequestParam(value ="course_name")String course_name) throws UnsupportedEncodingException{
		
		if(course_name!=null)
			course_name = new String(course_name.getBytes("iso-8859-1"), "utf-8");
		return courseService.getCourseList(course_name);
	}
	@RequestMapping(value ="course/getcourseList", method=RequestMethod.POST)
	@ResponseBody
	public String getcourseList(@RequestParam(value ="semester_id")Integer semester_id,@RequestParam(value ="teacher_id")Integer teacher_id) throws UnsupportedEncodingException{
	
		return courseService.getcourseList(semester_id,teacher_id);
	}
	@RequestMapping(value ="course/getclassList", method=RequestMethod.POST)
	@ResponseBody
	public String getclassList(@RequestParam(value ="semester_id")Integer semester_id,@RequestParam(value ="course_id")Integer course_id) throws UnsupportedEncodingException{
		return courseService.getclassList(semester_id,course_id);
	}
	@RequestMapping(value = "course/getCourse", method=RequestMethod.POST)
	@ResponseBody
	public String getCourse(Integer course_id){
		return courseService.getCourse(course_id);
	}
	
	
	@RequestMapping(value = "course/delete", method=RequestMethod.POST)
	@ResponseBody
	public String delete(Integer course_id){
		return courseService.delete(course_id);
	}
}
