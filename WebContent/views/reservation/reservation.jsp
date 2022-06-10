<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.semi.reservation.model.vo.*"%>

<%
	ArrayList<Reservation> list = (ArrayList<Reservation>) request.getAttribute("list");
%>

<% String name = (String)session.getAttribute("selectmovie"); %>

<!-- 8월 17일 신아라 수정본 -->


<!DOCTYPE html>
<html>

<head>
    <%@ include file="../common/header.jsp"%>

    <meta charset="UTF-8">
    <title>예매 페이지</title>

    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>



    <!-- <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet"> -->
    <!--     <link rel="stylesheet" href="../resource/css/header.css">
    <link rel="stylesheet" href="../resource/css/footer.css"> -->
    <!-- <script src="../resource/js/header.js"></script> -->


    <!--   <link rel="stylesheet" href="/Semi/resource/css/Reservation_modal.css">
   <!--  <link rel="stylesheet" href="Semi/resource/css/seat100.css"> -->
    <!--   <link rel="stylesheet" href="/Semi/resource/css/payment.css"> -->
    <!--   <script src="/Semi/resource/js/ReservationModal.js"></script>
     -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />


    <link rel="stylesheet" href="/Semi/resource/css/reservation.css">


    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <link rel="stylesheet" href="/Semi/resource/css/reservation.css">
    <script type="text/javascript" src="/Semi/resource/js/reservation.js"></script>
    <link rel="stylesheet" href="/Semi/resource/css/footer.css">

</head>


