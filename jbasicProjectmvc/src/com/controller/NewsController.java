package com.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dao.INewsDao;
import com.dao.IUserDao;
import com.entity.BigInfo;
import com.entity.Power;
import com.entity.Result;
import com.entity.RoleInfo;
import com.entity.T0300NEWS;
import com.entity.T0301NEWSTYPE;
import com.entity.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.util.PropertyUtil;
import com.util.TimeKey;

// 这个页面重点是jstl标签用法，也就是C标签
@Controller
public class NewsController {

	@Autowired
	public INewsDao inews;

	private static final String DEFAULT_SUB_FOLDER_FORMAT_AUTO = "yyyyMMddHHmmss";

	/*
	 * 上传图片文件夹
	 */
	private static final String UPLOAD_PATH = "WEB-INF/upload/img";
	String DirectoryName = "upload/img";

	@RequestMapping(value = "/news_qir", produces = "application/json; charset=utf-8")
	public ModelAndView newsqir(HttpServletRequest arg0,
			HttpServletResponse arg1, HttpSession httpSession) {
		ModelAndView modelview = new ModelAndView("webadmin/qir");
		return modelview;
	}

	@RequestMapping(value = "/news_qirlogin", produces = "application/json; charset=utf-8")
	public ModelAndView newslogintest(HttpServletRequest arg0,
			HttpServletResponse arg1, HttpSession httpSession) {
		ModelAndView modelview = new ModelAndView("webadmin/framework");
		Map<String, String> sqlmap = new HashMap<String, String>();
		String username = arg0.getParameter("username").toString();// 为主键KEY
		String password = arg0.getParameter("password").toString();
		if (username.equals("qir") && password.equals("1")) {
			httpSession.setMaxInactiveInterval(120 * 60);// 备注 120分钟*60秒
			httpSession.setAttribute("admin", "admin");
		} else {
			modelview = new ModelAndView("webadmin/qir");
			modelview.addObject("isok", "loginerror");
		}
		return modelview;
	}

	@RequestMapping(value = "webmain/news_maper", produces = "application/json; charset=utf-8")
	public ModelAndView news_maper(HttpServletRequest arg0,
			HttpServletResponse arg1, HttpSession httpSession) {
		ModelAndView modelview = new ModelAndView("webmain/maper");
		try {
			modelview.addObject("biglist", ShowMaper());
		} catch (Exception e) {

		}
		return modelview;
	}

