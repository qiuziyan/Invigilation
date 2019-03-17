package com.org.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.org.model.Classes;
import com.org.model.Course;

public interface CourseDao {
	int UniquenessCheckForCourse(Integer course_id);
	void modifyCourse(Course course);
	void delete(Integer course_id);
	Course getCourse(Integer course_id);
	List<Course> getCourseList(@Param(value ="course_name")String course_name);
	void addCourse(Course course);
	List<Course> getcourseList(@Param(value ="semester_id")Integer semester_id,@Param(value ="teacher_id")Integer teacher_id);
	List<Classes> getclassList(@Param(value ="semester_id")Integer semester_id,@Param(value ="course_id")Integer course_id);
}
