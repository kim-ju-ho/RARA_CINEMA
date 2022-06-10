<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>라라시네마</title>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">

<!-- 모달용-->
<link href="./resource/css/layout.css" rel="stylesheet" type="text/css" />
<!-- <link href="../resource/css/" -->

<link rel="stylesheet" href="./resource/css/main_footer.css">

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



/* float: right; */


/* visual */
.visual {
	width: 100%;
	margin: 0 auto;
	overflow: hidden;
	min-width: 1000px;
}

.visual .visual_img {
	height: 679px;
	width: 6000px;
}

.visual .visual_img li {
	width: 2000px;
	height: 679px;
	float: left;
}

.visual .visual_img .img1 {
	background: url("./resource/images/메인5.png") no-repeat center center;
}

.visual .visual_img .img2 {
	background: url("./resource/images/메인8.png") no-repeat center center;
}

.visual .visual_img .img3 {
	background: url("./resource/images/메인7.png") no-repeat center center;
}

.visual .visual_btn {
	width: 1000px;
	position: absolute;
	left: 50%;
	margin-left: -500px;
	top: 300px;
	min-width: 1000px;
}

.visual .visual_btn li {
	float: left;
	cursor: pointer;
}

.visual .visual_btn li:hover {
	opacity: 0.5;
}

.visual .visual_btn li:last-child {
	float: right;
}

/* content */
.cont1 {
	position: absolute;
	top: 720px;
	left: 50%;
	margin-left: -500px;
	min-width: 1000px;
}

.cont1 ul {
	position: relative;
}

.cont1 ul li {
	float: left;
	margin-right: 24px;
}

.cont1 ul li:last-child {
	margin-right: 0;
}

.cont1 ul li a {
	position: relative;
	top: -50px;
	width: 65px;
	height: 65px;
	display: block;
	padding-top: -100px;
}

.cont1 ul li a h3 {
	color: #2e2e2e00;
	text-align: center;
	padding-top: -300px;
	position: absolute;
	top: 105px;
	left: 80px;
	font-size: 20px;
	text-indent: 0%;
}

.text {
	background: #000;
	opacity: 0;
	height: 330px;
	width: 230px;
	position: relative;
	text-align: center;
	/* padding: 100px 0px; */
}

#linkbtn {
	position: relative;
	top: 120px;
	color: white;
}

.cont1 ul .top1:hover .text {
	opacity: 0.6;
	text-align: center;
	color: #ffffff;
}

.cont1 ul .top2:hover .text {
	opacity: 0.6;
	text-align: center;
	color: #ffffff;
}

.cont1 ul .top3:hover .text {
	opacity: 0.6;
	text-align: center;
	color: #ffffff;
}

.cont1 ul .top4:hover .text {
	opacity: 0.6;
	text-align: center;
	color: #ffffff;
}

.cont1 ul .top1 {
	background: url("./resource/images/rank_6.jpg") no-repeat center center;
	height: 330px;
	width: 230px;
}

.cont1 ul .top1 a {
	background: url("./resource/images/num1.png") no-repeat center center;
	top: -90px;
}

.cont1 ul .top2 {
	background: url("./resource/images/rank_2.jpg") no-repeat center center;
	height: 330px;
	width: 230px;
}

.cont1 ul .top2 a {
	background: url("./resource/images/num2.png") no-repeat center center;
	top: -90px;
}

.cont1 ul .top3 {
	background: url("./resource/images/rank_3.jpg") no-repeat center center;
	height: 330px;
	width: 230px;
}

.cont1 ul .top3 a {
	background: url("./resource/images/num3.png") no-repeat center center;
	top: -90px;
}

.cont1 ul .top4 {
	background: url("./resource/images/rank_5.jpg") no-repeat center center;
	height: 330px;
	width: 230px;
}

.cont1 ul .top4 a {
	background: url("./resource/images/num4.png") no-repeat center center;
	top: -90px;
}

.cont2 {
	width: 1000px;
	margin: 0 auto;
	min-width: 1000px;
}

.cont3 {
	position: relative;
	top: 400px;
	height: 60px;
	left: 50%;
	margin-left: -650px;
	min-width: 1000px;
}

.cont2 {
	overflow: hidden;
	max-width: 1000px;
	padding-top: 430px;
	margin-bottom: 20px;
}

.cont2 div {
	float: left;
	height: 300px;
	box-sizing: border-box;
}

