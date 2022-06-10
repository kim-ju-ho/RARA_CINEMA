<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.semi.member.model.vo.*"%>
<%
	Member m = (Member) session.getAttribute("member");
%>

<!DOCTYPE html> 
<html> 
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">

<link href="/Semi/resource/css/header.css" rel="stylesheet"
	type="text/css" />
<link href="/Semi/resource/css/layout_nomain.css" rel="stylesheet"
	type="text/css" />
<style>
.topMenuLi:hover .menuLink {
	border-bottom: #505984 solid 3px;
}
</style>
</head>

<body>

		<!--header_section-->
		<%
			if (m == null) {
		%>
		<div id="header_section">
			<div>
				<div id="main">
					<div id="main_logo">
						<img src="/Semi/resource/images/logo_nv.png" alt="로고">
					</div>

					<div id="modal">

						<a href="#" class="content" id="join">회원가입</a> &nbsp; <a
							href="#loginmodal" class="content" rel="modal:open">로그인</a>
					</div>


					<!-- 로그인 모달-->
					<div id="loginmodal" style="display: none; color: #555555;">
						<h2>LOGIN</h2>
						<div class="p_c_text">아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.</div>
						<div class="login_line"
							style="position: relative; left: 10%; top: -13%;">
							<form id="loginForm" action="/Semi/login.me" method="post">

								<div class="box_in">
									<input type="text" name="userId" placeholder="아이디를 입력해주세요">
									<input type="password" name="userPwd"
										placeholder="비밀번호를 입력해주세요">
								</div>
								<div id="loginBtn" onclick='login()' class="btn_login">로그인</div>

							</form>

							<script>
								function login() {
									$('#loginForm').submit();
								}
							</script>
						</div>
						<div class="find_join">
							<a href="" class="find_1"
								style="font-size: 13px; color: #464646;">아이디 / 비밀번호 찾기</a> | <a
								href="" class="find_2" style="color: #464646; font-size: 13px">회원가입</a>
						</div>
					</div>


				</div>

				<%
					} else {
				%>
				<div id="login_info">

					<label
						style="color: #f4f4f4; position: relative; right: -45%; top: 17%; font-size: 14px;">
						<%= m.getUserName() %> 님의 방문을 환영합니다. </label>

				</div>
				<div id="login_name"></div>
				<div>
					<div id="main">
						<div id="main_logo">
							<img src="/Semi/resource/images/logo_nv.png" alt="">
						</div>

						<div id="modal">

							<a href="#" class="content" id="mypage">마이페이지</a> &nbsp; <a
								href="#" class="content" onclick="button1_click();">로그아웃</a>

						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
		<div id="nav">
			<div id="topMenu">
				<ul>
					<li class="topMenuLi"><a href="#" class="menuLink">예매</a>
						<ul class="submenu">
							<div>
							<li>
								<% if ( m == null ) { %>
			                    	<a href="#loginmodal" rel="modal:open">예매하기 </a>
			                   <% }else {%>
			                   		 <a onclick="reservation();">예매하기 </a>
			                   <% } %> 
			             	</li>
								<li><a href="/Semi/views/movie/movieTime.jsp" onclick="timetable();" >상영시간</a></li>
							</div>
						</ul></li>
					<li class="topMenuLi"><a href="#" class="menuLink">영화</a>
						<ul class="submenu">
							<div>
								<li><a href="#">영화정보</a></li>
								<li><a href="#">예고편</a></li>
							</div>
						</ul></li>
					<li class="topMenuLi"><a href="#" class="menuLink">영화관</a>
						<ul class="submenu">
							<div>
								<li><a href="#">역삼점</a></li>
								<li><a href="#">사당점</a></li>
							</div>
						</ul></li>
					<li class="topMenuLi"><a href="#" class="menuLink">QnA</a>
						<ul class="submenu">
							<div>
								<li><a href="#">자주묻는질문</a></li>
								<li><a href="#">1:1문의</a></li>
							</div>
						</ul></li>
				</ul>
			</div>
			</div>

	</div>

		</div>
 <script>
      function timetable(){
    	  location.href="/Semi/selectlist.time";
      }
      
      function reservation(){
    	  location.href="/Semi/selectlist.rs";
      }
      </script>
</body>
</html>