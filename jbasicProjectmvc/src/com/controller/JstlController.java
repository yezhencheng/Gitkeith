package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.entity.TagsModel;
import com.entity.User;

// 这个页面重点是jstl标签用法，也就是C标签
@Controller
public class JstlController {

	
	
	// 页面赋值
	// http://127.0.0.1:8080/jbasicProjectmvc/jstlform1.do
	// 参数formmodel这个实体类代表了页面映射回来的实体（实体里面包含页面的属性，可以通过get取值）
	@RequestMapping(value = "/jstlform1")
	public ModelAndView setform(@ModelAttribute TagsModel formmodel) {
		ModelAndView view = new ModelAndView("jstlform");
		TagsModel tagsModel =initpage();
		view.addObject("contentModel", tagsModel);// 由于页面的原因这个空节点必须添加
		return view;// 这里返回的值，代表下面JSP的视图
	}
	
	
	
	/** 这个函数非常关键，代表页面初始化（绑定生成各个控件）
	 * @return
	 */
	private TagsModel initpage()
	{
		TagsModel tagsModel = new TagsModel();
		tagsModel.setUsername("张三,李四");
		tagsModel.setCount(100);
		tagsModel.setCheckarray(new String[]{"A","B","C"});
		tagsModel.setSelectarray(new String[]{"B"});
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("A", "A选项");
		map.put("B", "B选项");
		map.put("C", "C选项");
		tagsModel.setChoosemap(map);
		tagsModel.setSelectid("A");// 设置radio button 为A
		
		List<User> userlist=new ArrayList<User>();
		User m;
		m=new User();
		m.setLoginname("loingA");
		m.setUsername("userA");
		userlist.add(m);
		m=new User();
		m.setLoginname("loingB");
		m.setUsername("userB");
		userlist.add(m);
		tagsModel.setUserlist(userlist);
		
		return tagsModel;
		
	}

	
	// 页面取值
	// 参数formmodel这个实体类代表了页面映射回来的实体（实体里面包含页面的属性，可以通过get取值）
	@RequestMapping(value = "/jstlform2")
	public ModelAndView getform(@ModelAttribute TagsModel formmodel) {
		ModelAndView view = new ModelAndView("jstlform");
		TagsModel tagsModel =initpage();// 初始化绑定一下
	
		
		view.addObject("selectid",formmodel.getSelectid());
		
		
		return view;// 这里返回的值，代表下面JSP的视图
	}

}
