<%@page import="kr.co.ezenac.model1.board.BoardDTO"%>
<%@page import="kr.co.ezenac.model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO(application);
	dao.updateVisitCount(num);				//조회수 증가
	BoardDTO dto = dao.selectView(num);		//게시물 가져오기
	dao.close();
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>게시물 상세 보기</title>
	<script type="text/javascript">
		function deletePost() {
			let confirmed = confirm("정말로 삭제하시겠습니까?")
			
			if(confirmed) {
				let form = document.writeFrm
				form.method = "post"				//전송방식
				form.action = "deleteProcess.jsp"	//전송경로
				form.submit()						//폼 값 전송
				
			}
		}
	</script>
	
			<style type="text/css">
		/* 헤더 css */
.HeaderContainer {
	width: 90%;
	margin: 0 auto;
	height: 150px;
}

.HeaderLogo {
	display: inline-block;
	width: 15%;
	height: 80%;
	position: relative;
	left: 2%;
	top: 5%;
}

.search {
	display: inline-block;
	width: 70%;
	height: 20%;
	position: relative;
	top: 38%;
	left: 3%;
}

.searchbox {
	width: 90%;
	height: 100%;
	border-radius: 0.2em;
}

.searchBtn {
	width: 38px;
	height: 100%;
	background-color: #9bb7d6;
	border-radius: 0.5em;
}

.headerMenu {
	display: inline-block;
	position: relative;
	bottom: 75%;
	float: right;
	color: #9bb7d6;
}

.serchDTL {
	display: inline-block;
	position: relative;
	float: left;
	left: 18.5%;
	bottom: 20%;
}

.searchDTLBTN {
	height: 30px;
	background-color: #9bb7d6;
	border-radius: 0.5em;
}

/* 고객센터 헤더 css */
a {
	text-decoration: none;
}

a:link {
	color: black;
}

a:visited {
	color: black;
}

.ahref {
	text-align: center;
	font-size: x-large;
	/* margin-top: 80px; */
	/* margin-right: 30px; */
	margin-top: 45px;
	font-weight: 900;
}

.hreftag {
	margin-right: 170px;
}

#underline {
	text-decoration: underline;
}

p {
	font-size: medium;
}
	</style>
	
</head>
<body>

	<div class="HeaderContainer">
		<div class="HeaderLogo">로고</div>
		<div class="search">
			<input type="text" class="searchbox" />
			<button class="searchBtn">
				<i class="fa-solid fa-magnifying-glass"></i>
			</button>
		</div>
		<div class="headerMenu">
			<a>이벤트/쿠폰</a>&nbsp;&nbsp;|&nbsp;&nbsp; <a>게시판</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="../custormercenter/CustomerCenterMain.jsp">고객센터</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a>로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp; &nbsp;&nbsp; <a><i
				class="fa-solid fa-chalkboard-user" class="user_info"></i></a>
		</div>
		<div class="serchDTL">
			<button class="searchDTLBTN">세부검색</button>
		</div>
	</div>

	<div class="ahref">
		<a href="../board/write.jsp" class="hreftag">1:1문의</a> <a
			href="../board/list.jsp" class="hreftag"  id = underline>문의내역</a> <a 
			href="../question/question.jsp" class="hreftag">자주 묻는 질문</a> <a
			href="../notice/notice.jsp">공지사항</a><br>
		<br>
		<br>
	</div>

	<jsp:include page="../common/link.jsp"></jsp:include>
	<form action="#" name = "writeFrm"> 
		<input type="hidden" name = "num" value="<%= num%>"/>
		
		<table border="1" width = "90%" style="margin-left: auto; margin-right: auto;">
			<tr>
				<td>작성자</td>
				<td><%=dto.getName() %></td>
	
				<td>작성일</td>
				<td><%=dto.getPostdate() %></td>
				
				<%-- <td>조회수</td>
				<td><%=dto.getVisitcount() %></td>
			</tr> --%>
			
			<tr>
				<td>제목</td>
				<td colspan="3" height="100"><%=dto.getTitle() %></td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td colspan="3" height="100"><%=dto.getContent().replace("\r\n", "<br/>") %></td>
			</tr>
			
			<tr>
				<td colspan="4" align="center">
					<%
						/* 로그인한 사용자와 작성자가 같을 때만 표시 */
						if (session.getAttribute("UserId") != null &&
						    session.getAttribute("UserId").toString().equals(dto.getId())) {
					%>
						<button type="button" onclick="location.href='edit.jsp?num=<%= dto.getNum()%>';">수정하기</button>
						<button type="button" onclick="deletePost()">삭제하기</button>
					<%		
						}
					%>
					
						<button type="button" onclick="location.href='list.jsp'">목록보기</button>
				</td>
			</tr>	
		</table>
		
	</form>
</body>
</html>