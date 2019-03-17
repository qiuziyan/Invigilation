package com.org.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.org.model.Semester;
import com.org.model.Type;
@Mapper
public interface SemesterDao {
	List<Semester> getSemesterList();
	List<Type> getTypeList();
}
