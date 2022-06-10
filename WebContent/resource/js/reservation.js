

$(() => {
    // 처음 모든 .form의 input, button을 disabled상태로 만듬
    const form$ = $(".form").slice(1);
    form$.find('#ad1,#ad2,#ad3,#ad4,#ch1,#ch2,#ch3,#ch4,#viewall,#searchtheater').attr('disabled', true);
    // 아직 비활성화를 전부 적용한것이 아니기 때문에 페이지 흐름을 위해 일부 버튼은 강제로 활성화시켜놓음!! 
    form$.find('#rs_button,#payBtn,#paybtn').attr('disabled', false);
    $('#ms').css('background', '#505984');

});

$(function () {
    $('#ms_btn1,#ms_btn2').click(function () {
        $('#ad1,#ad2,#ad3,#ad4,#ch1,#ch2,#ch3,#ch4').attr('disabled', false);

        $('#ms_2_title').css('background', '#505984');

    });  

    $('#ad1,#ad2,#ad3,#ad4,#ch1,#ch2,#ch3,#ch4').click(function () {
        $('#viewall,#searchtheater,#searchbtn,#cinema1,#cinema2,#cinema3').attr('disabled', false);
        $('#ts_1,#searchbtn,#viewall').css('background', '#505984');
        $('#ts_1,#searchbtn,#viewall').css('color', 'white');

    });
    
    // 날짜 선택 라디오 활성화 
    
    $('#viewall,#searchbtn').click(function () {
        $('#day0,#day1,#day2,#day3').attr('disabled', false);
        $('#ds_1').css('background', '#505984');
    });
});


// 영화관 전체보기 토글 
$(function () {
    $('.contents').slideUp();
    $('.menu').click(function () {
        // $(this).next('p').slideDown();
        $(this).next('p').slideToggle(1000, function () {
            
        });
    });
});

$(document).ready(function () {
    $('.bxslider').bxSlider({
        auto: true, // 자동으로 애니메이션 시작
        speed: 500,  // 애니메이션 속도
        pause: 2000,  // 애니메이션 유지 시간 (1000은 1초)
        mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
        autoControls: true, // 시작 및 중지버튼 보여짐
        pager: true, // 페이지 표시 보여짐
        captions: false, // 이미지 위에 텍스트를 넣을 수 있음
    });
});







var paymodal = document.getElementById('payModal');
var seatmodal = document.getElementById('seatmodal');

$(document).on("click","#payBtn",function(){
	$('#seatmodal').show();
    $('#payModal').show();
});
$(document).on("click","#payclose",function(){
	$('#payModal').hide();
	$('#seatmodal').hide();
});
$(document).on("click","#backbtn",function(){
	$('#payModal').hide();
	$('#seatmodal').show();
});

$(document).on("click","#rs_button",function(){
	$('#seatmodal').show();
});

$(document).on("click","#seatclose",function(){
	$('#seatmodal').hide();
});



function buttonClick(button) {
    var buttons = document.getElementsByClassName('seatBtn');
    var str = button.innerHTML;
    var btn = document.getElementById(str);
    var seatNo = document.getElementById('seatNo');
    var arr = seatNo.innerHTML.split(' ');
    var arr2 = [];

    if (btn.style.background == "rgb(80, 89, 132)") {
        btn.style.background = "white";
        for (var i = 0; i < arr.length; i++) {
            if (arr[i] != str) {
                arr2[i] = arr[i];
            }
        }
        seatNo.innerHTML = arr2.join(' ');
    } else {
        btn.style.background = "#505984";
        seatNo.innerHTML += str + " ";
    }
}

 //예매율순 정렬 버튼 
function rs123() {

    var ms_1_2 = document.getElementById("ms_1_2").style;
    var ms_1_3 = document.getElementById("ms_1_3").style;
    ms_1_2.display = "block";
    ms_1_3.display = "none";

}





function placeCk() {
    //라디오 버튼 Name 가져오기
    var movie_btn = document.getElementsByName("cinema");
    var cinema = document.getElementById("cinema");

    //라디오 버튼이 체크되었나 확인하기 위한 변수
    var movie_btn_check = 0;
    for (var i = 0; i < movie_btn.length; i++) {
        //만약 라디오 버튼이 체크가 되어있다면 true
        if (movie_btn[i].checked == true) {

            //라디오 버튼 값
            cinema.innerHTML = movie_btn[i].value;


            //라디오 버튼이 체크되면 radio_btn_check를 1로 만들어준다.
            movie_btn_check++;


        }
        movie_btn_check = 0;
    }
}


function num_ck() {
    //라디오 버튼 Name 가져오기
    var adult = document.getElementsByName("adult");
    var child = document.getElementsByName("child");
    var adult_num = document.getElementById("adult_num");
    var child_num = document.getElementById("child_num");

    //라디오 버튼이 체크되었나 확인하기 위한 변수
    for (var i = 0; i < adult.length; i++) {
        //만약 라디오 버튼이 체크가 되어있다면 true
        if (adult[i].checked == true) {

            //라디오 버튼 값
            adult_num.innerHTML = adult[i].value;

        }
    }
    
    for (var i = 0; i < child.length; i++) {
        //만약 라디오 버튼이 체크가 되어있다면 true
        if (child[i].checked == true) {

            //라디오 버튼 값
            child_num.innerHTML = child[i].value;

        }
    }
    
}

    
  
function timeCk() {
    //라디오 버튼 Name 가져오기
  
    var time = document.getElementsByName("timeck");
    var time2= document.getElementById("Stime");
   

    //라디오 버튼이 체크되었나 확인하기 위한 변수
    for (var i = 0; i < time.length; i++) {
        //만약 라디오 버튼이 체크가 되어있다면 true
        if (time[i].checked == true) {

            //라디오 버튼 값
            time2.innerHTML = time[i].value;
           

        }
    }

}
    

