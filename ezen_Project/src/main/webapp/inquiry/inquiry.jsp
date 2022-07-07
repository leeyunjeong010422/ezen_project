<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="./isLoggedIn.jsp"%> 로그인 확인 --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>1:1 게시판</title>
	<script type="text/javascript">
	
	function validateForm(form) {		//폼 내용 검증
		if (form.title.value == "") {
			alert("제목을 입력하세요.")
			form.title.focus();
			return false;
		}
	
		if (form.content.value == "") {
			alert("내용을 입력하세요.")
			form.content.focus();
			return false;
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

/* 1:1 문의 게시판 css */

#button {
	margin-top: 20px;
	float: right;
}

.buttonmo {
	margin-right: 78px;
}

.buttonmo2 {
	margin-right: 10px;
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
		<a href="../inquiry/inquiry.jsp" class="hreftag" id = underline>1:1문의</a> <a
			href="../inquirylist/list.jsp" class="hreftag">문의내역</a> <a 
			href="../question/question.jsp" class="hreftag">자주 묻는 질문</a> <a
			href="../notice/notice.jsp">공지사항</a><br>
		<br>
		<br>
	</div>
	
	
	<%-- <jsp:include page="../common/link.jsp" /> --%>
	<form action="writeProcess.jsp" name = "writeFrm" method="get"
		  onsubmit="return validateForm(this)">
		  <table border="1" width = "90%" style="margin-left: auto; margin-right: auto;">
		  	<tr>
		  		<td style="text-align: center;">제목</td>
		  		<td>
		  			<input type="text" name = "title" style="width: 90%"/>
		  		</td>
		  	</tr>
		  	
		  	<tr>
		  		<td style="text-align: center;">내용</td>
		  		<td>
		  			<textarea name = "content" style="width: 90%; height: 250px;"></textarea>
		  		</td>
		  	</tr>
		  </table>
		  			<button type="submit" id = "button" class = "buttonmo" >작성 완료</button> <!-- onclick="location.href = 'inquiryclear.jsp';" -->
		  			<button type="reset" id = "button" class = "buttonmo2">다시 입력</button>
		  			<button type="button" onclick="location.href = '../inquirylist/list.jsp';" id = "button" class = "buttonmo2">목록 보기</button>
	</form>
</body>
</html>