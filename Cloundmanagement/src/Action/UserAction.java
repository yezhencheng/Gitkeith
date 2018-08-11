package Action;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import Model.User;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.xml.internal.ws.api.message.ExceptionHasMessage;

import dao.UserDao;

public class UserAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
public String username;
public String password;
public static String path;
UserDao ud;
public List<User> user_list=null;

public String list(){		
	Map<String, String> map = new HashMap<String, String>();
	map.put("password", password);
	map.put("username", username);
	user_list = ud.queryForList("sltuser", map);
	setPath("view/userlist.jsp");
	return "success";
}
public String useraddfirst(){
	setPath("view/useradd.jsp");
	return "success";
}
public String add(){
	Map<String, String> map = new HashMap<String, String>();
	map.put("password", password);
	map.put("username", username);
	ud.save("saveuser", map);
	setPath("view/userlist.jsp");
	return "success";
}






public List<User> getUser_list() {
	return user_list;
}
public void setUser_list(List<User> userList) {
	user_list = userList;
}
public String getPath() {
	return path;
}
public void setPath(String path) {
	this.path = path;
}
public UserDao getUd() {
	return ud;
}
public void setUd(UserDao ud) {
	this.ud = ud;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}

}
