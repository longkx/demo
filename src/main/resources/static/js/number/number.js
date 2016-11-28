$(function(){
	
	$("#city").citySelect({
		url:"/js/plugins/city.min.js",
		prov:"甘肃",
		city:"天水", 
		nodata:"none"
	});
	
	//根据公司名称去查询当前公司所有数据
	$("#findByCom").click(function(){
		var companyName = $("#findBycompany").val();
		$.ajax({
			url:ctx+"/findBycompany.do",
			type: "POST",
     		data:{"companyName":companyName},
			success:function(data){
				var html = "";
				data = eval("(" + data + ")");
				if (data == null) {
					layer.msg("没有搜索到结果",{icon: 5});
				} else {
					for (var i in data.data) {
						var numberOfCar = data.data[i];
						html += '<tr>'+
						'<td class="pros">'+numberOfCar.province+'</td>'+
						'<td class="citys">'+numberOfCar.city+'</td>'+
						'<td class="cartypes">'+numberOfCar.carType+'</td>'+
						'<td class="companys">'+numberOfCar.company+'</td>'+
						'<td class="dates">'+numberOfCar.createDate+'</td>'+
						'<td class="counts">'+numberOfCar.count+'</td>'+
						'<td class="func"><a href="javascript:void(0)" onclick="deleteRow('+numberOfCar.id+')" value="'+numberOfCar.id+'" class="gray">删除</a>&nbsp&nbsp&nbsp&nbsp'+
						'<a href="javascript:void(0)" onclick="modifyRow('+numberOfCar.id+')" value="'+numberOfCar.id+'" class="gray">修改</a>'+
						'</td>'+
						'</tr>'
					}
				}
				$("#numberList").html(html);
			}	
    	});
	});
	
	//根据省份，地市查询当前数据
	$("#find").click(function(){
		var province = $("#prov").val();
    	var city = $(".city").val();
		var carType = $("#typeByCar").val();
		var companyCar = $("#companyCar").val();
		
			$.ajax({
				url:ctx+"/findByAll.do",
				type: "POST",
         		data:{"province":province,"city":city,"carType":carType,"company":companyCar},
				success:function(data){
					data = eval("(" + data + ")");
					var html = "";
					for (var i in data.data) {
						var numberOfCar = data.data[i];
						html += '<tr>'+
	    	    			'<td class="pros">'+numberOfCar.province+'</td>'+
	    	    			'<td class="citys">'+numberOfCar.city+'</td>'+
	    	    			'<td class="cartypes">'+numberOfCar.carType+'</td>'+
	    	    			'<td class="companys">'+numberOfCar.company+'</td>'+
	    	    			'<td class="dates">'+numberOfCar.createDate+'</td>'+
	    	    			'<td class="counts">'+numberOfCar.count+'</td>'+
	    	    			'<td class="func"><a href="javascript:void(0)" onclick="deleteRow('+numberOfCar.id+')" value="'+numberOfCar.id+'" class="gray">删除</a>&nbsp&nbsp&nbsp&nbsp'+
	    	    						'<a href="javascript:void(0)" onclick="modifyRow('+numberOfCar.id+')" value="'+numberOfCar.id+'" class="gray">修改</a>'+
	    	    			'</td>'+
	    	    		'</tr>'
					}
					$("#numberList").html(html);
				}	
        	});
		
	});
	
	//添加数据
	$("#save").click(function(){
		var carType = $("#typeByCar").val();
		if(carType == "汽车类型"){
    	      layer.tips('汽车类型不能为空','#typeByCar',{tips: [1, '#3595CC']});
    	      $('#typeByCar').focus();
    	      return;
    	      layer.close(index);
    	}
		
		layer.open({
		 	type:1,
	        title: '汽车数量',
	        content: $("#save_numberCar"),
	        btn: ['导入', '取消'],
	        yes: function(index, layero){ 
	        	var province = $("#prov").val();
	        	var city = $(".city").val();
	        	var company = $("#belongCompany").val();
	        	var count = $("#carnumber").val();
	        	
	        	if(!company || company.length < 1){
		      	      layer.tips('汽车公司不能为空','#belongCompany',{tips: [1, '#3595CC']});
		      	      $('#belongCompany').focus();
		      	      return;
	        	}
	        	
	        	if(!count || count.length < 1){
		      	      layer.tips('汽车数量不能为空','#carnumber',{tips: [1, '#3595CC']});
		      	      $('#carnumber').focus();
		      	      return;
		        }
	        	
	        	$.ajax({
					url:ctx+"/save.do",
					type: "POST",
	         		data:{"province":province,"city":city,"carType":carType,"company":company,"count":count},
					success:function(data){
						data = eval("(" + data + ")");
						if(data.status=="200"){
							layer.msg("添加成功",{icon: 6});
							layer.close(index);
						} else if (data.status=="400") {
							layer.msg("以存在该条数据",{icon: 5});
						}else {
							layer.msg("添加失败",{icon: 5});
						}
					}	
	        	});
	        	layer.close(index);
	        }
		})
	});
	
	//根据汽车类型查询当前所有的汽车公司
	$("#typeByCar").change(function(){
		var province = $("#prov").val();
    	var city = $(".city").val();
    	var carType = $("#typeByCar").val();
    	$.ajax({
			url:ctx+"/findCompany.do",
			type: "POST",
     		data:{"province":province,"city":city,"carType":carType},
			success:function(data){
				data = eval("(" + data + ")");
	            var html = '<option type="text" value="汽车公司">汽车公司</option>';
	            if (data != null) {
	            	if (data['data'].length > 0) {
	            		for (var i in data.data) {
	            			var numCar = data.data[i];
	            			html += "<option type='text' value='"+numCar.company+"'>"+numCar.company+"</option>"
	            		}
	            	}
	            }
	            $("#companyCar").html(html); 
			}	
    	});
    });
    	
})

//删除数据
function deleteRow(numberId) {
	$.ajax({
		url:ctx+"/delete.do",
		type: "POST",
 		data:{"numberId":numberId},
		success:function(data){
			data = eval("(" + data + ")");
			if(data.status=="200"){
				layer.msg("删除成功",{icon: 6});
				 window.location.reload();
			} else {
				layer.msg("删除失败",{icon: 5});
			}
		}	
	});
}

function modifyRow(numberId) {
	layer.open({
	 	type:1,
        title: '修改',
        content: $("#modify_numberCar"),
        btn: ['修改', '取消'],
        yes: function(index, layero){ 
        	var count = $("#modify_carnumber").val();
        	$.ajax({
        		url:ctx+"/modify.do",
        		type: "POST",
         		data:{"numberId":numberId,"count":count},
        		success:function(data){
        			data = eval("(" + data + ")");
        			if(data.status=="200"){
        				layer.msg("修改成功",{icon: 6});
        				window.location.reload();
        			} else {
        				layer.msg("修改失败",{icon: 5});
        			}
        		}	
        	});
        }
	})
	
}
