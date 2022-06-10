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
    <link href="../resource/css/layout_nomain.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/Semi/resource/css/사이드바.css">
    <link rel="stylesheet" href="/Semi/resource/css/MyPage.css">

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<style>



#myQnAbtn ,#movieHistotybtn, #myReviewbtn{

    float: right;
    margin-right: 5%;
    background: #505984;
    color: white;
    border: 3px solid #505984;
   
     margin-top: 15px;
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

            
        <!--  <form id="updateForm" action="/Semi/Update.me" method="post"> -->
            <table id="maintable">
                <tr>
                    <td id="nrow">이름 </td>
                    <td id="ncolumn">
                  <%= m.getUserName() %>
                       
                    </td>
                </tr>
                <tr>
                    <td id="irow">아이디 </td>
                    <td id="icolumn" class="id_iput">
                         <%= m.getUserId() %>

                    </td>
                </tr>
                 <tr>
                    <td id="prow">전화번호 </td>
      
                        <td id="pcolumn"> 
                        	<select name="tel1" id="tel1">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                            </select> -
                            <input type="text" id="tel2" name="tel2" style="width:50px;"> -
                            <input type="text" name="tel3" id="tel3" style="width:50px;">
                            &nbsp;&nbsp;<input type="button" id="phoneCheck" value="중복확인">
                         <label class="successphone" style="display:none;">
                        <input type="hidden" name="PhoneCheckResult" id="check_phone" value="Y" style="border:none"> * 인증되었습니다.
                        </label>
                        </td>
                 
                </tr>
             
              
                 <tr>
                    <td id="qrow2">우편번호</td>
                    <td id="qcolumn2"><input type="text" name="userZip" id="userZip" style="width: 100px;">
                    &nbsp;&nbsp;<input type="button" id="in" value="우편번호찾기" onclick="findZip()"></td>
                </tr>
                <tr>
                    <td id="qrow2">주소</td>
                    <td id="qcolumn2"><input type="text" name="userAddress" id="userAddress" >
                  <input type="text" name="juso" id="address_d" placeholder="상세주소">
                  
                </tr>
                <tr>
                    <td id="erow">이메일 </td>
                    <td id="ecolumn">
            
                         <%= m.getEmail() %>
                    </td>
                    
                   
                        
                </tr>
           
                   <tr>
                    <td id="yrow">생년월일 </td>
                    <td id="ycolumn">
                        <input type="text"  id="year" size="5" class="inBorder" name="year"/>&nbsp 년
                        <select class="inBorder" id="month" name="month">
                            <option value="1">1
                            <option value="2">2
                            <option value="3">3
                            <option value="4">4
                            <option value="5">5
                            <option value="6">6
                            <option value="7">7
                            <option value="8">8
                            <option value="9">9
                            <option value="10">10
                            <option value="11">11
                            <option value="12">12
                        </select> &nbsp월
                        <select class="inBorder" id="day" name="day">
                            <option value="1">1
                            <option value="2">2
                            <option value="3">3
                            <option value="4">4
                            <option value="5">5
                            <option value="6">6
                            <option value="7">7
                            <option value="8">8
                            <option value="9">9
                            <option value="10">10
                            <option value="11">11
                            <option value="12">12
                            <option value="13">13
                            <option value="14">14
                            <option value="15">15
                            <option value="16">16
                            <option value="17">17
                            <option value="18">18
                            <option value="19">19
                            <option value="20">20
                            <option value="21">21
                            <option value="22">22
                            <option value="23">23
                            <option value="24">24
                            <option value="25">25
                            <option value="26">26
                            <option value="27">27
                            <option value="28">28
                            <option value="29">29
                            <option value="30">30
                            <option value="31">31
                        </select> &nbsp일

                    </td>
                </tr>
            </table>
           
      
            <button id="changebtn" onclick="changebtn" style="left: -38%;
    position: relative;
    width: 100px;
    height: 40px;
    margin-top: 30px;
">수정하기</button>

