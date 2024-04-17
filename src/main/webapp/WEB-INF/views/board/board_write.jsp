<link href="${pageContext.request.contextPath}/resource/css/reset.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/core.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resource/css/board/board_core.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resource/css/board/board_write.css"
	rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Board Write</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https:/code.jquery.com/jquery-3.7.1.js"></script>
</head>
<style>

</style>

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
                <div class="location notice"><span>게시판</span></div>
                <div class="location community"><span>커뮤니티 > </span></div>
                <div class="location main"><span>메인이미지 > </span></div>
            </div>
            <div class="subject">
                <div>게시판</div>
            </div>
            <div class="contents">
                <div class="board-write">
					<form name="notice" id="frm-write">
						<div class="insert-form">
							<table>
								<tr>
									<th>작성자</th>
									<td>memId</td>
								</tr>
								<tr>
									<th>제목</th>
									<td><input type="text" name="title" id="write-title"
										title="제목 입력"></td>
								</tr>
								<tr>
									<th>내용</th>
									<td><textarea name="content" id="write-content" cols="15"
											rows="5" title="내용 입력"></textarea></td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td>
										<ul>
											<li><input type="file" name="" id="file_1"></li>
											<li><input type="file" name="" id="file_2"></li>
											<li><input type="file" name="" id="file_3"></li>
										</ul>
									</td>
								</tr>
							</table>
						</div>
						<div class="write-btn">
							<button type="button" id="btn-submit">등록하기</button>
							<button type="button" id="btn-list">목록</button>
						</div>
						<!-- 모달 -->
						<div class="modal update">
							<div class="modal_body">
								<h2>글을 등록하시겠습니까?</h2>
								<div class="modal-btn">
									<button type="button" id="btn-update-modalok">확인</button>
									<button type="button" id="btn-update-modalcancel">취소</button>
								</div>
							</div>
						</div>
						<!-- 모달 목록 -->
						<div class="modal list">
							<div class="modal_body">
								<h2>글 작성을 취소하시겠습니까?</h2>
								<div class="modal-btn">
									<button type="button" id="btn-list-modalok">확인</button>
									<button type="button" id="btn-list-modalcancel">취소</button>
								</div>
							</div>
						</div>
					</form>
				</div>
            </div>
        </div>
    </div>
    <div class="wrap-footer">
        <footer>

        </footer>
    </div>

    <script>
        $(loadedHandler);
        function loadedHandler() {
            $("#btn-submit").on("click", btnUpModalClickHandler);
            $("#btn-update-modalok").on("click", btnUpModalOkClickHandler);
            $("#btn-update-modalcancel").on("click", btnUpModalCancleClickHandler);

            $("#btn-list").on("click", btnListModalClickHandler);
            $("#btn-list-modalok").on("click", btnListModalOkClickHandler);
            $("#btn-list-modalcancel").on("click", btnListModalCancleClickHandler);
        }

        function btnUpModalClickHandler() {
            console.log("모달창 오픈");
            if($("[name=title]").val().trim().lenght == 0 || $("[name=content]").val().trim().length == 0){
            	alert("공백란 없이 입력해주세요.");
            }else{
            $(".modal.update").css("display", "block");
            }
            	
            
        }
        function btnUpModalOkClickHandler() {
            console.log("눌림");
            var frm = document.getElementById("frm-write");
            frm.method = "post";
            frm.submit();
            /* frm.action = "${pageContext.request.contextPath}/board/community"; */
/*             location.href = "${pageContext.request.contextPath}/board/community";

            var htmlVal = '<tr>' +
                '<td class="td no">번호</td>' +
                '<td class="td title">제목</td>' +
                '<td class="td file"></td>' +
                '<td class="td writer">작성자</td>' +
      
					'<td class="td date">YYYY-MM-DD</td>' +
						 '<td class="td hits">5</td>' +
						 '<tr>';
						 $(".table-body").append(htmlVal); */
					}
					function btnUpModalCancleClickHandler() {
						console.log("모달창 닫기");
						$(".modal.update").css("display", "none");
					}

					// 목록 모달
					function btnListModalClickHandler() {
						console.log("모달창 오픈");
						$(".modal.list").css("display", "block");
					}
					function btnListModalOkClickHandler() {
						console.log("눌림");
						location.href = "${pageContext.request.contextPath}/board/community";
					}
					function btnListModalCancleClickHandler() {
						console.log("모달창 닫기");
						$(".modal.list").css("display", "none");
					}
				</script>
</body>

</html>