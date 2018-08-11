package dao.impl;

import Action.LoginAction;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;


public class LoginInterceptor extends MethodFilterInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		
		if(LoginAction.class.equals(invocation.getAction().getClass())){
			invocation.invoke();
		}else{
		Object loginUserName = ActionContext.getContext().getSession().get("username");
		
		if (null != loginUserName&&!"".equals(loginUserName)) {
			
			return invocation.invoke(); 
		}
		
		}
		return "input";// 这里返回用户登录页面视图
		
	}

}
