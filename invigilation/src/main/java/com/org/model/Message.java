package com.org.model;

public class Message {
	private int message_id;
	private String msg_title;
	private String msg_content;
	private String user_name;
	private String create_date;
	public int getMessage_id() {
		return message_id;
	}
	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}
	public String getMsg_title() {
		return msg_title;
	}
	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	@Override
	public String toString() {
		return "Message [message_id=" + message_id + ", msg_title=" + msg_title + ", msg_content=" + msg_content
				+ ", user_name=" + user_name + ", create_date=" + create_date + "]";
	}

}
