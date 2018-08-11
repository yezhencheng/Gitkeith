package demo;

import org.apache.commons.httpclient.Cookie;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.cookie.CookiePolicy;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;


public class Test {
	
	public static void main(String[] args)
	{
		  //模拟登录URL  
        String loginUrl = "";  
        String userid="";
        String type = "";  
          
        //模拟打点URL+参数  
        String dataUrl = ""+"?account="+userid+"&id="+userid+"&type="+type;  
   
        HttpClient httpClient = new HttpClient();  
   
        //获得POST请求方法  
        PostMethod postMethod = new PostMethod(loginUrl);  
        postMethod.setRequestHeader("Referer", "这是一个参数");  
        postMethod.setRequestHeader("User-Agent","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2453.0 Safari/537.36");  
        //设置登录请求参数  
        NameValuePair[] data = {  
                new NameValuePair("username", "这是一个变量名1"),  
                new NameValuePair("password","这是一个变量名2"),  
        };  
        postMethod.setRequestBody(data);  
   
        try {  
            //设置 HttpClient 接收 Cookie,用与浏览器一样的策略  
            httpClient.getParams().setCookiePolicy(CookiePolicy.BROWSER_COMPATIBILITY);  
            int loginState = httpClient.executeMethod(postMethod);  
            System.out.println(loginState);  
            //获得登陆后的 Cookie  
            Cookie[] cookies=httpClient.getState().getCookies();  
            String tmpcookies= "";  
            for(Cookie c:cookies){  
                tmpcookies += c.toString()+";";  
            }  
   
            //进行登陆后的操作  
            GetMethod getMethod = new GetMethod(dataUrl);  
   
            //每次访问需授权的网址时需带上前面的 cookie 作为通行证  
            getMethod.setRequestHeader("cookie",tmpcookies);  
              
              
            httpClient.executeMethod(getMethod);  
        } catch (Exception e) {  
            System.out.println("登陆出错------------->"+e.getMessage());  
        }     
	}
}
