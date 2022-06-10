<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.semi.movie.model.vo.*"%>
    <%
    Movie mv = (Movie)request.getAttribute("m"); 
    
    
    String photoArr[] = mv.getMphotopath().split(", ");
    
    String photo1 = photoArr[0];
    String photo2 = photoArr[1];
    String photo3 = photoArr[2];
    
    String actorArr[] = mv.getActor().split(", ");
    
    String actor1 = actorArr[0];
    String actor2 = actorArr[1];
    String actor3 = actorArr[2];
    
    
    
 
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 정보 페이지</title>
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
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script src="../resource/js/header.js"></script>
 <style>
        * {
            font-family: 'Noto Sans KR', sans-serif;
        }
        div {
            box-sizing: border-box;
        }

        /* 나는   바디 */
        #wrapper1 {
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
            padding-left: 2%;
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

        /* ~클릭시 바뀔부분 1, 영화정보 페이지~ */
        #storyFrame {
            width: 100%;
            height: 100%;
            float: left;
            box-sizing: border-box;
            display: block;
        }

        /* 스토리 */
        #story {
            width: 100%;
            height: 200px;
        }

        #story>p {
            padding-top: 20px;
            padding-left: 20px;
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

        /* 성비,평점 */
        #gender,
        #score {
            width: 50%;
            height: 300px;
            float: left;
            box-sizing: border-box;
        }

        #gender {
            border-right: 1px solid #505984  ;
        }

        #gender_piechart {
            width: 99%;
            height: 80%;
            margin-top: 50px;
        }

        /* 트레일러 */
        #trailerBox {
            width: 100%;
            height: 550px;
            float: left;
        }
        #trailerTitle{
            margin-top: 10px;
            
        }

        /* 스틸컷 */
        #photobox {
            width: 100%;
            height: 350px;
            float: left;
        }

        /* 감독,배우사진 */
        #perfomerbox {
            width: 100%;
            height: 200px;
            float: left;
            margin-left: 129px;
        }
        #perfomer{
            margin-top: 10px;
        }

        /* 사진들 들어가는 프레임 */
        .p {
            width: 111px;
            height: 139px;
            float: left;
            margin-left: 5%;
            margin-top: 10px;
            border: 1px solid lightgray;
        }

        /* 사진들 */
        .p>img {
            width: 100%;
            height: 100%;
        }

        /* 사진 밑에 이름들 */
        .pn,
        .an {
            width: 200px;
    height: 10px;
    float: left;
    font-size: 15px;
    margin-left: 7%;
        }

        /* 가장 하단에 있을부분 */
        #ad1 {
            width: 1000px;
            height: 200px;
            float: left;
        }

        #footer{
        margin-top: 100px;
        width: 100%;
        height: 100px;
        float: left; 
        background: #505984; 
        color: #c6c6c6; 
        text-align: center;
        text-decoration: none;
        list-style: none;
        }
        a {
        color: white;
        }
        li{
            list-style: none;
        }

        /* 사이드바 */
        #asidecontent {
            width: 100px;
            height: 300px;
            box-sizing: border-box;
            position: fixed;
            float: right;
            padding: 0%;
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
        
       
            ul,li{list-style:none;}
            #slide{    
            height: 302px;
    		width: 464px;
		    
		    position: relative;
		    overflow: hidden;
		    margin: 0 auto;
		    top: 35px;}
		
            #slide ul{width:400%;height:100%;transition:1s;}
            #slide ul:after{content:"";display:block;clear:both;}
            #slide li{float:left;width:25%;height:100%;}
    
            #slide input{display:none;}
            #slide label{display:inline-block;vertical-align:middle;width:10px;height:10px;border:2px solid #666;background:#fff;transition:0.3s;border-radius:50%;cursor:pointer;}
            #slide .pos{text-align:center;position:absolute;bottom:10px;left:0;width:100%;text-align:center;}
            #pos1:checked~ul{margin-left:0%;}
            #pos2:checked~ul{margin-left:-100%;}
            #pos3:checked~ul{margin-left:-200%;}

            #pos1:checked~.pos>label:nth-child(1){background:#666;}
            #pos2:checked~.pos>label:nth-child(2){background:#666;}
            #pos3:checked~.pos>label:nth-child(3){background:#666;}

    
			.star-rating {width:304px; }
			.star-rating,.star-rating span {display:inline-block; height:55px; overflow:hidden; background:url(/Semi/resource/images/star.png)no-repeat; }
			.star-rating span{background-position:left bottom; line-height:0; vertical-align:top; }
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div>
	<div id="wrapper1">
        <div id="body"></div>
        <div id="movieinfo">
            <div id="minfoTitle" class="title"> 영화 상세페이지 </div>
            <div id="mimg">
                <img src="/Semi/resource/images/<%= mv.getPoster_path()%>" alt="영화 포스터1">
                <br>
                <button id="bookbtn" onclick="alert('로그인을 해주세요!');">예매하기</button>
            </div>

            <div id="mcontent">
                영화 제목 : <%= mv.getMovieTitle()%><br>
                영화 감  독 :<%= mv.getDirector()%><br>
                영화 배우 :<%= mv.getActor()%><br>
                상영시간 : <%= mv.getRunningTime()%>분<br>
            </div>
        </div>

        <div id="icbutton">
            <div id="minfo">
                <button id="minfobtn" onclick="location.href='/Semi/movie.mo?no=<%=mv.getMovieNo()%>'"> 영화 정보 버튼</button>
            </div>
            <div id="coment"> 
                <button id="comentbtn" onclick="location.href='/Semi/reviewList.rl?no=<%=mv.getMovieNo()%>'"> 평점 및 관람평</button>
            </div>
        </div>

        <div id="storyFrame">
            <!--스토리, 예매분포, 별점-->
            <div id="story">
                <p>
                    <%= mv.getMovieInfo() %>
                </p>
            </div>

            <div id="gender">
                <div id="genderTitle" class="title">성별예매 분포</div>
                <div id="gender_piechart"></div>
                <script type="text/javascript">
                    google.load("visualization", "1", { packages: ["corechart"] });
                    google.setOnLoadCallback(drawChart);
                    function drawChart() {
                        var data = google.visualization.arrayToDataTable([["Gender", "Rating"], ["Fmale", 5], ["Male", 3]]);
                        var options = { title: "Gender Ratings" };
                        var chart = new google.visualization.PieChart(document.getElementById("gender_piechart"));
                        chart.draw(data, options);
                    }
                    
                  
                </script>

            </div>
            <div id="score">
                <div id="scoreTitle" class="title">관람평점</div>
                <div class="wrap-star">
                    <h2>Width="30%"</h2>
                    <div class='star-rating'>
                        <span style ="width:30%"></span>
                    </div>
                </div>
                
            </div>
            <div id="trailerTitle" class="title">메인트레일러</p>
            </div>
            <div id="trailerBox">
                <iframe width="800" height="450" url=<%= mv.getTrailerURL() %> ></iframe>
            </div>
            
            <script>
            
        	$(function(){
	            
	            
            console.log('photoArr',photoArr);
            console.log('photo1',photo1);
            
			
      		});
            </script>

            <div id="photo" class="title">스틸컷</div>
            <div id="photobox">
               <div id="slide">
                    <input type="radio" name="pos" id="pos1" checked 
                    
                   >
                    <input type="radio" name="pos" id="pos2">
                    <input type="radio" name="pos" id="pos3">
            
                    <ul>
                        <li style="background:url(/Semi/resource/images/<%= photo1 %>);"></li>
                        <li style="background:url(/Semi/resource/images/<%= photo2 %>);">></li>
                        <li style="background:url(/Semi/resource/images/<%= photo3 %>);">></li>
               
                    </ul>
                    <p class="pos">
                        <label for="pos1" ></label>
                        <label for="pos2"></label>
                        <label for="pos3"></label>
                    
                    </p>
                </div>
            </div>
           

            <div id="perfomer" class="title">감독및 배우</div>
            <div id="perfomerbox">
                <div class="p -1">
                    <img src="/Semi/resource/images/<%=mv.getDirector()%>.png" alt="">
                     <div class="pn -1"><%=mv.getDirector()%></div>
                </div>
                <div class="p -2">
                    <img src="/Semi/resource/images/<%= actor1 %>.png"  alt="">
                    <div class="pn -2"><%= actor1 %></div>
                    
                </div>
                <div class="p -3">
                    <img src="/Semi/resource/images/<%= actor2 %>.png"  alt="">
                     <div class="pn -3"><%= actor2 %></div>
                </div>
                <div class="p -4">
                    <img src="/Semi/resource/images/<%= actor3 %>.png"  alt="">
                     <div class="pn -4"><%= actor3 %></div>
                </div>
      
      
            </div>
        </div>
        
        <div id="ad1">
        <br><br><br>

       <img src="/Semi/resource/images/Tenet.jpg" ></div>
       
    
    </div>
       <%@ include file="../common/footer.jsp"%>
    </div>
</body>

</html>