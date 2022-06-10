<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="com.semi.member.model.vo.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link rel="stylesheet" href="../resource/css/header.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
   rel="stylesheet">


<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link href="../resource/css/layout_nomain.css" rel="stylesheet"
   type="text/css" />
<link rel="stylesheet" href="/Semi/resource/css/사이드바.css">
<link rel="stylesheet" href="/Semi/resource/css/footer.css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
      <!--카카오 api -->


<style>
* {
   font-family: 'Noto Sans KR', sans-serif;
}

input, select {
   border-radius: 0px;
   border: 1px solid lightgray;
}

div {
   /* border: 1px solid black; */
   box-sizing: border-box;
}

#wrapper {
   margin: auto;
   text-align: center;
   width: 1000px;
   position: relative;
}

a {
   text-decoration: none;
   color: #000;
}

#row {
   font-weight: bold;
   padding-left: 20px;
}

#idCheck, #check_phone, #in, #useremail, #emailcheckBtn, #phoneCheck{
   background: #505984;
   color: white;
   border: 3px solid #505984;
}

#back, #insertBtn {
   margin-left: 0px;
   margin-top: 1px;
   width: 100px;
   height: 55px;
   background: #505984;
   border: none;
   color: white;
   font-size: 14px;
   width: 7000;
   border: 1px dashed outset #505984;
}

#irow, #prow, #pwrow, #pwrow2, #erow, #nrow, #qrow, #yrow, #qrow2 {
   width: 150px;
   text-align: left;
   height: 50px;
   background: lightgray;
   border: 1px solid lightgray;
   table-layout: fixed;
}

#icolumn, #pcolumn, #pwcolumn, #pwcolumn2, #ecolumn, #ncolumn, #qcolumn,
   #ycolumn, #qcolumn2 {
   width: 550px;
   text-align: left;
   height: 50px;
   margin-left: 10px;
   border: 1px solid lightgray;
   padding-left: 5%;
}

#maintable {
   text-align: center;
   /* border: 1px solid rgb(221, 160, 230); */
   border: none;
   width: 80%;
   margin: auto;
}

#ex {
   font-size: 9pt;
   color: gray;
   margin-top: 0px;
   margin-bottom: -4px;
}

.agree_ck {
   float: right;
   margin-right: 10%;
}

.test1 {
   padding-left: 20%;
}

.gender {
   margin-left: 10px;
}

textarea {
   resize: none;
   width: 80%;
}

#demo {
   margin-left: 450px;
   margin-top: -25px;
   font-size: 14px;
   color: #1a5490;
   border: 1px solid white;
   /* padding: 10px;  */
   font-weight: bold;
   /* width: 100px; */
   height: 25px;
   display: none;
}
</style>
</head>
<body>

   <%@ include file="../common/header.jsp"%>

   <div id="wrapper"
      style="margin: auto; text-align: center; width: 1000px; position: relative;">
       <div id="content">
            <div id="content-1">
               
               
                    <h2><strong>회원가입</strong></h2>
                    <hr>
                    <h3>이용약관(필수)</h3>

                    <textarea rows="20" cols="100">가. 수집하는 개인정보의 항목첫째, 회사는 회원가 입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
[회원가입]
- 이름, 생년월일, 성별, 아이디, 비밀번호, 별명, 연락처(메일주소, 휴대폰 번호 중 선택), 가입인증정보
만14세 미만 아동 회원가입
- 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호, 연락처 (메일주소, 휴대폰 번호 중 선택), 가입인증정보
단체아이디 회원가입
- 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소, 관리자 아이디, 관리자 연락처, 관리자 부서/직위
- 선택항목 : 대표 홈페이지, 대표 팩스번호
둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다.
넷째, 성인컨텐츠, 유료/게임 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우, 아래와 같은 정보들이 수집될 수 있습니다.
- 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택), 아이핀 번호(아이핀 이용시), 내/외국인 정보
다섯째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.
- 신용카드 결제시 : 카드사명, 카드번호 등
- 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등
- 계좌이체시 : 은행명, 계좌번호 등
- 상품권 이용시 : 상품권 번호
나. 개인정보 수집방법회사는 다음과 같은 방법으로 개인정보를 수집합니다.
- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
- 협력회사로부터의 제공
- 생성정보 수집 툴을 통한 수집
                    </textarea> <br><br>
                    <div class="agree_ck">
                        <label>
                            이용약관에 동의합니까?
                            <strong>동의</strong><input class="agree" type="checkbox" name="agree"></input>
                        </label>
                    </div> <br> <br>

                    <textarea rows="20" cols="100">가. 수집하는 개인정보의 항목첫째, 회사는 회원가 입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
