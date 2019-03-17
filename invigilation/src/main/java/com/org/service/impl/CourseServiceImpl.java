package com.org.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.org.dao.CourseDao;
import com.org.model.Course;
import com.org.service.CourseService;
@Service
public class CourseServiceImpl implements CourseService{
	@Autowired
	CourseDao courseDao;

	public String UniquenessCheckForCourse(Integer course_id) {
		if(courseDao.UniquenessCheckForCourse(course_id) > 0)
			return "false";
		else
			return "ok";
	}

	public String addroom(String info) {
		JSONObject json = JSONObject.parseObject(info);
		Course course = new  Course();
		course.setCourse_id(json.getInteger("course_id"));
		course.setCourse_name(json.getString("course_name"));
		course.setIs_examed(json.getInteger("is_examed"));
		try{
			courseDao.addCourse(course);
		}catch(Exception e){
			e.printStackTrace();
			return "false";
		}
		return "ok";
	}

	public String getCourseList(String course_name) {
		
		return JSONObject.toJSONString(courseDao.getCourseList(course_name));
	}
	public String getcourseList(Integer semester_id,Integer teacher_id) {

		return JSONObject.toJSONString(courseDao.getcourseList(semester_id,teacher_id));
	}
	public String getclassList(Integer semester_id,Integer course_id) {
		return JSONObject.toJSONString(courseDao.getclassList(semester_id,course_id));
	}

	public String getCourse(Integer course_id) {
		Course  course = courseDao.getCourse(course_id);
		return JSONObject.toJSONString(course);
	}

	public String delete(Integer course_id) {
		try{
			courseDao.delete(course_id);
		}catch(Exception e){
			e.printStackTrace();
			return "false";
		}
		return "ok";
	}

	public String modifyCourse(String info) {
		JSONObject json = JSONObject.parseObject(info);
		Course course= new  Course();
		course.setCourse_id(json.getInteger("course_id"));
		course.setCourse_name(json.getString("course_name"));
		course.setIs_examed(json.getInteger("is_examed"));
		try{
			courseDao.modifyCourse(course);
		}catch(Exception e){
			e.printStackTrace();
			return "false";
		}
		return "ok";
	}

	public String addCourse(String info) {
		JSONObject json = JSONObject.parseObject(info);
		Course course= new  Course();
	//	course.setCourse_id(json.getInteger("course_id"));
		course.setCourse_name(json.getString("course_name"));
		course.setIs_examed(json.getInteger("is_examed"));
		try{
			courseDao.addCourse(course);
		}catch(Exception e){
			e.printStackTrace();
			return "false";
		}
		return "ok";
	}

}
