package cn.njit.invigilation.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import cn.njit.invigilation.dao.Dao;



@RestController
public class TestController {
	@Autowired
	private Dao dao;

	private static final Logger LOGGER = LoggerFactory.getLogger(TestController.class);
	private int i;
	@RequestMapping("/test")
	public ModelAndView test() {
		return new ModelAndView("show","name","name") ;
	}
	public String test4() {
		return "下班了 吃晚饭...。";
	}
}
