<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%String path=request.getContextPath(); %>
<script type="text/javascript">
var ctx = "<%=path%>";
</script>
<html>
<head>
    <title>统计</title>
    <link rel="stylesheet" type="text/css" href="<%=path %>/plugins/bootstrap-3.3.5/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/plugins/bootstrap-slider/dist/css/bootstrap-slider.min.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path %>/plugins/layer/skin/layer.css"/>
    
    <script type="text/javascript" src="<%=path %>/js/plugins/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="<%=path %>/plugins/bootstrap-3.3.5/dist/js/bootstrap.js" ></script>
    <script type="text/javascript" src="<%=path %>/js/plugins/jquery.cityselect.js"></script>
    <script type="text/javascript" src="<%=path %>/js/number/number.js"></script>
    <script type="text/javascript" src="<%=path %>/plugins/layer/layer.js"></script>
    
</head>
<body>
    <div id = "carBase" style = "width: 100%;background-color: #eee;height: 100%;">
        <div style = "margin-left:370px;padding-top: 2cm ">
		    <div id="city" style = "float:left;  ">  
			    <select class="prov" id = "prov" style = "width: 100px;height: 48px;"></select>   
			    <select class="city"  id = "city" disabled="disabled" style = "width: 100px;height: 48px;"></select>  
			   <!--  <select class="dist" disabled="disabled"></select>  --> 
			</div>
		    
		    <select id="typeByCar" name="typeByCar" placeholder="汽车类型" style="width:100px; height:48px;float:left;">
               <option type="text" value=汽车类型>汽车类型</option>
               <option type="text" value="公交车">公交车</option>
               <option type="text" value="出租车">出租车</option>
               <option type="text" value="长途客运">长途客运</option>
            </select>
		    
		    <select id="companyCar" name="companyCar" placeholder="汽车公司" style="width:218px; height:48px;float:left;">
               <option type="text" value="汽车公司">汽车公司</option>
            </select>
		    
		    <div style="margin-right:5px ;float:left;" >
		       <button  id = "find" type="button" class="btn btn-success" style = "width:70px;height:48px">查询</button>
		       <button id = "save" type="button" class="btn btn-danger"  style = "width:70px;height:48px">添加</button>
		    </div>
		    
		    <div style="margin-right:5px ; ">
               <input type="text" id="findBycompany" placeholder="根据公司名称模糊查询"  value= ""  />
               <button id = "findByCom" type="button" class="btn btn-danger"  style = "width:50px;height:35px">搜索</button>
            </div>
		    
	    </div>
	     <div class="itemTable" style = "margin-left:100px;margin-right:100px;padding-top: 2cm ">
	          <table class="table">
                   <thead>
                       <tr>
                           <th style="width: 15%;padding-left: 5px;">省份</th>
                           <th style="width: 15%;text-indent: 8px;">地市</th>
                           <th style="width: 15%;">汽车类型</th>
                           <th style="width: 15%;">汽车公司</th>
                           <th style="width: 20%;">最后操作时间</th>
                           <th style="width: 10%;">数量</th>
                           <th style="width: 20%;">操作</th>
                       </tr>
                   </thead>
                   <tbody id = "numberList">
                        
                   </tbody>
               </table>
	    </div>
	    
	    
	    <div id="save_numberCar" style = "display:none;">
             <div style="width: 300px; margin: 5px 10px 5px 10px">
                <p>所属公司：<input type="text" id="belongCompany" style="width: 50%" value= "" /></p>
                <p>汽车数量：<input type="text" id="carnumber" style="width: 50%" value= ""  /></p>
             </div>
       </div>
       
       <div id="modify_numberCar" style = "display:none;">
             <div style="width: 300px; margin: 5px 10px 5px 10px">
                <p>汽车数量：<input type="text" id="modify_carnumber" style="width: 50%" value= ""  /></p>
             </div>
       </div>
       
   </div>
</body>
</html>