<!-- </form> -->
           
          
        </div>
        <div class="div1-2">
            <div class="div2">
                <p class="title">최근 예매내역</p>
                <hr>
                <button id="movieHistotybtn" onclick="location.href = './current_reservation.html'">더보기</button>
                <div>
                    예매내역 들어올 부분
                </div>
            </div>
        
            <div class="div3">
                <p class="title">나의 리뷰</p>
                <hr>
                <button id="myReviewbtn" onclick="location.href = './MovieInfoReview_Page_login.html'">더보기</button>
                <div>
                    리뷰 들어올 부분
                </div>
            </div>
        
            <div class="div4">
                <p class="title">나의 질문</p>
                <hr>
                <button id="myQnAbtn" onclick="location.href = './Qna_1_1.html'">더보기</button>
                <div>
                    질문 들어올 부분
                </div>
            </div>

        </div>
    </div>

   


    </div>

 	<%@ include file="../common/footer.jsp"%>
      
         

 
  	<script>
  		
  		/* function changebtn() {
		$("#updateForm").submit();
		}
  		 */
  		
  		$(function(){
  			var addressArr = '<%= m.getAddress() %>'.split(',');
			
			$('#userZip').val(addressArr[0]);

			$('#userAddress').val(addressArr[1]);
			$('#address_d').val(addressArr[2]);
			
			
			var birthArr = '<%= m.getUserBirth() %>'.split('-');;
			
			$('#year').val(birthArr[0]);
			$('#month').val(birthArr[1]);
			$('#day').val(birthArr[2]);
			

			var phoneArr = '<%= m.getPhone() %>'.split('-');
			
			$('#tel1').val(phoneArr[0]);
			$('#tel2').val(phoneArr[1]);
			$('#tel3').val(phoneArr[2]);
			
  		});
  
  		
 
  		
  		
  		   //카카오 api
             function findZip() {
                 new daum.Postcode({
                     oncomplete: function(data) {
                         // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                         // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                         // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                         var fullAddr = ''; // 최종 주소 변수
                         var extraAddr = ''; // 조합형 주소 변수

                         // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                         if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                             fullAddr = data.roadAddress;

                         } else { // 사용자가 지번 주소를 선택했을 경우(J)
                             fullAddr = data.jibunAddress;
                         }

                         // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                         if(data.userSelectedType === 'R'){
                             //법정동명이 있을 경우 추가한다.
                             if(data.bname !== ''){
                                 extraAddr += data.bname;
                             }
                             // 건물명이 있을 경우 추가한다.
                             if(data.buildingName !== ''){
                                 extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                             }
                             // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                             fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                         }

                         // 우편번호와 주소 정보를 해당 필드에 넣는다.
                         $('#userZip').val(data.zonecode); //5자리 새우편번호 사용
                         
                         $('#userAddress').val(fullAddr);

                         // 커서를 상세주소 필드로 이동한다.
                         $('#address_d').focus();
                     }
                 }).open();
             };
         
             
            
             
          // 전화번호 중복 체크
   $('#phoneCheck').click(function(){
      $.ajax({
         url:"/Semi/PhoneCheck.me",
         type:"post",
         data:{
            tel1:$('#tel1').val(),
            tel2:$('#tel2').val(),
            tel3:$('#tel3').val()  
         },success:function(data){
            console.log(data);
               if(data=='Y'){
            	   $('.successphone').show();
            	   $('input[name=PhoneCheckResult]').val('Y'); 
               }else{
            	   alert("중복된 전화번호 입니다.");
            	   $('.successphone').hide();
            	   $('input[name=PhoneCheckResult]').val('N'); 
               }
          },error:function(data){
               console.log("전송실패");
         
     		 }
   		})
   });
          
      $('#changebtn').click(function(){
    	 /*  
    	  if(checkphone.value == "N"){
          	alert("전화번호를 인증해주세요.");
          	checkphone.focus();
          	 return false;
          } */
    	  
    	  
    	 $.ajax({
    		 url:"/Semi/Update.me",
    		 type:"post",
    		 data:{
    			 tel1:$('#tel1').val(),
    	         tel2:$('#tel2').val(),
    	         tel3:$('#tel3').val(),
    	         userZip:$('#userZip').val(),
    	         userAddress:$('#userAddress').val(),
    	         address_d:$('#address_d').val(),
    	         year:$('#year').val(),
    	         month:$('#month').val(),
    	         day:$('#day').val()
    	        
    	         
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