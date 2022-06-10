<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.member.model.vo.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 작성</title>
<style>
    body {        
         padding: 0px;
         margin: auto;
         box-sizing: border-box;
         font-family: "Noto Sans KR", sans-serif;
     }

    a {
      text-decoration: none;
      color: #000;
    }

    #container {
        width: 1000px;
        height: 900px;
        margin: auto;
    }

    #container >p{
        text-align: center;
    }
    #upload {
        width: 80%;
        height: 630px;
        margin: auto;
        text-align: left;
        padding: 30px;
        border: 1px solid lightgray;
    }

    #upload > p {
        font-size: 12px;
        color: rgb(179, 177, 177);
    }

    #container > p {
        padding-top: 60px;
    }

    #text {
        margin-top: 10px;
        resize: none;
        background: snow;
    }

    .upload_btn {
        border: none;
        padding: 10px;
        margin: 5px;
    }
    #up_btn{
        margin-left: 350px;
    }

    hr {
        margin-top: 15px;
        margin-bottom: 15px;
    }
    
</style>
</head>
<body>
   	<%@ include file="../common/header.jsp" %>
   	<% if (m != null) { %>
<div id="container">
        <p>1 : 1 문의 등록하기</p>
        <hr>
        <form action="/Semi/qInsert.qo" method="post" enctype="multipart/form-data">

            <div id="upload">
                <label for="">제목 (필수)</label> <Input name="title" type="text" placeholder="제목을 입력해주세요. (20자 미만)" style="width: 700px;"></Input> <br>
                작성자 :<%= m.getUserName()%><br>
                <input type="hidden" name="userName" value="<%= m.getUserName()%>"/>
                <input type="hidden" name="userId" value="<%= m.getUserId()%>"/>
                <label for="">문의 종류 (필수)</label>
                <select name="qtype" id="qtype">
                    <option value="결제">결제</option>
                    <option value="환불">환불</option>
                    <option value="이용">이용</option>
                    <option value="기타">기타</option>
                </select> &nbsp&nbsp

                <br>
                <label for="">내용 (필수)</label> <br> 
                <textarea name="content" id="text" cols="95" rows="20"  style="width: 100%"
                placeholder="불편사항이나 문의사항을 남겨주시면 최대한 신속하게 답변드리겠습니다.임시임 암튼! ! "></textarea>
                <br>
                
                <label for="">사진 첨부</label> <br>
                <input type="file" name="file" id="file">
                <p>* JPEG,PNG 형식의 5M 이하의 파일만 첨부 가능합니다. (최대 5개)
                    * 개인정보가 포함된 이미지 등록은 자제하여 주시기 바랍니다.</p>
	
                    <button type="submit" class="upload_btn" id="up_btn" >등록</button>
                    <button type="reset" class="upload_btn" >취소</button>
            </div>
        </form>
    </div>
    
    <% } else { 
		request.setAttribute("msg", "회원만 열람 가능합니다.");
		request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
	 } %>
</body>
</html>