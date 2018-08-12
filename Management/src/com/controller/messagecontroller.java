package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dao.messageDao;
import com.entity.publicinit;

@Controller
public class messagecontroller {
	@Autowired
	public messageDao messagedao;

	//上传文件
	@RequestMapping(value = "/message_form", produces = "application/json; charset=utf-8")
	public ModelAndView newssave(HttpServletRequest arg0,
			HttpServletResponse arg1) {
		String jsonstr = "";
		ModelAndView modelview = new ModelAndView("webadmin/newsadd");
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("content", arg0.getParameter("content").toString());//这个就是ckeditor前台传过来的值
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelview;
	}

	
	
}
