/*
 * 文件名：numberOfCarController.java
 * 版权：Copyright by bonc
 * 描述：
 * 修改人：zhoutao
 * 修改时间：2016年8月10日
 * 跟踪单号：
 * 修改单号：
 * 修改内容：
 */

package demo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Demo {
    @Value("${test.connect.url}")
    private String url ;
    
    public static Integer NUM = 1;
    
	/**
	 * Description: <br>
	 * 登录页面
	 * @param request
	 * @return 
	 * @see
	 */
	@RequestMapping("/demo")
	public String login(HttpServletRequest request){
	    
//	    Date date = new Date();
//	    SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss Z");
//	    System.out.println("\n\n\n");
//		System.out.println("===============================================");
//		System.out.println(time.format(date)+"   第"+NUM+"次访问;");
//		NUM = NUM + 1 ;
		return "demo";
	}
	
	@RequestMapping("/demo/url")
    public String readContentFromGet() throws IOException{
//	    for (int i = 0 ;i < 10 ; i++) {
	        try {
                // 拼凑get请求的URL字串，使用URLEncoder.encode对特殊和不可见字符进行编码
                URL getUrl =new URL(url);
                System.out.println(getUrl);
                // 根据拼凑的URL，打开连接，URL.openConnection函数会根据URL的类型，
                // 返回不同的URLConnection子类的对象，这里URL是一个http，因此实际返回的是HttpURLConnection
                HttpURLConnection connection =(HttpURLConnection) getUrl.openConnection();
                // 进行连接，但是实际上get request要在下一句的connection.getInputStream()函数中才会真正发到
                // 服务器
                connection.connect();
                BufferedReader reader =new BufferedReader(new InputStreamReader(connection.getInputStream(),"utf-8"));//设置编码,否则中文乱码
                Date date = new Date();
                SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss Z");
                System.out.println("\n\n\n");
                System.out.println("===============================================");
                System.out.println(time.format(date));
                String lines;
                while((lines= reader.readLine())!=null){
                        //lines = new String(lines.getBytes(), "utf-8");
                    System.out.println(lines);
                }
                reader.close();
                // 断开连接
                connection.disconnect();
//                Thread.sleep(2000);
            }
            catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
//	    }
	    return "demo";
    }

   
}
