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
<style>

</style>
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
				<a href="${pageContext.request.contextPath}/board/community"
					class="flex community">게시판</a> <a
					href="${pageContext.request.contextPath}/board/faq"
					class="flex faq">FAQ</a>
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
							<dl class="write-time">
								<dt>작성일</dt>
								<dd>${dto.boardWriteTime }</dd>
							</dl>
							<dl class="hits">
								<dt>조회수</dt>
								<dd>${dto.hit }</dd>
							</dl>
						</div>
						<div class="file">
							<dl>
								<dt>첨부파일</dt>
								<dd>
									<ul>
										<c:forEach items="${dto.filedtolist }" var="filedto">
											<li>${filedto.fileOriginalName }<a
												href="${pageContext.request.contextPath}/files/${filedto.filePath}"
												download="${filedto.fileOriginalName }">다운로드</a>
											</li>
										</c:forEach>
									</ul>
								</dd>
							</dl>
							<dl class="btn">
								<dt>
									<c:if test="${ssslogin.mem_admin > 0 || ssslogin.mem_id eq dto.boardWriter}">
									<a href="${PageContext.request.contextPath}/star/board/update?no=${dto.boardNo }"><button type="button" class="btn-update">수정하기</button></a>
								</c:if>
								</dt>
								<dd>
									<c:if test="${ssslogin.mem_admin > 0 || ssslogin.mem_id eq dto.boardWriter}">
									<a href="${PageContext.request.contextPath}/star/board/delete?no=${dto.boardNo }"><button type="button" class="btn-delete">삭제하기</button></a>
									</c:if>
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
			<form id="frm-reply">
				<input type="hidden" name="boardNo" value="${dto.boardNo }">
				<div class="comment">
					 <div>댓글 ${replydto.replyCount} </div> 
					<div class="comment-box">
						<input type="text" name="boardReplyContent" required>
						<button type="button" class="btn reply">등록</button>
					</div>
				</div>
			</form>

			<div class="reply-wrap"></div>
		</div>
	</div>
	<div class="wrap-footer">
		<footer> </footer>
	</div>
	<script>
        $(loadedHandler);
        function loadedHandler(){
            $(".btn.reply").on("click", btnReplyClickHandler);

            $.ajax({
                url : "${pageContext.request.contextPath}/board/reply/read.ajax"
                ,method : "post"
                ,error : function(request, status, error) {
					alert("code: " + request.status + "\n" + "message: "
							+ request.responseText + "\n" + "error: " + error);
                }
                ,data : {boardNo:"${dto.boardNo}"}
                ,dataType : "json"
                ,success : function(result){
                    console.log(result);
                    displayReplyWrap(result);
                }
            });
            console.log("${dto.boardNo}");
        }
		// 댓글
        function btnReplyClickHandler() {
        	console.log("댓글 등록버튼 눌림");
            // 로그인 페이지로 이동

            // 공란 테스트
            if($("#frm-reply [name=boardReplyContent]").val().trim().length == 0){
                alert("댓글을 입력해 주세요.");
                return;
            }
            
            console.log($("#frm-reply").serialize());

            $.ajax({
                url : "${pageContext.request.contextPath}/board/reply/write.ajax"
                ,method : "post"
                ,error : function(request, status, error) {
					alert("code: " + request.status + "\n" + "message: "
							+ request.responseText + "\n" + "error: " + error);
                }
                ,data : $("#frm-reply").serialize()
                ,dataType : "json"
                ,success : function(result){
                    if(result == "-1"){
                        alert("댓글이 작성되지 않았습니다.");
                        return;
                    }
                    if(result == "0"){
                        alert("댓글 등록에 실패했습니다");
                        return;
                    }
                    console.log("댓글작성 result : " + result);
                    displayReplyWrap(result);
                }
            });
         	// 댓글 등록 후 댓글란 비우기
            $(this).prev().val("");
        }
		
        // 대댓글
        function btnReReplyClickHandler() {
            // login 확인
         if($(this).parents(".frm-rereply").find("[name=boardReplyContent]").val().trim().length == 0){
        	 
        	 alert("대댓글 댓글이 작성되지 않았습니다");
         }
         
         console.log($(this).parents(".frm-rereply").serialize());
         
         $.ajax({
                 url : "${pageContext.request.contextPath}/board/reply/write.ajax"
                 ,method : "post"
                 ,error : function(request, status, error) {
 					alert("code: " + request.status + "\n" + "message: "
 							+ request.responseText + "\n" + "error: " + error);
                 }
                 ,data : $(this).parents(".frm-rereply").serialize()
                 ,dataType : "json"
                 ,success : function(result){
                     if(result == "-1"){
                         alert("댓글이 작성되지 않았습니다.");
                         location.href="${pageContext.request.contextPath}/view";
                         return;
                     }
                     if(result == "0"){
                         alert("댓글 등록에 실패했습니다");
                         return;
                     }
                     displayReplyWrap(result);
                     // displayReReplyWrap(result);
                 }
         });
         
        }
         
        // 댓글
        function displayReplyWrap(datalist) {
        	console.log("${dto.boardNo}");
        	var htmlVal = '';
        	for(var idx in datalist){
				var replydto = datalist[idx];
				if(replydto.bReplyLevel == 1){
        		htmlVal += `
        		<form class="frm-rereply">
        			<input type="hidden" name="boardNo" value="${dto.boardNo}">
        			<input type="hidden" name="boardReplyId" value="\${replydto.bReplyId}">
        			<input type="hidden" name="boardReplyLevel" value="\${replydto.bReplyLevel}">
        			<input type="hidden" name="boardReplyStep" value="\${replydto.bReplyStep}">
        			<input type="hidden" name="boardReplyRef" value="\${replydto.bReplyRef}">
        			<div class="boardreply grid">
        				<div>\${replydto.bReplyContent}</div>
        				<div>\${replydto.bReplyWriteTime}</div>
        				<div>\${replydto.bReplyWriter}</div>
        				<div><button type="button" class="btn show rereplycontent">답글</button></div>
        				<div class="rereplycontent span">
        					<input type="text" name="boardReplyContent">
        					<button type="button" class="btn rereply">등록</button>
        				</div>
        			</div>
        		</form>
				`;
				
			// 대댓글
			}else{
				htmlVal += `
	        		<form class="frm-rereply">
	        			<input type="hidden" name="boardNo" value="${dto.boardNo}">
	        			<input type="hidden" name="boardReplyId" value="\${replydto.bReplyId}">
	        			<input type="hidden" name="boardReplyLevel" value="\${replydto.bReplyLevel}">
	        			<input type="hidden" name="boardReplyStep" value="\${replydto.bReplyStep}">
	        			<input type="hidden" name="boardReplyRef" value="\${replydto.bReplyRef}">
	        			<div class="boardrereply grid">
	        				<div><span class="rereply-content">ㄴ </span> \${replydto.bReplyContent}</div>
	        				<div>\${replydto.bReplyWriteTime}</div>
	        				<div>\${replydto.bReplyWriter}</div>
	        				<div><button type="button" class="btn show rereplycontent">답글</button></div>
	        				<div class="rereplycontent span">
	        					<input type="text" name="boardReplyContent">
	        					<button type="button" class="btn rereply">등록</button>
	        				</div>
	        			</div>
	        		</form>
					`;
				
			}
        }
		$(".reply-wrap").html(htmlVal);
		// html(새로운 내용으로 덮어쓰면 기존 event 등록이 사라짐)
		// event 다시 등록
		$(".btn.rereplycontent.show").on("click",btnReReplyContentClickHandler);
		$(".btn.rereply").on("click", btnReReplyClickHandler);
        }
        
       	// 댓글 총 개수
       	/* 
       	$.ajax({
       		url : "${pageContext.request.contextPath}/board/reply/write.ajax",
       		method : "post",
       		data : {boardNo:"${dto.boardNo}"},
       		dataType : "json",
       		success : function (result){
       			// 댓글 총 개수를 가져와서 HTML에 표시
       			$(".comment").html("<div>댓글 ${reply.replyCount} </div>");
       		}
       	});
        */
        // 대댓글
