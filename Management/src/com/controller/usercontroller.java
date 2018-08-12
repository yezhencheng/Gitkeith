package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dao.IUserDao;
import com.dao.yuyueDao;
import com.entity.User;
import com.entity.yuyue;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xerces.internal.impl.dv.xs.MonthDayDV;

@Controller
public class usercontroller {
	@Autowired
	public IUserDao iuser;
	@Autowired
	public yuyueDao yyd;
	
	@RequestMapping("/reg")
	public ModelAndView login(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
		String username=arg0.getParameter("username");
		String password=arg0.getParameter("password");
		String mail=arg0.getParameter("mail");
		String phone=arg0.getParameter("phone");
		Date day= new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date=df.format(day);
		User user=new User();
	     user.setUsername(username);
	     user.setPassword(password);
	     user.setMail(mail);
	     user.setPhone(phone);
	     user.setRegtime(date);
	     iuser.saveuser(user);
		ModelAndView mv= new ModelAndView("front/reg");
		mv.addObject("info", "close");
		return mv;
	}
	
	
	
	
	@RequestMapping(value = "/user_ajax", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String userlist(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		Map<String, String> sqlmap = new HashMap<String, String>();
		sqlmap.put("username", arg0.getParameter("username").toString());
		int pageindex = Integer.parseInt(arg0.getParameter("pagenumber")
				.toString());
		int pagesize = Integer.parseInt(arg0.getParameter("pagesize")
				.toString());
		PageHelper.startPage(pageindex, pagesize);
		List<User> datalist = iuser.selectuser();
		PageInfo<User> page = new PageInfo<User>(datalist);
		String liststr = "";
		liststr = JSONArray.fromObject(page.getList()).toString();
		jsonstr = "{\"datacount\":\"" + page.getTotal() + "\",\"datalist\":"
				+ liststr + "}";
		System.out.println(jsonstr);
		System.out.println(sqlmap.get("username"));
		return jsonstr;
	}
	
	
	
	@RequestMapping("/yuyue")
	public ModelAndView yuyue(HttpServletRequest arg0,HttpServletResponse arg1) throws Exception {
		String zhuanjia=arg0.getParameter("zhuanjia");
	 	String time=arg0.getParameter("time").toString();
		String session=(String) arg0.getSession().getAttribute("username");
		String txt=arg0.getParameter("txt");
		yuyue yy=new yuyue();
		yy.setUsername(session);
		yy.setZhuanjia(zhuanjia);
		yy.setTime(time);
		yy.setTxt(txt);
		yyd.addyuyue(yy);
		ModelAndView mv= new ModelAndView("front/kszj/shxzx_yuyue");
		mv.addObject("id", "true");
		return mv;
	}
	
	
	
}
