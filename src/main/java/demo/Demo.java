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
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Demo {
    @Value("${test.connect.url}")
    private String url ;

    @Value("${test.access.account}")
    private int account;

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
		return "demo";
	}

	@RequestMapping("/scan")
	public String reflect(HttpServletRequest request) {
	    for (int i=0;i<account;i++) {
	        Date start = new Date();
	        visitService();
	        Date end = new Date();
			int i1 = 1;
				System.out.println("# Licensed to the Apache Software Foundation (ASF) under one or more       \n"
						+ "# contributor license agreements.  See the NOTICE file distributed with    \n"
						+ "# this work for additional information regarding copyright ownership.      \n"
						+ "# The ASF licenses this file to You under the Apache License, Version 2.0  \n"
						+ "# (the \"License\"); you may not use this file except in compliance with     \n"
						+ "# the License.  You may obtain a copy of the License at                    \n"
						+ "#                                                                          \n"
						+ "#     http://www.apache.org/licenses/LICENSE-2.0                           \n"
						+ "#                                                                          \n"
						+ "# Unless required by applicable law or agreed to in writing, software      \n"
						+ "# distributed under the License is distributed on an \"AS IS\" BASIS,        \n"
						+ "# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. \n"
						+ "# See the License for the specific language governing permissions and      \n"
						+ "# limitations under the License.                                           \n");
	        System.out.println("第"+NUM+"次访问,客户端调用耗时：" + (end.getTime() - start.getTime())+"ms");
	        System.out.println("========================================================================");
	        NUM = NUM + 1 ;
	    }
        return "number";
	}


    @RequestMapping("/dealmethod")
    @ResponseBody
    public String dealMethod() {
        String result="";
        Date start = new Date();
        for (int i=0;i<100;i++) {
           result = RandomString.getStringRandom(1000);
        }
        Date end = new Date();
        System.out.println("第"+NUM+"次访问,服务端处理耗时：" + (end.getTime() - start.getTime())+"ms");
        NUM = NUM + 1 ;
        return result;
    }


	public void visitService() {
        try {
            // 拼凑get请求的URL字串，使用URLEncoder.encode对特殊和不可见字符进行编码
            URL getUrl =new URL(url);
            // 根据拼凑的URL，打开连接，URL.openConnection函数会根据URL的类型，
            // 返回不同的URLConnection子类的对象，这里URL是一个http，因此实际返回的是HttpURLConnection
            HttpURLConnection connection =(HttpURLConnection) getUrl.openConnection();
            // 进行连接，但是实际上get request要在下一句的connection.getInputStream()函数中才会真正发到
            // 服务器
            connection.connect();
            BufferedReader reader =new BufferedReader(new InputStreamReader(connection.getInputStream(),"utf-8"));//设置编码,否则中文乱码
            reader.close();
            // 断开连接
            connection.disconnect();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
	}
}
