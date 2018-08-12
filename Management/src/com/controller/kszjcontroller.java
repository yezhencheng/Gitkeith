package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.dao.kszjDao;
import com.entity.User;
import com.entity.keshi;
import com.entity.kszj;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class kszjcontroller {
	@Autowired
	public kszjDao kszjdao;
	
	
	
	@RequestMapping("/shxzx")
	public ModelAndView shxzx(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
		ModelAndView model = new ModelAndView("front/kszj/shxzx");
        return model;
	}
	
	@RequestMapping(value = "/shxzx_ajax", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String newsnewslist(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		Map<String, String> sqlmap = new HashMap<String, String>();
		sqlmap.put("username", arg0.getParameter("username").toString());
		int pageindex = Integer.parseInt(arg0.getParameter("pagenumber")
				.toString());
		int pagesize = Integer.parseInt(arg0.getParameter("pagesize")
				.toString());
		PageHelper.startPage(pageindex, pagesize);
		List<kszj> datalist =kszjdao.selectshxzx();
		PageInfo<kszj> page = new PageInfo<kszj>(datalist);
		String liststr = "";
		liststr = JSONArray.fromObject(page.getList()).toString();
		jsonstr = "{\"datacount\":\"" + page.getTotal() + "\",\"datalist\":"
				+ liststr + "}";
		System.out.println(jsonstr);
		System.out.println(sqlmap.get("username"));
		return jsonstr;
	}
	
	
	@RequestMapping(value = "/shxzx_yuyue", produces = "application/json; charset=utf-8")
	public ModelAndView yuyue(HttpServletRequest arg0,
			HttpServletResponse arg1) {
		ModelAndView modelview = new ModelAndView("front/kszj/shxzx_yuyue");
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("id", arg0.getParameter("zjid").toString());
			kszj model = kszjdao.queryitem(sqlmap);
			modelview.addObject("id", arg0.getParameter("zjid").toString());
			modelview.addObject("zjs", model);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelview;
	}
	
}