.cont2 div h3 {
	font-weight: 900;
	font-size: 24px;
}

.cont2 .customer {
	width: 500px;
	padding: 30px;
	margin-right: 20px;
	position: relative;
	right: 30px;
	top: -20px;
	color: black;
}

.cont2 .location {
	width: 480px;
	background: url("./resource/images/광고2.png") no-repeat center center;
	color: #f2f2f2;
	padding: 20px 32px;
}

.cont4 {
	position: relative;
	top: 25px;
	height: 60px;
	left: 50%;
	margin-left: -650px;
}

.cont5 {
	position: absolute;
	/* top: 720px; */
	left: 50%;
	margin-left: -500px;
	height: 300px;
	min-width: 1000px;
}

/* .tr_ul{
  position: absolute;
  top: 720px;
  left: 50%;
  margin-left: -500px;
  min-width: 1000px;
  } */
#tra_in {
	height: 146px;
	width: 220px;
	float: left;
	margin-right: 14px;
	margin-left: 15px;
}

@media ( max-width : 1000px) {
	.visual .visual_btn {
		margin-left: 0;
		left: 0;
	}
	.cont1 {
		left: 0;
		margin-left: 0;
	}
}

/*# sourceMappingURL=main.css.map */
dl {
	width: 500px;
	margin: 0 0 20px;
}

dt {
	padding: 6px 10px 6px;
	background: rgb(255, 255, 255);
	margin: 0 0 0px;
	font-weight: bold;
	border-top: 1px dashed rgb(167, 167, 167);
}

dt.closed {
	cursor: pointer;
	color: black;
	background: rgb(255, 255, 255) url(bg.png) repeat-y 100% 0;
}

dd {
	padding: 0 10px 12px;
	width: 478px;
	height: 150px;
	/* border-left:1px dashed rgb(167, 167, 167); */
	background: white;
	margin: -3px 0 3px;
}

dd.closed {
	display: none;
}

#star {
	width: 100px;
	height: 32px;
	float: right;
	position: relative;
	top: -5px;
	right: 25px;
}

#p_text {
	margin: 0 auto;
	text-align: center;
	font-size: 13px;
	margin-top: 5px;
}
</style>



<script language='javascript' type='text/javascript'>

    $(function () {

      var class_closed = 'closed';

      $('.accordion').each(function () {



        var dl = $(this);

        var all_Dt = dl.find('dt');

        var all_Dd = dl.find('dd');

        function closeAll() {

          all_Dt.addClass(class_closed);

          all_Dd.addClass(class_closed);

        }

        function open(dt, dd) {

          dt.removeClass(class_closed);

          dd.removeClass(class_closed);

        }


        closeAll();

        all_Dt.hover(function () {

          var dt = $(this);

          var dd = dt.next();

          closeAll();

          open(dt, dd);

        });
      });

    });


  </script>



</head>

