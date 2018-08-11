package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.IUserDao;
import com.entity.Power;
import com.entity.Result;
import com.entity.RoleInfo;
import com.entity.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.util.TimeKey;

// 这个页面重点是jstl标签用法，也就是C标签
@Controller
public class UserController {

	@Autowired
	public IUserDao iuser;
	
	
	
	// 保存权限
	@RequestMapping(value = "/user_grandsave", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String grandsave(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("userid", arg0.getParameter("id").toString());
			
			String roleids=arg0.getParameter("roleids").toString();
			
			if(!"".equals(roleids))
			{
				String[] roleidstr=roleids.split(",");
				// 1:删掉原来的权限
				iuser.deleterolebyuserid(sqlmap);
				for(int i=0;i<roleidstr.length;i++)
				{
					// 2:插入现有权限
					sqlmap = new HashMap<String, String>();
					sqlmap.put("userid", arg0.getParameter("id").toString());
					sqlmap.put("roleid", roleidstr[i].toString());
					iuser.saveuserrole(sqlmap);
				}				
			}
			Result result = new Result();
			result.setResultcode("000");
			String resultjson = "";
			resultjson = JSONObject.fromObject(result).toString();
			jsonstr =resultjson;
			System.out.println("roleshow:"+jsonstr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonstr;
	}
	
	// 展示权限
	@RequestMapping(value = "/user_grandshow", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String grandshow(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("userid", arg0.getParameter("id").toString());
			// 1:用户信息
			User u=iuser.showuser(sqlmap);
		    // 2:所有角色
			List<RoleInfo> roleinfo_list=new ArrayList<RoleInfo>();
			roleinfo_list=iuser.queryrolelist(sqlmap);
		    // 3:此用户已绑定的角色
			List<RoleInfo> choosed_list=new ArrayList<RoleInfo>();
			choosed_list=iuser.chooserolelist(sqlmap);
			
			
			String userstr = "";
			userstr = JSONObject.fromObject(u).toString();
			String roleinfostr = "";
			roleinfostr = JSONArray.fromObject(roleinfo_list).toString();
			String choosedstr = "";
			choosedstr = JSONArray.fromObject(choosed_list).toString();

			jsonstr = "{\"userstr\":" + userstr + ",\"roleinfostr\":"+ roleinfostr + ",\"choosedstr\":"+ choosedstr + "}";
			System.out.println("roleshow:"+jsonstr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonstr;
	}
	
	
	
	
	@RequestMapping(value = "/user_roleupdate", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String roleupdate(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		Result result = new Result();
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("roleid", arg0.getParameter("roleid").toString());
			sqlmap.put("rolename", arg0.getParameter("rolename").toString());
			sqlmap.put("content", arg0.getParameter("content").toString());
			sqlmap.put("hidpower", arg0.getParameter("hidpower").toString());
			// 1:更新主表
			iuser.updaterolemain(sqlmap);
			// 2:删除从表
			iuser.deleteroledetail(sqlmap);
			// 3:存入从表
			String[] powerids = arg0.getParameter("hidpower").toString().split(
					",");
			for (String powerid : powerids) {
				sqlmap = new HashMap<String, String>();
				sqlmap.put("roleid", arg0.getParameter("roleid").toString());
				sqlmap.put("powerid", powerid);
				if (!"".equals(powerid)) {
					iuser.saveroledetail(sqlmap);
				}
			}
			result.setResultcode("000");
			JSONObject jsonObject = JSONObject.fromObject(result);
			jsonstr = jsonObject.toString();
		} catch (Exception e) {
			e.printStackTrace();
			result.setResultcode("999");
			JSONObject jsonObject = JSONObject.fromObject(result);
			jsonstr = jsonObject.toString();
		}
		return jsonstr;
	}
	
	
	@RequestMapping(value = "/user_deleterole", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String userdeleterole(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		Result result = new Result();
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("roleid", arg0.getParameter("id").toString());
			// 1：删除主表
			iuser.deleterolemain(sqlmap);
			// 2: 删除从表
			iuser.deleteroledetail(sqlmap);
			result.setResultcode("000");
		} catch (Exception e) {
			result.setResultcode("999");
			e.printStackTrace();
		}
		jsonstr = JSONObject.fromObject(result).toString();
		return jsonstr;
	}

	@RequestMapping(value = "/user_roleshow", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String roleshow(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("roleid", arg0.getParameter("id").toString());
			RoleInfo rolemodel = iuser.rolebyid(sqlmap);
			List<Power> powerlist = iuser.powerbyid(sqlmap);
			String rolestr = "";
			rolestr = JSONObject.fromObject(rolemodel).toString();

			String powerstr = "";
			powerstr = JSONArray.fromObject(powerlist).toString();

			jsonstr = "{\"rolemodel\":" + rolestr + ",\"powerlist\":"
					+ powerstr + "}";
			System.out.println("roleshow:"+jsonstr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonstr;
	}

	@RequestMapping(value = "/user_rolelistinfo", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String rolelistinfo(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";

		Map<String, String> sqlmap = new HashMap<String, String>();
		int pageindex = Integer.parseInt(arg0.getParameter("pagenumber")
				.toString());
		int pagesize = Integer.parseInt(arg0.getParameter("pagesize")
				.toString());

		PageHelper.startPage(pageindex, pagesize);
		List<RoleInfo> userlist = iuser.rolelistinfo(sqlmap);
		PageInfo<RoleInfo> page = new PageInfo<RoleInfo>(userlist);
		System.out.println("本次数据" + page.getList());
		System.out.println("总数" + page.getTotal());

		String liststr = "";
		liststr = JSONArray.fromObject(page.getList()).toString();
		jsonstr = "{\"datacount\":\"" + page.getTotal() + "\",\"datalist\":"
				+ liststr + "}";
		System.out.println(jsonstr);
		return jsonstr;
	}

	@RequestMapping(value = "/user_rolesave", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String rolesave(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		Result result = new Result();
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			String roleid = TimeKey.newkey("ro");
			sqlmap.put("roleid", roleid);
			sqlmap.put("rolename", arg0.getParameter("rolename").toString());
			sqlmap.put("content", arg0.getParameter("content").toString());
			sqlmap.put("hidpower", arg0.getParameter("hidpower").toString());
			// 1:存入主表
			iuser.saverolemain(sqlmap);
			// 2:存入从表
			String[] powerids = arg0.getParameter("hidpower").toString().split(
					",");
			for (String powerid : powerids) {
				sqlmap = new HashMap<String, String>();
				sqlmap.put("roleid", roleid);
				sqlmap.put("powerid", powerid);
				if (!"".equals(powerid)) {
					iuser.saveroledetail(sqlmap);
				}
			}
			result.setResultcode("000");
			JSONObject jsonObject = JSONObject.fromObject(result);
			jsonstr = jsonObject.toString();
		} catch (Exception e) {
			e.printStackTrace();
			result.setResultcode("999");
			JSONObject jsonObject = JSONObject.fromObject(result);
			jsonstr = jsonObject.toString();
		}
		return jsonstr;
	}

	//
	@RequestMapping(value = "/user_rolelist", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String rolelist(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		List<RoleInfo> resultrole = new ArrayList<RoleInfo>();// 最终返回给页面的JSON
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("powerfather", "0");
			List<RoleInfo> rolelist = iuser.findpowerbyleave(sqlmap);// 1:先查根模块
			for (RoleInfo rolemain : rolelist) {
				RoleInfo newrole = new RoleInfo();
				String fatherid = rolemain.getMainroleid();
				String fathername = rolemain.getMainrolename();
				sqlmap = new HashMap<String, String>();
				sqlmap.put("powerid", fatherid);
				List<Power> powerlist = new ArrayList<Power>();
				List<Power> childlist = iuser.findchildbyleave(sqlmap);// 2:根据根查子节点
				for (Power child : childlist) {
					Power childmodel = new Power();
					childmodel.setPowerid(child.getPowerid());
					childmodel.setPowername(child.getPowername());
					powerlist.add(childmodel);
				}
				newrole.setMainroleid(fatherid);
				newrole.setMainrolename(fathername);
				newrole.setPowerlist(powerlist);
				resultrole.add(newrole);
			}
			JSONArray jsonarray = JSONArray.fromObject(resultrole);
			jsonstr = jsonarray.toString();
			System.out.println(jsonstr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonstr;
	}

	@RequestMapping(value = "/user_deletepower", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String userdeletepower(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		Result result = new Result();
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("id", arg0.getParameter("id").toString());
			iuser.deletepowerbyid(sqlmap);
			result.setResultcode("000");
		} catch (Exception e) {
			result.setResultcode("999");
			e.printStackTrace();
		}
		jsonstr = JSONObject.fromObject(result).toString();
		return jsonstr;
	}

	@RequestMapping(value = "/user_poweredit", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String poweredit(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		Result result = new Result();
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("id", arg0.getParameter("id").toString());
			sqlmap.put("powerid", arg0.getParameter("powerid").toString());
			sqlmap.put("powername", arg0.getParameter("powername").toString());
			sqlmap.put("urlaction", arg0.getParameter("urlaction").toString());
			sqlmap.put("powerfather", arg0.getParameter("powerfather")
					.toString());
			iuser.updatepowerModel(sqlmap);
			result.setResultcode("000");
		} catch (Exception e) {
			e.printStackTrace();
			result.setResultcode("001");
		}
		jsonstr = JSONObject.fromObject(result).toString();
		return jsonstr;
	}

	@RequestMapping(value = "/user_showpower", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String showpower(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		Map<String, String> sqlmap = new HashMap<String, String>();
		sqlmap.put("id", arg0.getParameter("id").toString());
		Power p = iuser.powerModelById(sqlmap);
		jsonstr = JSONObject.fromObject(p).toString();
		return jsonstr;
	}

	@RequestMapping(value = "/user_powerlist", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String powerlist(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			int pageindex = Integer.parseInt(arg0.getParameter("pagenumber")
					.toString());
			int pagesize = Integer.parseInt(arg0.getParameter("pagesize")
					.toString());

			PageHelper.startPage(pageindex, pagesize);
			List<Power> userlist = iuser.findpowerlist(sqlmap);
			PageInfo<Power> page = new PageInfo<Power>(userlist);
			System.out.println("本次数据" + page.getList());
			System.out.println("总数" + page.getTotal());

			String liststr = "";
			liststr = JSONArray.fromObject(page.getList()).toString();
			jsonstr = "{\"datacount\":\"" + page.getTotal()
					+ "\",\"datalist\":" + liststr + "}";
			System.out.println(jsonstr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonstr;
	}

	@RequestMapping(value = "/user_save", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String jsonsession(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		Result result = new Result();
		Map<String, String> sqlmap = new HashMap<String, String>();
		sqlmap.put("loginname", arg0.getParameter("loginname").toString());
		sqlmap.put("password", arg0.getParameter("password").toString());
		sqlmap.put("mobileno", arg0.getParameter("mobileno").toString());
		sqlmap.put("qq", arg0.getParameter("qq").toString());
		// 
		List<User> userlist = iuser.isuserexist(sqlmap);
		if (userlist.size() > 0) {
			result.setResultcode("001");// 用户已经存在
		} else {
			iuser.save(sqlmap);
			result.setResultcode("000");
		}
		JSONObject jsonObject = JSONObject.fromObject(result);
		jsonstr = jsonObject.toString();
		return jsonstr;
	}

	@RequestMapping(value = "/user_power1save", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String power1save(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		Result result = new Result();
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("powerid", TimeKey.newkey("P"));
			sqlmap.put("powername", arg0.getParameter("powername").toString());
			sqlmap.put("powerfather", "0");
			sqlmap.put("urlaction", "user/Modular.jsp");
			// 
			List<Power> powerlist = iuser.ispowerfatherexist(sqlmap);
			if (powerlist.size() > 0) {
				result.setResultcode("001");// 一级分类编码 已经存在
			} else {
				iuser.savepower(sqlmap);
				result.setResultcode("000");
			}
			JSONObject jsonObject = JSONObject.fromObject(result);
			jsonstr = jsonObject.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonstr;
	}

	@RequestMapping(value = "/user_power2save", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String power2save(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		Result result = new Result();
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("powerid", TimeKey.newkey("P"));
			sqlmap.put("powerfather", arg0.getParameter("powerid").toString());
			sqlmap.put("powername", arg0.getParameter("powername").toString());
			sqlmap.put("urlaction", arg0.getParameter("urlaction").toString());
			// 
			List<Power> powerlist = iuser.ispowerfatherexist(sqlmap);
			if (powerlist.size() > 0) {
				result.setResultcode("001");// 分类编码 已经存在(1级，2级都不可以重复)
			} else {
				iuser.savepower(sqlmap);
				result.setResultcode("000");
			}
			JSONObject jsonObject = JSONObject.fromObject(result);
			jsonstr = jsonObject.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonstr;
	}

	//
	@RequestMapping(value = "/user_showleiyi", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String usershowleiyi(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		Result result = new Result();
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("powerfather", "0");
			List<Power> powerlist = iuser.queryfather(sqlmap);
			JSONArray jsonarray = JSONArray.fromObject(powerlist);
			jsonstr = jsonarray.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonstr;
	}

	@RequestMapping(value = "/user_userlist", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String userlist(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";

		Map<String, String> sqlmap = new HashMap<String, String>();
		sqlmap.put("loginname", arg0.getParameter("loginname").toString());
		int pageindex = Integer.parseInt(arg0.getParameter("pagenumber")
				.toString());
		int pagesize = Integer.parseInt(arg0.getParameter("pagesize")
				.toString());

		PageHelper.startPage(pageindex, pagesize);
		List<User> userlist = iuser.findlist(sqlmap);
		PageInfo<User> page = new PageInfo<User>(userlist);
		System.out.println("本次数据" + page.getList());
		System.out.println("总数" + page.getTotal());

		String liststr = "";
		liststr = JSONArray.fromObject(page.getList()).toString();
		jsonstr = "{\"datacount\":\"" + page.getTotal() + "\",\"datalist\":"
				+ liststr + "}";
		System.out.println(jsonstr);
		return jsonstr;
	}

	@RequestMapping(value = "/user_show", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String usershow(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		Map<String, String> sqlmap = new HashMap<String, String>();
		sqlmap.put("id", arg0.getParameter("id").toString());
		User usermodel = iuser.findModel(sqlmap);
		jsonstr = JSONObject.fromObject(usermodel).toString();
		return jsonstr;
	}

	@RequestMapping(value = "/user_edit", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String useredit(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		Result result = new Result();
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("id", arg0.getParameter("id").toString());
			sqlmap.put("loginname", arg0.getParameter("loginname").toString());
			sqlmap.put("mobileno", arg0.getParameter("mobileno").toString());
			sqlmap.put("qq", arg0.getParameter("qq").toString());
			iuser.updateModel(sqlmap);
			result.setResultcode("000");
		} catch (Exception e) {
			result.setResultcode("999");
			e.printStackTrace();
		}
		jsonstr = JSONObject.fromObject(result).toString();
		return jsonstr;
	}

	@RequestMapping(value = "/user_delete", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String userdelete(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		Result result = new Result();
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("id", arg0.getParameter("id").toString());
			iuser.deleteuser(sqlmap);
			result.setResultcode("000");
		} catch (Exception e) {
			result.setResultcode("999");
			e.printStackTrace();
		}
		jsonstr = JSONObject.fromObject(result).toString();
		return jsonstr;
	}

	// JSON转成字符串 (import net.sf.json.JSONArray;import net.sf.json.JSONObject;)
	// JSONObject jsonObject = JSONObject.fromObject(p);
	// String jsonstr="单Model:"+jsonObject.toString();
	// JSONArray jsonarray=JSONArray.fromObject(p_list);
	// jsonstr+="List展示:"+jsonarray.toString();

	// 字符串转成JSON(Model)
	// String jsonstr2=jsonObject.toString();
	// new JSONObject();
	// JSONObject obj = JSONObject.fromObject(jsonstr2);
	// PeopleModel modeltext=(PeopleModel)JSONObject.toBean(obj,
	// PeopleModel.class);
	// 字符串转JSON(LIST)
	// String jsonstr3=jsonarray.toString();
	// JSONArray obj3 = new JSONArray().fromObject(jsonstr3);
	// List<PeopleModel> list3=(List<PeopleModel>)JSONArray.toList(obj3,
	// PeopleModel.class);

}
