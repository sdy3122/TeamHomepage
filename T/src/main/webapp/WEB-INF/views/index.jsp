<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
<head>
<title>한잔해</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${path}/resources/css/main.css" />
<style>
</style>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<div class="content">
				<div class="inner">
					<h1>술안주추천</h1>
					<c:choose>
						<c:when test="${empty check}">
							<p id="loginSession">로그인하세요</p>
						</c:when>
						<c:otherwise>
							<p>${sessionScope.sessionVo.userName}님환영합니다!</p>
						</c:otherwise>
					</c:choose>
					<c:if test="${!empty fail}">
						<p>아이디중복으로인한 회원가입실패</p>
					</c:if>
				</div>
			</div>
			<nav>
				<ul>
					<c:choose>
						<c:when test="${empty check}">
							<li><a href="#intro">소개</a></li>
							<li><a href="#login">로그인</a></li>
							<li><a href="#regist">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#choiceSul">술 선택</a></li>
							<li><a href="#logout">로그아웃</a></li>
							<li><a href="#myInfo">내정보</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</header>

		<!-- Main -->
		<div id="main">

			<article id="intro">
				<h2 class="major">소개</h2>
				<div>
					<p>주류선택 후 랜덤한 안주를 추천해주는 용도</p>
				</div>
			</article>

			<article id="choiceSul">
				<h2 class="major">술!</h2>
				<input type="button" value="소주" onclick="sojuRandomFood()" /> <input
					type="button" value="맥주" onclick="registHaksa" /> <input
					type="button" value="막걸리" onclick="registHaksa" /> <input
					type="button" value="와인" onclick="registHaksa" /> <input
					type="button" value="전체출력" onclick="registHaksa" />
				<div >
					<input type="button" value="시;발"id = "sibal"/>
				</div>
				<div>
					<ul>
						<li id="registHaksa"><a>소주</a></li>
						<li id="deleteHaksa"><a>맥주</a></li>
						<li id="searchHaksa"><a>막걸리</a></li>
						<li id="editHaksa"><a>와인</a></li>
						<li id="listHaksa"><a>전체출력</a></li>
					</ul>
				</div>
				<!-- 숨겨진 메뉴 토글로 보이기 -->
				<div id="hideDivUl">
					<div class="hideAll" id="registToggle">
						<ul class="listShow">
							<li><a href="#intro"><span class="sojuFood">안주추천</span></a></li>
						</ul>
					</div>
					<div class="hideAll" id="deleteToggle">
						<ul class="listShow">
							<li><a href="#intro">학생삭제</a></li>
							<li><a href="#intro">교수삭제</a></li>
							<li><a href="#intro">관리자삭제</a></li>
						</ul>
					</div>
					<div class="hideAll" id="searchToggle">
						<ul class="listShow">
							<li><a href="#intro">학생검색</a></li>
							<li><a href="#intro">교수검색</a></li>
							<li><a href="#intro">관리자검색</a></li>
						</ul>
					</div>
					<div class="hideAll" id="editToggle">
						<ul class="listShow">
							<li><a href="#intro">학생수정</a></li>
							<li><a href="#intro">교수수정</a></li>
							<li><a href="#intro">관리자수정</a></li>
						</ul>
					</div>
					<div class="hideAll" id="listToggle">
						<ul class="listShow">
							<li><a href="#intro">학생출력</a></li>
							<li><a href="#intro">교수출력</a></li>
							<li><a href="#intro">관리자출력</a></li>
						</ul>
					</div>
				</div>

			</article>

			<!-- Board-->
			<article id="board">
				<h2 class="major">게시판</h2>
				<form method="post" name="goBoard">
					<table border="1">
						<tr>
							<th>글번호</th>
							<th>글작성자</th>
							<th>작성일</th>
						</tr>
						<c:forEach var="sdy" items="${dyoung}">
							<tr>
								<td><a href="board.do?bid=${sdy.bid}">${sdy.bid}</a></td>
								<td>${sdy.writer}</td>
								<td>${sdy.regdate}</td>
							</tr>
						</c:forEach>
					</table>
					<button type="submit" formaction="insert.jsp">글작성</button>
				</form>
			</article>

			<!-- Login -->
			<article id="login">
				<h2 class="major">로그인</h2>
				<form method="post" action="login">
					<div class="fields">
						<div class="field half">
							<label for="ID">아이디</label> <input type="text" id="inputID"
								placeholder="아이디 입력" name="userId" required="required">
						</div>
						<div class="field half">
							<label for="PW">비밀번호</label> <input type="password" id="iputPW"
								placeholder="비밀번호 입력" name="userPw" required="required">
						</div>
					</div>
					<ul class="actions">
						<li><input type="submit" value="로그인" class="primary" /></li>
						<li><input type="reset" value="리셋" /></li>
					</ul>
				</form>
			</article>
			<!-- Logout -->
			<article id="logout">
				<h2 class="major">로그아웃</h2>
				<form>
					<div class="fields">
						<div class="field half">
							<button type="button" class="primary" id="sdyMargin"
								onclick="location.href='/controller/logout'">로그아웃</button>
						</div>
						<div class="field half">
							<button type="button" class="primary"
								onclick="location.href='/controller/'">취소</button>
						</div>
					</div>
				</form>
			</article>
			<!-- Regist -->
			<article id="regist">
				<h2 class="major">회원가입</h2>
				<!-- onsubmit return + 함수() = 클릭시 함수호출 -->
				<form method="post" action="regist" name="registHard"
					onsubmit="return formCheck(this)">
					<div class="fields">
						<div class="field half">
							<label for="ID">아이디 15자내</label> <input type="text" id="registID"
								name="userId" required="required" placeholder="아이디 입력"
								maxlength="15" onkeydown="inputIDCheck">
						</div>
						<div class="field half">
							<label for="irum">이름 10자내</label> <input type="text" id="irum"
								maxlength="10" name="userName" placeholder="이름 입력"
								required="required">
						</div>
					</div>

					<div class="fields">
						<div class="field half">
							<label for="PW">비밀번호 15자내</label> <input type="password"
								id="registPW" name="registPW" maxlength="15"
								placeholder="비밀번호 입력" onchange="checkPw()" required="required">
						</div>
						<div class="field half">
							<label for="PW">비밀번호확인</label> <input type="password"
								name="userPw" id="checkPW" placeholder="비밀번호 재입력" maxlength="15"
								onchange="checkPw()" required="required">
						</div>
					</div>

					<div class="fields">
						<div class="field half">
							<label for="PW">주민등록번호 앞자리</label> <input type="text" name="rn1"
								id="rn1" placeholder="주민등록번호 앞자리" maxlength="6"
								required="required"
								onkeyup="moveNext(this,6,document.registHard.rn2)">
						</div>
						<div class="field half">
							<label for="PW">뒷자리</label> <input type="password" name="rn2"
								id="rn2" placeholder="주민등록번호 뒷자리" maxlength="7"
								required="required"
								onkeyup="moveNext(this,7,document.registHard.sendBtn)">
						</div>
					</div>
					<ul class="actions">
						<li><input type="submit" value="회원가입" class="primary"
							name="sentBtn" /></li>
						<li><input type="reset" value="리셋" /></li>
					</ul>
				</form>
			</article>

			<article id="myInfo">
				<h2 class="major">내정보</h2>
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="userId"
							value="${sessionScope.sessionVo.userId}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="userName"
							value="${sessionScope.sessionVo.userName}" readonly="readonly"></td>
					</tr>
					<tr>
						<td><button type="button"
								onclick="location.href='#myInfoEdit'" class="primary"
								id="sdyMargin">비밀번호변경</button></td>
						<td><button type="button"
								onclick="location.href='/controller/deleteUser'" class="primary">회원탈퇴</button></td>
					</tr>
				</table>
			</article>

			<article id="myInfoEdit">
				<h2 class="major">내정보</h2>
				<form method="post">
					<table border="1">
						<tr>
							<td>아이디</td>
							<!-- 세션값을 빼올때는 sessionScope.세션이름.세션에있는값 으로 작성하면된다 -->
							<td><input type="text" name="userId"
								value="${sessionScope.sessionVo.userId}" readonly="readonly"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="text" name="userPw" placeholder="변경할비밀번호입력"
								required="required"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="userName"
								value="${sessionScope.sessionVo.userName}" readonly="readonly"></td>
						</tr>
						<tr>
							<td><button type="submit" formaction="userInfoEdit"
									class="primary">비밀번호변경</button></td>
							<td><button type="button" onclick="location.href='#myInfo'"
									class="primary" id="sdyMargin">뒤로가기</button></td>
						</tr>
					</table>
				</form>
			</article>

			<!-- 여가 끝남 -->
		</div>

		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">&copy; Design: 서덕영</p>
		</footer>

	</div>

	<!-- BG -->
	<div id="bg"></div>

	<!-- Scripts -->
	<script src="${path}/resources/js/jquery.min.js"></script>
	<script src="${path}/resources/js/browser.min.js"></script>
	<script src="${path}/resources/js/breakpoints.min.js"></script>
	<script src="${path}/resources/js/util.js"></script>
	<script src="${path}/resources/js/main.js"></script>
	<!-- 추가 스크립트 -->
	<script>
		
	</script>
</body>
</html>