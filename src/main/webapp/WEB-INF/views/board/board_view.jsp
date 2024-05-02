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
<link
	href="${pageContext.request.contextPath}/resource/css/board/board_ck.css"
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
<jsp:include page="/WEB-INF/views/common/common_star.jsp" />
<style>
body > div.wrap-main > div.container > div.contents > div > div.view-content > div.memo > div.ck.ck-reset.ck-editor.ck-rounded-corners > div.ck.ck-editor__main > div{
	background: transparent;
}
</style>
</head>

<body>
[[ 로그인 정보 : ${ssslogin} ]]
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
								<dd id="board-writer">${dto.boardWriter }</dd>
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
<!-- 								
								<div class="modal reply-delete">
									<div class="modal_body">
										<h2>댓글을 삭제하시겠습니까?</h2>
										<div class="modal-btn">
											<button type="button" class="btn-reply-delete-modalok">확인</button>
											<button type="button" class="btn-reply-delete-modalcancel">취소</button>
										</div>
									</div>
								</div>
-->
							</form>
						</div>
					</div>
					<div class="view-content">
						<%-- <div class="memo">${dto.boardContent }</div> --%>
						<div class="memo">
						<div id="outline" class="document-outline-container" style="display:none;"></div>
                        <textarea id="editor" name="content"></textarea>
						</div>
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
					<div>댓글 ${replycount.replyCount}</div>
					<div class="comment-box">
						<input type="text" name="boardReplyContent" required>
						<button type="button" class="btn reply">등록</button>
					</div>
				</div>
			</form>

			<div class="reply-wrap">
				
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
            //$(".btn.reply").on("click", loginPermission);
            
            $(".btn.reply").on("click", btnReplyClickHandler);
            $(".btn-delete").on("click", btnDeleteClickHandler);
            $("#btn-delete-modalok").on("click", btnDeleteOkClickHandler);
            $("#btn-delete-modalcancel").on("click", btnDeleteCancelClickHandler);
            // 댓글 수정
            $(".btn.show.rereplyupdate").on("click", btnReplyUpdateClickHandler);
            $(".btn.reupdate").on("click", btnReplyUpdateOkClickHandler);
            // 댓글 삭제
            $(".btn.show.rereplydelete").on("click", btnReplyDeleteOkClickHandler);
            // $(".btn.show.rereplydelete").on("click", btnReplyDeleteClickHandler);
            // $(".btn-reply-delete-modalok").on("click", btnReplyDeleteOkClickHandler);
            

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
            // 로그인 확인
            // $ssslogin === null || ssslogin === undefined || ssslogin === ''
			if("${empty ssslogin}"){
				alert("로그인 후 댓글 작성이 가능합니다.");
				location.href="${pageContext.request.contextPath}/login";
	            return;
			}
            // 공란 테스트
            if($("#frm-reply [name=boardReplyContent]").val().trim().length == 0){
                alert("댓글을 입력해 주세요.");
            }
            
            console.log($("#frm-reply").serialize());

            $.ajax({
            	url: "${pageContext.request.contextPath}/board/reply/write.ajax"
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
        	console.log("${replydto.bReplyWriter}");
        	var htmlVal = '';
			var isAdmin = ("${ssslogin}"!="" && ("${ssslogin.mem_admin}" > "0"));
			console.log(isAdmin);
        	for(var idx in datalist){
				var replydto = datalist[idx];
				var buttonHtml = '';
        		if(isAdmin || "${ssslogin.mem_id}" == replydto.bReplyWriter ) {
		            		/* ssslogin.mem_admin > 0 || ssslogin.mem_id === replydto.bReplyWriter */
		                buttonHtml = `
		                    <button type="button" class="btn show rereplyupdate" id="reply-update">수정</button>
		                    <button type="button" class="btn show rereplydelete">삭제</button>
		                `;
		            }
				var buttonHtml2 = '';
        		if(isAdmin || "${ssslogin.mem_id}" == replydto.bReplyWriter ) {
		            		/* ssslogin.mem_admin > 0 || ssslogin.mem_id === replydto.bReplyWriter */
		                buttonHtml2 = `
		                    <button type="button" class="btn show rereplyupdate2" id="reply-update">수정</button>
		                    <button type="button" class="btn show rereplydelete">삭제</button>
		                `;
		            }
			if(replydto.bReplyLevel == 1){
        		htmlVal += `
        		<form class="frm-rereply">

        			<input type="hidden" name="boardNo" value="${dto.boardNo}">
        			<input type="hidden" name="boardReplyId" value="\${replydto.bReplyId}">
        			<input type="hidden" name="boardReplyWriter" value="\${replydto.bReplyWriter}">
        			<input type="hidden" name="boardReplyLevel" value="\${replydto.bReplyLevel}">
        			<input type="hidden" name="boardReplyStep" value="\${replydto.bReplyStep}">
        			<input type="hidden" name="boardReplyRef" value="\${replydto.bReplyRef}">
        			
        			<div class="boardreply grid">
        				<div class="recontent" id="recontent">\${replydto.bReplyContent}</div>
        				<input type="text" class="reupdatecontent" id="reupdatecontent" name="reupdatecontent">
        				<div class="rewritetime" id="rewritetime">\${replydto.bReplyWriteTime}</div>
        				<button type="button" class="btn reupdate" id="reupdateokbtn">등록</button>
        				<div>\${replydto.bReplyWriter}
        			</div>
        				<div class="btn-show">
	        				\${buttonHtml}
	    					<div class="modal reply-delete">
							<div class="modal_body">
								<h2>댓글을 삭제하시겠습니까?</h2>
								<div class="modal-btn">
									<button type="button" class="btn-reply-delete-modalok">확인</button>
									<button type="button" class="btn-reply-delete-modalcancel">취소</button>
								</div>
							</div>
						</div>
        					<button type="button" class="btn show rereplycontent">답글</button>
        				</div>
        				<div class="rereplycontent span">
        					<input type="text" name="boardReplyContent">
        					<button type="button" class="btn rereply">등록</button>
        				</div>
        			</div>
       		
        		</form>
				`;

			}else{
				htmlVal += `
	        		<form class="frm-rereply">

	        			<input type="hidden" name="boardNo" value="${dto.boardNo}">
	        			<input type="hidden" name="boardReplyId" value="\${replydto.bReplyId}">
	        			<input type="hidden" name="boardReplyWriter" value="\${replydto.bReplyWriter}">
	        			<input type="hidden" name="boardReplyLevel" value="\${replydto.bReplyLevel}">
	        			<input type="hidden" name="boardReplyStep" value="\${replydto.bReplyStep}">
	        			<input type="hidden" name="boardReplyRef" value="\${replydto.bReplyRef}">
	        			<div class="boardrereply grid">
	        				<div class="rerecontent"><span class="rereply-content">ㄴ </span> \${replydto.bReplyContent}</div>
        					<input type="text" class="reupdatecontent" id="reupdatecontent" name="reupdatecontent">
        					<div class="rewritetime" id="rewritetime">\${replydto.bReplyWriteTime}</div>
        					<button type="button" class="btn reupdate" id="reupdateokbtn">등록</button>
        				<div>\${replydto.bReplyWriter}</div>
	        				<div class="btn-show">
	        					\${buttonHtml2}
	    						<div class="modal reply-delete">
									<div class="modal_body">
										<h2>댓글을 삭제하시겠습니까?</h2>
										<div class="modal-btn">
											<button type="button" class="btn-reply-delete-modalok">확인</button>
											<button type="button" class="btn-reply-delete-modalcancel">취소</button>
										</div>
									</div>
								</div>
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
        	
		$(".reply-wrap").html(htmlVal);
		// html(새로운 내용으로 덮어쓰면 기존 event 등록이 사라짐)
		// event 다시 등록
		$(".btn.rereplycontent.show").on("click",btnReReplyContentClickHandler);
		$(".btn.rereply").on("click", btnReReplyClickHandler);
		// 수정 버튼 활성화
		$(".btn.show.rereplyupdate").on("click", btnReplyUpdateClickHandler);
		$(".btn.show.rereplyupdate2").on("click", btnReplyUpdateClickHandler2);
		$(".btn.reupdate").on("click", btnReplyUpdateOkClickHandler);
		
        $(".btn.show.rereplydelete").on("click", btnReplyDeleteOkClickHandler);
		// $(".btn.show.rereplydelete").on("click", btnReplyDeleteClickHandler);
        // $(".btn-reply-delete-modalok").on("click", btnReplyDeleteOkClickHandler);
        	}
        }
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
	        $boardRereply.find("input[name='reupdatecontent']").val($(this).closest('.boardrereply.grid').find('.rerecontent').children('.rereply-content').remove().end().text().trim());
	    		}
	}
       	 
       // 댓글 수정 
       
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
       				console.log("댓글 업데이트" );
    			   console.log(result);
      				
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
		
       // 댓글 삭제 버튼 오픈
      
      function btnReplyDeleteClickHandler() {
     	console.log("댓글 삭제 모달창 오픈");
		$(".modal.reply-delete").css("display", "block");
      }
      
     // 댓글 삭제 모달 닫기
/*      
     function btnReplyDeleteCancelClickHandler() {
	 	console.log("댓글 삭제 모달창 닫기");
	 	$(".modal.reply-delete").css("display", "none");
	 }
        */
       // 댓글 삭제
       
       function btnReplyDeleteOkClickHandler() {
    	   console.log("댓글 삭제 버튼 눌림");
    	   console.log($(this).parents(".frm-rereply").serialize());
    		
    	   $.ajax({
    		   url: "${pageContext.request.contextPath}/board/reply/delete.ajax"
    		   ,method: "post"
   			   ,error: function(request, status, error) {
   					alert("code: " + request.status + "\n" + "message: "
   							+ request.responseText + "\n" + "error: " + error);
               }
    		   ,data: $(this).parents(".frm-rereply").serialize()
    		   ,dataType: "json"
    		   ,success: function(result){
    			   console.log("댓글delete result ");
    			   console.log(result);
                   if(result == null){
                       alert("댓글이 삭제되지 않았습니다. 1");
                       return;
                   }
	    		   displayReplyWrap(result);
    		   }
    	   });
		}
			 
       	// 글 삭제 모달 오픈 
       	function btnDeleteClickHandler() {
       		console.log("모달창 오픈");
			$(".modal.delete").css("display", "block");
		}
       	
       	// 글 삭제 모달 닫기
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
		// 클라우디너리
    	</script>
   
        <script src="https://cdn.ckbox.io/CKBox/2.4.0/ckbox.js"></script>
        <script src="https://cdn.ckeditor.com/ckeditor5/41.2.0/super-build/ckeditor.js"></script>
	    <script src="https://cdn.ckeditor.com/ckeditor5/41.2.0/super-build/translations/ko.js"></script>
   
        <script>
    	// ck 에디터
            // This sample still does not showcase all CKEditor 5 features (!)
            // Visit https://ckeditor.com/docs/ckeditor5/latest/features/index.html to browse all the features.
            CKEDITOR.ClassicEditor.create(document.querySelector('#editor'), { // 여기 editor
                // https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html#extended-toolbar-configuration-format
                toolbar: {
                    items: [
                        'aiCommands', 'aiAssistant', '|',
                        'ckbox', 'uploadImage', '|',
                        'exportPDF', 'exportWord', '|',
                        'comment', 'trackChanges', 'revisionHistory', '|',
                        'findAndReplace', 'selectAll', 'formatPainter', '|',
                        'undo', 'redo',
                        '-',
                        'bold', 'italic', 'strikethrough', 'underline', 'removeFormat', '|',
                        'bulletedList', 'numberedList', 'todoList', '|',
                        'outdent', 'indent', '|',
                        'alignment', '|',
                        '-',
                        'heading', '|',
                        'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
                        'link', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', 'tableOfContents', 'insertTemplate', '|',
                        'specialCharacters', 'horizontalLine', 'pageBreak', '|',
                        // Intentionally skipped buttons to keep the toolbar smaller, feel free to enable them:
                        // 'code', 'subscript', 'superscript', 'textPartLanguage', '|',
                        // ** To use source editing remember to disable real-time collaboration plugins **
                        // 'sourceEditing'
                    ],
                    shouldNotGroupWhenFull: true
                },
                // Changing the language of the interface requires loading the language file using the <script> tag.
                // language: 'es',
                list: {
                    properties: {
                        styles: true,
                        startIndex: true,
                        reversed: true
                    }
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
                heading: {
                    options: [
                        { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
                        { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
                        { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
                        { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
                        { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
                        { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
                        { model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6' }
                    ]
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
                fontFamily: {
                    options: [
                        'default',
                        'Arial, Helvetica, sans-serif',
                        'Courier New, Courier, monospace',
                        'Georgia, serif',
                        'Lucida Sans Unicode, Lucida Grande, sans-serif',
                        'Tahoma, Geneva, sans-serif',
                        'Times New Roman, Times, serif',
                        'Trebuchet MS, Helvetica, sans-serif',
                        'Verdana, Geneva, sans-serif'
                    ],
                    supportAllValues: true
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
                fontSize: {
                    options: [10, 12, 14, 'default', 18, 20, 22],
                    supportAllValues: true
                },
                // Be careful with the setting below. It instructs CKEditor to accept ALL HTML markup.
                // https://ckeditor.com/docs/ckeditor5/latest/features/general-html-support.html#enabling-all-html-features
                // htmlSupport: {
                //  allow: [
                //      {
                //          name: /.*/,
                //          attributes: true,
                //          classes: true,
                //          styles: true
                //      }
                //  ]
                // },
                // Be careful with enabling previews
                // https://ckeditor.com/docs/ckeditor5/latest/features/html-embed.html#content-previews
                htmlEmbed: {
                    showPreviews: true
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/mentions.html#configuration
                mention: {
                    feeds: [
                        {
                            marker: '@',
                            feed: [
                                '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
                                '@cupcake', '@danish', '@donut', '@dragée', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
                                '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@soufflé',
                                '@sugar', '@sweet', '@topping', '@wafer'
                            ],
                            minimumCharacters: 1
                        }
                    ]
                },
                template: {
                    definitions: [
                        {
                            title: 'The title of the template',
                            description: 'A longer description of the template',
                            data: '<p>Data inserted into the content</p>'
                        },
                        {
                            title: 'Annual financial report',
                            description: 'A report that spells out the company\'s financial condition.',
                            data: `<figure class="table">
                            <table style="border:2px solid hsl(0, 0%, 0%);">
                                <thead>
                                    <tr>
                                        <th style="text-align:center;" rowspan="2">Metric name</th>
                                        <th style="text-align:center;" colspan="4">Year</th>
                                    </tr>
                                    <tr>
                                        <th style="background-color:hsl(90, 75%, 60%);text-align:center;">2019</th>
                                        <th style="background-color:hsl(90, 75%, 60%);text-align:center;">2020</th>
                                        <th style="background-color:hsl(90, 75%, 60%);text-align:center;">2021</th>
                                        <th style="background-color:hsl(90, 75%, 60%);text-align:center;">2022</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th><strong>Revenue</strong></th>
                                        <td>$100,000.00</td>
                                        <td>$120,000.00</td>
                                        <td>$130,000.00</td>
                                        <td>$180,000.00</td>
                                    </tr>
                                    <tr>
                                        <th style="background-color:hsl(0, 0%, 90%);"><strong>Operating expenses</strong></th>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <th><strong>Interest</strong></th>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <th style="background-color:hsl(0, 0%, 90%);"><strong>Net profit</strong></th>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </tbody>
                            </table>
                        </figure>`
                        },
                    ]
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
                placeholder: '내용을 입력해주세요.',
                // Used by real-time collaboration
                cloudServices: {
                    // Be careful - do not use the development token endpoint on production systems!
                    tokenUrl: 'https://108971.cke-cs.com/token/dev/LWvcqjSdY8J1orf2B1bT0an5x6qP8mxfseAP?limit=10',
                    webSocketUrl: 'wss://108971.cke-cs.com/ws',
                    uploadUrl: 'https://108971.cke-cs.com/easyimage/upload/'
                },
                collaboration: {
                    // Modify the channelId to simulate editing different documents
                    // https://ckeditor.com/docs/ckeditor5/latest/features/collaboration/real-time-collaboration/real-time-collaboration-integration.html#the-channelid-configuration-property
                    channelId: 'document-id-7'
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/collaboration/annotations/annotations-custom-configuration.html#sidebar-configuration
                /* sidebar: {
                    container: document.querySelector('#sidebar')
                }, */
                documentOutline: {
                    container: document.querySelector('#outline')
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/collaboration/real-time-collaboration/users-in-real-time-collaboration.html#users-presence-list
                /* presenceList: {
                    container: document.querySelector('#presence-list-container')
                }, */
                // Add configuration for the comments editor if the Comments plugin is added.
                // https://ckeditor.com/docs/ckeditor5/latest/features/collaboration/annotations/annotations-custom-configuration.html#comment-editor-configuration
                comments: {
                    editorConfig: {
                        extraPlugins: CKEDITOR.ClassicEditor.builtinPlugins.filter(plugin => {
                            // Use e.g. Ctrl+B in the comments editor to bold text.
                            return ['Bold', 'Italic', 'Underline', 'List', 'Autoformat', 'Mention'].includes(plugin.pluginName);
                        }),
                        // Combine mentions + Webhooks to notify users about new comments
                        // https://ckeditor.com/docs/cs/latest/guides/webhooks/events.html
                        mention: {
                            feeds: [
                                {
                                    marker: '@',
                                    feed: [
                                        '@Baby Doe', '@Joe Doe', '@Jane Doe', '@Jane Roe', '@Richard Roe'
                                    ],
                                    minimumCharacters: 1
                                }
                            ]
                        },
                    }
                },
                // Do not include revision history configuration if you do not want to integrate it.
                // Remember to remove the 'revisionHistory' button from the toolbar in such a case.
                /* revisionHistory: {
                    editorContainer: document.querySelector('#editor-container'),
                    viewerContainer: document.querySelector('#revision-viewer-container'),
                    viewerEditorElement: document.querySelector('#revision-viewer-editor'),
                    viewerSidebarContainer: document.querySelector('#revision-viewer-sidebar'),
                }, */
                // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/ckbox.html
                ckbox: {
                    // Be careful - do not use the development token endpoint on production systems!
                    tokenUrl: 'https://108971.cke-cs.com/token/dev/LWvcqjSdY8J1orf2B1bT0an5x6qP8mxfseAP?limit=10'
                },
                ai: {
                    // AI Assistant feature configuration.
                    // https://ckeditor.com/docs/ckeditor5/latest/features/ai-assistant.html
                    aiAssistant: {
                        contentAreaCssClass: "formatted"
                    },
                    // Configure one of the supported AI integration: OpenAI, Azure OpenAI, Amazon Bedrock
                    // https://ckeditor.com/docs/ckeditor5/latest/features/ai-assistant/ai-assistant-integration.html#integration
                    openAI: {
                        // apiUrl: 'https://url.to.your.application/ai'
                    }
                },
                style: {
                    definitions: [
                        {
                            name: 'Article category',
                            element: 'h3',
                            classes: ['category']
                        },
                        {
                            name: 'Info box',
                            element: 'p',
                            classes: ['info-box']
                        },
                    ]
                },
                // License key is required only by the Pagination plugin and non-realtime Comments/Track changes.
                licenseKey: 'NGN3bHZtUjJWZjk4Zis1N0xmUGhqQ2Q5RjFWVU1MZVNGM1h6L1FBRnVpNE0xV0I5THdTTkptOFpqaUtKLU1qQXlOREExTWpZPQ==',
                removePlugins: [
                    // Before enabling Pagination plugin, make sure to provide proper configuration and add relevant buttons to the toolbar
                    // https://ckeditor.com/docs/ckeditor5/latest/features/pagination/pagination.html
                    'Pagination',
                    // Intentionally disabled, file uploads are handled by CKBox
                    'Base64UploadAdapter',
                    // Intentionally disabled, file uploads are handled by CKBox
                    'CKFinder',
                    // Intentionally disabled, file uploads are handled by CKBox
                    'EasyImage',
                    // Requires additional license key
                    'WProofreader',
                    // Incompatible with real-time collaboration
                    'SourceEditing',
                    // Careful, with the Mathtype plugin CKEditor will not load when loading this sample
                    // from a local file system (file://) - load this site via HTTP server if you enable MathType
                    'MathType', 
                    // If you would like to adjust enabled collaboration features:
                    'RealTimeCollaborativeComments',
                    'RealTimeCollaborativeTrackChanges',
                    'RealTimeCollaborativeRevisionHistory',
                    'PresenceList',
                    'sidebar',
                    // 'Comments',
                    // 'TrackChanges',
                    // 'TrackChangesData',
                    'RevisionHistory'
                ]
            })
                .then(a => {
                    b = a;
					
                    // readonly로 변경
                    b.enableReadOnlyMode( 'feature-id' );
                    // readonly 모드 시 툴바 제거
                    const toolbarElement = b.ui.view.toolbar.element;
                    toolbarElement.style.display='none';
                    var content = '${dto.boardContent}';
                    b.setData(content);
                    // Example implementation to switch between different types of annotations according to the window size.
                    // https://ckeditor.com/docs/ckeditor5/latest/features/collaboration/annotations/annotations-display-mode.html
                    const annotationsUIs = b.plugins.get('AnnotationsUIs');
                    // const sidebarElement = document.querySelector('.sidebar');
                    let currentWidth;
				
                    function refreshDisplayMode() {
                        // Check the window width to avoid the UI switching when the mobile keyboard shows up.
                        if (window.innerWidth === currentWidth) {
                            return;
                        }
                        currentWidth = window.innerWidth;

                        if (currentWidth < 1000) {
                            // sidebarElement.classList.remove('narrow');
                            // sidebarElement.classList.add('hidden');
                            annotationsUIs.switchTo('inline');
                        }
                        else if (currentWidth < 1300) {
                            // sidebarElement.classList.remove('hidden');
                            // sidebarElement.classList.add('narrow');
                            annotationsUIs.switchTo('narrowSidebar');
                        }
                        else {
                            // sidebarElement.classList.remove('hidden', 'narrow');
                            annotationsUIs.switchTo('wideSidebar');
                        }
                    }

                    // editor.ui.view.listenTo(window, 'resize', refreshDisplayMode);
                    // refreshDisplayMode();

                    return b;
                })
                .catch(error => {
                    // console.error('There was a problem initializing the editor.', error);
                });
 
    </script>
</body>

</html>