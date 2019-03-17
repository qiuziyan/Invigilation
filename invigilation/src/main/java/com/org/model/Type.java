package com.org.model;

public class Type {
	private String exam_type_id;
	private String exam_type;
	public String getExam_type_id() {
		return exam_type_id;
	}
	public void setExam_type_id(String exam_type_id) {
		this.exam_type_id = exam_type_id;
	}
	public String getExam_type() {
		return exam_type;
	}
	public void setExam_type(String exam_type) {
		this.exam_type = exam_type;
	}
	@Override
	public String toString() {
		return "Type [exam_type_id=" + exam_type_id + ", exam_type=" + exam_type + "]";
	}
	

}