<body>
    <form action="">
        <div id="wrapper">
            <div class="bin">
                <ul class="bxslider">
                    <li><a href="#"><img src="/Semi/resource/images/listmain_1.jpg" alt="" title="이미지1"></a></li>
                    <li><a href="#"><img src="/Semi/resource/images/listmain_2.jpg" alt="" title="이미지2"></a></li>
                    <li><a href="#"><img src="/Semi/resource/images/listmain_3.jpg" alt="" title="이미지3"></a></li>
                </ul>
            </div>

            <div id="content">
                <div id="movieSelect" class="form">
                    <div id="ms">영화선택</div>
                    <div id="ms_1">
                        <div id="ms_1_1">
                            <input type="button" value="전체영화" id="ms_btn1" onclick="rs123();">
                            <input type="button" value="가나다순" id="ms_btn2">
                        </div>
                        <strong> - M O V I E -</strong> <br>
                        <div id="ms_1_2" style="display: block; overflow: scroll; height: 300px;">

                            &nbsp;&nbsp;&nbsp;&nbsp; 전체영화 <br>
                            <hr>

                            <%
								System.out.println(list);
							%>

                            <%
								for (Reservation r : list) {
							%>
                            <label style="display: block; color: black;"> <input type="radio" class="movie" name="movie" value="<%=r.getRmovie()%>" onclick="radio_chk();">
                            <%=r.getRageLimit()%>세 관람가 <%=r.getRmovie()%></label> <br>


                            <%
								}
							%>

                        </div>

                        <div id="ms_1_3" style="display: none; color: black; overflow: scroll; height: 300px;">

                            &nbsp;&nbsp;&nbsp;&nbsp; 가나다순 <br>
                            <hr>
                        </div>


                    </div>
                    <div id="myMovie" class="myMovie">
                        <strong>선택한 영화 : </strong>
                    </div>
                    <div id="ms_2">
                        <div id="ms_2_title">인원선택 (1인 4매까지 선택 가능)</div>
                        <div id="ms_2_adult">
                            <label for="">성인(명) </label> <input type="radio" name="adult" id="ad1" value="" onclick="num_ck();"> <label for="ad1">0</label>

                            <input type="radio" name="adult" id="ad1" value="성인 1명 " onclick="num_ck();"> <label for="ad1">1</label> <input type="radio" name="adult" id="ad2" value="성인 2명 " onclick="num_ck();"> <label for="ad2">2</label> <input type="radio" name="adult" id="ad3" value="성인 3명 " onclick="num_ck();"> <label for="ad3">3</label> <input type="radio" name="adult" id="ad4" value="성인 4명 " onclick="num_ck();"> <label for="ad4">4</label>


                        </div>
                        <div id="ms_2_child">

                            <label for="">청소년(명) </label> <input type="radio" name="child" id="ch" value="" onclick="num_ck();"> <label for="ch">0</label>
                            <input type="radio" name="child" id="ch1" value="청소년 1명 " onclick="num_ck();"> <label for="ch1">1</label> <input type="radio" name="child" id="ch2" value="청소년 2명 " onclick="num_ck();"> <label for="ch2">2</label> <input type="radio" name="child" id="ch3" value="청소년 3명 " onclick="num_ck();"> <label for="ch3">3</label> <input type="radio" name="child" id="ch4" value="청소년 4명 " onclick="num_ck();"> <label for="ch4">4</label>


                        </div>
                    </div>

                </div>
                <div id="theaterSelect" class="form">
                    <div id="ts_1">극장선택</div>
                    <div id="ts_2">
                        <div id="ts_2_1">
                            <input type="text" id="searchtheater" placeholder="극장 검색">
                            <input type="button" value="search" id="searchbtn">
                        </div>
                    </div>

                    <div class="menu">
                        <input type="button" value="전체영화관보기" id="viewall">
                        <!-- onclick="showday();" -->
                    </div>

                    <p class="contents" style="background: whitesmoke;">
                        <input type="radio" id="cinema1" name="cinema" value="역삼점" onclick="placeCk();"> <label for="cinema1">역삼점</label> <br>
                        <input type="radio" id="cinema2" name="cinema" value="사당점" onclick="placeCk();"> <label for="cinema2">사당점</label> <br>
                        <input type="radio" id="cinema3" name="cinema" value="지옥점" onclick="placeCk();"> <label for="cinema3">지옥점</label>
                    </p>


                    <div>
                        <fieldset id="searchResult">
                            <legend>검색 결과</legend>
                            <br>
                            <hr>
                            <div id="resultPlace">검색결과를 보여드립니다!</div>
                        </fieldset>


                    </div>
                </div>


                <script>
                    // 가나다순 정렬 에이작스 	
                    $('#ms_btn2').click(function() {
                        $.ajax({
                            url: "/Semi/abc.go",
                            type: "get",
                            success: function(data) {

                                $('#ms_1_2').css(
                                    'display',
                                    'none');
                                $('#ms_1_3').css(
                                    'display',
                                    'block');
                                console.log(data);

                                var $div = $('#ms_1_3');

                                $('#ms_1_3').children()
                                    .remove()
                                $div.append("<hr>");

                                for (var ara in data) {

                                    $div.append("<label style='display:block; color:black;'> <input type='radio' name='movie' onclick='radio_chk();'value='" +
                                        data[ara].movieTitle +
                                        "'>" +
                                        data[ara].ageLimit +
                                        " 세 관람가&nbsp;" +
                                        data[ara].movieTitle +
                                        "</label><br>");
                                }

                            },
                            error: function() {
                                console.log("에러입니다.");
                            }
                        });
                    });

                    // 영화 선택 라디오 버튼 
                    function radio_chk() {

                        var movie_btn = document.getElementsByName("movie");
                        var myMovie = document.getElementById('myMovie');
                        var select = "선택한 영화 : ";
                        var movie_title = "영화 이름 : ";
                        var movieName = document.getElementById("movieName");

                        var movie_btn_check = 0;
                        for (var i = 0; i < movie_btn.length; i++) {

                            if (movie_btn[i].checked == true) {

                                myMovie.style.backgroundColor = "#505984";
                                myMovie.style.color = "white";
                                myMovie.innerHTML = select + movie_btn[i].value;
                                movieName.innerHTML = movie_btn[i].value;

                                movie_btn_check++;
                                // 포스터 이미지 가져오기 작스 
                                $
                                    .ajax({
                                        url: "/Semi/search.image",
                                        type: "get",
                                        data: {
                                            movie: $("#movieName").text()
                                        },
                                        success: function(data) {
                                            console.log("사진 가져오기 검색 성공!");
                                            var str = ''
                                            var $div = $('#if_2');

                                            $('#if_2').children().remove();

                                            for (var i = 0; i < data.length; i++) {
                                                $div
                                                    .append("<img src='/Semi/resource/images/" +
                                                        data[i].image +
                                                        "' alt= '" +
                                                        data[i].title +
                                                        "'width='90%' height='90%' style='margin-top: 5%;'>");

                                            }

                                        },
                                        error: function(data) {
                                            console.log("사진 가져오기 실패!");

                                        }
                                    });

                            }
                            movie_btn_check = 0;
                        }
                    }
                </script>

                <script>
                    // 검색하기 작스 
                    $('#searchbtn').click(function() {

                        $('.days').attr('disabled', false);
                        $('#ds_1').css('background', '#505984');

                        $.ajax({
                                url: "/Semi/search.go",
                                type: "get",
                                data: {
                                    search: $('#searchtheater').val()
                                },
                                success: function(data) {
                                    console.log("검색 성공!");
                                    console.log(data);
                                    var str = ''
                                    var $div = $('#resultPlace');

                                    $('#resultPlace').children().remove();

                                    if (data.length != 0) {
                                        for (var i = 0; i < data.length; i++) {
                                            $div
                                                .append("<label style='display:block; color:black;font-size:15px; text-align:left;'> <input type='radio' name='cinema' onclick='placeCk();'value='" +
                                                    data[i].cinemaName +
                                                    "'>" +
                                                    data[i].cinemaName +
                                                    "</label>");
                                        }
                                        $div.append(str);
                                    } else {
                                        $div
                                            .append("<br><label style='display:block; color:black;font-size:13px; color:red; text-align:center;'> 해당 검색결과가 없습니다. </label>");

                                    }

                                },
                                error: function(data) {
                                    console.log("실패!");

                                }
                            });

                    });
                </script>

                <script>
                    $('#viewall,#searchbtn')
                        .one(
                            "click",
                            function(event) {

                                var week = new Array('일', '월', '화',
                                    '수', '목', '금', '토');

                                var $dayLi = $('#ds_3_day');
                                var $div = $('#ds_2_1');

                                $('#ds_3_day').children().remove();
                                $('#ds_2_1').children().remove();

                                for (var i = 0; i < 7; i++, date += 1) {
                                    var today = new Date()
                                    today.setDate(today.getDate() + i);

                                    var date = today.getDate();
                                    var month = today.getMonth() + 1;
                                    var day = week[today.getDay()];

                                    $dayLi
                                        .append("<input type='radio' name='day' id='day" + [i] + "' value ='" + month + "월" + date +
                                            "일'> <label onclick = 'dayck();' style='font-size:14px; padding-left:5px;' for='day" +
                                            [i] +
                                            "'>" +
                                            date +
                                            "일&nbsp;" +
                                            day +
                                            "요일 </label><br>");
                                }

                                $div
                                    .append("<span style='font-size: 20px;'> " +
                                        2020 +
                                        "  </span> <br>" +
                                        "<span style='font-size: 30px;'><strong>" +
                                        month +
                                        " </strong> </span>");
                            });
                </script>


                <div id="daySelect" class="form">
                    <div id="ds_1">날짜선택</div>
                    <div id="ds_2">
                        <div id="ds_2_1">
                            <b><span id="yearSpan"> </span></b> <span id="monthSpan"></span>

                        </div>
                    </div>
                    <div id="ds_3">

                        <div id="ds_3_day" style="width: 100%; text-align: left;"></div>
                    </div>
                </div>
                <div id="timeSelect" class="form">
                    <div id="tss_1">상영시간선택</div>
                    <div id="tss_2">
                        <div id="tss_2_1">
                            <fieldset id="tss_timetable" style="border: none;">
                                <legend class="movietime">
                                    <strong>상영시간</strong>
                                </legend>

                            </fieldset>
                        </div>
                    </div>
                    <div id="tss_3"></div>
                </div>
                <div id="information" class="form">
                    <div id="if_1">선택한정보확인창</div>
                    <div id="if_2">
                        <!-- <img src="../resource/images/movie_image (1).jpg" alt="라라랜드 포스터"
							width="90%" height="90%" style="margin-top: 5%;"> -->
                    </div>
                    <div id="if_3">
                        <ul style="padding: 10px;">
                            <hr>
                            <!-- 	<input type="hidden" id="1_1" value=""/> 
							<input type="hidden" id="1_2" value=""/> 
							<input type="hidden" id="1_3" value=""/> 
							<input type="hidden" id="1_4" value=""/> 
							<input type="hidden" id="1_5" value=""/> 
							<input type="hidden" id="1_6" value=""/> 
							 -->
                            <li id="movieName1">영화 이름 : <span id='movieName'></span></li>
                            <li>예매 인원 수 :</li>
                            <li id="adult_num"></li>
                            <li id="child_num"></li>
                            <li id="cinema1">상영 극장 : <span id="cinema"> </span></li>
                            <li id="selectime">상영 날짜 : <span id="sday"> </span></li>
                            <li id="selectime">상영 시간 : <span id='Stime'> </span>
                            </li>

                            <hr>
                        </ul>

                    </div>

                    <script>
                        // 날짜 체크시 시간불러오는 에이작스 가동 
                        function dayck() {
                            var day = $("input:radio[name='day']:checked").val();
                            if (day != "") {
                                $.ajax({
                                    url: "/Semi/search.time",
                                    type: "get",
                                    success: function(data) {
                                        console.log("시간  가져오기 검색 성공!");
                                        console.log(data);
                                        var str = ''
                                        var $div = $('#tss_timetable');
                                        $('#tss_timetable').children().remove()

                                        $div.append("<legend class='movietime'><strong>상영시간</strong></legend>");
                                        for (var i = 0; i < data.length; i++) {
                                            $div.append("<label style='display:block; color:black;font-size:20px; padding-left:45px; text-align:left;'> <input type='radio' name='timeck' onclick='timeCk();'value='" +
                                                data[i].showTime +
                                                "'>" +
                                                data[i].showTime +
                                                "</label>");
                                        }
                                        $("#sday").html($("input:radio[name='day']:checked").val());
                                        console.log("실패!");
                                    }
                                });
                            }

                        }
                    </script>

                    <div id="if_4">
                        <input type="button" id="rs_button" value="좌석선택하기">
                    </div>


                    <!-- 좌석 모달 div 시작 -->
                    <div id="seatModal" class="reservation_modal">

                        <!-- 모달 내용 -->
                        <div class="reservation_modal_content" id="reservation_modalContent">
                            <span class="close" id="seatclose">&times;</span>
                            <div id="left">
                                <div id="screen">
                                    <label>screen</label>
                                </div>
                                <table id='seat table'>
                                    <tr>
                                        <td>출구</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>출구</td>
                                    </tr>
                                    <tr>
                                        <td><button type="button" id="A1" onclick="buttonClick(this);">A1</button></td>
                                        <td><button type="button" id="A2" onclick="buttonClick(this);">A2</button></td>
                                        <td></td>
                                        <td><button type="button" id="A3" onclick="buttonClick(this);">A3</button></td>
                                        <td><button type="button" id="A4" onclick="buttonClick(this);">A4</button></td>
                                        <td><button type="button" id="A5" onclick="buttonClick(this);">A5</button></td>
                                        <td><button type="button" id="A6" onclick="buttonClick(this);">A6</button></td>
                                        <td><button type="button" id="A7" onclick="buttonClick(this);">A7</button></td>
                                        <td><button type="button" id="A8" onclick="buttonClick(this);">A8</button></td>
                                        <td></td>
                                        <td><button type="button" id="A9" onclick="buttonClick(this);">A9</button></td>
                                        <td><button type="button" id="A10" onclick="buttonClick(this);">A10</button></td>
                                    </tr>
                                    <tr>
                                        <td><button type="button" id="B1" onclick="buttonClick(this);">B1</button></td>
                                        <td><button type="button" id="B2" onclick="buttonClick(this);">B2</button></td>
                                        <td></td>
                                        <td><button type="button" id="B3" onclick="buttonClick(this);">B3</button></td>
                                        <td><button type="button" id="B4" onclick="buttonClick(this);">B4</button></td>
                                        <td><button type="button" id="B5" onclick="buttonClick(this);">B5</button></td>
                                        <td><button type="button" id="B6" onclick="buttonClick(this);">B6</button></td>
                                        <td><button type="button" id="B7" onclick="buttonClick(this);">B7</button></td>
                                        <td><button type="button" id="B8" onclick="buttonClick(this);">B8</button></td>
                                        <td></td>
                                        <td><button type="button" id="B9" onclick="buttonClick(this);">B9</button></td>
                                        <td><button type="button" id="B10" onclick="buttonClick(this);">B10</button></td>
                                    </tr>
                                    <tr>
                                        <td><button type="button" id="C1" onclick="buttonClick(this);">C1</button></td>
                                        <td><button type="button" id="C2" onclick="buttonClick(this);">C2</button></td>
                                        <td>통로</td>
                                        <td><button type="button" id="C3" onclick="buttonClick(this);">C3</button></td>
                                        <td><button type="button" id="C4" onclick="buttonClick(this);">C4</button></td>
                                        <td><button type="button" id="C5" onclick="buttonClick(this);">C5</button></td>
                                        <td><button type="button" id="C6" onclick="buttonClick(this);">C6</button></td>
                                        <td><button type="button" id="C7" onclick="buttonClick(this);">C7</button></td>
                                        <td><button type="button" id="C8" onclick="buttonClick(this);">C8</button></td>
                                        <td>통로</td>
                                        <td><button type="button" id="C9" onclick="buttonClick(this);">C9</button></td>
                                        <td><button type="button" id="C10" onclick="buttonClick(this);">C10</button></td>
                                    </tr>
                                    <tr>
                                        <td><button type="button" id="D1" onclick="buttonClick(this);">D1</button></td>
                                        <td><button type="button" id="D2" onclick="buttonClick(this);">D2</button></td>
                                        <td></td>
                                        <td><button type="button" id="D3" onclick="buttonClick(this);">D3</button></td>
                                        <td><button type="button" id="D4" onclick="buttonClick(this);">D4</button></td>
                                        <td><button type="button" id="D5" onclick="buttonClick(this);">D5</button></td>
                                        <td><button type="button" id="D6" onclick="buttonClick(this);">D6</button></td>
                                        <td><button type="button" id="D7" onclick="buttonClick(this);">D7</button></td>
                                        <td><button type="button" id="D8" onclick="buttonClick(this);">D8</button></td>
                                        <td></td>
                                        <td><button type="button" id="D9" onclick="buttonClick(this);">D9</button></td>
                                        <td><button type="button" id="D10" onclick="buttonClick(this);">D10</button></td>
                                    </tr>
                                    <tr>
                                        <td><button type="button" id="E1" onclick="buttonClick(this);">E1</button></td>
                                        <td><button type="button" id="E2" onclick="buttonClick(this);">E2</button></td>
                                        <td></td>
                                        <td><button type="button" id="E3" onclick="buttonClick(this);">E3</button></td>
                                        <td><button type="button" id="E4" onclick="buttonClick(this);">E4</button></td>
                                        <td><button type="button" id="E5" onclick="buttonClick(this);">E5</button></td>
                                        <td><button type="button" id="E6" onclick="buttonClick(this);">E6</button></td>
                                        <td><button type="button" id="E7" onclick="buttonClick(this);">E7</button></td>
                                        <td><button type="button" id="E8" onclick="buttonClick(this);">E8</button></td>
                                        <td></td>
                                        <td><button type="button" id="E9" onclick="buttonClick(this);">E9</button></td>
                                        <td><button type="button" id="E10" onclick="buttonClick(this);">E10</button></td>
                                    </tr>
                                    <tr>
                                        <td><button type="button" id="F1" onclick="buttonClick(this);">F1</button></td>
                                        <td><button type="button" id="F2" onclick="buttonClick(this);">F2</button></td>
                                        <td></td>
                                        <td><button type="button" id="F3" onclick="buttonClick(this);">F3</button></td>
                                        <td><button type="button" id="F4" onclick="buttonClick(this);">F4</button></td>
                                        <td><button type="button" id="F5" onclick="buttonClick(this);">F5</button></td>
                                        <td><button type="button" id="F6" onclick="buttonClick(this);">F6</button></td>
                                        <td><button type="button" id="F7" onclick="buttonClick(this);">F7</button></td>
                                        <td><button type="button" id="F8" onclick="buttonClick(this);">F8</button></td>
                                        <td></td>
                                        <td><button type="button" id="F9" onclick="buttonClick(this);">F9</button></td>
                                        <td><button type="button" id="F10" onclick="buttonClick(this);">F10</button></td>
                                    </tr>
                                    <tr>
                                        <td>출구</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>출구</td>
                                    </tr>
                                    <tr>
                                        <td><button type="button" id="G1" onclick="buttonClick(this);">G1</button></td>
                                        <td><button type="button" id="G2" onclick="buttonClick(this);">G2</button></td>
                                        <td>통로</td>
                                        <td><button type="button" id="G3" onclick="buttonClick(this);">G3</button></td>
                                        <td><button type="button" id="G4" onclick="buttonClick(this);">G4</button></td>
                                        <td><button type="button" id="G5" onclick="buttonClick(this);">G5</button></td>
                                        <td><button type="button" id="G6" onclick="buttonClick(this);">G6</button></td>
                                        <td><button type="button" id="G7" onclick="buttonClick(this);">G7</button></td>
                                        <td><button type="button" id="G8" onclick="buttonClick(this);">G8</button></td>
                                        <td>통로</td>
                                        <td><button type="button" id="G9" onclick="buttonClick(this);">G9</button></td>
                                        <td><button type="button" id="G10" onclick="buttonClick(this);">G10</button></td>
                                    </tr>
                                    <tr>
                                        <td><button type="button" id="H1" onclick="buttonClick(this);">H1</button></td>
                                        <td><button type="button" id="H2" onclick="buttonClick(this);">H2</button></td>
                                        <td></td>
                                        <td><button type="button" id="H3" onclick="buttonClick(this);">H3</button></td>
                                        <td><button type="button" id="H4" onclick="buttonClick(this);">H4</button></td>
                                        <td><button type="button" id="H5" onclick="buttonClick(this);">H5</button></td>
                                        <td><button type="button" id="H6" onclick="buttonClick(this);">H6</button></td>
                                        <td><button type="button" id="H7" onclick="buttonClick(this);">H7</button></td>
                                        <td><button type="button" id="H8" onclick="buttonClick(this);">H8</button></td>
                                        <td></td>
                                        <td><button type="button" id="H9" onclick="buttonClick(this);">H9</button></td>
                                        <td><button type="button" id="H10" onclick="buttonClick(this);">H10</button></td>
                                    </tr>
                                    <tr>
                                        <td><button type="button" id="I1" onclick="buttonClick(this);">I1</button></td>
                                        <td><button type="button" id="I2" onclick="buttonClick(this);">I2</button></td>
                                        <td></td>
                                        <td><button type="button" id="I3" onclick="buttonClick(this);">I3</button></td>
                                        <td><button type="button" id="I4" onclick="buttonClick(this);">I4</button></td>
                                        <td><button type="button" id="I5" onclick="buttonClick(this);">I5</button></td>
                                        <td><button type="button" id="I6" onclick="buttonClick(this);">I6</button></td>
                                        <td><button type="button" id="I7" onclick="buttonClick(this);">I7</button></td>
                                        <td><button type="button" id="I8" onclick="buttonClick(this);">I8</button></td>
                                        <td></td>
                                        <td><button type="button" id="I9" onclick="buttonClick(this);">I9</button></td>
                                        <td><button type="button" id="I10" onclick="buttonClick(this);">I10</button></td>
                                    </tr>
                                    <tr>
                                        <td><button type="button" id="J1" onclick="buttonClick(this);">J1</button></td>
                                        <td><button type="button" id="J2" onclick="buttonClick(this);">J2</button></td>
                                        <td></td>
                                        <td><button type="button" id="J3" onclick="buttonClick(this);">J3</button></td>
                                        <td><button type="button" id="J4" onclick="buttonClick(this);">J4</button></td>
                                        <td><button type="button" id="J5" onclick="buttonClick(this);">J5</button></td>
                                        <td><button type="button" id="J6" onclick="buttonClick(this);">J6</button></td>
                                        <td><button type="button" id="J7" onclick="buttonClick(this);">J7</button></td>
                                        <td><button type="button" id="J8" onclick="buttonClick(this);">J8</button></td>
                                        <td></td>
                                        <td><button type="button" id="J9" onclick="buttonClick(this);">J9</button></td>
                                        <td><button type="button" id="J10" onclick="buttonClick(this);">J10</button></td>
                                    </tr>

                                </table>
                            </div>
                            <div id="right">
                                <div class="info">
                                    <label>극장명 : </label> <label id="cinema">어디어디</label> <br>
                                    <label>영화 </label><br> <img src="../resource/images/movie_image (1).jpg" alt="영화포스터" width="200px" height="300px"><br> <label id="movieName">영화 이름</label>
                                    <br> <br> <label>상영시간 : </label> <label id="showTime">00시00분</label> <br> <br> <label>선택한 좌석명 : </label><br> <label id="seatNo"></label>
                                </div>
                                <div class="price">
                                    <hr>
                                    <label>금액 : </label> <label id="price">30000</label> <label>원</label>
                                    <hr>
                                </div>
                                <div id="payDiv">
                                    <input type="button" value="결제선택" id="payBtn">
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- 좌석 모달 div 끝 -->

                    <script>
                        //모달 스크립트
                        var seatmodal = document.getElementById('seatModal');
                        var seatclose = document.getElementById('seatclose');
                        var rs_btn = document.getElementById("rs_button");

                        //버튼을 누르면 모달이 나타나는 기능
                        /* $('#rs_btn').click(function(){
                        	$('#seatModal').show();
                        });
                        $('#seatclose').click(function(){
                        	$('#seatModal').hide();
                        }); */

                        rs_btn.onclick = function() {
                            seatmodal.style.display = "block";
                        }

                        // x누르면 모달이 꺼지는 기능
                        seatclose.onclick = function() {
                            seatmodal.style.display = "none";
                        }


                        /* // 검은 바탕 클릭시 꺼지는 기능
                         window.onclick = function (event) {
                          if (event.target == modal) {
                         modal.style.display = "none";
                          }
                          } */

                        /* 	$('#rs_button').click(function(){
                        		$('#seatmodal').css('display','block');
                        	});
                        
                         */
                    </script>

                    <!-- 결제 모달 div 시작 -->
                    <div id="payModal" class="reservation_modal">

                        <div class="reservation_modal_content">
                            <span class="close" id="payclose">&times;</span>
                            <h1>결제 페이지</h1>
                            <hr>
                            <div id="leftPay">
                                <div></div>
                                <div id="payselectdiv">
                                    <h2>결제 수단 선택</h2>
                                    <hr>
                                    <form>
                                        <input type="radio" id="kakaopay" name="payselect"><label for="kakaopay">카카오 페이</label> <input type="radio" id="card" name="payselect"><label for="card">신용카드</label>
                                    </form>
                                </div>
                            </div>
                            <div id="rightPay">
                                <div class="infoPay">
                                    <label>극장명 : </label> <label id="">어디어디</label> <br> <label>영화
                                        : </label><br> <img src="../resource/images/movie_image (1).jpg" alt="영화포스터" width="150px" height="225px"><br> <label id="">영화 이름</label> <br> <label>상영시간 : </label> <label id="">00시00분</label> <br> <label>인원수 : 청소년 2명 성인
                                        2명</label> <label id=""></label>
                                </div>
                                <div class="pricePay">
                                    <hr>
                                    <label>최종 금액 : </label> <label id="">30000</label> <label>원</label>
                                    <hr>
                                </div>
                                <div id="payDiv">
                                    <h3>결제확인</h3>
                                    <input type="button" value="이전" id="backbtn">
                                    <input type="button" value="결제" id="paybtn">
                                </div>
                            </div>
                        </div>

                    </div>
                    <!--  결제 모달 div 끝  -->

                </div>
            </div>
        </div>

        <script>
            $(document).on("click", "#paybtn", function() {
                location.href = '/Semi/views/payment/payment.jsp';
            });
        </script>

    </form>
    <%@ include file="../common/footer.jsp"%>


</body>

</html>