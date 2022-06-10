<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Member findUser = (Member)request.getAttribute("findUser");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/Semi/resource/css/사이드바.css">
<link rel="stylesheet" href="/Semi/resource/css/findidpwd.css">

</head>

	<%@ include file="../common/Findver_header.jsp"%>
<body>
	<!-- 사이드바 -->
	<div id="asidecontent"
		style="background: url(/Semi/resource/images/사이드바배경.png);">
		<div id="side"
			style="background: url(/Semi/resource/images/사이드1.png);">
			<a href="../views/Reservation_Page.html"></a>
		</div>
		<div id="side"
			style="background: url(/Semi/resource/images/사이드2.png);">
			<a href="../views/TimeTable_Page.html"></a>
		</div>
		<div id="side"
			style="background: url(/Semi/resource/images/사이드3.png);">
			<a href="../views/Qna_1_1.html"></a>
		</div>
		<div>
			<a href="#">TOP</a>
		</div>
	</div>
	<div id="wrapper">
		<div id="content">
			<div id="content-1">
				<br>
				<br>
				<h3 id="main2">아이디 찾기</h3>
				<br>
				<hr>
				<p class="info_text">
					아이디가 기억나지 않으세요? <br> 등록된 회원정보로 아이디를 찾으실 수 있습니다.
				</p>
				<table id="maintable">

					<tr>
						<td id="row"><label id="text">이름</label></td>
						<td id="column">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
							style="left: -26px; position: relative;" type="text"
							name="nametext" id="nametext" placeholder="이름 입력" required>
						</td>
					</tr>

					<tr>
						<td id="row"><label id="text">이메일</label></td>
						<td id="column"><input type="text" id="emailtext1"
							name="emailtext1" class="box" style="width: 100px;"
							placeholder="이메일 입력"> @ <input type="text"
							id="emailtext2" name="emailtext2" class="box"
							style="width: 100px;" readonly> <select
							style="width: 100px; margin-right: 10px" name="selectEmail"
							id="selectEmail" class="box">
								<option value="" selected>선택하세요</option>
								<option value="naver">naver.com</option>
								<option value="hanmail">hanmail.net</option>
								<option value="gmail">gmail.com</option>
								<option value="nate">nate.com</option>
								<option value="dreamwiz">dreamwiz.com</option>
								<option value="empas">empas.com</option>
								<option value="1">직접입력</option>

						</select>&nbsp;&nbsp;&nbsp;<input type="button" id="in_1" class="useremail"
							value="인증확인"></td>
					</tr>

					<tr>
						<td id="row"><label id="text">인증번호</label></td>
						<td id="column" class="id_iput"><input type="text"
							name="AuthUser" id="AuthUser" placeholder="인증번호 입력">
							&nbsp;&nbsp; <input type="button" id="emailcheckBtn" value="인증하기"
							style="background: none; color: white; background: #7090cb; border: 2px solid #7090cb;">

							<label class="successemail" style="display: none;"> <input
								type="hidden" name="isVerified" id="isVerified" value="N">*
								이메일 인증 완료
						</label></td>

					</tr>
				</table>

				<br>
				<br> <input type="button" class="submitid_btn" id="idc"
					value="아이디 찾기" style="margin-top: -20px;"> <br>
				<br>
				</form>
			</div>
			<br> <br>
			<div id="content-2">
				<br>
				<br>





				<h3 id="main2">비밀번호 찾기</h3>
				<br>
				<hr>
				<p class="info_text">
					비밀번호가 기억나지 않으세요? <br> 아이디 확인 후 비밀번호를 다시 설정하실 수 있습니다.
				</p>
				<table id="maintable">

					<tr>
						<td id="row"><label id="text">아이디</label></td>
						<td id="column">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
							style="left: -26px; position: relative;" type="text"
							name="idtext" id="idtext" placeholder="아이디 입력" required>
						</td>
					</tr>
					<tr>
						<td id="row"><label id="text">이메일</label></td>
						<td id="column"><input type="text" id="emailtext3"
							name="emailtext3" class="box" style="width: 100px;"
							placeholder="이메일 입력"> @ <input type="text"
							id="emailtext4" name="emailtext4" class="box"
							style="width: 100px;" readonly> <select
							style="width: 100px; margin-right: 10px" name="selectEmail2"
							id="selectEmail2" class="box">
								<option value="" selected>선택하세요</option>
								<option value="naver">naver.com</option>
								<option value="hanmail">hanmail.net</option>
								<option value="gmail">gmail.com</option>
								<option value="nate">nate.com</option>
								<option value="dreamwiz">dreamwiz.com</option>
								<option value="empas">empas.com</option>
								<option value="1">직접입력</option>
						</select>&nbsp;&nbsp;&nbsp;<input type="button" id="in_1"  class="useremail2" 
						value="인증확인">



						</td>
					</tr>

					<tr>
						<td id="row"><label id="text">인증번호</label></td>
						<td id="column" class="id_iput"><input type="text"
							name="AuthUser2" id="AuthUser2" placeholder="인증번호 입력">
							&nbsp;&nbsp; <input type="button" id="emailcheckBtn2"
							value="인증하기"
							style="background: none; color: white; background: #7090cb; border: 2px solid #7090cb;">

							<label class="successemail2" style="display: none;"> <input
								type="hidden" name="isVerified2" id="isVerified2" value="N">*
								이메일 인증 완료
						</label></td>

					</tr>
				</table>
				<br>
				<br> <input type="button" id="pwc" class="submitpwd_btn"
					value="비밀번호 찾기" style="margin-top: -20px;">
			</div>
			<br>
			<br>
			<div id="content-3">
				<dl>
					<dt>이용 문의</dt>
					<dd>RARA CINEMA 고객센터 : 1544-1118</dd>
					<dd>문의 가능 시간 : 월~금 09:00~18:00 (이 외 시간은 자동 응답 안내 가능)</dd>
				</dl>

			</div>
		</div>
	</div>

	<%@ include file="../common/footer.jsp"%>



	<script>
      
      $('#selectEmail').change(function(){
          $("#selectEmail option:selected").each(function () {
             
             if($(this).val()== '1'){ //직접입력일 경우
                 $("#emailtext2").val('');                        //값 초기화
                 $("#emailtext2").attr("disabled",false); //활성화
             }else{ //직접입력이 아닐경우
                 $("#emailtext2").val($(this).text());      //선택값 입력
                 $("#emailtext2").attr("disabled",true); //비활dk성화
             }
          });
       });
      
      
      $('#selectEmail2').change(function(){
          $("#selectEmail2 option:selected").each(function () {
             
             if($(this).val()== '1'){ //직접입력일 경우
                 $("#emailtext4").val('');                        //값 초기화
                 $("#emailtext4").attr("disabled",false); //활성화
             }else{ //직접입력이 아닐경우
                 $("#emailtext4").val($(this).text());      //선택값 입력
                 $("#emailtext4").attr("disabled",true); //비활dk성화
             }
          });
       });
      
      
      
      // 이멜 보내기 id용
      
        $('.useremail').click(function(){
        	$.ajax({
				url:"/Semi/SendEmail_findId.me",
				type:"post",
				data:
					{emailtext1:$('#emailtext1').val() ,
					emailtext2:$('#emailtext2').val(),
					userName:$('#nametext').val()
				},success:function(AuthCode){
   					alert("입력하신 이메일로 인증번호를 전송하였습니다!");
   					$('#emailcheckBtn').click(function(){
   						let AuthUser = $('#AuthUser').val();
   					 	console.log(AuthUser); 
   						console.log(AuthCode);
   						if(AuthCode==AuthUser){
   							$('input[name=isVerified]').val('Y');
   							$('.successemail').show();
   							console.log("인증성공");
   							alert("인증 성공!");
   						
   						}else{
   							alert("입력하신 인증 번호는 일치 하지 않습니다.");
   						}
   					})
               },error:function(data){
                  console.log("전송실패");
                  alert("입력하신 정보는 일치 하지 않습니다.");
               }
         })
      })
         
      var checkemail = document.getElementById('isVerified');

      	$('.submitid_btn').click(function(){
      		
      		 // 이메일 인증 성공시 성공 서블릿으로 넘기기
            if(checkemail.value =="N"){
            	alert("이메일을 인증해주세요.");
            	checkemail.focus();
            	return false;
            }
      		 
            $.ajax({
				url:"/Semi/findIdSuccess.me",
				type:"post",
				data:
					{emailtext1:$('#emailtext1').val() ,
					emailtext2:$('#emailtext2').val(),
					userName:$('#nametext').val()
				},success:function(AuthCode){
           		 window.location.href = "/Semi/views/member/MemberFindidSuccess.jsp"; 
           	 },error:function(data){
                 console.log("성공 서블릿 전송실패");
                
              }
        })
     })
     
     
        
      // 이멜 보내기 pwd용
      
        $('.useremail2').click(function(){
        	$.ajax({
				url:"/Semi/SendEmail_findPwd.me",
				type:"post",
				data:
					{emailtext1:$('#emailtext3').val() ,
					emailtext2:$('#emailtext4').val(),
					idtext:$('#idtext').val()
				},success:function(AuthCode2){
   					alert("입력하신 이메일로 인증번호를 전송하였습니다!");
   					$('#emailcheckBtn2').click(function(){
   						let AuthUser2 = $('#AuthUser2').val();
   					 	console.log(AuthUser2); 
   						console.log(AuthCode2);
   						if(AuthCode2==AuthUser2){
   							$('input[name=isVerified2]').val('Y');
   							$('.successemail2').show();
   							console.log("인증성공");
   							alert("인증 성공!");
   						
   						}else{
   							alert("입력하신 인증 번호는 일치 하지 않습니다.");
   						}
   					})
               },error:function(data){
                  console.log("전송실패");
                  alert("입력하신 정보는 일치 하지 않습니다.");
               }
         })
      })
      
      
       var checkemail2 = document.getElementById('isVerified2');

      	$('.submitpwd_btn').click(function(){
      		
      		 // 이메일 인증 성공시 성공 서블릿으로 넘기기
            if(checkemail2.value =="N"){
            	alert("이메일을 인증해주세요.");
            	checkemail.focus();
            	return false;
            }
      		 
            $.ajax({
				url:"/Semi/findPwdSuccess.me",
				type:"post",
				data:
					{emailtext1:$('#emailtext3').val() ,
					emailtext2:$('#emailtext4').val(),
					idtext:$('#idtext').val()
				},success:function(data){
           		 window.location.href = "/Semi/views/member/MemberFindpwdSuccess.jsp"; 
           	 },error:function(data){
                 console.log("성공 서블릿 전송실패");
                
              }
        })
     })
     
     // 이메일 인증
     </script> 
      
</body>



</html>