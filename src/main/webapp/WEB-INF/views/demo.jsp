<%String path=request.getContextPath(); %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
	<body>
		<h2 style="float:left">Hello BONC </h2>
		<button type="button" onclick="scan()" style="cursor:pointer;float:left;width:120px;height:30px;background:#1e90ff;margin: 2px 10px;border-radius: 5px;">访问程序</button>
		<button type="button" onclick="scan2()" style="cursor:pointer;float:left;width:120px;height:30px;background:#1e90ff;margin: 2px 10px;border-radius: 5px;">访问程序2</button>
	</body>


	<script type="text/javascript" src="<%=path %>/js/plugins/jquery-1.11.3.js"></script>
	<script type="text/javascript">
	   var ctx = "<%=path%>";
	   function scan() {
	       $.ajax({
	            url : ctx + "/scan",
	            type : "GET",
	            success : function(data) {

	            }
	        });
	   }

	   function scan2() {
		   window.open(ctx+"/scan");
	   }
    </script>
</html>
