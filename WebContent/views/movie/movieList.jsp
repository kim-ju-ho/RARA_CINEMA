<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.semi.movie.model.vo.*"%>
     <%
    ArrayList<Movie> mlist = (ArrayList<Movie>)request.getAttribute("list"); 
    ArrayList<Movie> premlist = (ArrayList<Movie>)request.getAttribute("prelist"); 
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무비 리스트</title>
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
        * {
            font-family: 'Noto Sans KR', sans-serif;
        }
        div {
            /* border: 1px solid black; */
            box-sizing: border-box;
        }

        /* 바디 */
        #body1 {
            margin: auto;
            width: 1000px;
            height: 100%;
            padding: 10px;
        }

        #mainTitle {
            width: 100%;
            height: 70px;
            border-bottom: 3px solid #505984;
        }

        #mainTitle>p {
            float: left;
            font-size: 25px;
            font-weight: 900px;
            margin-left: 10px;
            color: #121a3e;
        }

        #mainTitle>select {
            float: right;
            margin-right: 5%;
            margin-top: 2%;
            width: 100px;
            height: 35px;
        }


        .area {
            width: 100%;
            height: 400px;
        }

        .area>p {
            font-size: 18px;
            margin-left: 20px;
        }

        .mpf {
            position: relative;
            box-sizing: border-box;
            float: left;
            width: 20%;
            height: 80%;
            margin-left: 3%;
            text-align: center;
            left: 25px;
        }


        #p_text {
            font-size: 12px;
        }

        #mpf1 {
            margin-left: 6%;
        }

        /* 포스터 이미지 */
        .mpf>img {
            width: 100%;
            height: 85%;
        }

        /* 인기 트레일러 */
        #trail {
            height: 400px;
            padding-top: 5px;
            border-top: 3px ;
        }

        #t1 {
            float: left;
            width: 70%;
            height: 80%;
        }

        #t1>div {
            float: left;
            width: 65%;
            height: 90%;
            margin-left: 3%;
            margin-top: 2%;
        }

        #t1>#t1frame {
            float: left;
            width: 25%;
            height: 90%;
            margin-left: 15px;
            margin-top: 2%;
        }

        #t1frame>img {
            width: 100%;
            height: 80%;
        }

        #t1frame>p {
            margin: auto;
        }

        .t2 {
            float: left;
            width: 30%;
            height: 40%;
        }

        .t2-1 {
            float: left;
            width: 65%;
            height: 80%;
            background: yellow;
            margin-top: 4%;
        }

        .t2-2 {
            float: left;
            width: 25%;
            height: 80%;
            background: blue;
            margin-left: 15px;
            margin-top: 4%;
        }

        /* 광고 */
        #ad_top {
            height: 250px;
        }

        #ad_bottom {
            height: 200px;
        }

        a {
        color: white;
        }
        li{
            list-style: none;
        }

        .ad>img {
            width: 100%;
            height: 100%;
        }


        /*예매하기 상세정보*/
        .text {
            position: relative;
            background: #000;
            opacity: 0;
            height: 272px;
            bottom: 300px;
            top: -336px;
            width: 198px;
            bottom: 300px;
            text-align: center;

        }

        #linkbtn {
            position: relative;
            top: 37%;
            color: white;
            background: rgba(255, 0, 0, 0);
            border: none;
            font-size: 15px;
        }


        #top:hover .text {
            opacity: 0.6;
            text-align: center;
        }



        #area_2 {
            position: relative;
            left: 25px;
        }

        /*넘어가는 이미지*/



        .bx-wrapper .bx-caption {
            position: absolute;
            bottom: 0;
            left: 0;
            background: #666;
            background: rgba(255, 255, 255, 0);
            width: 100%;
        }

        .bx-wrapper {
            -moz-box-shadow: 0 0 5px #ccc;
            -webkit-box-shadow: 0 0 5px #ccc;
            box-shadow: 0 0 5px #ccc;
            border: none;
        }

        /*더보기*/
        #more {
            position: relative;
            bottom: 30px;
            font-size: 12px;
            text-decoration: none;
            color: #666;
        }
        hr{
            background: #505984 ;
        height: 3px;
        }
        .area1{
        height: 400px;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('.bxslider').bxSlider({
                auto: true, // 자동으로 애니메이션 시작
                speed: 500,  // 애니메이션 속도
                pause: 4000,  // 애니메이션 유지 시간 (1000은 1초)
                mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
                autoControls: true, // 시작 및 중지버튼 보여짐
                pager: true, // 페이지 표시 보여짐
                captions: true, // 이미지 위에 텍스트를 넣을 수 있음
            });
        });
    </script>
