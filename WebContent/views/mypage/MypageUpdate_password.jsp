<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../resource/css/header.css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
   
    <link rel="stylesheet" href="/Semi/resource/css/사이드바.css">
    <link rel="stylesheet" href="/Semi/resource/css/MyPage.css">

</head>

<style>

#userZip, #address_d{
border:none;border-right:0px; border-top:0px; border-left:0px; border-bottom:0px;


}

#userAddress{
border:none;border-right:0px; border-top:0px; border-left:0px; border-bottom:0px;
width:200px
}

#myQnAbtn ,#movieHistotybtn, #myReviewbtn{

    float: right;
    margin-right: 5%;
    background: #505984;
    color: white;
    border: 3px solid #505984;
   
     margin-top: 15px;
}

#ex {
   font-size: 9pt;
   color: gray;
   margin-top: 0px;
   margin-bottom: -4px;
}
</style>
</head>

<body>
    <!-- 사이드바 -->
    <div id="asidecontent" style="background: url(/Semi/resource/images/사이드바배경.png);">
        <div id="side" style="background: url(/Semi/resource/images/사이드1.png);">
            <a href="../views/Reservation_Page.html"></a>
        </div>
        <div id="side" style="background: url(/Semi/resource/images/사이드2.png);">
            <a href="../views/TimeTable_Page.html"></a>
        </div>
        <div id="side" style="background: url(/Semi/resource/images/사이드3.png);">
            <a href="../views/Qna_1_1.html"></a>
        </div>
        <div><a href="#">TOP</a></div>
    </div>

     <%@ include file="../common/header.jsp"%>
   
    <div class="all">
        <!-- 왼쪽 목록 회원정보 수청 리뷰 등등 -->
    <div class="section"> 
        <div><p>&nbsp; 마이페이지</p></div>
        <ul id="mypage">
              <li> <a href="/Semi/views/mypage/MypagePassword_mainupdate.jsp" class="show1">회원정보 수정</a> </li>
            <li> <a href="/Semi/views/mypage/MypagePassword_pwdupdate.jsp" class="show5">비밀번호 수정</a> </li>
            <li> <a href="./current_reservation.html" class="show2">최근 예매내역</a> </li>
            <li> <a href="./MovieInfoReview_Page_login.html" class="show3">나의 리뷰</a> </li>
            <li> <a href="./Qna_1_1.html" class="show4">나의 질문</a> </li>
        </ul>
        
              <button id="goodbyebtn" style="background:lightgray; border:none; color:black; margin-top: 20px;"  >탈퇴하기</button>
    </div>
    <!-- 가운데 정보 나오는 창 -->
    <div class="div1">
        <p class="title">회원정보 수정</p>
        <hr>
        <div id="myinfo">

            
         
          <table id="maintable">
                <tr>
                    <td id="nrow">비밀번호 </td>
                    <td id="ncolumn">
                   <input type="password" name="userPwd" id="userPwd" placeholder="비밀번호"  autocomplete="off">
                         <p id="ex"> 영문 소문자, 특수기호, 숫자를 혼합하여 총 8~15자 사이로 입력하세요.</p>
                    </td>
                </tr>
                <tr>
                    <td id="irow">비밀번호 확인 </td>
                    <td id="icolumn" class="id_iput">
                     <input type="password" name="password" id="password" placeholder="비밀번호 확인"  autocomplete="off">

                    </td>
                </tr>
              
            </table>
           
           
      
            <button id="changebtn" onclick="return changebtn();" style="left: -38%;
			    position: relative;
			    width: 100px;
			    height: 40px;
			    margin-top: 30px;
			">수정하기</button>


           
          
        </div>
      
    </div>

   


    </div>

 	<%@ include file="../common/footer.jsp"%>
      
         

 
  	<script>
  	
  	$('#changebtn').click(function(){
  		 var pwd1 = document.getElementById('userPwd');
  	     var pwd2 = document.getElementById('password');

  	  	 // 2) 비밀번호 검사
  	    regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;
  	    if(!regExp.test(pwd1.value)){
  	        alert("유효한 비밀번호를 입력하세요");
  	        pwd1.value="";
  	        pwd1.focus();
  	        return false;
  	    }

  	    // 비밀번호값 비밀번호확인값이 일치하는가
  	    if(pwd1.value != pwd2.value){
  	        alert("동일한 비밀번호 확인값을 입력하세요!");
  	        pwd2.value = "";
  	        pwd2.focus();
  	        return false;
  	        
  	       
  	    }
  	  $.ajax({
    		 url:"/Semi/UpdatePwd.me",
    		 type:"post",
    		 data:{
    			userPwd:$('#userPwd').val(),
    	         
    		 },success:function(data){
    			  if(confirm("회원 정보를 수정하시겠습니까?")){
    				 	 alert("회원 정보가 수정되었습니다. 메인화면으로 돌아갑니다.");
    	    			 window.location.href = "/Semi/index.jsp";
    				    return true;
    				  }else{
    				    return false;
    				  }

    		 },error:function(data){
    			 console.log("전송실패");
    		 }
    		 
    	 });
    

  	  		
  	})
  	
    

  	
  	
  	</script>
</body>




</html>