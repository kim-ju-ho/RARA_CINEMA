<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/Semi/resource/css/사이드바.css">
  <style>
        .container {
            width: 1000px;
            margin: auto;
            margin-bottom: 200px;
        }

        #logo {
            margin-left: 30%;
            
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


    <div class="container">
       


            <hr>

            <h1 id="area">채용안내</h1>
            <p>라라 시네마는 미래지향적인 마인드와 신념과 야먕을 가지고 성실한게 같이 회사를 가꾸어 나갈 인재를 찾고 있습니다.
                공정하고 투명한 채용과 평등한 기회 제공하고 있으며,
                변화에 능동적이고 실패를 두려워하지 않은 사람과, 영화를 사랑하는 사람들이 함께 성장하고 있습니다.
            </p>
            

            <div id="logo3">
                <img id="logo3" src="/Semi/resource/images/RMlogo2.png" alt="로고">
            </div>



            <h1 id="area">인재상</h1>
            <p id="p1">라라시네마 인재상은 우리 시대를 규정하는 디지털과 글로벌의 파고는 기존의 경쟁방식으로는
                기업의 존속을 보장해주지 않는 시대를 열었습니다.이제는 과거의 방식, 남이 하는 방식이 아닌 우리만의 경쟁력을 찾아내고, 지속적인 혁신과 개선이 없이는 어느 누구도 살아 남을 수 없는
                환경이 되었습니다. 숨쉴 틈도 없이 변화하는 세상, 이제는 앉아서 기다리지 않고 적극적으로 대응하여 먼저 변화를 이끌어가는 기업만이 생존할 수 있습니다. 이제 롯데는 그간의 성공신화를
                넘어, 국내 굴지의 기업군에서 세계속의 강자로 군림하기 위한 경주를 하고 있습니다.<br>
                세계 속에 우뚝 선 아름다운 롯데의 꿈에 동참할 젊은이를 모십니다.
                저희 롯데는 현재의 모습이 아닌 미래에 그가 만들어 갈 수 있는 가능성에 더 높은 가치를 두고 있으며, 자신의 성장과 함께 
                우리 사회를 성숙시켜 나갈 젊은이를 찾습니다.
                우리의 영원한 꿈인 ‘사랑(LOVE)이 넘치는 세상’, ‘자유(LIBERTY)가 숨 쉬는 사회’, ‘풍요로운 삶(LIFE)을 누구나 누리는 미래’를 만들어가는 꿈에 동참할 다음과 같은
                젊은이를 모십니다.<br>
                젊고 원대한 여러분의 꿈을 투자하십시오! </p>
        
       
    </div>
            
     <%@ include file="../common/footer.jsp"%>

</body>
</html>