[회원가입]
- 이름, 생년월일, 성별, 아이디, 비밀번호, 별명, 연락처(메일주소, 휴대폰 번호 중 선택), 가입인증정보
만14세 미만 아동 회원가입
- 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호, 연락처 (메일주소, 휴대폰 번호 중 선택), 가입인증정보
단체아이디 회원가입
- 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소, 관리자 아이디, 관리자 연락처, 관리자 부서/직위
- 선택항목 : 대표 홈페이지, 대표 팩스번호
둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다.
넷째, 성인컨텐츠, 유료/게임 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우, 아래와 같은 정보들이 수집될 수 있습니다.
- 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택), 아이핀 번호(아이핀 이용시), 내/외국인 정보
다섯째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.
- 신용카드 결제시 : 카드사명, 카드번호 등
- 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등
- 계좌이체시 : 은행명, 계좌번호 등
- 상품권 이용시 : 상품권 번호
나. 개인정보 수집방법회사는 다음과 같은 방법으로 개인정보를 수집합니다.
- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
- 협력회사로부터의 제공
- 생성정보 수집 툴을 통한 수집
                    </textarea> <br><br>
                    <div class="agree_ck">
                        <label>
                            이용약관에 동의합니까?
                            <strong>동의</strong><input class="agree" type="checkbox" name="agree"></input>
                        </label>
                    </div> <br> <br> <br>
                    
                    <div class="agree_ck">
                        <label for="selectall"><strong>전체동의</strong></label>
                        <input type="checkbox" id="selectall" >
                    </div>
                
            </div> <br>

            <br><br>

            <hr>

         
            <br>
        </div>
        <div id="content-2">
            <h3>회원정보 (필수)</h3>



