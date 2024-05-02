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
<jsp:include page="/WEB-INF/views/common/common_star.jsp" />
<%-- /KSP/src/main/webapp/WEB-INF/views/common/common_star.jsp --%>
<style>
body {
	background-size: cover;
}

.table-body .notice-admin {
	color: red;
}
</style>
</head>
<body>
	<%-- 
	[[ 로그인 정보 : ${ssslogin} ]]
	<br> [[ map : ${map.dtolist }]]
	<br> [[ startPageNum : ${map.startPageNum }]]
	<br> [[ endPageNum : ${map.endPageNum }]]
	<br> [[ 조회수 : ${hit }]]
	<br> [[ totalPageCount : ${map.totalPageCount }]]
	<br> [[ totalCount : ${map.totalCount }]]
 --%>
 
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
						<input type="text" name="search-list" id="search-list"
							placeholder="제목을 입력해 주세요." class="search text">
						<button type="submit" class="search btn">검색</button>
					</div>
				</form>
			</div>
			<div class="count-write">
				<span>${map.totalCount }건</span>
				<div class="community-btn">
					<button type="button"
						<%-- onclick="location.href='${pageContext.request.contextPath}/board/write'" --%>
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
									<c:choose>
										<c:when test="${vo.memberAdmin > 0}">
											<td class="notice-admin">공지</td>
										</c:when>
										<c:otherwise>
											<td>${vo.boardNo }</td>
										</c:otherwise>
									</c:choose>
									<td><a
										href="${pgaeContext.request.contextPath}/star/board/view?no=${vo.boardNo }">
											${vo.boardTitle }</a></td>
									<c:choose>
										<c:when test="${vo.fileId == null || vo.fileId == 0}">
											<td></td>
										</c:when>
										<c:when test="${vo.fileId != null || vo.fileId != 0}">
											<td><img
												src="${pageContext.request.contextPath}/resource/image/file.png"></td>
										</c:when>
									</c:choose>
									<%-- <td>${vo.fileId }</td> --%>
									<td name="board-writer">${vo.boardWriter }</td>
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
							<%-- <li><a href="${pageContext.request.contextPath }/board/community?search-list${ssSearch }&page=${page = 1 }"> &lt;&lt;&nbsp;&nbsp; </a></li> --%>
							<li><a
								href="${pageContext.request.contextPath }/board/community?search-list${ssSearch }&page=${map.startPageNum-1 }">
									&lt;&lt; </a></li>
						</c:if>
						<c:forEach begin="${map.startPageNum }" end="${map.endPageNum }"
							var="page">
							<c:if test="${map.currentPageNum == page }">
								<li><strong>${page }</strong></li>
							</c:if>
							<c:if test="${map.currentPageNum != page }">
								<li><a
									href="${pageContext.request.contextPath }/board/community?search-list${ssSearch }&page=${page }">${page }</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${map.endPageNum < map.totalPageCount }">
							<li><a
								href="${pageContext.request.contextPath }/board/community?search-list${ssSearch }&page=${map.endPageNum+1 }">
									&gt;&gt; </a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		<div class="wrap-footer">
			<footer>
				<%@include file="/WEB-INF/views/common/footer.jsp"%>
			</footer>
		</div>
	</div>

	<script>
$(loadedHandler);
function loadedHandler(){
	$(".btn.write").on("click", loginPermission);
	$(".btn.write").on("click", btmWriteClickHandler);
}
function btmWriteClickHandler() {
	if(${ssslogin != null}){
    location.href = "${pageContext.request.contextPath}/board/write";
	}
}

</script>

</body>

</html>