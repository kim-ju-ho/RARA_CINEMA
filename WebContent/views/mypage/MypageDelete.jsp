<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/Semi/resource/css/회원가입완료.css" rel="stylesheet">
<link rel="stylesheet" href="/Semi/resource/css/footer.css">

<title>Insert title here</title>
</head>
<body>
 <%@ include file="../common/header.jsp"%>
   <div class="context">

        <label id="con">회원탈퇴가 완료 되었습니다.</label>
        <div id="imgcheck"> <img src="/Semi/resource/images/탈퇴.png" alt=""></div>
        <p id="rara" style="font-weight: bold; font-size: 15px;">이용해주셔서 감사합니다. </p><br>
            <p id="rara"> 보다 나은 라라시네마로 <br>다시 만나뵐 수 있기를 바랍니다 :)
       
         </p>
        <button class="btn" onclick="mainGo();">메인으로 이동하기</button>
      
    </div>
   <%@ include file="../common/footer.jsp"%>
  
  <script>
  function mainGo(){
	  location.href='/Semi/index.jsp';
  };
  </script>
           
      
        

</body>
</html>