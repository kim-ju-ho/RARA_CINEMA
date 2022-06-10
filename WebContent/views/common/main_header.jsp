<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.member.model.vo.*"%>
<%
	Member m = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
  
    <!-- 모달용-->
    
    
    <link href="/Semi/resource/css/layout.css" rel="stylesheet" type="text/css" />
<style>
* {
    margin: 0;
    padding: 0;
    list-style: none;
    font-family: 'Noto Sans KR', sans-serif;
  }


  img {
    border: 0;
  }

  a {
    text-decoration: none;
    color: #000;
    font-family: 'Noto Sans KR', sans-serif;
  }

  .hidden {
    display: none;
  }

  button {
    background: none;
    border: 0;
    cursor: pointer;
    font-family: 'Noto Sans KR', sans-serif;
  }




  /* header */
  #header {
    height: 100px;
    border-bottom: 1px solid rgb(161, 159, 159);
    position: absolute;
    width: 1000px;
    background: rgba(255, 255, 255, 0);
    /* margin: 0 auto; */
    left: 50%;
    margin-left: -500px;
    min-width: 1000px;
    display: inline-block;


  }

  .common {
    display: inline-block;
    font-size: 10px;
    width: 100px;
    height: 100px;
    display: table-cell;
    text-align: center;
    vertical-align: middle;

  }

  .content {
    /* display: table-cell; */
    text-align: center;
    vertical-align: middle;
  }

  #header>div>a:hover {
    font-size: 14px;
    color: rgb(255, 255, 255);
  }

  /* float: right; */




  #logo {
    left: -5%;
    width: 200PX;
    height: 100px;
    position: relative;

  }



  #header .header_wrap {
    width: 1000px;
    overflow: inherit;
    position: relative;
    left: 50%;
    /* margin-left: -600px; */
    margin: auto;
    padding-top: 6px;

  }

  #header .header_wrap h1 {

    float: center;
  }

  /* gnb */
  .gnb {
    /* margin: auto; */
    width: 1000px;
    left: 50%;

  }

  .gnb>ul {
    margin: auto;
    /* left: 50%; */
    margin-left: -25%;
  }


  .gnb>ul>li {
    float: left;
  }

  .gnb>ul>li:hover .dep {
    display: block;
  }

  .gnb>ul>li:hover>a {
    font-weight: 800;
    color: white;
  }

  .gnb>ul>li>a {
    font-size: 16px;
    padding: 10px 45px 20px;
    /* text-align: center; */
    display: inline-block;
    color: white;
  }

  .dep {
    background: rgba(128, 128, 128, 0.377);
    padding: 20px 0;
   left: 20px;
    display: none;
  }

  .dep li {
    padding: 4px 0;
  }

  .dep li>a {
    padding: 4px 20px;
    display: block;
    text-align: center;
    color: #f2f2f2;
    font-size: 15px;
  }

  .dep li>a:hover {
    background: #f2f2f2;
    color: rgba(0, 0, 0, 0.788);
    font-weight: bold;
  }
