package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dao.IUserDao;
import com.dao.adminDao;
import com.dao.keshiDao;
import com.dao.messageDao;
import com.dao.publicinitDao;
import com.entity.User;
import com.entity.admin;
import com.entity.keshi;
import com.entity.publicinit;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;



@Controller
public class Indexcontroller {
	@Autowired
	public IUserDao iuser;
	@Autowired
	public publicinitDao publicinit;
	@Autowired
	public messageDao messagedao;
	@Autowired
	public keshiDao keshidao;
	@Autowired
	public adminDao admindao;
	public String flag=null;
	
	//用户登录
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
        	List<publicinit> public_list = publicinit.select();
			String username=arg0.getParameter("username");
			String password=arg0.getParameter("password");
			if("".equals(username)||username.equals(null)){
			ModelAndView model = new ModelAndView("front/index");
			String info="用户名不能为空";
			model.addObject("info", info);
			model.addObject("list", public_list);
			return model;
			}
			else if("".equals(password)||password.equals(null)){
			ModelAndView model = new ModelAndView("front/index");
			String info="密码不能为空";
			model.addObject("info", info);
			model.addObject("list", public_list);
			return model;
				}
			else{
			List<User> user_list = iuser.selectkey();
			for(int i=0;i<user_list.size();i++){
			String value=user_list.get(i).getUsername();
			String value2=user_list.get(i).getPassword();
			if(value.equals(username)&&value2.equals(password))
			{
				setFlag(username);
			}
			}
			if(flag==username){  
			ModelAndView model = new ModelAndView("front/index");
	     	model.addObject("list", public_list);
	        model.addObject("username", username);
	        HttpSession session = arg0.getSession();
			session.setAttribute("username", username);
			session.setMaxInactiveInterval(900);
			return model;
			}else{
			ModelAndView model = new ModelAndView("front/index");
		    model.addObject("list", public_list);
		    String info="用户名或者密码错误";
		    model.addObject("info", info);
		    return model;
			}
			}
			
	}
	
	
	//首页按钮
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
			ModelAndView model = new ModelAndView("front/index");
			List<publicinit> public_list = publicinit.select();
			model.addObject("list", public_list);
			model.addObject("username", arg0.getParameter("username"));
	        return model;
			
	}
	
	//科室
	@RequestMapping("/keshi")
	public ModelAndView keshi(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
			List<keshi> keshi_list = keshidao.selectkey();
			ModelAndView model = new ModelAndView("front/keshi");
			model.addObject("list", keshi_list);
	        return model
	        ;}
	
	//留言板
	@RequestMapping("/message")
	public ModelAndView message(HttpServletRequest arg0, 
			HttpServletResponse arg1)throws Exception {
		ModelAndView model = new ModelAndView("front/message");
        return model;
	}
	
	
	//后台登录页
	@RequestMapping("/backstage")
	public ModelAndView backstage(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
			ModelAndView model = new ModelAndView("backstage/login");
	        return model;	
	}
	//后台登录页
	@RequestMapping("/backstage_login")
	public ModelAndView backstage_login(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
		String account=arg0.getParameter("account");
		String password=arg0.getParameter("password");
		if("".equals(account)||account==null){
		ModelAndView model = new ModelAndView("backstage/login");
		String info="用户名不能为空";
		model.addObject("info", info);
		return model;
		}
		else if("".equals(password)||password.equals(null)){
		ModelAndView model = new ModelAndView("backstage/login");
		String info="密码不能为空";
		model.addObject("info", info);
		return model;
			}
		else{
		List<admin> admin_list = admindao.selectkey();
		for(int i=0;i<admin_list.size();i++){
		String value=admin_list.get(i).getAccount();
		String value2=admin_list.get(i).getPassword();
		if(value.equals(account)&&value2.equals(password))
		{
			setFlag(account);
		}
		}
		if(flag==account){  
		ModelAndView model = new ModelAndView("backstage/index");
        HttpSession session = arg0.getSession();
		session.setAttribute("username", account);
		session.setMaxInactiveInterval(900);
		return model;
		}else{
		ModelAndView model = new ModelAndView("backstage/login");
	    String info="用户名或者密码错误";
	    model.addObject("info", info);
	    return model;
		}
		}
	}
		
	
	//留言
//	@RequestMapping("/message_form")
//	public ModelAndView message(HttpServletRequest arg0, 
//			HttpServletResponse arg1)throws Exception {
//		if(flag==null)
//		{
//		ModelAndView model = new ModelAndView("message");
//		model.addObject("info", "请先登录");
//		return model;
//		}else
//		{
//		String message=arg0.getParameter("editor1").toString();
//		Date day=new Date();    
//		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
//		String date=df.format(day);
//		Map<String, String> map= new HashMap<String, String>();
//		map.put("username", getFlag());
//		map.put("message", message);
//		map.put("date", date);
//		messagedao.savemessage(map);
//		ModelAndView model = new ModelAndView("message");
//		System.out.println(arg0.getParameter("editor1"));
//		return model;
//		}
//		
//	}

	public String getFlag() {
		return flag;
	}


	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	
}