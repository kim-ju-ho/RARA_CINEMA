<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.semi.qna.model.vo.*,com.semi.qnaComment.model.vo.*, java.util.*"%>
<%
	Qna q = (Qna)request.getAttribute("Qna");
	// 댓글 리스트
	ArrayList<QnaComment> qclist = (ArrayList<QnaComment>)request.getAttribute("qclist");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>1 : 1 문의글</title>

<!-- ëª¨ë¬ì©-->
<link href="../resource/css/layout_nomain.css" rel="stylesheet"
	type="text/css" />
<!-- <link href="../resource/css/" -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<link rel="stylesheet" href="../resource/css/header.css">
<link rel="stylesheet" href="../resource/css/footer.css">
<script src="../resource/js/header.js"></script>

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

#upload>p {
	font-size: 12px;
	color: rgb(179, 177, 177);
}

#container>p {
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
	color: #505984;
}

.tableArea>table {
	width: 650px;
	padding: 20px;
	color: black;
	border: 1px solid gray;
}

.tableArea {
	background: white;
	width: 650px;
	height: 100%;
	margin: auto;
}

span {
	font-size: 21pt;
	color: black;
}
.reply-content{
width:100%;
resize: none;
}
button{
	border-style: none;
	background: #7090cb;
	color: white;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div id="container">

		<p>1 : 1 문의 등록하기</p>
		<hr>
		<input type="hidden" name="qno" value="<%=q.getQno()%>" />
		<div class="tableArea">
			<table>
				<tr>
					<td>제목 :</td>
					<td><%= q.getQtitle() %></td>
				</tr>
				<tr>
					<td>작성자 :</td>
					<td><%= q.getQwriter() %></td>
					<td>작성일 :</td>
					<td><%= q.getQdate() %></td>

				</tr>

				<tr>
					<td>첨부파일</td>
					<td ><a
						href="/Semi/resource/qnaUploadFiles/<%=q.getQfile()%>"
						download="<%= q.getQfile() %>"> <%=q.getQfile() %>
					</a></td>
				</tr>
				<tr>
					<td>내용</td>
				</tr>
				<tr>
					<td colspan="6" style="width: 80%; height: 100%; 1px solid gray;">
						<p id="content"><%= q.getQcontent() %>
					</td>
				</tr>
			</table>
			<br>
			<div class="button">
				<button
					onclick="location.href='<%= request.getContextPath() %>/selectList.ql">메뉴로
					돌아가기</button>
				<% if(m != null && m.getUserName().equals(q.getQwriter())){ %>
				<button
					onclick="location.href='<%= request.getContextPath() %>/qUpView.qo?qno='+<%=q.getQno()%>">수정하기</button>
				<% } %>
				<% if(m != null && (m.getUserName().equals(q.getQwriter())||m.getUserName().equals("관리자"))){ %>
				<form action="/Semi/qDelete.qo" method="post">
					<input type="hidden" name="qno" value="<%=q.getQno()%>" />
					<button type="submit">삭제하기</button>
				</form>
				<% } %>
			</div>

			<!-- 게시글의 댓글들을 보여주는 부분  -->
			<div id="replySelectArea">
					<% if (qclist != null) { %>
					<% for(QnaComment qco : qclist) { %>
					<table id="replySelectTable">
						<tr>
							<td rowspan="2"></td>
							<td><b>라라시네마</b></td>
							<td><%= qco.getQcDate() %></td>
							
							<% if( m != null && m.getUserId().equals("admin")) { %>	
							<td align="center">
								<input type="hidden" name="cno" id="cno" value="<%=qco.getCno()%>" />
								<button type="button" class="updateBtn"
									onclick="updateReply (this);">수정하기</button>
								<button type="button" class="updateConfirm"
									onclick="updateConfirm(this);" style="display: none;">수정완료</button>
								&nbsp;&nbsp;
								<button type="button" class="deleteBtn"
									onclick="deleteReply(this);">삭제하기</button></td>
							<% } %>

						</tr>
						<tr>
							<td colspan="3" style="background: transparent;">
								<textarea class="reply-content" cols="105" rows="3" readonly="readonly"><%= qco.getQcContent()%></textarea>
							</td>
						</tr>
						</table>
					<% } %>
					<%} else { %>
					<div id ="no">
					<p>현재 등록된 답변이 없습니다. 조금만 기다려주세요!</p>
					</div>
					<% } %>
			</div>

			<% if( m != null && m.getUserId().equals("admin")) { %>
			<div class="replyWriteArea">
				<form action="/Semi/insertComment.qo" method="post">

					<input type="hidden" name="qno" value="<%=q.getQno() %>" />

					<table align="center">
						<tr>
							<td style="width: 30px;">답변 작성</td>
							<td><textArea style="height: 60px;" rows="3" cols="80"
									id="replyContent" name="replyContent"></textArea></td>
							<td><button type="submit" id="addReply"
									style="height: 60px;">등록</button></td>
						</tr>
					</table>
				</form>
			</div>
			<% } %>
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
		var cno = $(obj).siblings('#cno').val();
		
		// 게시글 번호 가져오기
		var qno = <%=q.getQno()%>;
		
		location.href="/Semi/updateComment.qo?"
				 +"cno="+cno+"&qno="+qno+"&content="+content;
	}
	
	function deleteReply(obj) {
		// 댓글의 번호 가져오기
		var cno = $(obj).siblings('input').val();
		
		// 게시글 번호 가져오기
		var qno = '<%=q.getQno()%>';
		
		location.href="/Semi/deleteComment.qo"
		+"?cno="+cno+"&qno="+qno;
	}
	
	</script>
	

		</div>
	</div>

</body>
</html>