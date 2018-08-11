package demo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;





@Controller
public class pageAction {
	
	

  @RequestMapping("/hello")
  public ModelAndView handleRequest(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
	  //http://127.0.0.1:8080/jbasicProjectmvc/hello.do
		ModelAndView model=new ModelAndView("index2");//参数代表jsp的文件名
		model.addObject("hello","hello hi");
		return model;
  }
  
  
  
  
  /* 
   * 实现页面跳转
   * /web1/urlinfo/redirectpage.html
   * */
  @RequestMapping("/redirectpage")
  public String RedirectPage()
  {
      return  "redirect:/jsp/index2.jsp"; 
              
  }
  
  
 
  //http://127.0.0.1:8080/jbasicProjectmvc/test1.do?username=zhangsan
  /**
   * 测试request接收参数*/
  @RequestMapping("test1.do")
  public ModelAndView test1(HttpServletRequest req){
      String userName = req.getParameter("username");
      String password = req.getParameter("password");
      System.out.println(userName);
      System.out.println(password);
      return new ModelAndView("index2");
  }
  
  
  /**
　　* 测试sping会自动将表单参数注入到方法参数 
　　* 最好每个形参前都添加@requestparameter
　　* 通过反射只能得到方法参数类型不能等到方法参数名称 没有加注解能成功获得为编译器自动添加
　　*/
//http://127.0.0.1:8080/jbasicProjectmvc/test2.do?password=zhangsan
  @RequestMapping("test2.do")
  public ModelAndView test2(String userName, @RequestParam("password") String pwd){
      System.out.println(userName+","+pwd);
      return new ModelAndView("jsp/hello");
  }

    
  
  
  
}
