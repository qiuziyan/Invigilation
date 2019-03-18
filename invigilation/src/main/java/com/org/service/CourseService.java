package com.org.service;

import org.springframework.stereotype.Service;


public interface CourseService {
	String UniquenessCheckForCourse(Integer course_id);
	String addCourse(String info);
	String getCourseList(String course_name);
	String getcourseList(Integer semester_id,Integer teacher_id);
	String  getCourse(Integer course_id);
	String delete(Integer course_id);
	String modifyCourse(String info);
	String getclassList(Integer semester_id,Integer course_id);
}
