package com.org.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


import com.org.model.Freetime;
import com.org.model.Req;
import com.org.model.Section;
import com.org.model.Teacher;

@Mapper
public interface TeacherDao {
	int UniquenessCheckForTeacher(@Param(value ="teacher_no")String teacher_no);
	void addClassRel(@Param(value = "classes")List<String> classes, @Param(value = "req_id")Integer req_id);
	void addTeacher(Teacher teacher);
	void addRequest(Req req);
	List<Teacher> getTeacherList(@Param(value ="teacher_name")String teacher_name);
	Teacher getTeacher(@Param(value ="teacher_no")String teacher_no);
	Freetime getId();
	void delete(String teacher_no);
	List<Section> getsectionList(@Param(value ="dept_id")Integer dept_id);
	void modifyTeacher(Teacher teacher);
	void modifyteacher(Teacher teacher);
	/*添加老师空闲时间*/
	void addFreeTime(@Param(value = "week")Integer week,@Param(value = "starttime")String starttime, @Param(value = "endtime")String endtime, @Param(value = "teacher_id")Integer teacher_id);
	
	/*获取老师空闲时间*/
	List<Freetime> getFreeTimeList(@Param(value = "time")String time, @Param(value = "teacher_id")Integer teacher_id);
	
	/* 删除空闲时间*/
	void deleteFreeTime(@Param(value ="id")Integer id);
	
	List<Req> getRequestList(@Param(value = "teacher_id")Integer teacher_id,@Param(value = "course_name")String course_name);
	/*获取空闲时间的老师列表*/
	List<Teacher>  getFreeTimeTecherList(@Param(value = "start_date")String start_date, @Param(value = "end_date")String end_date);
	/* 获取老师的监考次数*/
	int getInviNumber(@Param(value = "teacher_id")Integer teacher_id);
    List<String> getClasses(@Param(value = "req_id")Integer req_id);
	List<String> getClassnames(@Param(value = "req_id")Integer req_id);
}
