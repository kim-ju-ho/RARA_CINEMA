<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.semi.movie.model.vo.*"%>
     <%
    ArrayList<Movie> list = (ArrayList<Movie>)request.getAttribute("list"); 
     
     //PageInfo pi = (PageInfo)request.getAttribute("pi");
     
 	//int listCount = pi.getListCount();
 	//int currentPage = pi.getCurrentPage();
 	//int maxPage = pi.getMaxPage();
 	//int startPage = pi.getStartPage();
 	//int endPage = pi.getEndPage();
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화리스트 더보기</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    <!-- 모달용-->
    <link href="../resource/css/layout_nomain.css" rel="stylesheet" type="text/css" />
    <!-- <link href="../resource/css/" -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <link rel="stylesheet" href="../resource/css/header.css">
    <link rel="stylesheet" href="../resource/css/footer.css">
    <script src="../resource/js/header.js"></script>

    <style>
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
            height: 50px;
            position: relative;
            top: 20px;

        }

        #mainTitle>p {
            float: left;
            font-size: 25px;
            font-weight: 900px;
            margin-left: 10px;
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
            /* border: 1px solid purple; */
            text-align: center;
            left: 25px;
            margin-bottom: 40px;
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

       
        /* 광고 */
        #ad_top {
            height: 250px;
        }

        #ad_bottom {
            height: 200px;
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

        #main_btn {
            border: none;
            background: rgba(255, 255, 255, 0);
            color: rgb(71, 71, 71);
            text-decoration: none;
            font-size: 18px;
        }

        .first {
            color: black;
            font-size: 20px;
            font-weight: bold;
            text-decoration: none;
        }
        .pagingArea >button{
        border-style: none;
        
    }

    </style>

</head>
<body>
 <div id="body1">
        
        <div id="mainTitle">

            <a href="" class="first" href="Semi/movieList.now">현재 상영작</a>
            <a href="" class="second" id="main_btn" href="Semi/movieList.pre">상영 예정작</a>

        </div>

        <!-- <hr> -->
        <div class="show1">
            <div class="area 1">
                <p style="font-size: 14px;">현재상영작</p><p style="font-size: 14px;">상영 예정작</p>
                <!-- <hr> -->
                <!-- 한페이지에 16개만 -->
                <div class="mpf" id="top">
                    <img src="../resource/images/rank_1.jpg" alt="영화 포스터1">
                    <p id="p_text"> 영화제목<br> 예매율/개봉일 </p>
                    <div class="text">
                        <button id="linkbtn" onclick="alert('로그인을 해주세요!');">예매하기</button><br><br>
                        <button id="linkbtn" onclick="location.href = './MovieInfo_Page.html'">상세정보</button>
                    </div>
                </div>
				<% if( list != null) { %>
				<%for(Movie mv : list){ %>
                <div class="mpf" id="top">
                    <img src="/Semi/resource/images/<%= mv.getPoster_path()%>" alt="영화 포스터2">
                    <p id="p_text"><%= mv.getMovieTitle()%><br>
                    예매율/<%= mv.getMovieOpen() %></p>
                    <div class="text">
                        <button id="linkbtn" onclick="alert('로그인을 해주세요!');">예매하기</button><br><br>
                        <button id="linkbtn" onclick="location.href = '/Semi/movie.mo?no=<%=mv.getMovieNo()%>'">상세정보</button>
                    </div>
                </div>
                	<% } %>
				<% } %>
                
            </div>
        </div>
				
    </div>
</body>
</html>