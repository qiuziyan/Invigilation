package com.org.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.org.model.Department;

import com.org.model.Classes;

public interface DepartService {
	String UniquenessCheckForDept(Integer dept_id);

	String addDept(String info);

	String getDepartmentList(String dept_name);
	List<Department> getDepartList();
	String  getDept(Integer dept_id);

	String delete(Integer dept_id);

	String modifyDept(String info);
	List<Classes> getClassList(Integer depart_id, String class_name);
}
