package Action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import Model.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.UserDao;

public class LoginAction extends ActionSupport {
	public static String loginusername;
	public static String loginpassword;
	public static String path;
	UserDao ud;

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getLoginusername() {
		return loginusername;
	}

	public void setLoginusername(String loginusername) {
		this.loginusername = loginusername;
	}

	public String getLoginpassword() {
		return loginpassword;
	}

	public void setLoginpassword(String loginpassword) {
		this.loginpassword = loginpassword;
	}

	public UserDao getUd() {
		return ud;
	}

	public void setUd(UserDao ud) {
		this.ud = ud;
	}

	public String login() {
		System.out.println("进入登录方法");
		Map<String, String> map = new HashMap<String, String>();
		map.put("username", loginusername);
		map.put("password", loginpassword);
		
	
		// 通过JAVA代码去查数据库
		List<User> user_list = ud.queryForList("sltlogin", map);
		if (user_list != null && user_list.size() > 0) {
			 ActionContext.getContext().getSession().put("username", user_list.get(0));
			setPath("index.jsp");
			return "success";
		} else {
			setPath("login.jsp");
			return "error";
		}
		
	}

	public String register() {
		System.out.println("进入注册方法");
		Map<String, String> map = new HashMap<String, String>();
		map.put("username", loginusername);
		map.put("password", loginpassword);
		
		// 通过JAVA代码去查数据库
		List<User> user_list = ud.queryForList("sltlogin", map);
		if (user_list != null && user_list.size() > 0) {
			System.out.println("用户已存在");
			return "success";
		} else {
			// 存储数据
			ud.save("saveuser", map);
			return "success";
		}
	}
}
