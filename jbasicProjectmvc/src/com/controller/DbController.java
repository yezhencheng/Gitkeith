package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dao.IUserDao;
import com.entity.User;



// 这个类重点是如何访问数据库
@Controller
public class DbController {

	@Autowired
	public IUserDao iuser;

	public String view;

	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}

	// http://127.0.0.1:8080/jbasicProjectmvc/testdb.do
	@RequestMapping("/testdb")
	public ModelAndView handleRequest(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {

		ModelAndView model = new ModelAndView("index2");// 参数代表jsp的文件名
		model.addObject("hello", "hello hi");
		List<User> user_list = iuser.selectkey();
		return model;
	}

}
