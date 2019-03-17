package com.org.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.org.service.InvigilationService;
import com.org.dao.InvigilationDao;
import com.org.model.Classes;
import com.org.model.Exam;
import com.org.model.Req;

@Service
public class InvigilationServiceImpl implements InvigilationService {
	@Autowired
	InvigilationDao invigilationDao;
	public void addInvigilate(Exam invi) throws Exception {
		List<String> classes = invi.getClasses();
		List<String> teachers = invi.getTeachers();
		int req_id=invi.getReq().getReq_id();
		try{
			invigilationDao.addInvigilate(invi);
		}catch(Exception e){
			throw e;
		}
		invigilationDao.updateStatus(req_id);
		invigilationDao.addTeaRel(teachers , invi.getRoom().getRoom_id());
		invigilationDao.addClassRel(classes, invi.getRoom().getRoom_id());
	}
	public List<Exam> getInvigilationList(String class_name,Integer teacher_id,String course_name) {
		if(class_name != null && !"".equals(class_name))
			class_name = "%"+class_name+"%";
		List<Exam> inviList =  invigilationDao.getInvigilationList(class_name,teacher_id,course_name);
		for(int i = 0; i < inviList.size(); i++){
			inviList.get(i).setClasses(invigilationDao.getClasses(inviList.get(i).getRoom().getRoom_id()));
			inviList.get(i).setClassName(invigilationDao.getClassName(inviList.get(i).getRoom().getRoom_id()));
			inviList.get(i).setTeachers(invigilationDao.getTeachers(inviList.get(i).getRoom().getRoom_id()));
			inviList.get(i).setTeachersName(invigilationDao.getTeacherName(inviList.get(i).getRoom().getRoom_id()));
		}
		return inviList;
	}
	public List<Req> getRequestList(String class_name) {
		List<Req> reqList =  invigilationDao.getRequestList(class_name);
		for(int i = 0; i < reqList.size(); i++){
			reqList.get(i).setClasses(invigilationDao.getclasses(reqList.get(i).getReq_id()));
			reqList.get(i).setClassnames(invigilationDao.getClassnames(reqList.get(i).getReq_id()));
		}
		return reqList;
	}
	public Req getRequest(Integer req_id) {
		Req req = invigilationDao.getRequest(req_id);
		req.setClasses(invigilationDao.getclasses(req_id));
		req.setClassnames(invigilationDao.getClassnames(req_id));
		return req;
	}
	public List<Classes> getClassList(Integer req_id){
		List<Classes> classList =  invigilationDao.getClassList(req_id);
		return classList;
	}
	public Exam getInvigilate(Integer exam_id) {
		Exam invi = invigilationDao.getInvigilate(exam_id);
		invi.setClasses(invigilationDao.getClasses(invi.getRoom().getRoom_id()));
		invi.setClassName(invigilationDao.getClassName(invi.getRoom().getRoom_id()));
		invi.setTeachers(invigilationDao.getTeachers(invi.getRoom().getRoom_id()));
		invi.setTeachersName(invigilationDao.getTeacherName(invi.getRoom().getRoom_id()));
		return invi;
	}

	public void modifyInvigilate(Exam invi) throws Exception {
		List<String> teachers = invi.getTeachers();
		List<String> classes=invi.getClasses();
		try{
			invigilationDao.deleteTeaRel(invi.getRoom().getRoom_id());
			invigilationDao.deleteClassRel(invi.getRoom().getRoom_id());
			invigilationDao.modifyInvigilate(invi);
			invigilationDao.addTeaRel(teachers , invi.getRoom().getRoom_id());
			invigilationDao.addClassRel(classes, invi.getRoom().getRoom_id());
			
		}catch(Exception e){
			throw e;
		}
	}
}
