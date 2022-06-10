<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.semi.qna.model.vo.*"%>
    
    <%
    ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list"); 
    PageInfo pi = (PageInfo)request.getAttribute("pi");
    
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라라시네마 QnA</title>
<link rel="stylesheet" href="/Semi/resource/css/사이드바.css">
    <link rel="stylesheet" href="/Semi/resource/css/footer.css">
<style>

    *{
      font-family: "Noto Sans KR", sans-serif;
    }

    a {
      text-decoration: none;
      color: #000;
      font-family: "Noto Sans KR", sans-serif;
    }

    .containers {
        height: 650px;
        width: 1000px;
        margin: auto;
    }
    .hidden {
      display: none;
    }

    #wrappers {
      height: 100%;
      width: 100%;
      float: left;
      position: relative;
    
    }

    hr {
        width: 90%;
    }
    div {
      box-sizing: border-box;
      /* text-align: center; */
      height: 100%;
      
    }


   .section{
            width: 200px;
            float: left;
        }

    .section div{
        background: #505984;
        height: 50px;
        border-bottom-right-radius : 8px;
        border-top-right-radius : 8px;
    }

    .section p{
        
        font-size: 24px;
        margin: auto;
        color: #f4f4f4;

    }
    #menu {
        list-style: none; 
        padding: 0;
        margin: 0;
    }

    #menu li {
        border-bottom: 1px solid #cccccc;
        width: 200px;
    }

    #menu li:first-child {
        border-top: 1px solid #cccccc;
    }


    #menu li > a {
        display: block;
        padding: 10px 15px;
        width: auto;
        text-decoration: none;
        color: #222;
        font: 14px;
    }

    #menu li > a:hover {
        color: #505984;
    }

    #qna {
        width : 75%;
        height: 600px;
        float: left;
        text-align: center;

       
    }
    .menu{
        width: 90%;
        height: 40px;
        text-align: center;
        background:#505984;
        text-align: left;
        cursor: pointer;
        color: black;
        margin: auto;
        border-bottom: 1px solid grey ;
        line-height: 40px;
        float: left;

    }
    th{
        color: white;
    }

    .contents {
        width: 80%;
        height: 1200px;
        background: rgb(231, 231, 231);
        text-align : left;
        display : none;
        margin : auto; 
        margin-bottom: 20px;
    }

    #area2_1 {
        height: 600px;
        padding: 30px;
        display: block;
    }

    .pagebtn {
        margin-top: 20px;
        border: none;
        background: none;
    }

    #category {
        margin-top: 30px;
        height: 80%;
        text-align: center;
        
    }

    #category>a {
        background: lavenderblush;
        text-align: left;
        width: 100%;
    
    }

    #area2_2 {
        display: none;
        height: 600px;
        padding: 30px;
    }
    
    #area2_1>#btn1,#area2_2>#btn2 {
        font-weight: bold;
    }

    #writebtn {
        padding: 5px;
        margin-left: 80%;
        margin-bottom: 10px;
        background:#121a3e;
        color: white;
        border-style: none;
        
    }
    th,td {
        width: 100px;
        text-align: center;
    }
    td{
       padding-top: 0px;
       padding-bottom: 0px;
       margin: 0px;
    }

   .title {
       width: 500px;
   }

   #category>a {
       margin-left: 50%;
       
   } 
   
    #num{
     margin-left: 50%;
    }
    .pagingArea >button{
        border-style: none;
        
    }
    </style>
</head>
<body>
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

   	<%@ include file="../common/header.jsp" %>
	
     <div class ="containers">
    
        <div id="wrappers">

        <div class="section"> 
            <div><p>&nbsp; Qna</p></div>
            <ul id="menu">
                <li> <a href="#" class="show1">자주묻는 질문</a> </li>
                <li> <a href="#" class="show2">1:1 문의 게시판</a> </li>
            </ul>
        </div>

            <div id="qna">
                <br><br>
                1:1 문의 게시판 
                <hr>
                
                <input type="button" value="문의하기" id="writebtn" onclick="location.href='views/qna/qnaInsertForm.jsp'">
                    <div class="menu"> 
                    <table class="tableArea" id="listArea">
                        <thead>
                            <tr> 
                                <th> 번호</th> 
                                <th> 종류</th> 
                                <th class="title"> 제목</th> 
                                <th style="width:200px"> 날짜</th>
                                <th> 작성자</th>
                                <th> 응답</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(Qna q : list){%>
                        <tr>
                            <td><%= q.getQno()%></td>
                            <td><%= q.getQtype()%></td>
                            <td><%= q.getQtitle()%></td>
                            <td><%= q.getQdate()%></td>
                            <td><%= q.getQwriter()%></td>
                            <td><%=q.getAnswer()%></td>
                        </tr>
                        <% } %>                            

                        </tbody>
                    </table>
                    </div>
                    <div id ="block" style="height:500px" >            
                    </div>

                    <div class="pagingArea" align="center">
                    <button onclick="location.href='<%= request.getContextPath() %>/qnaList.ql?currentPage=1'"><<</button>
                    <%  if(currentPage <= 1){  %>
                    <button disabled><</button>
                    <%  }else{ %>
                    <button onclick="location.href='<%= request.getContextPath() %>/qnaList.ql?currentPage=<%=currentPage - 1 %>'"><</button>
                    <%  } %>
                    
                    <% for(int p = startPage; p <= endPage; p++){
                            if(p == currentPage){	
                    %>
                        <button disabled><%= p %></button>
                    <%      }else{ %>
                        <button onclick="location.href='<%= request.getContextPath() %>/qnaList.ql?currentPage=<%= p %>'"><%= p %></button>
                    <%      } %>
                    <% } %>
                        
                    <%  if(currentPage >= maxPage){  %>
                    <button disabled>></button>
                    <%  }else{ %>
                    <button onclick="location.href='<%= request.getContextPath() %>/qnaList.ql?currentPage=<%=currentPage + 1 %>'">></button>
                    <%  } %>
                    <button onclick="location.href='<%= request.getContextPath() %>/qnaList.ql?currentPage=<%= maxPage %>'">>></button>
                    </div>
            </div>

        
        </div>       
    </div>
        
	<script>
		$(function(){
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"});
			}).click(function(){
				var qno = $(this).parent().children().eq(0).text();
				location.href="/Semi/selectOne.qo?qno=" + qno;
			});
		});
	</script>
        
           

</body>
</html>