package com.org.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.org.model.Classes;
import com.org.model.Department;
@Mapper
public interface DepartDao {

int UniquenessCheckForDept(Integer dept_id);
void modifyDept(Department dept);
void delete(Integer dept_id);
Department getDept(Integer dept_id);
List<Department> getDepartmentList(@Param(value ="dept_name")String dept_name);
void addDept(Department dept);
List<Department> getDepartList();
	/**
	 * 根据院系和班级名选班级
	 */
	List<Classes> getClassList(@Param(value = "dept_id")Integer depart_id, @Param(value = "class_name")String class_name);
}
