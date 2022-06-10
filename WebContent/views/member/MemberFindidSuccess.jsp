<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	

 <%
	Member find = (Member) session.getAttribute("member");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디,비밀번호찾기</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<style>
.info_text>label {
	font-weight: bold;
	color: black;
	font-size: 16px;
}

* {
	font-family: 'Noto Sans KR', sans-serif;
	box-sizing: border-box;
}

#wrapper {
	margin: auto;
	text-align: center;
	width: 1000px;
	position: relative;
	margin-bottom: 100px;
}

#main {
	position: relative;
	font-size: 28px;
	margin: auto;
	text-align: center;
	color: #505984;
}

#main2 {
	font-size: 28px;
	/* margin-left: 400px; */
	margin: auto;
	color: #505984;
}

#username {
	font-size: 13px;
	margin-left: 180px;
}

#userid {
	font-size: 13px;
	margin-left: 180px;
}

#nametext {
	font-size: 13px;
}

#useremail {
	font-size: 13px;
	margin-left: 180px;
}

#emailtext1 {
	font-size: 13px;
}

#q {
	font-size: 13px;
}

#emailtext2 {
	font-size: 13px;
}

#in_1, #in_2 {
	background: none;
	color: white;
	background: #7090cb;
	border: 2px solid #7090cb;
}

#idc, #pwc {
	/* margin-left: 450px; */
	margin-left: 0px;
	margin-top: 1px;
	width: 180px;
	height: 55px;
	background: none;
	border: none;
	background: #505984;
	color: white;
	font-size: 14px;
	width: 7000;
	font-size: 18px;
}

#row {
	width: 150px;
	text-align: left;
	height: 50px;
	background: none;
	border: 2px solid none;
}

#column {
	width: 850px;
	text-align: left;
	height: 50px;
	margin-left: 10px;
	border: 2px solid none;
	padding-left: 5%;
}

#maintable {
	text-align: center;
	border: none;
	width: 80%;
	margin: auto;
}

#content {
	margin: auto;
	text-align: center;
}

input, select {
	border-radius: none;
	border: 2px solid #a9a8a6;
	outline: none;
}

#text {
	color: #505984;
	font-size: 15pt;
	font: bold;
}

.info_text {
	text-align: left;
	color: #666;
	font-size: 14px;
}

#content-1, #content-2 {
	margin: auto;
	width: 700px;
	height: 300px;
	 border: 1px solid #666;
}

#content-3 {
	margin: auto;
	width: 950px;
	height: 120px;
	border: 1px solid #666;
	text-align: left;
	padding-left: 50px;
	background: #f3f3f3;
}

input[type='text']:focus {
	outline: none;
	border-radius: 0px;
	border: 2px solid #7090cb;
}

input[type='text']:focus::placeholder {
	color: white
}

input[type='button']:hover {
	cursor: pointer;
}

dd {
	margin-left: 100px;
	padding-left: 25px;
	color: #666;
}

dl {
	padding: 20px;
}

dt {
	width: 70px;
	float: left;
	color: #666;
}

.btn{
    background: #505984;
border: none;
color: white;
width: 180px;
height: 70px;
font-size: 15px;

}
</style>
</head>

<body>
	<%@ include file="../common/Findver_header.jsp"%>

	<div id="wrapper">
		<div id="content">
			<div id="content-1">
				<br>
				<br>
				<h3 id="main2" style="text-align: center;">아이디 찾기가 완료 되었습니다.</h3>
				<br>
				<hr>
				<p class="info_text" style="text-align: center; font-size: 15px;">
					<%=find.getUserName() %>님의 아이디는 <label><%=find.getUserId() %></label> 입니다. <br> 로그인 후 서비스를 이용할 수
					있습니다.<br>

				</p>


				<br>
				<button class="btn" onclick="mainGo();">메인으로 이동하기</button>
				<br>

					
			</div>

		</div>
	</div>
	
	
	
	 <script>
  function mainGo(){
	 <% session.invalidate(); %>
	  location.href='/Semi/index.jsp';
  };
  </script>
           

	<%@ include file="../common/footer.jsp"%>

</body>

</body>
</html>