package com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.entity.PeopleModel;


// jstl标签与常用控件组合
@Controller
public class DemoController {

	
	
	// 页面赋值
	// http://127.0.0.1:8080/jbasicProjectmvc/demoform.do
	// 参数formmodel这个实体类代表了页面映射回来的实体（实体里面包含页面的属性，可以通过get取值）
	@RequestMapping(value = "/demoform")
	public ModelAndView demoform(@ModelAttribute PeopleModel formmodel) {
		ModelAndView view = new ModelAndView("demoform");
		List<PeopleModel> tagsModel =initpage();
		view.addObject("formModel", tagsModel);// 由于页面的原因这个空节点必须添加
		view.addObject("pageview",formmodel); // 注意这里，这样在你页面提交SUBMIT后，控件可以方便绑定提交前的值，否则提交值被洗去
		return view;// 这里返回的值，代表下面JSP的视图
	}
	
	
	@RequestMapping(value = "/demofind")
	public ModelAndView demofind(@ModelAttribute PeopleModel formmodel) {
		ModelAndView view = new ModelAndView("demoform");
		List<PeopleModel> tagsModel=new ArrayList<PeopleModel>();
		if(!"".equals(formmodel.getUsername())||"0".equals(formmodel.getSex())||"1".equals(formmodel.getSex()))
		{
			tagsModel=findquery(formmodel.getUsername(),formmodel.getSex());
		}
		else
		{
			tagsModel= initpage();
		}
		view.addObject("formModel", tagsModel);// 由于页面的原因这个空节点必须添加
		view.addObject("pageview",formmodel); // 注意这里，这样在你页面提交SUBMIT后，控件可以方便绑定提交前的值，否则提交值被洗去
		return view;// 这里返回的值，代表下面JSP的视图
	}
	
	@RequestMapping(value = "/demosession")
	public ModelAndView demosession(@ModelAttribute PeopleModel formmodel,HttpSession httpSession) {
		ModelAndView view = new ModelAndView("demoform");
		PeopleModel p=new PeopleModel();
		p.setUsername("peopleID001");
		httpSession.setAttribute("sessionmodel", p);  
		return view;// 这里返回的值，代表下面JSP的视图
	}
	
	
	//// http://127.0.0.1:8080/jbasicProjectmvc/demojson.do
	//  返回json字符串，标头这里要加utf-8,否则返回可能是中文乱码
	@RequestMapping(value = "/demojson",produces = "application/json; charset=utf-8")
	public @ResponseBody String jsonsession() {
		List<PeopleModel> p_list=new ArrayList<PeopleModel>();
		PeopleModel p=new PeopleModel();
		p.setUsername("peopleID001");
		p.setSex("0");
		p_list.add(p);
		p=new PeopleModel();
		p.setUsername("peopleID002");
		p.setSex("1");
		p_list.add(p);
		
		
		// JSON转成字符串                    (import net.sf.json.JSONArray;import net.sf.json.JSONObject;)
		JSONObject jsonObject = JSONObject.fromObject(p);
		String jsonstr="单Model:"+jsonObject.toString(); 
		JSONArray jsonarray=JSONArray.fromObject(p_list);
		jsonstr+="List展示:"+jsonarray.toString();
		
		// 字符串转成JSON(Model)
		String jsonstr2=jsonObject.toString();
		new JSONObject();
		JSONObject obj = JSONObject.fromObject(jsonstr2);
		PeopleModel modeltext=(PeopleModel)JSONObject.toBean(obj, PeopleModel.class);    
		// 字符串转JSON(LIST)
		String jsonstr3=jsonarray.toString();
		JSONArray obj3 = new JSONArray().fromObject(jsonstr3);
		List<PeopleModel> list3=(List<PeopleModel>)JSONArray.toList(obj3, PeopleModel.class);    
		return jsonstr;
	}
	
	
	
	
	
	private List<PeopleModel> findquery(String username,String sex)
	{
		List<PeopleModel> people_list=initpage();
		List<PeopleModel> new_list=new ArrayList<PeopleModel>();
		for(PeopleModel model:people_list)
		{
			if(username.equals(model.getUsername()))
			{
				new_list.add(model);
			}
		}
		for(PeopleModel model:people_list)
		{
			if(sex.equals(model.getSex()))
			{
				new_list.add(model);
			}
		}
		return new_list;
	}
	
	
	
	
	
	/** 这个函数非常关键，代表页面初始化（绑定生成各个控件）
	 * @return
	 */
	private List<PeopleModel> initpage()
	{
		List<PeopleModel> people_list=new ArrayList<PeopleModel>();
		PeopleModel people=new PeopleModel();
		
		people.setUsername("张三");
		people.setAge("20");
		people.setSex("1");
		people.setSchool("清华大学");
		people_list.add(people);
		
		people=new PeopleModel();
		people.setUsername("李四");
		people.setAge("22");
		people.setSex("0");
		people.setSchool("北京小学");
		people_list.add(people);
		
		people=new PeopleModel();
		people.setUsername("小名");
		people.setAge("37");
		people.setSex("1");
		people.setSchool("上海小学");
		people_list.add(people);

		return people_list;
		
	}

}
