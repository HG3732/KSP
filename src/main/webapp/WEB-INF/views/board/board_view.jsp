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
							<c:if test="${detail.reDto.reTitle }">
								<strong>${dto.boardTitle } (수정됨)</strong>
							</c:if>
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
							<form id="frm-edit">
								<input type="hidden" name="boardNo" value="${dto.boardNo }">
								<dl class="btn">
									<dt>
										<c:if
											test="${ssslogin.mem_admin > 0 || ssslogin.mem_id eq dto.boardWriter}">
											<a
												href="${PageContext.request.contextPath}/star/board/update?no=${dto.boardNo }"><button
													type="button" class="btn-update">수정하기</button></a>
										</c:if>
									</dt>
									<dd>
										<c:if
											test="${ssslogin.mem_admin > 0 || ssslogin.mem_id eq dto.boardWriter}">
											<button type="button" class="btn-delete">삭제하기</button>
										</c:if>
									</dd>
								</dl>
								<div class="modal delete">
									<div class="modal_body">
										<h2>글을 삭제하시겠습니까?</h2>
										<div class="modal-btn">
											<button type="button" id="btn-delete-modalok">확인</button>
											<button type="button" id="btn-delete-modalcancel">취소</button>
										</div>
									</div>
								</div>
							</form>
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
					<div>댓글 ${replydto.replyCount}</div>
					<div class="comment-box">
						<input type="text" name="boardReplyContent" required>
						<button type="button" class="btn reply">등록</button>
					</div>
				</div>
			</form>

			<div class="reply-wrap">
				<!-- 				<div class="test-id">
				
				</div> -->
			</div>
		</div>
	</div>
	<div class="wrap-footer">
		<footer> </footer>
	</div>
	<script>
        $(loadedHandler);
        function loadedHandler(){
            $(".btn.reply").on("click", btnReplyClickHandler);
            $(".btn-delete").on("click", btnDeleteClickHandler);
            $("#btn-delete-modalok").on("click", btnDeleteOkClickHandler);
            $("#btn-delete-modalcancel").on("click", btnDeleteCancelClickHandler);
            $(".btn.show.rereplyupdate").on("click", btnReplyUpdateClickHandler);
            $(".btn.reupdate").on("click", btnReplyUpdateOkClickHandler);

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
        	console.log("${replydto.bReplyId}");
        	
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
        // TODO 본인댓글에만 수정 삭제 버튼 표시
        function displayReplyWrap(datalist) {
        	console.log("${dto.boardNo}");
        	var htmlVal = '';
        	for(var idx in datalist){
				var replydto = datalist[idx];
				var buttonHtml = '';
		          if("${ssslogin.mem_admin}" > 0 || "${ssslogin.mem_id}" == "${replydto.bReplyWriter}") {
		              buttonHtml = `
		                  <button type="button" class="btn show rereplyupdate" id="reply-update">수정</button>
		                  <button type="button" class="btn show rereplydelete">삭제</button>
		              `;
		          }
				if(replydto.bReplyLevel == 1){
        		htmlVal += `
        		<form class="frm-rereply">
        			<input type="hidden" name="boardNo" value="${dto.boardNo}">
        			<input type="hidden" name="boardReplyId" value="\${replydto.bReplyId}">
        			<input type="hidden" name="boardReplyLevel" value="\${replydto.bReplyLevel}">
        			<input type="hidden" name="boardReplyStep" value="\${replydto.bReplyStep}">
        			<input type="hidden" name="boardReplyRef" value="\${replydto.bReplyRef}">
        			<div class="boardreply grid">
        				<div class="recontent" id="recontent">"\${replydto.bReplyContent}"</div>
        				<input type="text" class="reupdatecontent" id="reupdatecontent" name="reupdatecontent">
        				<div class="rewritetime" id="rewritetime">"\${replydto.bReplyWriteTime}"</div>
        				<button type="button" class="btn reupdate" id="reupdateokbtn">등록</button>
        				<div>"\${replydto.bReplyWriter}"</div>
        				<div class="btn-show">
							"\${buttonHtml}"
        					<button type="button" class="btn show rereplycontent">답글</button>
        				</div>
        				<div class="rereplycontent span">
        					<input type="text" name="boardReplyContent">
        					<button type="button" class="btn rereply">등록</button>
        				</div>
        			</div>
        		</form>
				`;
				/* 
			<div><span class="rereply-content">ㄴ </span> \${replydto.bReplyContent}</div>
	        				<input type="text" class="reupdatecontent" id="reupdatecontent" name="reupdatecontent">
	        				<div class="rewritetime" id="rewritetime">\${replydto.bReplyWriteTime}</div>
	        				<button type="button" class="btn reupdate" id="reupdateokbtn">등록</button>
	        				<div>\${replydto.bReplyWriter}</div>
	        				 */
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
	        				<div class="rerecontent"><span class="rereply-content">ㄴ</span>"\${replydto.bReplyContent}"</div>
        					<input type="text" class="reupdatecontent" id="reupdatecontent" name="reupdatecontent">
        					<div class="rewritetime" id="rewritetime">"\${replydto.bReplyWriteTime}"</div>
        					<button type="button" class="btn reupdate" id="reupdateokbtn">등록</button>
        				<div>"\${replydto.bReplyWriter}"</div>
	        				<div class="btn-show">
	        				\${buttonHtml}
        						<button type="button" class="btn show rereplycontent">답글</button>
        					</div>
	        				<div class="rereplycontent span">
	        					<input type="text" name="boardReplyContent">
	        					<button type="button" class="btn rereply">등록</button>
	        				</div>
	        			</div>
	        		</form>
					`;
				
			}
				/* 
				var htmlValTest = '';
	        	for(var idx in datalist){
					var replydto = datalist[idx];
					if(replydto.bReplyLevel == 1){
						htmlValTest += `
							 <button type="button" class="btn show rereplyupdate" id="reply-update">수정</button>
		                    <button type="button" class="btn show rereplydelete">삭제</button>
		                `;
					}
        }
					 */
		$(".reply-wrap").html(htmlVal);
		// $(".test-id").html(htmlValTest);
		// html(새로운 내용으로 덮어쓰면 기존 event 등록이 사라짐)
		// event 다시 등록
		$(".btn.rereplycontent.show").on("click",btnReReplyContentClickHandler);
		$(".btn.rereply").on("click", btnReReplyClickHandler);
		// 수정 버튼 활성화
		$(".btn.show.rereplyupdate").on("click", btnReplyUpdateClickHandler);
		$(".btn.show.rereplyupdate2").on("click", btnReplyUpdateClickHandler2);
		$(".btn.reupdate").on("click", btnReplyUpdateOkClickHandler);
        }
        }
        // 댓글 수정
        // $("#reply-update").on("click", btnReplyUpdateClickHandler);
/*         
        (function() {
            // AJAX 요청
            $.ajax({
                url: "${pageContext.request.contextPath}/board/reply/update.ajax"
                method: "post",
                dataType: "json",
                success: function(data) {
                    // 성공적으로 데이터를 받았을 때 실행할 코드
                    console.log(data);
                },
                error: function(request, status, error) {
 					alert("code: " + request.status + "\n" + "message: "
 							+ request.responseText + "\n" + "error: " + error);
                 }
            });
            // reply-update 버튼 클릭 핸들러 등록
            $("#reply-update").on("click", btnReplyUpdateOkClickHandler);
        })();

 */        
       	// 댓글 총 개수
        
       	// 답글 입력란
        function btnReReplyContentClickHandler() {
        	if($(this).text() == "취소"){
        		$(this).text("댓글");
        	}else{
        		$(this).text("취소");
        	}
			$(this).parent().next().toggle();
			/* $(this).prev().html(""); */
		}
       	
       	// 댓글 수정란
		// 댓글 수정 버튼 클릭 시
	function btnReplyUpdateClickHandler() {
	    console.log("수정버튼 눌림");
	    // 현재 클릭된 수정 버튼에 대해서만 작업 수행
	    var $boardReply = $(this).closest('.boardreply');
	    if ($(this).text() == "취소") {
	        $(this).text("수정");
	        $boardReply.find(".reupdatecontent").css("display", "none");
	        $boardReply.find(".btn.reupdate").css("display", "none");
	        $boardReply.find(".recontent").css("display", "block");
	        $boardReply.find(".rewritetime").css("display", "block");
	    } else {
	        $(this).text("취소");
	        $boardReply.find(".reupdatecontent").css("display", "block");
	        $boardReply.find(".btn.reupdate").css("display", "block");
	        $boardReply.find(".recontent").css("display", "none");
	        $boardReply.find(".rewritetime").css("display", "none");
	        var content = $boardReply.find('.recontent').val();
	        $boardReply.find("input[name='reupdatecontent']").val($(this).closest('.boardreply').find('.recontent').text());
	    		}

		    }
       	
    	// 대댓글 수정 버튼 클릭시 
	function btnReplyUpdateClickHandler2() {
	    console.log("수정버튼 눌림");
	    // 현재 클릭된 수정 버튼에 대해서만 작업 수행
	    var $boardRereply = $(this).closest('.boardrereply.grid');
	    if ($(this).text() == "취소") {
	        $(this).text("수정");
	        $boardRereply.find(".reupdatecontent").css("display", "none");
	        $boardRereply.find(".btn.reupdate").css("display", "none");
	        $boardRereply.find(".rerecontent").css("display", "block");
	        $boardRereply.find(".rewritetime").css("display", "block");
	    } else {
	        $(this).text("취소");
	        $boardRereply.find(".reupdatecontent").css("display", "block");
	        $boardRereply.find(".btn.reupdate").css("display", "block");
	        $boardRereply.find(".rerecontent").css("display", "none");
	        $boardRereply.find(".rewritetime").css("display", "none");
	        var content = $boardRereply.find('.recontent').val();
	        // trim을 사용해서 'ㄴ'자 제외
	        $boardRereply.find("input[name='reupdatecontent']").val($(this).closest('.boardrereply.grid').find('.rerecontent').text().trim());
	    		}
	}
			        
/* 			
        	if($(this).text() == "취소"){
        		$(this).text("수정");
    			$(".reupdatecontent").css("display", "none");
    			$(".btn.reupdate").css("display", "none");
    			$(".recontent").css("display", "block");
    			$(".rewritetime").css("display", "block");
        	} else{
        		$(this).text("취소");
        		$(".reupdatecontent").css("display", "block");
    			$(".btn.reupdate").css("display", "block");
    			$(".recontent").css("display", "none");
    			$(".rewritetime").css("display", "none");
            	$(this).parent().parent().children("input[name='reupdatecontent']").first().val($(this).closest('.boardreply').find('.recontent').text());
    			// $(this).parent().next().children("input[name='boardReplyContent']").toggle();
    			console.log($(this).parent().parent().children("input[name='reupdatecontent']").val($(this).closest('.boardreply').find('.recontent').text()));
    			console.log($(this).closest('.boardreply').find('.recontent').text());
        	}
		}
       	 */

       	// 댓글 수정 등록버튼
/*        	
       function btnReplyUpdateOkClickHandler() {
			console.log("업데이트 등록 버튼 눌림");
     		$.ajax({
     		   url : "${pageContext.request.contextPath}/board/reply/update.ajax"
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
		} */
       	 
       	
       function btnReplyUpdateOkClickHandler() {
			console.log("업데이트 등록 버튼 눌림");
     		$.ajax({
       			url: "${pageContext.request.contextPath}/board/reply/update.ajax"
       			,method: "post"
       			,error: function(request, status, error) {
 					alert("code: " + request.status + "\n" + "message: "
 							+ request.responseText + "\n" + "error: " + error);
                 }
       			,data: $(this).parents(".frm-rereply").serialize()
       			,dataType: "json"
       			,success: function(result) {
       				console.log("댓글 업데이트" + result);
                    if(result == "-1"){
                        alert("댓글이 작성되지 않았습니다.");
                        location.href="${pageContext.request.contextPath}/board/community";
                        return;
                    }
                    if(result == "0"){
                        alert("댓글 등록에 실패했습니다");
                        return;
                    }
                    displayReplyWrap(result);
				}
       		 });
		}
			 
       	// 모달 오픈 
       	function btnDeleteClickHandler() {
       		console.log("모달창 오픈");
			$(".modal.delete").css("display", "block");
		}
       	
       	// 모달 닫기
       	function btnDeleteCancelClickHandler() {
			console.log("모달창 닫기");
			$(".modal.delete").css("display", "none");
		}
       	
       	// 글 삭제
       	function btnDeleteOkClickHandler() {
			console.log("눌림");
			var frm = document.getElementById("frm-edit");
			frm.method = "post";
			// frm.enctype = "multipart/form-data"; // form 태그 내부에 input type="file"이 있다면
			frm.action = "${pageContext.request.contextPath}/board/delete"; 
			frm.submit();

		}

    </script>
</body>

</html>