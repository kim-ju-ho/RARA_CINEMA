<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.semi.qna.model.vo.*"%>
    
<% Qna q = (Qna)request.getAttribute("qna"); %>

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
        text-align: center;
        margin: auto;
    }

    #upload {
        width: 80%;
        height: 620px;
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

    #password {
        width: 80px;
    
    }

    .upload_btn {
        border: none;
        padding: 10px;
        margin: 5px;
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
        <form action="/Semi/qnaUpdate.qo" method="post" enctype="multipart/form-data">

                <label for="">제목 (필수)</label> <Input name="title" type="text" style="width: 700px;" value="<%= q.getQtitle() %>"/><br>
                <input type="hidden" name="qno" id="qno" value="<%=q.getQno()%>">
                <input type="hidden" name="userName" id="qno" value="<%=q.getQwriter()%>">
                <label for="">문의 종류 (필수)</label>
                <select name="qtype" id="qtype">
                    <option value="결제">결제</option>
                    <option value="환불">환불</option>
                    <option value="이용">이용</option>
                    <option value="기타">기타</option>
                </select> &nbsp&nbsp

                <br>
                <label for="">내용 (필수)</label> <br> 
                <textarea name="content" id="text" cols="95" rows="20"  style="width: 100%">
                <%= q.getQcontent() %>
                </textarea>
                <br>
                
                <% if(q.getQfile() != null){ %>
					<tr>
						<td>기존 파일 </td>
						<td colspan="3">
							<a href="/myWeb/bfdown.bo?path=<%=q.getQfile()%>">
							<%=q.getQfile()%></a>	
						</td>
					</tr>
					<% } %>
					<tr>
						<td>새 파일 </td>
						<td colspan="3">
							<input type="file" name="file" id="file" />
						</td>
					</tr>
				
        <button type="submit" class="upload_btn">등록</button>
        <button type="reset" class="upload_btn">나가기</button>
        </form>
    </div>
    <% } else { 
		request.setAttribute("msg", "회원만 열람 가능합니다.");
		request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
	 } %>
</body>
</html>