package com.org.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.org.model.Classes;
@Mapper
public interface ClassDao {
	int UniquenessCheckForClass(@Param(value ="class_id")Integer class_id);

	void addClass(Classes classes);

	List<Classes> getClassList(@Param(value ="class_name")String class_name);
	void modifyClass(Classes  classes);
	Classes getClass(@Param(value ="class_id")Integer class_id);

	void delete(Integer class_id);
}