</style>
</head>
<body>
 <div id="header">
 	<%if ( m == null ) { %>
        <div
          style="float: left; font-size: 13px; line-height:10px ;  position: relative; left: 800px; top: 70px; color: rgb(134, 134, 134);">
    
          <a href="/Semi/views/member/MemberJoinForm.jsp" class="content" id="join" style="color: rgb(134, 134, 134);
              position: relative; right: 10px;">회원가입</a>
          
          <a href="#loginmodal" class="content" rel="modal:open" style="color: rgb(134, 134, 134);
              position: relative; left: 10px;">로그인</a>
    
          <!-- 로그인 모달-->
          
          <div id="loginmodal" style="display:none; color: #555555;">
          
            <h2>LOGIN</h2>
            <div class="p_c_text">아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.</div>
            <div class="login_line" style="position: relative; left: 10%;">
            
               <form id="loginForm" action="/Semi/login.me" method="post">
              <div class="box_in">
           
                <input type="text" name="userId" placeholder="아이디를 입력해주세요">
                <input type="password" name="userPwd"  placeholder="비밀번호를 입력해주세요" >
              </div>
    
    		<div id="loginBtn" onclick='login()'  class="btn_login">로그인</div> 

    	</form>
    
    <script>
		function login(){
			$('#loginForm').submit();
		}
	</script>
              
            </div>
            <div class="find_join">
              <a href="./views/IdPassFind_Page.html" class="find_1" style="font-size:13px ;color: #464646;">아이디 / 비밀번호 찾기</a> |
              <a href="/Semi/views/member/MemberJoinForm.jsp" class="find_2" style="color: #464646; font-size:13px">회원가입</a>
            </div>
          </div>
    
			<%-- <% } else { %>
			<label><%= m.getUserName() %>님의 방문을 환영합니다.</label> <a
				href="./views/My_Page.html" class="content" id="join"
				style="color: rgb(134, 134, 134); position: relative; right: 10px;">마이페이지</a>

			<a href="/Semi/logout.me" class="content" onclick="button1_click();"
				style="color: rgb(134, 134, 134); position: relative; left: 10px;">로그아웃</a>

			<% } %> --%>
          
        </div>
        <% } else { %>
			    <div
      style="float: left; font-size: 13px; line-height:10px ;  position: relative; left: 800px; top: 70px; color: rgb(134, 134, 134);">
      <label style="position: absolute;
      top: -50px;
      width: 200px;">
      <%= m.getUserName() %> 님의 방문을 환영합니다.</label>
      <a href="/Semi/myPage.mo?id=<%= m.getUserId()%>" class="content" id="join" style="color: rgb(134, 134, 134);
          position: relative; right: 10px;">마이페이지</a>
      
      <a href="" class="content" onclick="logout();" style="color: rgb(134, 134, 134);
          position: relative; left: 10px;">로그아웃</a>


    </div>
			<% } %>
    
        <div><a href="./index.html"><img src="/Semi/resource/images/logo_wh.png" alt="라라시네마" id="logo" class="common"
              style="margin-left: 45%;"></a></div>
    
        <div class="header_wrap">
    
    
          <nav>
            <h2 class="hidden">카테고리</h2>
            <div class="gnb">
              <ul>
                <li>
                  <a href="#loginmodal" rel="modal:open">예매</a>
                  <ul class="dep">
                    <li>
                    <% if ( m == null ) { %>
                    	<a href="#loginmodal" rel="modal:open">예매하기 </a>
                   <% }else {%>
                   		 <a onclick="reservation();">예매하기 </a>
                   <% } %>   
                    
                    
                    </li>
                    <li><a href="./views/movie/movieTime.jsp" onclick="timetable();">상영시간</a></li>
                  </ul>
                </li>
                <li>
                  <a href="/Semi/movieList.ml">영화</a>
                  <ul class="dep">
                    <li><a href="/Semi/movieList.ml">영화정보</a></li>
                    <li><a href="./views/PreView_Page.html">예고편</a></li>
                  </ul>
                </li>
                <li>
                  <a href="./views/Cinema_Info.html">영화관</a>
                  <ul class="dep">
                    <li><a href="./views/Cinema_Info.html">역삼점</a></li>
                    <li><a href="./views/Cinema_Info.html">사당점</a></li>
                  </ul>
                </li>
                <li>
                  <a href="/Semi/qnaList.ql">QnA</a>
                  <ul class="dep">
                    <li><a href="./views/oftenQna.html">자주묻는질문</a></li>
                  </ul>
                </li>
              </ul>
            </div>
          </nav>
        </div>
      </div>
      
      
      <script>
      function timetable(){
    	  location.href="/Semi/selectlist.time";
      }
      
     function reservation(){
    	 location.href="/Semi/selectlist.rs";
     }
     
     function logout(){
			location.href="/Semi/logout.me";
			alert("로그아웃 되었습니다.");
	}
     
     
      </script>

</body>
</html>