	@RequestMapping(value = "webmain/news_biglei", produces = "application/json; charset=utf-8")
	public ModelAndView newsbiglei(HttpServletRequest arg0,
			HttpServletResponse arg1) {
		ModelAndView modelview = new ModelAndView("webmain/newsBigLei");
		String bigid = arg0.getParameter("bigid").toString();
		try {
			// 分类展示
			modelview.addObject("biglist", ShowBigInfo(bigid));
			// 精品教程
			modelview.addObject("jingpingjiaocheng", ShowJingPinJiaocheng());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelview;
	}

	// 首页
	@RequestMapping(value = "webmain/news_index", produces = "application/json; charset=utf-8")
	public ModelAndView newseditredirect(HttpServletRequest arg0,
			HttpServletResponse arg1) {
		ModelAndView modelview = new ModelAndView("webmain/index");
		try {
			// 最近更新
			modelview.addObject("zuijingengxin", ShowZuiJinGengXin());
			// 精品教程
			modelview.addObject("jingpingjiaocheng", ShowJingPinJiaocheng());
			// 阅读排行
			modelview.addObject("yuedupaihang", ShowYueDupaihang());
			// JAVA教程
			modelview.addObject("javajiaocheng", ShowJAVAJiaocheng());
			// 前端教程
			modelview.addObject("htmljiaocheng", ShowHTMLJiaocheng());
			// 数据库教程
			modelview.addObject("shujku", Showshujuku());
			// 项目实战
			modelview.addObject("xiangmushizhan", ShowXiangMuShiZhan());
			// 软件下载
			modelview.addObject("downloadjiaocheng", ShowDownLoad());
			// JAVA技巧
			modelview.addObject("javajiqiao", ShowJAVAjiqiao());
			// JAVA框架配置
			modelview.addObject("javakuangjia", ShowJAVAKuangJia());
		} catch (Exception e) {

		}
		return modelview;
	}

	@RequestMapping(value = "webmain/news_detail", produces = "application/json; charset=utf-8")
	public ModelAndView newsdetail(HttpServletRequest arg0,
			HttpServletResponse arg1) {
		ModelAndView modelview = new ModelAndView("webmain/newsdetail");
		String newsid = arg0.getParameter("newsid").toString();
		try {
			// 文章详情
			T0300NEWS news = ShowNewsDetail(newsid);
			modelview.addObject("newsmodel", news);
			// 上一篇下一篇
			List<T0300NEWS> newslist = Showupdown(newsid, news.typeid);
			modelview.addObject("upmodel", "");
			modelview.addObject("downmodel", "");
			for (T0300NEWS model : newslist) {
				if (model.getUpdown().equals("up")) {
					modelview.addObject("upmodel", model.getNewsid());
				}
				if (model.getUpdown().equals("down")) {
					modelview.addObject("downmodel", model.getNewsid());
				}
			}
			// 阅读排行
			modelview.addObject("yuedupaihang", ShowYueDupaihang());
		} catch (Exception e) {

		}
		return modelview;
	}

	// 修改小类
	@RequestMapping(value = "/news_smalledit", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String newssmalledit(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("id", arg0.getParameter("id").toString());
			sqlmap.put("smallname", arg0.getParameter("smallname").toString());
			inews.editsmalltype(sqlmap);
			String jsonstr2 = "{\"resultcode\":\"000\"}";
			jsonstr = jsonstr2;
		} catch (Exception e) {
			jsonstr = "{\"resultcode\":\"001\"}";
			e.printStackTrace();
		}
		return jsonstr;
	}

	// 
	@RequestMapping(value = "/news_editleibie", produces = "application/json; charset=utf-8")
	public ModelAndView newseditleibie(HttpServletRequest arg0,
			HttpServletResponse arg1) {
		ModelAndView modelview = new ModelAndView("webadmin/leibieedit");
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("id", arg0.getParameter("editid").toString());
			T0301NEWSTYPE model = inews.querleibieitem(sqlmap);
			modelview.addObject("model", model);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelview;
	}

	// 添加大类
	@RequestMapping(value = "/news_addbig", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String newsaddbig(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("bigname", arg0.getParameter("bigname").toString());
			sqlmap.put("typecontent", arg0.getParameter("typecontent")
					.toString());
			sqlmap.put("bigid", TimeKey.newkey("B"));
			inews.doaddbigtype(sqlmap);
			String jsonstr2 = "{\"resultcode\":\"000\"}";
			jsonstr = jsonstr2;
		} catch (Exception e) {
			jsonstr = "{\"resultcode\":\"001\"}";
			e.printStackTrace();
		}
		return jsonstr;
	}

	// 添加小类
	@RequestMapping(value = "/news_addsmall", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String newsaddsmall(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("bigid", arg0.getParameter("bigid").toString());

			sqlmap.put("smallname", arg0.getParameter("smallname").toString());
			sqlmap.put("smallid", TimeKey.newkey("X"));
			inews.doaddsmalltype(sqlmap);
			String jsonstr2 = "{\"resultcode\":\"000\"}";
			jsonstr = jsonstr2;
		} catch (Exception e) {
			jsonstr = "{\"resultcode\":\"001\"}";
			e.printStackTrace();
		}
		return jsonstr;
	}

	@RequestMapping(value = "/news_leibieirect", produces = "application/json; charset=utf-8")
	public ModelAndView newsleibieirect(HttpServletRequest arg0,
			HttpServletResponse arg1) {
		ModelAndView modelview = new ModelAndView("webadmin/leibielist");
		return modelview;
	}

	// 编辑
	@RequestMapping(value = "/news_edit", produces = "application/json; charset=utf-8")
	public ModelAndView newsedit(HttpServletRequest arg0,
			HttpServletResponse arg1) {
		String jsonstr = "";
		ModelAndView modelview = new ModelAndView("webadmin/newsedit");
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("newsid", arg0.getParameter("hidid").toString());// 为主键KEY
			sqlmap.put("title", arg0.getParameter("txttitle").toString());
			sqlmap.put("keywords", arg0.getParameter("txtkeywords").toString());
			sqlmap.put("description", arg0.getParameter("txtdescription")
					.toString());
			sqlmap.put("typeid", arg0.getParameter("dplpower2").toString());
			sqlmap.put("power", arg0.getParameter("txtpower").toString());
			sqlmap.put("datetime", TimeKey.NowTime());
			sqlmap.put("content", arg0.getParameter("content").toString());
			inews.doupdatenews(sqlmap);
			modelview.addObject("isok", "updateok");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelview;
	}

	// 新闻详细展示
	@RequestMapping(value = "/news_editredirect", produces = "application/json; charset=utf-8")
	public ModelAndView editaddredirect(HttpServletRequest arg0,
			HttpServletResponse arg1) {
		ModelAndView modelview = new ModelAndView("webadmin/newsedit");
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("id", arg0.getParameter("editid").toString());
			T0300NEWS model = inews.querynewsitem(sqlmap);
			byte[] b = (byte[]) model.getContent();
			String s = new String(b, "utf-8");
			model.setContentutf(s);
			modelview
					.addObject("hidid", arg0.getParameter("editid").toString());
			modelview.addObject("news", model);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelview;
	}

	@RequestMapping(value = "/news_deleteitem", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String newsdeleteitem(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		Result result = new Result();
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("id", arg0.getParameter("id").toString());
			inews.deletenewsitem(sqlmap);
			result.setResultcode("000");
		} catch (Exception e) {
			result.setResultcode("999");
			e.printStackTrace();
		}
		jsonstr = JSONObject.fromObject(result).toString();
		return jsonstr;
	}

	@RequestMapping(value = "/news_deleteleibie", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String newsdeleteleibie(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		Result result = new Result();
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("id", arg0.getParameter("id").toString());
			inews.deleteleibie(sqlmap);
			result.setResultcode("000");
		} catch (Exception e) {
			result.setResultcode("999");
			e.printStackTrace();
		}
		jsonstr = JSONObject.fromObject(result).toString();
		return jsonstr;
	}

	@RequestMapping(value = "/news_newslist", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String newsnewslist(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		Map<String, String> sqlmap = new HashMap<String, String>();
		sqlmap.put("title", arg0.getParameter("title").toString());
		int pageindex = Integer.parseInt(arg0.getParameter("pagenumber")
				.toString());
		int pagesize = Integer.parseInt(arg0.getParameter("pagesize")
				.toString());

		PageHelper.startPage(pageindex, pagesize);
		List<T0300NEWS> datalist = inews.findlist(sqlmap);
		PageInfo<T0300NEWS> page = new PageInfo<T0300NEWS>(datalist);
		String liststr = "";
		liststr = JSONArray.fromObject(page.getList()).toString();
		jsonstr = "{\"datacount\":\"" + page.getTotal() + "\",\"datalist\":"
				+ liststr + "}";
		System.out.println(jsonstr);
		return jsonstr;
	}

	@RequestMapping(value = "/news_leibielist", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String newsleibielist(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		Map<String, String> sqlmap = new HashMap<String, String>();
		sqlmap.put("smallname", arg0.getParameter("smallname").toString());
		int pageindex = Integer.parseInt(arg0.getParameter("pagenumber")
				.toString());
		int pagesize = Integer.parseInt(arg0.getParameter("pagesize")
				.toString());

		PageHelper.startPage(pageindex, pagesize);
		List<T0301NEWSTYPE> datalist = inews.findtypelist(sqlmap);
		PageInfo<T0301NEWSTYPE> page = new PageInfo<T0301NEWSTYPE>(datalist);
		String liststr = "";
		liststr = JSONArray.fromObject(page.getList()).toString();
		jsonstr = "{\"datacount\":\"" + page.getTotal() + "\",\"datalist\":"
				+ liststr + "}";
		System.out.println(jsonstr);
		return jsonstr;
	}

	// 新闻列表
	@RequestMapping(value = "/news_redirect", produces = "application/json; charset=utf-8")
	public ModelAndView newsredirect(HttpServletRequest arg0,
			HttpServletResponse arg1) {
		ModelAndView modelview = new ModelAndView("webadmin/newslist");
		return modelview;
	}

	// 新闻添加
	@RequestMapping(value = "/news_addredirect", produces = "application/json; charset=utf-8")
	public ModelAndView newsaddredirect(HttpServletRequest arg0,
			HttpServletResponse arg1) {
		ModelAndView modelview = new ModelAndView("webadmin/newsadd");
		return modelview;
	}

	// 新闻类添加
	@RequestMapping(value = "/news_addtyperedirect", produces = "application/json; charset=utf-8")
	public ModelAndView news_addtyperedirect(HttpServletRequest arg0,
			HttpServletResponse arg1) {
		ModelAndView modelview = new ModelAndView("webadmin/leibieadd");
		return modelview;
	}

	public List<T0300NEWS> ShowJAVAJiaocheng() {
		List<T0300NEWS> result_list = new ArrayList<T0300NEWS>();
		Map<String, String> sqlmap = new HashMap<String, String>();
		sqlmap.put("bigid", "20180503");
		List<T0300NEWS> list = inews.queryByBig(sqlmap);
		int count = 12;// 查询最新的12条
		if (list != null && list.size() > count) {
			for (int i = 0; i < count; i++) {
				result_list.add(list.get(i));
			}
		} else {
			result_list = list;
		}
		return result_list;
	}

	public T0300NEWS ShowNewsDetail(String newsid) {
		T0300NEWS model = new T0300NEWS();
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("newsid", newsid);
			model = inews.queryNewsDetail(sqlmap);
			byte[] b = (byte[]) model.getContent();
			String s = new String(b, "utf-8");
			model.setContentutf(s);
			// 添加点击率
			inews.addpoint(sqlmap);
		} catch (Exception e) {

		}

		return model;
	}

	public List<T0300NEWS> Showupdown(String newsid, String typeid) {
		List<T0300NEWS> list = new ArrayList<T0300NEWS>();
		Map<String, String> sqlmap = new HashMap<String, String>();
		sqlmap.put("newsid", newsid);
		sqlmap.put("typeid", typeid);
		list = inews.queryupdown(sqlmap);
		return list;
	}

	public List<T0300NEWS> ShowHTMLJiaocheng() {
		List<T0300NEWS> result_list = new ArrayList<T0300NEWS>();
		Map<String, String> sqlmap = new HashMap<String, String>();
		sqlmap.put("bigid", "B20180515141959");
		List<T0300NEWS> list = inews.queryByBig(sqlmap);
		int count = 12;// 查询最新的12条
		if (list != null && list.size() > count) {
			for (int i = 0; i < count; i++) {
				result_list.add(list.get(i));
			}
		} else {
			result_list = list;
		}
		return result_list;
	}

	public List<T0300NEWS> Showshujuku() {
		List<T0300NEWS> result_list = new ArrayList<T0300NEWS>();
		Map<String, String> sqlmap = new HashMap<String, String>();
		sqlmap.put("bigid", "B20180524094321");
		List<T0300NEWS> list = inews.queryByBig(sqlmap);
		int count = 12;// 查询最新的12条
		if (list != null && list.size() > count) {
			for (int i = 0; i < count; i++) {
				result_list.add(list.get(i));
			}
		} else {
			result_list = list;
		}
		return result_list;
	}

	public List<T0300NEWS> ShowXiangMuShiZhan() {
		List<T0300NEWS> result_list = new ArrayList<T0300NEWS>();
		Map<String, String> sqlmap = new HashMap<String, String>();
		sqlmap.put("bigid", "B20180524105757");
		List<T0300NEWS> list = inews.queryByBig(sqlmap);
		int count = 12;// 查询最新的12条
		if (list != null && list.size() > count) {
			for (int i = 0; i < count; i++) {
				result_list.add(list.get(i));
			}
		} else {
			result_list = list;
		}
		return result_list;
	}

	public List<T0300NEWS> ShowDownLoad() {
		List<T0300NEWS> result_list = new ArrayList<T0300NEWS>();
		Map<String, String> sqlmap = new HashMap<String, String>();
		sqlmap.put("bigid", "B20180516092948");
		List<T0300NEWS> list = inews.queryByBig(sqlmap);
		int count = 5;// 查询最新的5条
		if (list != null && list.size() > count) {
			for (int i = 0; i < count; i++) {
				result_list.add(list.get(i));
			}
		} else {
			result_list = list;
		}
		return result_list;
	}

	public List<T0300NEWS> ShowJAVAjiqiao() {
		List<T0300NEWS> result_list = new ArrayList<T0300NEWS>();
		Map<String, String> sqlmap = new HashMap<String, String>();
		sqlmap.put("bigid", "B20180516101945");
		List<T0300NEWS> list = inews.queryByBig(sqlmap);
		int count = 10;// 查询最新的5条
		if (list != null && list.size() > count) {
			for (int i = 0; i < count; i++) {
				result_list.add(list.get(i));
			}
		} else {
			result_list = list;
		}
		return result_list;
	}

	public List<T0300NEWS> ShowJAVAKuangJia() {
		List<T0300NEWS> result_list = new ArrayList<T0300NEWS>();
		Map<String, String> sqlmap = new HashMap<String, String>();
		sqlmap.put("bigid", "B20180516111455");
		List<T0300NEWS> list = inews.queryByBig(sqlmap);
		int count = 10;// 查询最新的5条
		if (list != null && list.size() > count) {
			for (int i = 0; i < count; i++) {
				result_list.add(list.get(i));
			}
		} else {
			result_list = list;
		}
		return result_list;
	}

	public List<T0300NEWS> ShowJingPinJiaocheng() {
		List<T0300NEWS> result_list = new ArrayList<T0300NEWS>();
		Map<String, String> sqlmap = new HashMap<String, String>();
		sqlmap.put("typeid", "X20180515094347");
		List<T0300NEWS> tuijianyuedu_list = inews.queryLeiBie(sqlmap);
		int count = 10;// 查询最新的十条
		if (tuijianyuedu_list != null && tuijianyuedu_list.size() > count) {
			for (int i = 0; i < 10; i++) {
				result_list.add(tuijianyuedu_list.get(i));
			}
		} else {
			result_list = tuijianyuedu_list;
		}
		return result_list;
	}

	public List<T0300NEWS> ShowYueDupaihang() {
		List<T0300NEWS> result_list = new ArrayList<T0300NEWS>();
		Map<String, String> sqlmap = new HashMap<String, String>();
		List<T0300NEWS> tuijianyuedu_list = inews.queryPaiHang(sqlmap);
		int count = 10;// 查询最新的十条
		if (tuijianyuedu_list != null && tuijianyuedu_list.size() > count) {
			for (int i = 0; i < 10; i++) {
				result_list.add(tuijianyuedu_list.get(i));
			}
		} else {
			result_list = tuijianyuedu_list;
		}
		return result_list;
	}

	public List<T0300NEWS> ShowZuiJinGengXin() {
		List<T0300NEWS> result_list = new ArrayList<T0300NEWS>();
		Map<String, String> sqlmap = new HashMap<String, String>();
		List<T0300NEWS> tuijianyuedu_list = inews.queryNew(sqlmap);
		int count = 10;// 查询最新的十条
		if (tuijianyuedu_list != null && tuijianyuedu_list.size() > count) {
			for (int i = 0; i < 10; i++) {
				result_list.add(tuijianyuedu_list.get(i));
			}
		} else {
			result_list = tuijianyuedu_list;
		}
		return result_list;
	}

	public List<BigInfo> ShowMaper() {
		Map<String, String> sqlmap = new HashMap<String, String>();
		List<BigInfo> big_list = new ArrayList<BigInfo>();
		big_list = inews.querymap(sqlmap);
		return big_list;
	}

	public List<BigInfo> ShowBigInfo(String bigid) {
		List<BigInfo> big_list = new ArrayList<BigInfo>();
		BigInfo big_result = new BigInfo();

		Map<String, String> sqlmap = new HashMap<String, String>();
		sqlmap.put("bigid", bigid);
		List<BigInfo> smalllist = inews.querysmalllist(sqlmap);
		for (BigInfo model : smalllist) {
			big_result = new BigInfo();
			big_result.setBigid(bigid);
			big_result.setBigname(model.getBigname());
			big_result.setTypecontent(model.getTypecontent());
			big_result.setSmallid(model.getSmallid());
			big_result.setSmallname(model.getSmallname());
			sqlmap = new HashMap<String, String>();
			sqlmap.put("smallid", model.getSmallid());
			List<T0300NEWS> newslist = inews.queryitembysmall(sqlmap);
			big_result.setNewslist(newslist);
			big_list.add(big_result);
		}
		return big_list;
	}

	// 保存CKEDITOR图片
	@RequestMapping(value = "/news_picture")
	public String newspicture(@RequestParam("upload") MultipartFile file,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			String wuliPath = request.getSession().getServletContext()
					.getRealPath("/")
					+ UPLOAD_PATH;

			String proName = request.getContextPath();

			String callback = request.getParameter("CKEditorFuncNum");

			String fileName = file.getOriginalFilename();
			String uploadContentType = file.getContentType();
			String expandedName = "";
			if (uploadContentType.equals("image/pjpeg")
					|| uploadContentType.equals("image/jpeg")) {
				expandedName = ".jpg";
			} else if (uploadContentType.equals("image/png")
					|| uploadContentType.equals("image/x-png")) {
				expandedName = ".png";
			} else if (uploadContentType.equals("image/gif")) {
				expandedName = ".gif";
			} else if (uploadContentType.equals("image/bmp")) {
				expandedName = ".bmp";
			} else {
				return null;
			}

			DateFormat df = new SimpleDateFormat(DEFAULT_SUB_FOLDER_FORMAT_AUTO);
			fileName = df.format(new Date()) + expandedName;
			file.transferTo(new File(wuliPath + "/" + fileName));
			String path = request.getContextPath();
			String imageContextPath = DirectoryName + "/" + fileName;
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/" + imageContextPath;
			// 返回图片访问路径
			callback="1";
			String result = "window.parent.CKEDITOR.tools.callFunction("
					+ callback + ",'" + basePath + "','')";
		String s=	returnResult(response, result);
		return s;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private String returnResult(HttpServletResponse response, String result)
			throws IOException {
		response.setCharacterEncoding("UTF-8");
	String str="<script type=\"text/javascript\">";
	str+=result;
	str+="</script>";
	   return str;
	}

	// 显示大类
	@RequestMapping(value = "/news_showbig", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String showbig(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			List<T0301NEWSTYPE> bigtype_list = inews.querybigtype();
			String bigjson = JSONArray.fromObject(bigtype_list).toString();
			jsonstr = bigjson;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonstr;
	}

	// 显示小类
	@RequestMapping(value = "/news_showsmall", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String showsmall(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("bigid", arg0.getParameter("bigid").toString());
			List<T0301NEWSTYPE> smalltype_list = inews.querysmalltype(sqlmap);
			String smalljson = JSONArray.fromObject(smalltype_list).toString();
			jsonstr = smalljson;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonstr;
	}

	// 显示小类
	@RequestMapping(value = "/news_showsmallall", produces = "application/json; charset=utf-8")
	public @ResponseBody
	String newsshowsmall(HttpServletRequest arg0, HttpServletResponse arg1) {
		String jsonstr = "";
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("smallid", arg0.getParameter("smallid").toString());
			List<T0301NEWSTYPE> smalltype_list = inews
					.querysmalltypebyid(sqlmap);
			String smalljson = JSONArray.fromObject(smalltype_list).toString();
			String jsonstr2 = "{\"smalljson\":" + smalljson + ",\"smallid\":"
					+ arg0.getParameter("smallid").toString() + ",\"bigid\":"
					+ smalltype_list.get(0).getBigid() + "}";
			jsonstr = jsonstr2;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonstr;
	}

	// 保存
	@RequestMapping(value = "/news_save", produces = "application/json; charset=utf-8")
	public ModelAndView newssave(HttpServletRequest arg0,
			HttpServletResponse arg1) {
		String jsonstr = "";
		ModelAndView modelview = new ModelAndView("webadmin/newsadd");
		try {
			Map<String, String> sqlmap = new HashMap<String, String>();
			sqlmap.put("newsid", TimeKey.newkey("new"));
			sqlmap.put("title", arg0.getParameter("txttitle").toString());
			sqlmap.put("keywords", arg0.getParameter("txtkeywords").toString());
			sqlmap.put("description", arg0.getParameter("txtdescription")
					.toString());
			sqlmap.put("typeid", arg0.getParameter("dplpower2").toString());
			sqlmap.put("power", arg0.getParameter("txtpower").toString());
			sqlmap.put("datetime", TimeKey.NowTime());
			sqlmap.put("content", arg0.getParameter("content").toString());
			inews.dosavenews(sqlmap);
			modelview.addObject("isok", "saveok");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelview;

	}

}
