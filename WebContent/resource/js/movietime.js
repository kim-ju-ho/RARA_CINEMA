function dayClick(button) {
	var daybtn = document.getElementsByClassName('daybtn');
	for (var i = 0; i < daybtn.length; i++) {
		if (daybtn[i].style.border == '3px solid navy') {
			daybtn[i].style.border = 'white';
			daybtn[i].style.color = '#3045a1';
			daybtn[i].setAttribute('id','notselectday');
		}else{			
			button.setAttribute('id','selectday');
		}
	}
	button.style.border = '3px solid navy';
	button.style.color = 'navy';
	
	
	$.ajax({
		url:"/Semi/MovieList.do",
		type:"get",
		data:{
			cinemaName : $('#movieselect1 option:selected').val(),
			date : $('#selectday').val()
		},success:function(data){
			$('.screen').remove();
			console.log(data);
			var a=0;
			for(var index=0;index<data.length;index++){
				var date = $('#selectday').val().split('-');
				var time = data[index].starttime.split(':');
				var selectDate = new Date(date[0],date[1]-1,date[2],time[0],time[1]);
				var now = new Date();
				var current = selectDate-now;
				
				for(var i=0;i<$('.screen').length;i++){
					if($('.screen').eq(i).attr('id')==data[index].movieName && current>0){
						a=1;
						$('.screen').eq(i).children('.startTime').append("<button type='button'"+" id='timebtn'>"+data[index].starttime+"<br>"
														+data[index].screen+data[index].nullseat+"</button>");
						break;
					}else if($('.screen').eq(i).attr('id') != data[index].movieName && current>0){
						a=0;
					}
				}
				if(a==0  && current>0){
					$('.screens').append("<div class='screen'"+" id='"+data[index].movieName+"'>"
							+"<h4 class='movieName'>"+data[index].movieName+"</h4>"
							+"<h5 class='movieInfo'>"+data[index].genre+"/"+data[index].runningtime+"분"+"/"+data[index].open+"</h5>"
							+"<span class='startTime'"+" id='startTime_"+data[index].movieName+"'>"
							+"<button type='button'"+" id='timebtn'>"+data[index].starttime+"<br>"
							+data[index].screen+data[index].nullseat+"</button>"+"</span></div>");
				}
			}
		},error:function(request,status,error){
			console.log("영화리스트 불러오기 AJAX 에러!");
			console.log("영화리스트 불러오기 AJAX 에러!"+request);
			console.log("영화리스트 불러오기 AJAX 에러!"+status);
			console.log("영화리스트 불러오기 AJAX 에러!"+error);
		}
	});
}


$(function(){
	var week = new Array('일', '월', '화', '수', '목', '금', '토');   
	var daylist = "";

	for(var i=0;i<7;i++,date+=1){
		var today = new Date()
		today.setDate(today.getDate()+i);

		var date = today.getDate();
		var month = today.getMonth()+1;
		var year = today.getFullYear();
		var day = week[today.getDay()];
		if(i==0){
			daylist += "<li><button type='button'"+" class='daybtn'"+" id='selectday'"+" value='"+year+"-"+month+"-"+date+"'"
			+" onclick='dayClick(this);'"+" style='border: 3px solid navy; color: navy;'>"
			+"<label id='month'>"+month+"</label>월 "+day+"요일<br>"+"<label id='date'>"+date+"</label>일</button></li>";
		}else{			
			daylist += "<li><button type='button'"+" class='daybtn'"+" value='"+year+"-"+month+"-"+date+"'" + " onclick='dayClick(this);'>"
			+"<label id='month'>"+month+"</label>월 "+day+"요일<br>"+"<label id='date'>"+date+"</label>일</button></li>";
		}
	}
	$('#daylist').html(daylist);



	$.ajax({
		url:"/Semi/CinemaList.do",
		type:"get",
		success:function(data){
			for(var i=0 ; i<data.length ; i++){
				$('#movieselect1').append("<option value = '"+data[i].cinemaName+"'>" + data[i].cinemaName+"</option>");
			}
		},error:function(request,status,error){
			console.log("영화관 불러오기 AJAX 에러!");
			console.log("영화관 불러오기 AJAX 에러!"+request);
			console.log("영화관 불러오기 AJAX 에러!"+status);
			console.log("영화관 불러오기 AJAX 에러!"+error);
		}
	});
	
	
	
//	$(document).on("click","#timebtn",function(){
//		console.log($(this).parent().parent().eq(0).attr('id'));
//		var moviename = $(this).parent().parent().eq(0).attr('id');
//		if(m==null){
//			console.log("로그인 누름");
//			location.href="#loginmodal";
//		}else{			
//			location.href="/Semi/reservationConnect.rc?moviename=" + moviename;
//		}
//	});
});

$(function(){
	$('#movieselect1').change(function(){
		$.ajax({
			url:"/Semi/MovieList.do",
			type:"get",
			data:{
				cinemaName : $('#movieselect1 option:selected').val(),
				date : $('#selectday').val()
			},success:function(data){
				$('.screen').remove();
				console.log(data);
				var a=0;
				var b=0;
				for(var index=0;index<data.length;index++){
					var date = $('#selectday').val().split('-');
					var time = data[index].starttime.split(':');
					var selectDate = new Date(date[0],date[1]-1,date[2],time[0],time[1]);
					var now = new Date();
					var current = selectDate-now;
					
					for(var i=0;i<$('.screen').length;i++){
						if($('.screen').eq(i).attr('id')==data[index].movieName && current>0){
							a=1;
//							for(var j=0;j<$('.screen').eq(i).children('.startTime').eq(i).children('#timebtn').length;j++){
//								if($('.screen').eq(i).children('.startTime').eq(i).children('#timebtn').eq(j).attr('class') == data[index].starttime){								
//									b=1;
//									break;
//								}else{
							$('.screen').eq(i).children('.startTime').append("<button type='button'"+" id='timebtn'"+" class='"+data[index].starttime+"'>"+data[index].starttime+"<br>"
									+data[index].screen+data[index].nullseat+"</button>");
//								}
//							}
							break;
						}else if($('.screen').eq(i).attr('id') != data[index].movieName && current>0){
							a=0;
						}
					}
					if(a==0 && b==0  && current>0){
						$('.screens').append("<div class='screen'"+" id='"+data[index].movieName+"'>"
								+"<h4 class='movieName'>"+data[index].movieName+"</h4>"
								+"<h5 class='movieInfo'>"+data[index].genre+"/"+data[index].runningtime+"분"+"/"+data[index].open+"</h5>"
								+"<span class='startTime'"+" id='startTime_"+data[index].movieName+"'>"
								+"<button type='button'"+" id='timebtn'"+" class='"+data[index].starttime+"'>"+data[index].starttime+"<br>"
								+data[index].screen+data[index].nullseat+"</button>"+"</span></div>");
					}
					console.log($('.screen').eq(0).children('.startTime').eq(0).children('#timebtn').length);
					console.log($('.screen').eq(0).children('.startTime').eq(0).children('#timebtn').eq(5).attr('class'));
				}
			},error:function(request,status,error){
				console.log("영화리스트 불러오기 AJAX 에러!");
				console.log("영화리스트 불러오기 AJAX 에러!"+request);
				console.log("영화리스트 불러오기 AJAX 에러!"+status);
				console.log("영화리스트 불러오기 AJAX 에러!"+error);
			}
		});
	});
});