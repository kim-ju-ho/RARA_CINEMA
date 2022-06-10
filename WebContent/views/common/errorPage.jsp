<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%
	String msg = (String) request.getAttribute("msg");
	Exception e = (Exception) request.getAttribute("exception");
	// 일반적으로 jsp에 사용되는 exception 내장 객체는 jspException 클래스를 활용한다.
	// 따라서 사용자 정의 예외를 구현할 때에는 Exception 객체를 직접 선언하여 사용하여야 한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service ERROR</title>
<style>


* {
    font-family: "Noto Sans KR", sans-serif;
    margin: auto;
    text-align: center;

}
.outer {
	padding: 20px;
	width: 650px;
	height: 600px;
	background:white;
	color:  #505984;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
    border:2px solid #9099c6;
}



a input{
    margin: 5px;
    margin-top: 30px;
    background: #505984;
    color: white;
    border: 2px solid #505984;
    padding: 20px;
    
}

a input:hover {
    background: white;
    color: #505984;
    border: 2px solid #505984;
}

span {
    font-size: 26px;
}

h1 {
    color:#9099c6
}

img {
    opacity: 0.2;
}


</style>
</head>
<body>

	<div class="outer">
        <br>
        <h1> - 요청하신 페이지를 찾을 수 없습니다 - </h1> <br>
        <hr> <br>
		<h3 style="color: #505984;"> 
			ERROR :
			<%=e.getMessage()%></h3><br>
		<h4> <span>


            RARA CINEMA에서 서비스 수행 중 <br>
            현재 페이지에서 오류가 발생했습니다. <br> <br>
            
        </span>

        <img src="/Semi/resource/images/error_icon.png" alt="에러" style="width: 130px; height: 130px;">
            <br><br>
            
            이용에 불편을 드려 대단히 죄송합니다.
        </h4>
        
  
       <a href=""> <input type="button" value="메인으로"></a> 
	</div>

</body>
</html>