</head>

<body>

   	<%@ include file="../common/header.jsp" %>
   	
<div id="body1">
       <!--   <div class="ad top" id="ad_top">
            <ul class="bxslider">
                <li><a href="./MovieInfo_Page.html"><img src="../resource/images/listmain_1.jpg" alt=""></a></li>
                <li><a href="./MovieInfo_Page.html"><img src="../resource/images/listmain_2.jpg" alt=""></a></li>
                <li><a href="./MovieInfo_Page.html"><img src="../resource/images/listmain_3.jpg" alt=""></a></li>
            </ul>
        </div>-->
        <div id="mainTitle">
            <p>무비차트</p>
            <select name="" id="">
                <option value="예매율순">예매율순</option>
                <option value="평점순">평점순</option>
            </select>
        </div>

        <!-- <hr> -->
        <div class="area1">
            <p>현재상영작</p>
            <a href="/Semi/movieList.now" id="more">더보기 ></a>
            <!-- <hr> -->
            <% if( mlist != null) { %>
             <% for(Movie mv : mlist) { %>
                <div class="mpf" id="top">
                <img src="/Semi/resource/images/<%= mv.getPoster_path()%>" alt="영화 포스터1">
                <p id="p_text"> <%= mv.getMovieTitle()%><br>
                예매율/<%= mv.getMovieOpen() %></p>
                <div class="text">
                    <button id="linkbtn" onclick="alert('로그인을 해주세요!');">예매하기</button><br><br>
                    <button id="linkbtn" onclick="location.href = '/Semi/movie.mo?no=<%=mv.getMovieNo()%>'">상세정보</button>
                </div>
            </div>
                        <% } %>
             <% } else {%>
             현재 상영중인 영화가 업습니다
             <% } %>
        </div>

        <div class="area 2">
            <p>개봉 예정작</p>
            <a href="/Semi/movieList.pre" id="more" >더보기 ></a>
            <!-- <hr> -->
 			<% if( premlist != null) { %>
             <% for(Movie mv : premlist) { %>
            <div class="mpf" id="top">
                <img src="/Semi/resource/images/<%= mv.getPoster_path()%>" alt="영화 포스터1">
                <p id="p_text"> <%= mv.getMovieTitle()%><br> 예매율/<%= mv.getMovieOpen() %> </p>
                <div class="text">
                    <button id="linkbtn" onclick="alert('로그인을 해주세요!');">예매하기</button><br><br>
                    <button id="linkbtn" onclick="location.href = '/Semi/moviepre.mo?no=<%=mv.getMovieNo()%>'">상세정보</button>
                </div>
            </div><% } %>
             <% } else {%>
             개봉 예정인 영화가 업습니다
             <% } %>

            

        </div>
        <div class="ad bottom" id="ad_bottom">
            <img src="../resource/images/listmain_2.jpg" alt="개봉 예정영화 포스터">
        </div>
        <div class="area 3" id="trail">
            <p>인기 트레일러</p>
            <hr>
            <div id="t1">
                <div>
                    <iframe width="100%" height="100%" src="https://www.youtube.com/embed/XUhRA_ObaDo" frameborder="0"
                        allow="accelerometer; autoplay; encrypted-media; gyroscope;
                    picture-in-picture" allowfullscreen></iframe>
                </div>
                <div id="t1frame">
                    <img src="../resource/images/포스터2.jpg" alt="">
                    <p>영화제목 : 덩케르크<br>
                        개봉일 :<br>
                        평점:<br>

                    </p>
                </div>

            </div>
            <div class="t2">
                <div class="t2-1">아이프레임 대신용..</div>
                <div class="t2-2"> 제목자리</div>
            </div>
            <div class="t2">
                <div class="t2-1">아이프레임 대신용..</div>
                <div class="t2-2"> 제목자리</div>
            </div>
        </div>
    </div>
</body>
</html>