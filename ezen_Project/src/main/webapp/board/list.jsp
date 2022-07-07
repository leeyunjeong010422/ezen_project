<%@page import="kr.co.ezenac.model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.co.ezenac.model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//DAO 객체를 생성해 DB 연결
	BoardDAO dao = new BoardDAO(application);

	//사용자가 입력한 검색 조건어를 Map컬렉션에 저장
	Map<String, Object> param = new HashMap<>();
	String searchField = request.getParameter("searchField");		//검색어 폼 값 받기
	String searchWord = request.getParameter("searchWord");
	
	if (searchWord != null) {		//검색어가 있을 때 Map에 저장
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	
	int totalCount = dao.selectCount(param);		//게시물 수 확인
	List<BoardDTO> boardLists = dao.selectList(param);	//게시물 목록 받기
	
	dao.close();			//DB연결 닫기
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>게시글 목록보기</title>
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
			<a href="../session/logout.jsp">로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp; &nbsp;&nbsp; <a><i
				class="fa-solid fa-chalkboard-user" class="user_info"></i></a>
		</div>
		<div class="serchDTL">
			<button class="searchDTLBTN">세부검색</button>
		</div>
	</div>
		
	<div class="ahref">
		<a href="write.jsp" class="hreftag">1:1문의</a> <a
			href="list.jsp" class="hreftag" id = underline>문의내역</a> <a 
			href="../question/question.jsp" class="hreftag">자주 묻는 질문</a> <a
			href="../notice/notice.jsp">공지사항</a><br>
		<br>
		<br>
	</div>
	
	<jsp:include page="../common/link.jsp" />
	<!-- 검색 폼 -->
	<form action ="#" method="get">
		<table border = "1" width = "90%" style="margin-left: auto; margin-right: auto;"> 
		
			<tr>
				<td align = "center">
					<select name = "searchField">
						<option value = "title">제목</option>
						<option value = "content">내용</option>
					</select>
					<input type="text" name = "searchWord"/>
					<input type="submit" value="검색하기"/>
				</td>
			</tr>			
		</table>
		
		<!-- 게시물 목록 테이블 -->
		<table border = "1" width = "90%" style="margin-left: auto; margin-right: auto;">
			<!-- 컬럼 이름 -->
			<tr>
				<th width = "10%" >번호</th>
				<th width = "50%" >제목</th>
				<th width = "15%" >작성자</th>
				<th width = "15%" >작성일</th>
			</tr>
			
			<!-- 목록내용 -->
			<%
				if (boardLists.isEmpty()) {
					//게시물이 하나도 없는 경우
			%>
			
				<tr>
					<td colspan="5" align = "center">등록된 게시물이 없습니다.</td>
				</tr>
				
			<%
				}
				else {		//입력된 게시물이 있다면
					int virtalNum = 0;					//화면 상의 게시물 번호 (가상 번호)
					for(BoardDTO dto : boardLists) {
						virtalNum = totalCount--;		//전체 게시물 수에서 시작해 1개씩 감소
			%>
			
				<tr align="center">
					<td><%=virtalNum %></td>	<!-- 게시물 번호 -->
					<td align="left">			<!-- 제목 클릭시 일련번호를 통해 상세보기 페이지로 이동 -->
						<a href="view.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle() %></a>
					</td>
					<td align="center"><%=dto.getId() %></td> <!-- 작성자 아이디 -->
					<td align="center"><%=dto.getPostdate() %></td> <!-- 작성일 -->
				</tr>
			
			<%
					}
				}
			%>
		</table>
		
		<!-- 글쓰기 버튼 -->
			<button type = "button" onclick="location.href = 'write.jsp';">글쓰기</button>
	</form>
</body>
</html>