<body style="overflow-x: hidden; overflow-y: auto;">

	<%@ include file="views/common/main_header.jsp" %>


	<script type="text/javascript">


    $(function () {
      $(".visual_img li:last").prependTo(".visual_img");

      $(".visual_btn li:last").click(function () {
        $(".visual_img").animate({ marginLeft: -2000 }, function () {
          $(".visual_img li:first").appendTo(".visual_img")
          $(".visual_img").css({ marginLeft: 0 })
        });
      });

      $(".visual_btn li:first").click(function () {
        $(".visual_img").animate({ marginLeft: 0 }, function () {
          $(".visual_img li:last").prependTo(".visual_img")
          $(".visual_img").css({ marginLeft: -2000 })
        });
      });
    });

  </script>

	<section class="visual">
		<ul class="visual_img">
			<li class="img1"></li>
			<li class="img2"></li>
			<li class="img3"></li>
		</ul>
		<ul class="visual_btn">
			<li><button>
					<img src="./resource/images/left.png" alt="left_button">
				</button></li>
			<li><button>
					<img src="./resource/images/right.png" alt="right_button">
				</button></li>
		</ul>
	</section>
	<section class="cont1">
		<ul>
			<li class="top1">
				<div class="text">
					<button id="linkbtn" onclick="alert('로그인을 해주세요!');">예매하기</button>
					<br>
					<br>
					<button id="linkbtn"
						onclick="location.href = './views/MovieInfo_Page.html'">상세정보</button>
				</div>
				<p id="p_text">
					영화제목<br> 예매율/개봉일
				</p> <a></a>
			</li>
			<li class="top2">
				<div class="text">
					<button id="linkbtn" onclick="alert('로그인을 해주세요!');">예매하기</button>
					<br>
					<br>
					<button id="linkbtn"
						onclick="location.href = './views/MovieInfo_Page.html'">상세정보</button>
				</div>
				<p id="p_text">
					영화제목<br> 예매율/개봉일
				</p> <a></a>
			</li>
			<li class="top3">
				<div class="text">
					<button id="linkbtn" onclick="alert('로그인을 해주세요!');">예매하기</button>
					<br>
					<br>
					<button id="linkbtn"
						onclick="location.href = './views/MovieInfo_Page.html'">상세정보</button>
				</div>
				<p id="p_text">
					영화제목<br> 예매율/개봉일
				</p> <a></a>
			</li>
			<li class="top4">
				<div class="text">
					<button id="linkbtn" onclick="alert('로그인을 해주세요!');">예매하기</button>
					<br>
					<br>
					<button id="linkbtn"
						onclick="location.href = './views/MovieInfo_Page.html'">상세정보</button>
				</div>
				<p id="p_text">
					영화제목<br> 예매율/개봉일
				</p> <a></a> <br>
			<br>
			<br>
			</li>

		</ul>

	</section>

	<section class="cont3">
		<div
			style="margin: 0 auto; position: relative; right: -145px; top: 20px;">
			<hr style="width: 1000px; margin-top: 10px;">
		</div>
		<div>
			<p
				style="font-size: 25px; position: relative; right: -150px; top: 40px; font-weight: bold;">개봉영화 
				평점</p>
		</div>
	</section>

	<section class="cont2">

		<div class="customer">
			<dl class="accordion">

				<dt>
					#살아있다 <a href="./views/MovieInfoReview_Page.html" id="star"
						style="background: url(./resource/images/별4.png);"></a>
				</dt>

				<dd>
					<div
						style="background: url(./resource/images/살아있다.jpg); width: 105px; height: 150px; position: relative; left: 350px; top: 8px;"></div>
				</dd>

				<dt>
					블루아워 <a href="./views/MovieInfoReview_Page.html" id="star"
						style="background: url(./resource/images/별4.png);"></a>
				</dt>


				<dd>
					<div
						style="background: url(./resource/images/블루아워.png); width: 105px; height: 150px; position: relative; left: 350px; top: 8px;"></div>
				</dd>

				<dt>
					온워드: 단 하루의 기적 <a href="./views/MovieInfoReview_Page.html" id="star"
						style="background: url(./resource/images/별4.png);"></a>
				</dt>

				<dd>
					<div
						style="background: url(./resource/images/온워드.jpg); width: 105px; height: 150px; position: relative; left: 350px; top: 8px;"></div>
				</dd>

			</dl>

		</div>
		<div class="location"></div>




	</section>

	<section class="cont4">

		<div style="margin: 0 auto; position: relative; right: -145px;">
			<hr style="width: 1000px; border: rgb(160, 160, 160) dotted 1px;">
		</div>
	</section>


	<!-- 예고편 -->
	<section class="cont5">
		<div>
			<p
				style="font-size: 25px; font-weight: bold; position: relative; bottom: 20px;">현재
				상영작 예고편</p>
		</div>
		<div class="tr_all" style="position: flex; top: 100px;">
			<ul class="tr_ul">
				<li class="tr_1">
					<div class="">
						<a href="./views/PreView_Page.html" id="tra_in"
							style="background: url(./resource/images/tra_2.png);"></a>
					</div>

				</li>
				<li class="tr_2">
					<div class="">
						<a href="./views/PreView_Page.html" id="tra_in"
							style="background: url(./resource/images/tra_3.png);"></a>
					</div>

				</li>
				<li class="tr_3">
					<div class="">
						<a href="./views/PreView_Page.html" id="tra_in"
							style="background: url(./resource/images/tra_4.png);"></a>
					</div>
				</li>
				<li class="tr_4">
					<div class="">
						<a href="./views/PreView_Page.html" id="tra_in"
							style="background: url(./resource/images/tra_5.png);"></a>
					</div>
				</li>
			</ul>
		</div>


	</section>


	   <%@ include file="views/common/footer.jsp"%>



</body>

</html>