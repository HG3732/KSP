<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Board Community</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https:/code.jquery.com/jquery-3.7.1.js"></script>
<link href="${pageContext.request.contextPath}/resource/css/reset.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/core.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resource/css/board/board_core.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resource/css/board/board_community.css"
	rel="stylesheet">
	<style>


</style>
</head>
<body>
	[[ 로그인 정보 : ${sssLogin} ]]
	<br> [[ map : ${map.dtolist }]]
	<br> [[ totalPageCount : ${map.totalPageCount }]]
	<br> [[ startPageNum : ${map.startPageNum }]]
	<br> [[ endPageNum : ${map.endPageNum }]]
	<br>
	<div class="wrap-header">
		<header>
			<%@include file="/WEB-INF/views/common/header.jsp"%>
		</header>
	</div>
	<div class="wrap-main">
		<div class="container">
			<div class="flexnav">
				<a href="${pageContext.request.contextPath}/board/community"
					class="flex community">게시판</a> <a
					href="${pageContext.request.contextPath}/board/faq"
					class="flex faq">FAQ</a>
			</div>
			<div class="location">
				<div class="location main">
					<a href="${pageContext.request.contextPath}/home"> <img
						alt="메인"
						src="${pageContext.request.contextPath}/resource/image/home_icon.png">
					</a>
				</div>
				<div class="l">|</div>
				<div class="location community">
					<span>커뮤니티</span>
				</div>
				<div class="l">|</div>
				<div class="location notice">
					<span>게시판</span>
				</div>
			</div>
			<div class="subject">
				<div>게시판</div>
			</div>
			<div class="search">
				<form action="">
					<div class="flexsearch">
						<input type="text" name="" id="" class="search text">
						<button type="submit" class="search btn">검색</button>
					</div>
				</form>
			</div>
			<div class="count-write">
				<span>436건</span>
				<div class="community-btn">
					<button type="button"
						onclick="location.href='${pageContext.request.contextPath}/board/write'"
						class="btn write">글작성</button>
				</div>
			</div>
			<div class="board">
				<div class="board-list">
					<table class="tb board">
						<tr>
							<th class="no">번호</th>
							<th class="title">제목</th>
							<th class="file">파일</th>
							<th class="writer">작성자</th>
							<th class="date">작성일</th>
							<th class="hits">조회수</th>
						</tr>
						<tbody class="table-body">
							<c:forEach items="${map.dtolist }" var="vo" varStatus="vs">
								<tr>
									<td>${vo.boardNo }</td>
									<td><a href="${pgaeContext.request.contextPath}/star/board/view?no=${vo.boardNo }">
									${vo.boardTitle }</a></td>
									<td>${vo.fileId }</td>
									<td>${vo.boardWriter }</td>
									<td>${vo.boardWriteTime }</td>
									<td>${vo.hit }</td>
								</tr>
							</c:forEach>

						</tbody>

					</table>
				</div>

				<div class="pagelist">
					<ul>
						<c:if test="${map.startPageNum > 1}">
							<li><a
								href="${pageContext.request.contextPath }/board/community?page=${map.startPageNum-1 }">
									&lt;&lt; </a></li>
						</c:if>
						<c:forEach begin="${map.startPageNum }" end="${map.endPageNum }"
							var="page">
							<c:if test="${map.currentPageNum == page }">
								<li><strong>${page }</strong></li>
							</c:if>
							<c:if test="${map.currentPageNum != page }">
								<li><a
									href="${pageContext.request.contextPath }/board/community?page=${page }">${page }</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${map.endPageNum < map.totalPageCount }">
							<li><a
								href="${pageContext.request.contextPath }/board/community?page=${map.endPageNum+1 }">
									&gt;&gt; </a></li>
						</c:if>
					</ul>
				</div>

				<!-- 
				<div class="pageno">
					<div class="flexpage">
						<div class="no 1">
							<button type="submit">1</button>
						</div>
						<div class="no 2">
							<button type="submit">2</button>
						</div>
						<div class="no 3">
							<button type="submit">3</button>
						</div>
						<div class="no 4">
							<button type="submit">4</button>
						</div>
						<div class="no 5">
							<button type="submit">5</button>
						</div>
						<div class="no 6">
							<button type="submit">6</button>
						</div>
						<div class="no 7">
							<button type="submit">7</button>
						</div>
						<div class="no 8">
							<button type="submit">8</button>
						</div>
						<div class="no 9">
							<button type="submit">9</button>
						</div>
						<div class="no 10">
							<button type="submit">10</button>
						</div>
						<div class="no next">
							<button type="submit">></button>
						</div>
					</div>
				</div>
				 -->
			</div>
		</div>
	</div>
	<div class="wrap-footer">
		<footer> </footer>
	</div>
	<!-- TODO 값을 받으면 테이블 목록 생성... -->
	<!-- <script>
        $(loadedHandler);
        function loadedHandler() {
            $(".btn.write").on("click", btnWriteHandler);
        }
        function btnWriteHandler() {
            var htmlVal = '<tr>' +
                '<td class="td no">번호</td>' +
                '<td class="td title">제목</td>' +
                '<td class="td file"></td>' +
                '<td class="td writer">작성자</td>' +
                '<td class="td date">YYYY-MM-DD</td>' +
                '<td class="td hits">5</td>' +
                '<tr>';
            $(".table-body").append(htmlVal);
        }
    </script> -->
</body>

</html>