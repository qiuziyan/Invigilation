package com.org.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.org.model.Student;
@Mapper
public interface StudentDao {
	Student getStudent(@Param(value = "stu_no")String stu_no);
	int UniquenessCheckForStudent(String stu_no);
	void modifyStudent(Student student);
}
