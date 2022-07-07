<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객센터 메인 페이지</title>
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

/* 고객센터 메인 페이지 css */
img {
	margin-right: 130px;
	margin-top: -20px;
}

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
	font-size: x-large;/* 
	/* margin-top: 80px; */
	/* margin-right: 30px; */
	margin-top: 45px; */
	font-weight: 900;
}

.hreftag {
	
}

#enter {
	margin-right: 500px;
} 

#enter2 {
	margin-right: 420px;
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
	
	<div style="text-align : center;" id = maincenter>
	<img alt="" src="https://ifh.cc/g/akc1AO.png"
	 height="200" width="200">
	 	<p>02 - 1234 - 5678</p>
	 	<p>상담 가능 시간: 9:00~18:00</p>
	 	<p>점심 시간: 13:00~14:00</p>
	 	<p>공휴일 상담 불가</p>
	 </div>


	<div class="ahref">
		<hr width = "80%" color = #C0C0C0>
		<a href="../inquiry/inquiry.jsp" class="hreftag" id = enter>1:1문의</a> 
		<a href="../inquirylist/list.jsp" class="hreftag">문의내역</a><br/>
		<hr width = "80%" style="border-style: dotted;">
		<a href="../question/question.jsp" class="hreftag" id = enter2>자주 묻는 질문</a> 
		<a href="../notice/notice.jsp" class="hreftag" id = margin>공지사항</a><br>
		<hr width = "80%" color = #C0C0C0>
		<br>
		<br>
	</div>
</body>
</html>