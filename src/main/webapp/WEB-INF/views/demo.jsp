<%String path=request.getContextPath(); %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
	<body>
	<h2>Hello BONC </h2>
	    <img alt="" id = "imageId" style = "display: block;max-width: 100%;height: auto" src="image/img1.jpg">
	    
	   <%-- <a href="<%=path %>/demo/url" >
	       <input type="button" name="btnAdd" id="btnAdd" value="测试黏连" /></a>
	       
	       <form id="formid" method = 'get'  action = '<%=path %>/demo/url'  >
	       
	       </form>

           <!--  <input type="button" class="btn2" onclick = "checkUser();" value="测试黏连"  /> --> --%>
	</body>
	
	<script type="text/javascript">
	setInterval(function(){
		var u=['(image/img1.jpg',
	           'image/img2.png',
	           'image/img3.png'
	           ];
		document.getElementById("imageId").src = u[parseInt(Math.random()*100)%3];
	    },3500);
    </script>
</html>
