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
import com.org.model.Course;
import com.org.model.Exam;
import com.org.model.Freetime;
import com.org.model.Req;
import com.org.model.Teacher;
import com.org.model.Type;
import com.org.service.TeacherService;


@Controller
public class Teachercontroller {
	@Autowired
	private TeacherService teacherService;
	
	@RequestMapping(value = "teacher/UniquenessCheckForTeacher", method=RequestMethod.POST)
	@ResponseBody
	public String UniquenessCheckForTeacher(String teacher_no){
		return teacherService.UniquenessCheckForTeacher(teacher_no);
	}
	
	@RequestMapping(value = "teacher/addTeacher", method=RequestMethod.POST)
	@ResponseBody
	public String addTeacher(String Info){
		return teacherService.addTeacher(Info);
	}
	
	@RequestMapping(value = "teacher/modifyTeacher", method=RequestMethod.POST)
	@ResponseBody
	public String modifyTeacher(String Info){
		return teacherService.modifyTeacher(Info);
	}
	@RequestMapping(value = "teacher/modifyteacher", method=RequestMethod.POST)
	@ResponseBody
	public String modifyteacher(String Info){
		return teacherService.modifyteacher(Info);
	}
	@RequestMapping(value = "teacher/getTeacherList", method=RequestMethod.POST)
	@ResponseBody
	public String getTecherList(@RequestParam(value = "teacher_name")String teacher_name) throws UnsupportedEncodingException{
	
		if(teacher_name!=null)
			teacher_name = new String(teacher_name.getBytes("iso-8859-1"), "utf-8");
		return JSONObject.toJSONString(teacherService.getTeacherList(teacher_name));
	}

	@RequestMapping(value ="teacher/getsectionList", method=RequestMethod.POST)
	@ResponseBody
	public String getsectionList(@RequestParam(value ="dept_id")Integer dept_id) throws UnsupportedEncodingException{
	
		return teacherService.getsectionList(dept_id);
	}
	
	@RequestMapping(value = "teacher/getTeacher", method=RequestMethod.POST)
	@ResponseBody
	public String getTeacher(String teacher_no){
		return teacherService.getTeacher(teacher_no);
	}
	
	@RequestMapping(value = "teacher/delete", method=RequestMethod.POST)
	@ResponseBody
	public String delete(String teacher_no){
		return teacherService.delete(teacher_no);
	}
	
	/**
	 * 教师添加空余时间
	 * @param startTime
	 * @param endTime
	 * @param teacherID
	 * @return
	 */
	@RequestMapping(value = "teacher/addFreeTime", method=RequestMethod.POST)
	@ResponseBody
	public String addFreeTime(Integer week,String starttime,String endtime, Integer teacher_id){
		try{
			teacherService.addFreeTime(week,starttime,endtime,teacher_id);
			return "ok";
		}catch(Exception e){
			e.printStackTrace();
			return "failed";
		}
	}
	/**
	 * 获取对应老师对应时间下的空闲时间
	 * @param time
	 * @param teacherID
	 * @return
	 */
	@RequestMapping(value = "teacher/getFreeTimeList", method=RequestMethod.POST)
	@ResponseBody
	public String getFreeTimeList(@RequestParam(value = "time")String time, @RequestParam(value = "teacher_id")Integer teacher_id){
		try{
			List<Freetime> freeTimeList = teacherService.getFreeTimeList(time, teacher_id);
			return JSONObject.toJSONString(freeTimeList);
		}catch(Exception e){
			e.printStackTrace();
			return "failed";
		}
	}
	/**
	 * 删除空闲时间
	 * @param ID
	 * @return
	 */
	@RequestMapping(value = "teacher/deleteFreeTime", method=RequestMethod.POST)
	@ResponseBody
	public String deleteFreeTime(Integer id){
		try{
			teacherService.deleteFreeTime(id);
			return "ok";
		}catch(Exception e){
			e.printStackTrace();
			return "failed";
		}
	}
	
	@RequestMapping(value = "teacher/getRequestList", method=RequestMethod.POST)
	@ResponseBody
	public String getRequestList(@RequestParam(value ="teacher_id")Integer teacher_id,@RequestParam(value ="course_name")String course_name) throws UnsupportedEncodingException{
			try{
				if(course_name!=null)
					course_name = new String(course_name.getBytes("iso-8859-1"), "utf-8");
				List<Req> reqList = teacherService.getRequestList(teacher_id,course_name);
				return JSONObject.toJSONString(reqList);
			}catch(Exception e){
				e.printStackTrace();
				return "failed";
			}
		}
	@RequestMapping(value = "teacher/getStaticList", method=RequestMethod.POST)
	@ResponseBody
	public String getStaticList(String teacher_name) throws UnsupportedEncodingException{
		if(teacher_name!=null)
			teacher_name = new String(teacher_name.getBytes("iso-8859-1"), "utf-8");
		try{
			List<Teacher> staticList  = teacherService.getStaticList(teacher_name);
			return JSONObject.toJSONString(staticList);
		}catch(Exception e){
			e.printStackTrace();
			return "failed";
		}
	}
	@RequestMapping(value = "teacher/addRequest", method=RequestMethod.POST)
	@ResponseBody
	public String addRequest(String Info){
		try{
			JSONObject obj = JSONObject.parseObject(Info);
			Req req = new Req();
			req.setReq_date(obj.getString("req_date"));
			req.setStatus(0);
			req.setClasses(JSONObject.parseArray(obj.getJSONArray("classes").toJSONString(), String.class));
			Type type = new Type();
			type.setExam_type_id(obj.getString("exam_type_id"));
			Teacher teacher = new Teacher();
			teacher.setTeacher_id(obj.getInteger("teacher_id"));
			Course course = new Course();
			course.setCourse_id(obj.getInteger("course_id"));
			req.setCourse(course);
			req.setTeacher(teacher);
			req.setType(type);
			teacherService.addRequest(req);
			return "ok";
		}catch(Exception e){
			e.printStackTrace();
			return "falied";
		}
	}
	@RequestMapping(value = "teacher/getInviTecherList", method=RequestMethod.POST)
	@ResponseBody
	public String getInviTecherList(String start_date, String end_date){
		try{
			List<Teacher> teaViewList  = teacherService.getInviTecherList(start_date, end_date);
			return JSONObject.toJSONString(teaViewList);
		}catch(Exception e){
			e.printStackTrace();
			return "failed";
		}
	}

}