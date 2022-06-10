<%@page import="com.semi.review.model.vo.PageInfo"%>
<%@page import="com.semi.review.model.vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, com.semi.movie.model.vo.*, com.semi.review.model.vo.*"%>
    <% Movie mv = (Movie)request.getAttribute("m");
    ArrayList<Review> rlist = (ArrayList<Review>)request.getAttribute("rarr");
    PageInfo pi = (PageInfo)request.getAttribute("pi");

    int listCount = pi.getListCount();
    int currentPage = pi.getCurrentPage();
    int maxPage = pi.getMaxPage();
    int startPage = pi.getStartPage();
    int endPage = pi.getEndPage();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 평점 리뷰</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

    <link href="../resource/css/layout_nomain.css" rel="stylesheet" type="text/css" />

    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <link rel="stylesheet" href="../resource/css/header.css">
    <link rel="stylesheet" href="../resource/css/footer.css">
    <script src="../resource/js/header.js"></script>

<style>
 * {font-family: 'Noto Sans KR', sans-serif;}
      div {
          box-sizing: border-box;
      }

      /* 나는   바디 */
      #wrapper {
          width: 1000px;
          height: 100%;
          margin: auto;
      }

      /* 영화상세페이지 전체틀*/
      #movieinfo {
          width: 100%;
          height: 100%;
          float: left;
      }

      /* 영화상세페이지 제목부분*/
      #minfoTitle {
          width: 100%;
          height: 50px;
          padding-top: 5px;
          background: #505984;
          color:  #f4f4f4;
          font-size: 20px;
          font-weight: bold;
          text-align: center;
          border-top: 3px solid white;
      }

      #realminfo {
          width: 100%;
          height: 300px;
      }

      /* 영화포스터이미지 프레임*/
      #mimg {
          width: 30%;
          height: 100%;
          float: left;
          margin-top: 10px;
      }

      #mimg>img {
          width: 80%;
          padding-left: 30px;
      }

      /* 포스터 밑에 예매 버튼 */
      #bookbtn {
          width: 200px;
          height: 40px;
          margin-left: 16%;
          margin-bottom: 10px;
          font-size: 15px;
          border: 1px solid #7090cb;
          color: #7090cb;
          background: white;
      }

      /* 영화 상세 내용 감독 어쩌구 이부분 */
      #mcontent {
          width: 70%;
          height: 100%;
          float: left;
          padding-left: 10%;
          padding-top: 5%;
      }

      /* !!!!!!!!리뷰/정보 이동 버튼틀 설정 */
      #icbutton {
          width: 100%;
          height: 100%;
          
      }

      #minfo,
      #coment {
          width: 50%;
          height: 50px;
          float: left;
      }

      #minfobtn {
          width: 100%;
          height: 100%;
          font-size: 18px;
          border: 2px solid #7090cb;
          color:  #7090cb;
          background: white;
          margin-right: 5px;
      }

      #comentbtn {
          width: 100%;
          height: 100%;
          font-size: 18px;
          border: 2px solid #7090cb;
          color:  #7090cb;
          background: white;
      }

      #minfobtn:hover {
          background: #7090cb;
          color: white;
      }

      #comentbtn:hover {
          background: #7090cb;
          color: white;
      }


      /* 제목들 */
      .title {
          width: 100%;
          height: 50px;
          float: left;
          padding-top: 5px;
          background: #505984;
          color:  #f4f4f4;
          font-size: 20px;
          font-weight: bold;
          text-align: center;
      }

      /*리뷰 페이지~ */
      #reviewFrame {
          width: 100%;
          height: 900px;
          float: left;
          box-sizing: border-box;
          background: white;
      }

      .btn {
          width: 80px;
          height: 40px;
          margin-left: 15px;
          margin-top: 15px;
          background-color: #505984;
          color: white;
          border: 1px solid snow;
          border-radius: 10%;
      }

      #reviewWrite{
          padding-left: 60px;
          padding-top: 20px;
    	  width: 900px;
          height: 180px;
          margin: auto;
      }

      textarea {
          width: 700px;
          height: 90px;
          resize: none;
          float: left;
          margin-top: 15px;
      }
      .reply-content{
      width: 800px;
      }

      .-wr {
          width: 80px;
          height: 100px;
          float: left;
      }



      /* 하단에 있을부분 */
      /* 광고 */
      #ad1 {
          width: 100%;
          height: 200px;
          float: left;
      }


      #asidecontent {
          width: 100px;
          height: 300px;
          box-sizing: border-box;
          position: fixed;
          float: right;
          padding: 0%;
      }
