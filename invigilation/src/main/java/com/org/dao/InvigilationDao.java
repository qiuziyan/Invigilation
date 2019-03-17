package com.org.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.org.model.Classes;
import com.org.model.Exam;
import com.org.model.Req;

@Mapper
public interface InvigilationDao {
	void addInvigilate(Exam invi);
	List<Exam> getInvigilationList(@Param(value = "class_name")String class_name,@Param(value = "teacher_id")Integer teacher_id,@Param(value = "course_name")String course_name);
	List<Req> getRequestList(@Param(value = "class_name")String class_name);
	Req getRequest(@Param(value ="req_id")Integer req_id);
	List<Classes> getClassList(@Param(value = "req_id")Integer req_id);
	List<String> getTeachers(@Param(value = "room_id")Integer room_id);
	/* 获取该监考信息下的老师Name集合 */
	List<String> getTeacherName(@Param(value = "room_id")Integer room_id);
    List<String> getClasses(@Param(value = "room_id")Integer room_id);
	/* 获取该监考信息下的老师Name集合*/
	List<String> getClassName(@Param(value = "room_id")Integer room_id);
	  List<String> getclasses(@Param(value = "req_id")Integer req_id);
		List<String> getClassnames(@Param(value = "req_id")Integer req_id);
		void addTeaRel(@Param(value = "teachers")List<String> teachers,@Param(value = "room_id")Integer room_id);
		
		void updateStatus(@Param(value="req_id")Integer req_id);
		/* 添加监考 监考班级关系表*/
		void addClassRel(@Param(value = "classes")List<String> classes, @Param(value = "room_id")Integer room_id);
		Exam getInvigilate(@Param(value ="exam_id")Integer exam_id);
		void modifyInvigilate(Exam invi);
		void deleteTeaRel(Integer room_id);
		void deleteClassRel(Integer room_id);
}
