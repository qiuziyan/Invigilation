package com.org.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.alibaba.fastjson.JSONObject;
import com.org.dao.TeacherDao;
import com.org.model.Department;
import com.org.model.Freetime;
import com.org.model.Req;
import com.org.model.Section;
import com.org.model.Teacher;
import com.org.service.TeacherService;

@Service
public class TeacherServiceImpl implements TeacherService{
	@Autowired
	TeacherDao teacherDao;

	public String UniquenessCheckForTeacher(String teacher_no) {
		if(teacherDao.UniquenessCheckForTeacher(teacher_no) > 0)
			return "false";
		else
			return "ok";
	}

	public void addRequest(Req req) throws Exception {
		List<String> classes = req.getClasses();
		try{
			teacherDao.addRequest(req);
		}catch(Exception e){
			throw e;
		}
		teacherDao.addClassRel(classes, req.getReq_id());
	}
	
	public String addTeacher(String Info) {
		JSONObject json = JSONObject.parseObject(Info);
		Teacher teacher = new  Teacher();
		teacher.setTeacher_no(json.getString("teacher_no"));
		teacher.setTeacher_name(json.getString("teacher_name"));
		teacher.setTeacher_phone(json.getString("teacher_phone"));
		teacher.setEmail(json.getString("email"));
		Section section = new Section();
		section.setSection_id(json.getInteger("section_id"));
		teacher.setSection(section);
		try{
			teacherDao.addTeacher(teacher);
		}catch(Exception e){
			e.printStackTrace();
			return "false";
		}
		return "ok";
	}

	public List<Teacher> getTeacherList(String teacher_name) throws UnsupportedEncodingException {
		return teacherDao.getTeacherList(teacher_name);
	}
	
	public String getTeacher(String teacher_no) {
		Teacher  teacher = teacherDao.getTeacher(teacher_no);
	
		return JSONObject.toJSONString(teacher);
	}

	public String delete(String teacher_no) {
		try{
			teacherDao.delete(teacher_no);
		}catch(Exception e){
			e.printStackTrace();
			return "false";
		}
		return "ok";
	}

	public String modifyTeacher(String Info) {
		JSONObject json = JSONObject.parseObject(Info);
		Teacher teacher = new  Teacher();
		teacher.setTeacher_no(json.getString("teacher_no"));
		teacher.setTeacher_name(json.getString("teacher_name"));
		teacher.setTeacher_phone(json.getString("teacher_phone"));
		teacher.setEmail(json.getString("email"));
		Section section = new Section();
		section.setSection_id(json.getInteger("section_id"));
		teacher.setSection(section);
		Department depart=new Department();
		depart.setDept_id(json.getInteger("dept_id"));
		teacher.setDepart(depart);
		try{
			teacherDao.modifyTeacher(teacher);
		}catch(Exception e){
			e.printStackTrace();
			return "false";
		}
		return "ok";
	}
	public String modifyteacher(String Info) {
		JSONObject json = JSONObject.parseObject(Info);
		Teacher teacher = new  Teacher();
		teacher.setTeacher_no(json.getString("teacher_no"));
		teacher.setTeacher_name(json.getString("teacher_name"));
		teacher.setTeacher_phone(json.getString("teacher_phone"));
		teacher.setEmail(json.getString("email"));
		try{
			teacherDao.modifyteacher(teacher);
		}catch(Exception e){
			e.printStackTrace();
			return "false";
		}
		return "ok";
	}

	public String getsectionList(Integer dept_id) {

		return JSONObject.toJSONString(teacherDao.getsectionList(dept_id));
	}
	

	public void addFreeTime(Integer week,String starttime, String endtime, Integer teacher_id) {
		teacherDao.addFreeTime(week,starttime,endtime,teacher_id);
	}

	public List<Freetime> getFreeTimeList(String time, Integer teacher_id) {
		return teacherDao.getFreeTimeList(time, teacher_id);
	}

	public void deleteFreeTime(Integer id) {
		teacherDao.deleteFreeTime(id);
		
	}

	public List<Req> getRequestList(Integer teacher_id,String course_name) {
		List<Req> reqList =  teacherDao.getRequestList(teacher_id,course_name);
		for(int i = 0; i < reqList.size(); i++){
			reqList.get(i).setClasses(teacherDao.getClasses(reqList.get(i).getReq_id()));
			reqList.get(i).setClassnames(teacherDao.getClassnames(reqList.get(i).getReq_id()));
		}
		return reqList;
	}
	public List<Teacher> getStaticList(String teacher_name) {
		List<Teacher> teacherList = teacherDao.getTeacherList(teacher_name);
		for(int i = 0; i < teacherList.size(); i++){
			teacherList.get(i).setNumber(teacherDao.getInviNumber(teacherList.get(i).getTeacher_id()));
		}
		return teacherList;
	}

	public List<Teacher> getInviTecherList(String start_date, String end_date) {
		List<Teacher> teacherList = teacherDao.getFreeTimeTecherList(start_date, end_date);
		for(int i = 0; i < teacherList.size(); i++){
			teacherList.get(i).setNumber(teacherDao.getInviNumber(teacherList.get(i).getTeacher_id()));
		}
		return teacherList;
	}


}