a {
      color: white;
      }
      li{
          list-style: none;
      }
      /* 사이드바 안에 버튼들 */
      .sidebtn {
          width: 100%;
          height: 30%;
          border: 1px solid steelblue;
          background: white;
          color: #505984;
          padding-top: 30px;
          text-align: center;
      }

      button{
          border-style: none;
      }
      .starR{
      background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
      background-size: auto 100%;
      width: 30px;
      height: 30px;
      display: inline-block;
      text-indent: -9999px;
      cursor: pointer;
      }
      .starR.on{background-position:0 0;}
      #reviewRead{
          margin-left: 10%;

      }
      #likeBtn,#hateBtn{
          background: white;
      }

    </style>

</head>
<body>
	<%@ include file="../common/header.jsp"%>
    <div id="wrapper" style="width: 1000px; height: 100%; margin: auto;">
        <div id="movieinfo">
            <div id="minfoTitle" class="title"> 영화 상세페이지 </div>
            <div id="mimg">
                <img src="./resource/images/<%= mv.getPoster_path()%>" alt="영화 포스터 이미지">
                <br>
                <button id="bookbtn" onclick="alert('로그인을 해주세요!');">예매하기</button>
            </div>

            <div id="mcontent">
                영화 제목 : <%=mv.getMovieTitle()%><br>
                영화 감독 :<%=mv.getDirector()%><br>
                영화 배우 :<%=mv.getActor()%><br>
                상영시간 : <%=mv.getRunningTime()%><br>
            </div>
        </div>

        <div id="icbutton">
            <div id="minfo">
                <button id="minfobtn" onclick="location.href = '/Semi/movie.mo?no=<%=mv.getMovieNo()%>'"> 영화 정보 버튼</button>
            </div>
            <div id="coment">
                <button id="comentbtn" onclick="location.href = '/Semi/reviewList.rl?no=<%=mv.getMovieNo()%>'"> 평점 및 관람평</button>
            </div>
        </div>

        <!-- 리뷰창 -->
        <div id="reviewFrame">
            <button class="btn -new">최신순</button>
            <button class="btn -like">추천순</button>
            <% if(m != null){ %>
            <div id="reviewWrite"> 
                <form action="/Semi/insertReview.ro?mo=<%=mv.getMovieNo()%>" method="post">
                	<input type="hidden" name="id" value="<%=m.getUserId()%>"/>
                    <input type="hidden" id="score" name="score" value="1" />
                    <div class="starRev" id="starRev">
                        <span class="starR on" >★</span>
                        <span class="starR" >★</span>
                        <span class="starR"> ★</span>
                        <span class="starR" >★</span>
                        <span class="starR" >★</span>
                      </div>
                    <textarea name="content" id="write" cols="30" rows="10"></textarea>
                    <button type="submit" class="btn -wr" >리뷰 작성하기</button>
                </form>
            </div>
            <script>
                $('.starRev span').click(function(){
                $(this).parent().children('span').removeClass('on');
                $(this).addClass('on').prevAll('span').addClass('on');
                var onarr = $(document.getElementsByClassName('on')); <!--배열-->
                console.log($(onarr).length);
				var score = $(onarr).length; 
				$('#score').val(score);
				console.log($('#score').val());
				
                return false;
                });
                
            </script>
            
            <% } else { %>
            	<p style="text-align:center;">로그인 해야 리뷰를 입력할 수 있습니다</p>
            <% } %>
            
            
            
            <div id="reviewRead">
                <% if( rlist != null) { %>
                <table id="replySelectTable">
               		 <% for(Review r : rlist){ %>
                    <tr style="p">
                        <td><b><%= r.getUserName() %></b></td>
                        <input type="hidden" id="rno" value="<%= r.getRenum()%>">
                        <td>평점 :<%=r.getRscore() %>
                        </td>
                        <td><button type="button" id="likeBtn" onclick="like(this)">👍</button>:<%=r.getLikenum() %>
                            <button type="button" id="hateBtn" onclick="hate(this)">👎</button>:<%=r.getHatenum() %></td> 
                        <td>작성일:<%=r.getReDate()%></td>
                        <td align="center">
                        <% if(m != null && r.getUserName().equals(m.getUserName())){ %>
                        <input type="hidden" name="rno" id="rno" value="<%=r.getRenum()%>"/>		
                        <button type="button" class="updateBtn" onclick="updateReply (this);">수정하기</button>
                        <button type="button" class="updateConfirm" onclick="updateConfirm(this);" style="display:none;" >수정완료</button> &nbsp;&nbsp;			
                        <button type="button" class="deleteBtn" onclick="deleteReply(this);">삭제하기</button>
                        <% } else if(m != null && m.getUserId().equals("admin")){ %>
                        <input type="hidden" name="rno" id="rno" value="<%=r.getRenum()%>"/>		
                        <button type="button" class="deleteBtn" onclick="deleteReply(this);">삭제하기</button>
                        <% } %>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="background : transparent;">
                        <textarea class="reply-content" cols="105" rows="3" readonly="readonly"><%= r.getRecontent()%></textarea>
                    	</td>
                    </tr>
                    <tr style="height: 50px">
                    </tr>
                  		<% } %> 
                  </table>
						<% } else { %> 
						<p>리뷰가 없습니다 영화 리뷰의 첫 작성자가 되어주세요!</p>
						<% }%>
            </div>
            <script>
			function updateReply(obj) {
				// 현재 위치와 가장 근접한 textarea 접근하기
				$(obj).parent().parent().next().find('textarea')
				.removeAttr('readonly');
				// 수정 완료 버튼을 화면 보이게 하기
				$(obj).siblings('.updateConfirm').css('display','inline');
				// 수정하기 버튼 숨기기
				$(obj).css('display', 'none');
			}
			
			function updateConfirm(obj) {
				// 댓글의 내용 가져오기
				var content
				  = $(obj).parent().parent().next().find('textarea').val();
				
				// 댓글의 번호 가져오기
				var rno = $(obj).siblings('#rno').val();
				
				// 게시글 번호 가져오기
				var mno = <%= mv.getMovieNo()%>;
				
				location.href="/Semi/updateReview.ro?"
						 +"rno="+rno+"&mno="+mno+"&content="+content;
			}
			
			function deleteReply(obj) {
				// 댓글의 번호 가져오기
				var rno = $(obj).siblings('#rno').val();
				
				// 게시글 번호 가져오기
				var mno = <%= mv.getMovieNo()%>;
				
				location.href="/Semi/deleteReview.ro?"
				+"rno="+rno+"&mno="+mno;
			}
	
	</script>
			<div class="pagingArea" align="center">
					<button onclick="location.href='<%= request.getContextPath() %>/qnaList.ql?currentPage=1'"><<</button>
					<%  if(currentPage <= 1){  %>
					<button disabled><</button>
					<%  }else{ %>
					<button onclick="location.href='<%= request.getContextPath() %>/qnaList.ql?currentPage=<%=currentPage - 1 %>'"><</button>
					<%  } %>
											
					<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){	%>
					<button disabled><%= p %></button>
					<%      }else{ %>
					<button onclick="location.href='<%= request.getContextPath() %>/qnaList.ql?currentPage=<%= p %>'"><%= p %></button>
					<%      } %>
					<% } %>
												
					<%  if(currentPage >= maxPage){  %>
					<button disabled>></button>
					<%  }else{ %>
					<button onclick="location.href='<%= request.getContextPath() %>/qnaList.ql?currentPage=<%=currentPage + 1 %>'">></button>
					<%  } %>
					<button onclick="location.href='<%= request.getContextPath() %>/qnaList.ql?currentPage=<%= maxPage %>'">>></button>
			</div>
        </div>
    </div>
    
     <!-- 사이드바 -->
    <div id="asidecontent" style="background: url(../resource/images/사이드바배경.png);">
        <div id="side" style="background: url(../resource/images/사이드1.png);">
            <a href="../views/Reservation_Page.html"></a>
        </div>
        <div id="side" style="background: url(../resource/images/사이드2.png);">
            <a href="../views/TimeTable_Page.html"></a>
        </div>
        <div id="side" style="background: url(../resource/images/사이드3.png);">
            <a href="../views/Qna_1_1.html"></a>
        </div>
        <div><a href="#">TOP</a></div>
    </div>
</body>
</html>