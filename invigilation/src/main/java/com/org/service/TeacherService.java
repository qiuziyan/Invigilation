package com.org.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.org.model.Freetime;
import com.org.model.Req;
import com.org.model.Teacher;


public interface TeacherService {
	String UniquenessCheckForTeacher(String teacher_no);

	String addTeacher(String Info);
	List<Teacher> getTeacherList(String teacher_name) throws UnsupportedEncodingException;
	String getTeacher(String teacher_no);
	void addRequest(Req req) throws Exception;
	String delete(String teacher_no);
	String getsectionList(Integer dept_id);
	String modifyTeacher(String Info);
	String modifyteacher(String Info);
	/*�����ʦ����ʱ��*/
	void addFreeTime(Integer week,String starttime,String endtime, Integer teacher_id);
	
	/*��ȡ��ʦ����ʱ��*/
	List<Freetime> getFreeTimeList(@Param(value = "time")String time, @Param(value = "teacher_id")Integer teacher_id);
	
	/* ɾ������ʱ��*/
	void deleteFreeTime(@Param(value = "id")Integer id);
	
	List<Req> getRequestList(Integer teacher_id,String course_name);
	
	/*��ȡ����ʱ�����ʦ�б�*/
	List<Teacher>  getInviTecherList(@Param(value = "start_date")String start_date, @Param(value = "end_date")String end_date);
	List<Teacher> getStaticList(String teacher_name);
}
