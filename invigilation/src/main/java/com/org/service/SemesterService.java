package com.org.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.org.model.Semester;
import com.org.model.Type;
@Service
public interface SemesterService {
	List<Type> getTypeList();
	List<Semester> getSemesterList();
}
