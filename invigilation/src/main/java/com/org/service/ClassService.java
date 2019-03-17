package com.org.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.org.model.Classes;
@Service
public interface ClassService {
	String UniquenessCheckForClass(Integer class_id);

	String addClass(String Info);

	List<Classes> getClassList(String class_name) throws UnsupportedEncodingException;

	String getClass(Integer class_id);

	String delete(Integer class_id);

	String modifyClass(String Info);
}
