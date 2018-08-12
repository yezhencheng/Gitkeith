package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dao.publicinitDao;
import com.entity.publicinit;

@Controller
public class publicinitcontroller {
	@Autowired
	public publicinitDao publicinit;
	//公告初始化
	@RequestMapping("/publicinit")
	public ModelAndView pub(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
			ModelAndView model = new ModelAndView("front/index");
			List<publicinit> public_list = publicinit.select();
			model.addObject("list", public_list);
			String strBackUrl = arg0.getServerName() //服务器地址  
			+ ":"                    
			+ arg0.getServerPort()//端口号                        
			+ arg0.getContextPath();//项目名称           
			 //+ arg0.getServletPath()      //请求页面或其他地址 
			 //+ "?" + (arg0.getQueryString()); //参数 
	        return model;
	}
}
