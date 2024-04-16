<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Board View</title>
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
	href="${pageContext.request.contextPath}/resource/css/board/board_view.css"
	rel="stylesheet">
</head>

<body>
	<div class="wrap-header">
		<header>
		<%@include file="/WEB-INF/views/common/header.jsp"%>
		 </header>
	</div>
	<div class="wrap-main">
		<div class="container">
			<div class="flexnav">
				<a href="${pageContext.request.contextPath}/board/community" class="flex community">게시판</a>
                <a href="${pageContext.request.contextPath}/board/faq" class="flex faq">FAQ</a>
			</div>
			<div class="location">
				<div class="location notice">
					<span>게시판</span>
				</div>
				<div class="location community">
					<span>커뮤니티 > </span>
				</div>
				<div class="location main">
					<span>메인이미지 > </span>
				</div>
			</div>
			<div class="subject">
				<div>게시판</div>
			</div>
			<div class="contents">
				<div class="board-view">
					<div class="view-header">
						<div class="title">
							<strong>${dto.boardTitle }</strong>
						</div>
						<div class="info">
							<dl>
								<dt>작성자</dt>
								<dd>${dto.boardWriter }</dd>
							</dl>
							<dl>
								<dt>작성일</dt>
								<dd>${dto.boardWriteTime }</dd>
							</dl>
							<dl>
								<dt>조회수</dt>
								<dd>${dto.hit }</dd>
							</dl>
						</div>
						<div class="file">
							<dl>
								<dt>첨부파일</dt>
								<dd>
									<ul>
										<li>파일명..... <a href="#">다운로드</a>
										</li>
									</ul>
								</dd>
							</dl>
						</div>
					</div>
					<div class="view-content">
						<div class="memo">${dto.boardContent }</div>
					<div class="view-btn">
						<button type="button" class="lsit-btn"
							onclick="location.href='${pageContext.request.contextPath}/board/community'">목록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	
	<div class="wrap-footer">
		<footer> </footer>
	</div>
</body>

</html>