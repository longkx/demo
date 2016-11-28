<%String path=request.getContextPath(); %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
	<body>
	    <h2>demo!</h2>
	   <a href="<%=path %>/demo/url" >
	       <input type="button" name="btnAdd" id="btnAdd" value="测试黏连" /></a>
	       
	       <form id="formid" method = 'get'  action = '<%=path %>/demo/url'  >
	       
	       </form>

           <!--  <input type="button" class="btn2" onclick = "checkUser();" value="测试黏连"  /> -->
	</body>
	
	<script type="text/javascript">
	   function checkUser(){
		  document.getElementById("formid").submit();
		}
    </script>
</html>
