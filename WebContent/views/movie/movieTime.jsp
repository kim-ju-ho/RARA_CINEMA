<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 시간표</title>
<%@ include file="../common/header.jsp"%>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<!-- 모달용-->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">

<link rel="stylesheet" href="/Semi/resource/css/movietime.css">
<script type="text/javascript" src="/Semi/resource/js/movietime.js"></script>
<script>
	$(function(){
		$(document).on("click","#timebtn",function(){
			console.log($(this).parent().parent().eq(0).attr('id'));
			var moviename = $(this).parent().parent().eq(0).attr('id');
			<% if(m==null){ %>
				console.log("로그인 누름");
				alert("로그인을 해주세요!");
			<% }else{ %>			
				location.href="/Semi/reservationConnect.rc?moviename=" + moviename;
			<% } %>
		});
	});
</script>
<body>
	<div id="body">
			<hr>
			<div class="scroll-wrap">
				<ul class="menu-area">
					<li id="day_notice">가까운 7일의 상영 시간표를 확인하실 수 있습니다. <br>
						<p>→ &nbsp; → &nbsp;→ &nbsp;→&nbsp;</p></li>
					<span id="daylist"></span>
				</ul>
			</div>
			<hr>
			<label id="notice" for=""> * 시간을 클릭하시면 빠른 예매를 하실 수 있습니다.</label>
			<hr>
			<span>
					<h4>
						&nbsp; 영화관 선택 <select id="movieselect1">
							<option value="선택">영화관 선택</option>
						</select>
					</h4>
			</span>
			<hr>
			<div class="movieplace">
				<!-- <form action="/ReservationTime.do" method="post"> -->
						<div class="screens">
							<div class="screen" id="test"></div>
						</div>
				<!-- </form> -->
			</div>
			
	</div>
</body>

<%@ include file="../common/footer.jsp"%>
</html>