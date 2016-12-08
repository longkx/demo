<%String path=request.getContextPath(); %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
	<body>
		<h2 style="float:left">Hello BONC </h2>
		<button type="button" onclick="image1()" style="cursor:pointer;float:left;width:60px;height:30px;background:#1e90ff;margin: 2px 10px;border-radius: 5px;">image1</button>
		<button type="button" onclick="image2()" style="cursor:pointer;float:left;width:60px;height:30px;background:#f00;margin: 2px 10px;border-radius: 5px;">image2</button>
	    <img alt="" id = "imageId" style = "display: block;max-width: 100%;height: auto" src="image/img3.png">
	</body>
	
	<script type="text/javascript">
	   /* setInterval(function(){
		var u=['image/img1.png',
	           'image/img2.png',
	           'image/img3.png'
	           ];
		document.getElementById("imageId").src = u[parseInt(Math.random()*100)%3];
	    },1500); */
	   function image1(){
		   document.getElementById("imageId").src="image/img1.png";
	   }
	   function image2(){
		   document.getElementById("imageId").src="image/img2.png";
       }
    </script>
</html>