<!--    <form id="joinForm" action="/Semi/Insert.me" method="post"> -->
            <table id="maintable">
                <tr>
                    <td id="nrow">이름 </td>
                    <td id="ncolumn">
                        <input type="text" name="userName" id="userName" required
                            placeholder="이름 입력" autocomplete="new-password">
                    </td>
                </tr>
                <tr>
                    <td id="irow">아이디 </td>
                    <td id="icolumn" class="id_iput">
                        <input type="text" name="userId" id="userId" placeholder="아이디" style="ime-mode:disabled;" autocomplete="off">
                        &nbsp;&nbsp;
                        <input type="button" id=idCheck value="중복확인" >
                        
                        <input class="successid" style="display:none; border:none" >
                        <input type="hidden" name="IdCheckResult" id="check_id" value="" style="border:none"> 
                        </input>
                       
                        <p id="ex"> 영문 소문자와 숫자를 혼합하여 총 4~12자 사이로 입력하세요.</p>
                        
                        
                    
                        

                    </td>
                </tr>
                
                <tr>
                    <td id="pwrow">비밀번호 </td>
                    <td id="pwcolumn">
                        <input type="password" name="userPwd" id="userPwd" placeholder="비밀번호">
                        
                        <p id="ex"> 영문 소문자, 특수기호, 숫자를 혼합하여 총 8~15자 사이로 입력하세요.</p>
                    
                    </td>
                </tr>

                <tr>
                    <td id="pwrow2">비밀번호 확인 </td>
                    <td id="pwcolumn2"><input type="password" name="password" id="password" placeholder="비밀번호 확인"  autocomplete="off"></td>
                </tr>
               <tr>
                    <td id="prow">전화번호 </td>
                    <div class="test1">
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
                        <input type="hidden" name="PhoneCheckResult" id="check_phone" value="N" style="border:none"> * 인증되었습니다.
                        </label>
                        </td>
                    </div>
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
                       
                        <input type="text" id="emailtext1" name="emailtext1" class="box" style="width:100px;" placeholder="이메일 입력"> @
                        <input type="text" id="emailtext2" name="emailtext2" class="box" style="width:100px;" readonly>
                        <select style="width:100px;margin-right:10px" name="selectEmail" id="selectEmail" class="box">
                            <option value="" selected>선택하세요</option>
                            <option value="naver">naver.com</option>
                            <option value="hanmail">hanmail.net</option>
                            <option value="gmail">gmail.com</option>
                            <option value="nate">nate.com</option>
                            <option value="dreamwiz">dreamwiz.com</option>
                            <option value="empas">empas.com</option>
                            <option value="1">직접입력</option>
                        </select>
                
       <!--                  &nbsp;&nbsp;<input type="button" id="in2" id="useremail" value="인증번호"> -->
                        
                        <button id ="useremail">발송</button>
                         <div id="demo"></div> 
                        
                    </td>
          
                </tr>
                <tr>
                    <td id="irow">인증번호 </td>
                    <td id="icolumn" class="id_iput">
                        <input type="text" name="AuthUser" id="AuthUser" placeholder="인증번호 입력">
                        &nbsp;&nbsp;
                        <input type="button" id="emailcheckBtn" value="인증하기">
                     
                        <input class="successemail" style="display:none; border:none">
                        <input type="hidden"name="isVerified"  id="isVerified" value="N">
                        </input>
                       
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
                   <input type="radio" name="gender" value="M">남성 &nbsp;
                  <input type="radio" name="gender" value="F">여성 &nbsp;
                    </td>
                </tr>
            </table>

            <br><br><br>
            <input type="button" id="back" value="이전으로" onclick="location.href='../index.html'"> &nbsp;&nbsp;
            &nbsp;&nbsp;
            <button id=insertBtn onclick="return insertBtn();">회원가입완료</button>
            <br><br><br>
        </div>
    </div>
    

   
     
    

   
    <script>
    
   // 전체 동의
   var $selectall = $('#selectall');
   $selectall.change(function() {
      var $this = $(this);
      var checked = $this.prop('checked');
      $('input[name="agree"]').prop('checked', checked);
   });
   
   // 정규표현식
   $('#insertBtn').click(function(){
      
      var id = document.getElementById('userId');
      var pwd1 = document.getElementById('userPwd');
      var pwd2 = document.getElementById('password');
      var checkid = document.getElementById('check_id');
      var checkphone = document.getElementById('check_phone');
      var userZip = document.getElementById('userZip');
      var emailtext1 = document.getElementById('emailtext1');
      var month = document.getElementById('year');
      var tel2 = document.getElementById('tel2');
      var checkemail = document.getElementById('isVerified');
       
       // 1) 아이디 검사
        var regExp = /^[A-Za-z0-9+]{4,12}$/i;
        if(!regExp.test(id.value)){
            alert("아이디는 영문 소문자와 숫자 혼합하여,총 4~12자 사이로 입력하세요."); 
            id.value = "";
            id.focus();
            return false;
     	
        }

        // 아이디 인증
         
        if(checkid.value == "" || checkid.value == "N"){
        	alert("아이디 중복 체크를 해주세요");
        	checkid.focus();
        	 return false;
        }
        
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
        
        // 전화번호 인증
              
        if(checkphone.value == "N"){
        	alert("전화번호를 인증해주세요.");
        	checkphone.focus();
        	 return false;
        }
        
        // 전화번호
        
        if(tel2.value == null){
        	alert("전화번호를 입력해주세요.");
        	tel2.focus();
        	return false;
        }
        
        
        
        // 우편번호 
        
        if(userZip.value == null){
        	alert("우편번호를 입력해주세요.");
        	userZip.focus();
        	return false;
        }
        
        
        // 이메일
        if(emailtext1.value == null){
        	alert("이메일을 입력해주세요.");
        	emailtext1.focus();
        	return false;
        }
        
        // 이메일 인증
        if(checkemail.value =="N"){
        	alert("이메일을 인증해주세요.");
        	checkemail.focus();
        	return false;
        }
        
        // 생일 month
        if(year.value == null){
        	alert("생년월일을 입력해주세요.");
        	month.focus();
        	return false;
        }
        
        // 성별
        if( $('input[name=gender]:radio:checked').val() == null){
        	alert("성별을 선택해주세요.");
        	return false;
        } 
        
        // 전체 동의
        if($("input:checkbox[name=agree]:checked").length != 2){
        	alert("이용약관에 동의해주세요.");
        	return false;
        } 
        
        
        
        $.ajax({
            url:'/Semi/Insert.me',
            type:"get",
            data:{
            	
            	userName : $('#userName').val(),
            	userId : $('#userId').val(),
            	userPwd : $('#userPwd').val(),
            	userZip : $('#userZip').val(),
            	userAddress : $('#userAddress').val(),
            	address_d : $('#address_d').val(),
            	emailtext1 : $('#emailtext1').val(),
            	emailtext2 : $('#emailtext2').val(),
            	year : $('#year').val(),
            	month : $('#month').val(),
            	day : $('#day').val(),
            	tel1 : $('#tel1').val(),
            	tel2 : $('#tel2').val(),
            	tel3 : $('#tel3').val(),
            	gender : $('input[name=gender]:radio:checked').val()

            },
            success:function(data){
               console.log(data);
               alert("회원가입 성공!");
               location.href="/Semi/index";
              

            },error:function(data){
               console.log("전송실패");
            }
         })
      }); 
        
        
 
   // 아이디 중복 체크
   
   $('#idCheck').click(function(){
      $.ajax({
         url:"/Semi/IdCheck.me",
         type:"post",
         data:{
            userId:$('#userId').val()
         },success:function(data){
            console.log(data);
            if(data=='Y'){
              
               if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){  
				
					 $('input[name=IdCheckResult]').val('Y'); 
					 $('.successid').val('사용 가능한 아이디 입니다.'); 
					 $('.successid').show();
					 
					}
            }else{
               userId.focus();
              alert("중복된 아이디 입니다.");
               $('input[name=IdCheckResult]').val('N'); 
               $('.successid').val('중복된 아이디 입니다.'); 
               $('.successid').show(); 
            }
         },error:function(data){
            console.log("전송실패");
         }
      });
   });
   
   
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
   
   
    // 이메일 select
    
    function joinMember() {
      $("#joinForm").submit();
   }
    
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

   


    // 타이머 스크립트 
       var time = 180;
      var min = "";
      var sec = "";

       
               
      // 이메일 인증
   
      $('#useremail').click(function(){
         
         // var row2 = document.getElementById('row').style;
         var page = document.getElementById('demo').style;
         page.display = "block";
         // row2.width = '150px';
         var click = true;
         if (click) {
            console.log("클릭됨");
            $('#in2').css("display", "none");
         } else {
            console.log("중복됨");
         }
         var x = setInterval(function() {

            min = parseInt(time / 60);
            sec = time % 60;

            document.getElementById("demo").innerHTML = min + "분" + sec
                  + "초";
            time--;

            //타임아웃 
            if (time < 0) {
               clearInterval(x);
               document.getElementById("demo").innerHTML = "시간초과";
            }
         }, 1000);
         
      // 이메일 보내기
       $.ajax({
				url:"/Semi/sendEmail.me",
				type:"get",
				data:
					{emailtext1:$('#emailtext1').val() ,
					emailtext2:$('#emailtext2').val()
				},success:function(AuthCode){
   					alert("입력하신 이메일로 인증번호를 전송하였습니다!");
   					$('#emailcheckBtn').click(function(){
   						let AuthUser = $('#AuthUser').val();
   					 	console.log(AuthUser); 
   						console.log(AuthCode);
   						if(AuthCode==AuthUser){
   							$('input[name=isVerified]').val('Y');
   							$('.successemail').show();
   							$('.successemail').val("* 이메일 인증 완료");
   							console.log("인증성공");
   							alert("인증 성공!");
   						}else{
   							alert("인증 번호를 확인하세요");
   						}
   					})
   					
                  
                  
   
               },error:function(data){
                  console.log("전송실패");
               }
         })
      })
          

 	// 회원가입
 	
 

   
      
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
         
             
      
   </script>
   
    <%@ include file="../common/footer.jsp"%>

</body>
</html>