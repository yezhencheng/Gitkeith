package demo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;



public class IndexAction implements Controller  {
	public String view;

	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
		ModelAndView model=new ModelAndView();
		model.addObject("hello","hello hi");
		return model;
	}

	
	

}
