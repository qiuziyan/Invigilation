package com.org.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.org.model.Classes;
import com.org.model.Exam;
import com.org.model.Req;

@Service
public interface InvigilationService {
	void addInvigilate(Exam invi) throws Exception;
	List<Exam> getInvigilationList(String class_name, Integer teacher_id,String course_name);
	List<Req> getRequestList(String class_name);
	Req getRequest(Integer req_id);
	List<Classes> getClassList(Integer req_id);
	/* ��ȡ��ID��Ӧ�ļ࿼��Ϣ*/
	Exam getInvigilate(Integer exam_id);
	
	/* �޸ļ࿼��Ϣ*/
	void modifyInvigilate(Exam invi) throws Exception;
}
