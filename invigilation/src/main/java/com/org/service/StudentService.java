package com.org.service;

import org.springframework.stereotype.Service;

import com.org.model.Student;

public interface StudentService {
	Student getStudnet(String stu_no);
String UniquenessCheckForStudent(String stu_no);
String modifyStudent(String info);
}