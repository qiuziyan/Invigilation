package com.org.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSONObject;
import com.org.model.Classes;
import com.org.model.Course;
import com.org.model.Exam;
import com.org.model.Req;
import com.org.model.Type;
import com.org.service.InvigilationService;
import com.org.model.Room;
import com.org.model.Semester;
@Controller
@RequestMapping(value = "invigilate")
public class Invigilationcontroller {
	@Autowired
	private InvigilationService invigilationService;
	/**
	 * 根据班级 和 监考老师找到对应的监考信息
	 * @param className
	 * @param teacherID
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/getInvigilationList", method=RequestMethod.POST)
	@ResponseBody
	public String getInvigilationList(@RequestParam(value ="class_name")String class_name,@RequestParam(value ="teacher_id")Integer teacher_id,@RequestParam(value ="course_name")String course_name) throws UnsupportedEncodingException{
			try{
				if(class_name!=null)
					class_name = new String(class_name.getBytes("iso-8859-1"), "utf-8");
				if(course_name!=null)
					course_name = new String(course_name.getBytes("iso-8859-1"), "utf-8");
				List<Exam> inviList = invigilationService.getInvigilationList(class_name, teacher_id,course_name);
			
				return JSONObject.toJSONString(inviList);
			}catch(Exception e){
				e.printStackTrace();
				return "failed";
			}
		}
	@RequestMapping(value = "/getRequestList", method=RequestMethod.POST)
	@ResponseBody
	public String getRequestList(@RequestParam(value ="class_name")String class_name) throws UnsupportedEncodingException{
			try{
				if(class_name!=null)
					class_name = new String(class_name.getBytes("iso-8859-1"), "utf-8");
				System.out.print(class_name);
				List<Req> reqList = invigilationService.getRequestList(class_name);
				return JSONObject.toJSONString(reqList);
			}catch(Exception e){
				e.printStackTrace();
				return "failed";
			}
		}
	@RequestMapping(value = "/getClassList", method=RequestMethod.POST)
	@ResponseBody
	public String getClassList(@RequestParam(value ="req_id")Integer req_id){
			try{
				List<Classes> classList = invigilationService.getClassList(req_id);
				return JSONObject.toJSONString(classList);
			}catch(Exception e){
				e.printStackTrace();
				return "failed";
			}
		}
	@RequestMapping(value = "/getRequest", method=RequestMethod.POST)
	@ResponseBody
	public String getRequest(Integer req_id){
		try{
			Req req = invigilationService.getRequest(req_id);
			return JSONObject.toJSONString(req);
		}catch(Exception e){
			e.printStackTrace();
			return "failed";
		}
	}
	@RequestMapping(value = "/addInvigilate", method=RequestMethod.POST)
	@ResponseBody
	public String addInvigilate(String Info){
		try{
			System.out.print(Info);
			Exam invi = new Exam();
			JSONObject obj = JSONObject.parseObject(Info);
			invi.setCreate_date(obj.getString("create_date"));
			invi.setExam_name(obj.getString("exam_name"));
			invi.setStart_date(obj.getString("start_date"));
			invi.setEnd_date(obj.getString("end_date"));
			invi.setWeek(obj.getInteger("week"));
			invi.setUser_name(obj.getString("user_name"));
			Room room = new Room();
			room.setRoom_id(obj.getInteger("room_id"));
			invi.setRoom(room);
			Semester semester=new Semester();
			semester.setSemester_id(obj.getString("semester_id"));
			invi.setSemester(semester);
			Course course=new Course();
			course.setCourse_id(obj.getInteger("course_id"));
			invi.setCourse(course);
			Type type=new Type();
			type.setExam_type_id(obj.getString("exam_type_id"));
			invi.setType(type);
			Req req=new Req();
			req.setReq_id(obj.getInteger("req_id"));
			invi.setReq(req);
			invi.setClasses(JSONObject.parseArray(obj.getJSONArray("classes").toJSONString(), String.class));
			invi.setTeachers(JSONObject.parseArray(obj.getJSONArray("teachers").toJSONString(), String.class));
			invigilationService.addInvigilate(invi);
			return "ok";
		}catch(Exception e){
			e.printStackTrace();
			return "falied";
		}	
	}
	@RequestMapping(value = "/getInvigilate", method=RequestMethod.POST)
	@ResponseBody
	public String getInvigilate(Integer exam_id){
		try{
			Exam invi = invigilationService.getInvigilate(exam_id);
			return JSONObject.toJSONString(invi);
		}catch(Exception e){
			e.printStackTrace();
			return "failed";
		}
	}
	
	/**
	 * 修改监考记录
	 * @param Info
	 * @return
	 */
	@RequestMapping(value = "/modifyInvigilate", method=RequestMethod.POST)
	@ResponseBody
	public String modifyInvigilate(String Info){
		try{
			Exam invi = new Exam();
			System.out.print(Info);
			JSONObject obj = JSONObject.parseObject(Info);
			invi.setExam_id(obj.getInteger("exam_id"));
			invi.setExam_name(obj.getString("exam_name"));
			invi.setCreate_date(obj.getString("create_date"));
			invi.setWeek(obj.getInteger("week"));
			invi.setStart_date(obj.getString("start_date"));
			invi.setEnd_date(obj.getString("end_date"));
			Room room = new Room();
			room.setRoom_id(obj.getInteger("room_id"));
			invi.setRoom(room);
            Semester semester=new Semester();
            semester.setSemester_id(obj.getString("semester_id"));
            invi.setSemester(semester);
            Type type=new Type();
            type.setExam_type_id(obj.getString("exam_type_id"));
            invi.setType(type);
			invi.setClasses(JSONObject.parseArray(obj.getJSONArray("classes").toJSONString(), String.class));
			invi.setTeachers(JSONObject.parseArray(obj.getJSONArray("teachers").toJSONString(), String.class));
			invigilationService.modifyInvigilate(invi);
			return "ok";
		}catch(Exception e){
			e.printStackTrace();
			return "falied";
		}
		
	}
	
}
