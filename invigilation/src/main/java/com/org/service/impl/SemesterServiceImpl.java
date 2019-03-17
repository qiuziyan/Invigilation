package com.org.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.dao.SemesterDao;
import com.org.model.Semester;
import com.org.model.Type;
import com.org.service.SemesterService;

@Service
public class SemesterServiceImpl implements SemesterService{
	@Autowired
	SemesterDao semesterDao;
public List<Semester> getSemesterList() {
		
		return semesterDao.getSemesterList();
	}
	public List<Type> getTypeList(){
			
			return semesterDao.getTypeList();
		}
}
