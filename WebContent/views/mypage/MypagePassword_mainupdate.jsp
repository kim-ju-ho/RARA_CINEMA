<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link rel="stylesheet" href="/Semi/resource/css/사이드바.css">
    <link rel="stylesheet" href="/Semi/resource/css/MyPagepassword.css">



    <script>
    
    </script>
</head>

  <%@ include file="../common/header.jsp"%>
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
    </div>
    <!-- 가운데 정보 나오는 창 -->
    <div class="div1">
        <p class="title">회원정보 수정</p>
        <hr>
        <div id="myinfo">

            <div style="background: url(/Semi/resource/images/자물쇠.png);
                        width: 70px;
                        height: 70px;
                        position: absolute;
                        top:54%;
                        left: 39%;
                        "
                        
            ></div>
            <label id="c1" style="
             font-size: 24px;
            font-weight: bold;
            left: 41%;
            top: 20px;
            position: relative;
            
            ">비밀번호 확인</label><br><br>


            <label id="c2" style="
            font-size: 14px;
            position: absolute;
            left: 48%;
            top: 58%;
            text-align: center;
            
            "> <%=m.getUserName() %>님의 회원정보를 안전하게 보호 하기 위해 <br>
            비밀 번호를 한번 더 확인해 주세요.</label>

            
         
            <div style="
                width: 300px;
                position: absolute;
                top: 67%;

                left: 52%;
            ">
                <table>
                    <tr>
                        <td >아이디 </td>
                        <td >
                          : <input type="text" id="id" name="id" value="<%=m.getUserId() %>">
    
                        </td>
                    </tr>
                    <tr>
                        <td >비밀번호 </td>
                        <td >
                          : <input type="password" id="password" name="password">
    
                        </td>
                    </tr>
                </table>

            </div>
           
      
            <button id="checkbtn" style="left: -38%;
       left: -38%;
    position: relative;
    width: 100px;
    height: 40px;
    margin-top: 234px;
">확인하기.</button>


           
          
        </div>

    </div>

   


    </div>
  <%@ include file="../common/footer.jsp"%>
  
  <script>
  
  	$('#checkbtn').click(function(){
  
  				let pwd = $('#password').val(); 
  				let userpwd = '<%= m.getUserPwd() %>' ;
  				
  				if(pwd==userpwd){
  					console.log("jsp 비밀번호일치");
  					 alert("비밀번호가 일치합니다. ");
  					window.location.href = "/Semi/views/mypage/MypageUpdate.jsp";
  				}else{
  					console.log("비밀번호 일치ㄴㄴ");
  					 alert("비밀번호가 일치하지 않습니다. ");
  				}
  		
  		
  	});
  </script>

</body>
</html>