/*          
        function displayReReplyWrap(datalist) {
        	console.log("${dto.boardNo}");
        	var htmlVal = '';
        	for(var idx in datalist){
				var replydto = datalist[idx];
        		htmlVal += `
        		<form class="frm-rereply">
        			<input type="hidden" name="boardNo" value="${dto.boardNo}">
        			<input type="hidden" name="boardReplyId" value="\${replydto.bReplyId}">
        			<input type="hidden" name="boardReplyLevel" value="\${replydto.bReplyLevel}">
        			<input type="hidden" name="boardReplyStep" value="\${replydto.bReplyStep}">
        			<input type="hidden" name="boardReplyRef" value="\${replydto.bReplyRef}">
        			<div class="boardrereply grid">
        				<div>\${replydto.bReplyId}</div>
        				<div>\${replydto.bReplyContent}</div>
        				<div>\${replydto.bReplyWriteTime}</div>
        				<div>\${replydto.bReplyWriter}</div>
        				<div><button type="button" class="btn show rereplycontent">답글</button></div>
        				<div class="rereplycontent span">
        					<input type="text" name="boardReplyContent">
        					<button type="button" class="btn rereply">등록</button>
        				</div>
        			</div>
        		</form>
				`;
			}
         	
    		$(".reply-wrap").html(htmlVal);
    		// html(새로운 내용으로 덮어쓰면 기존 event 등록이 사라짐)
    		// event 다시 등록
    		$(".btn.rereplycontent.show").on("click",btnReReplyContentClickHandler);
    		$(".btn.rereply").on("click", btnReReplyClickHandler);
            }
           */
        
        	
        function btnReReplyContentClickHandler() {
        	if($(this).text() == "취소"){
        		$(this).text("댓글");
        	}else{
        		$(this).text("취소");
        	}
			$(this).parent().next().toggle();
			/* $(this).prev().html(""); */
		}
    </script>
</body>

</html>