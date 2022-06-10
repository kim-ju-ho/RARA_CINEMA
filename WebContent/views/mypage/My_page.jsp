<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
    pageEncoding="UTF-8" import="java.util.*, com.semi.qna.model.vo.*, com.semi.review.model.vo.* "%>
    
     <% ArrayList<Qna> qlist = (ArrayList<Qna>)request.getAttribute("qlist"); 
     	ArrayList<Review> rlist = (ArrayList<Review>)request.getAttribute("rlist");
     %>
    
=======
    pageEncoding="UTF-8"%>
>>>>>>> branch 'master' of https://github.com/KHsemiProjectRARA/RARAcinema.git

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
                              <%= m.getPhone() %>
                        </td>
                   
                </tr>
             
              
                <tr>
                    <td id="qrow2">우편번호</td>
                    <td id="qcolumn2">
<<<<<<< HEAD
                       <input type="text" id="userZip" name="userZip">
                </tr>
                <tr>
                    <td id="qrow2">주소</td>
                    <td id="qcolumn2">
                     <input type="text" id="userAddress" name="userAddress"> ,
                     <input type="text" id="address_d" name="address_d"></td>
                  
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
                       
                        <%= m.getUserBirth() %>
=======
                   	 <input type="text" id="userZip" name="userZip">
                </tr>
                <tr>
                    <td id="qrow2">주소</td>
                    <td id="qcolumn2">
               		<input type="text" id="userAddress" name="userAddress"> ,
               		<input type="text" id="address_d" name="address_d"></td>
                  
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
                       
                 		 <%= m.getUserBirth() %>
>>>>>>> branch 'master' of https://github.com/KHsemiProjectRARA/RARAcinema.git
                    </td>
                </tr>
            </table>
           
      
            <button id="changebtn" style="left: -38%;
    position: relative;
    width: 100px;
    height: 40px;
    margin-top: 30px;
">수정하기</button>


           
          
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
                   <div>
                    <table>
                    	<tr>
	                    	<td style="width: 250px; color:gray;">영화제목</td>
	                    	<td style="width: 30px; color:gray;">별점</td>
                    	</tr>
                    	 <%if(rlist != null){ %>
                    	<% for(Qna q : qlist){%>
                    	<tr>
                    		<td></td>
                    		<td></td>
                    	</tr>
                    	<% } %>
                     <% }else{ %>
                    	 <tr>
                    	 <td colspan="2">등록하신 리뷰가 없습니다</td>
                    	 </tr>
                     <% } %>
         				
                    </table>
                </div>
                </div>
            </div>
        
            <div class="div4">
                <p class="title">나의 질문</p>
                <hr>
                <button id="myQnAbtn" onclick="location.href = '/Semi/myqna.ql?id=<%= m.getUserId()%>'">더보기</button>
                <div>
                    <table>
                   <tr>
                   <td style="width: 250px; color:gray;">질문 제목</td>
                   <td style="width: 30px; color:gray;">답변</td>
                   </tr>
                   <%if(qlist != null){ %>
                    <% for(Qna q : qlist){%>
                        <tr>
                            <td ><%= q.getQtitle()%></td>
                            <td ><%=q.getAnswer()%></td>
                        </tr>
                        
                        <% } %>
                     <% }else{ %>
                     		<tr><td colspan="2">질문하신 목록이 없습니다</td></tr>
							 <% } %>
                    </table>
                </div>
            </div>

        </div>
    </div>

   


    </div>

<<<<<<< HEAD
    <%@ include file="../common/footer.jsp"%>
=======
 	<%@ include file="../common/footer.jsp"%>
>>>>>>> branch 'master' of https://github.com/KHsemiProjectRARA/RARAcinema.git
      
         

 
     <script>
     // 주소
        $(function(){
           var addressArr = '<%= m.getAddress() %>'.split(',');
         
         $('#userZip').val(addressArr[0]);

         $('#userAddress').val(addressArr[1]);
         $('#address_d').val(addressArr[2]);
         
         
        });
  
        
        // 비밀번호 치는곳으로
        $('#changebtn').click(function(){
         window.location.href = "/Semi/views/mypage/MypagePassword_mainupdate.jsp";
        })

<<<<<<< HEAD
        
        // 탈퇴용
        $('#goodbyebtn').click(function(){
         window.location.href = "/Semi/views/mypage/MypagePassword_delete.jsp";
        })
     
     </script>
=======
  		
  		// 탈퇴용
  		$('#goodbyebtn').click(function(){
  		 window.location.href = "/Semi/views/mypage/MypagePassword_delete.jsp";
  		})
  	
  	</script>
>>>>>>> branch 'master' of https://github.com/KHsemiProjectRARA/RARAcinema.git
</body>




</html>