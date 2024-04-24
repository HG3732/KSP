<link href="${pageContext.request.contextPath}/resource/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/core.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KimParkSeo</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <jsp:include page="/WEB-INF/views/common/common_star.jsp"/>
    <script>
	loginPermission();
    </script>
    <style>
        .wrap-main,
        .wrap-footer{
            margin: 10px auto;
            width: 1100px;
            height: fit-content;
        }
        .wrap-main>.content{
            overflow: hidden;
        }
        .wrap-main>.content>a{
            float: left;
            width: 50%;
            box-sizing: border-box;
            cursor: pointer;
            text-align: center;
        }
        .wrap-main>.content>.home-menu{
            display: flex;
            float: right;
            align-items: center;
            margin: 10px 0;
        }
        .wrap-main>.content>.home-menu>a>img{
            width: 1em;
            height: 1em;
            background-color: transparent;
            filter: invert(1);
        }
        .wrap-main>.content>hr{
            clear: both;
        }
        .wrap-main>.content>.edu-list {
            clear: both;
        }
        .wrap-main>.content>.edu-list>.edu-detail{
        	padding: 30px;
        }
        .wrap-main>.content>.edu-list>.edu-detail>.edu-detail-content>table{
            line-height: 3em;
            width: 100%;
        }
		.wrap-main>.content>.edu-list>.edu-detail>.edu-detail-content>table>tbody>tr>td>.edu-edit-del{
		    display: flex;
		    float: right;
		    column-gap: 10px;
		    justify-content: flex-end;
		    align-items: center;
		}
        .wrap-main>.content>.edu-list>.edu-detail>.edu-book{
            text-align: center;
            margin-top: 10px;
        }
        .wrap-main .btn{
			background-color: transparent;
			border: 1px solid white;
			cursor: pointer;
			font-size: 16px;
        }
        .wrap-main .btn:hover{
        	background-color: white;
        	color: black;
        	font-weight: bold;
        }
        
        .wrap-main .tabs{
        	display: flex;
        	justify-content: space-around;
        }
        .wrap-main .tabs>div{
        	border: 1px solid white;
        	width: 100%; height: 100%;
        	text-align: center;
        }
        .wrap-main .tabs>div>button{
        	border: 0;
        	background-color: transparent;
        	width: 100%; height: 100%;
        	padding: 15px 0;
        }
        .wrap-main .tabs>div>button:hover{
        	background-color: white;
        	color: black;
        }
        .wrap-main .tabs>div>button:hover>*{
        	background-color: white;
        	color: black;
        	font-weight: bold;
        }
        .wrap-footer {
            clear: both;
        }
    </style>
</head>

<body>
	<div class="wrap-header">
		<%@include file="/WEB-INF/views/common/header.jsp" %>
	</div>
    <div class="wrap-main">
        <div class="content">
    		<div class="tabs">
	            <div class="edutab"><button type="button" class="btn edulist"><h3>교육 목록</h3></button></div>
	            <div class="edutab"><button type="button" class="btn edubooklist"><h3>교육 예약 현황</h3></button></div>
    		</div>
            <div class="home-menu">
                <a href="${pageContext.request.contextPath }/home"><img src="https://www.jejusi.go.kr/images/star/icon/home_icon01.png"></a>
                <div> &nbsp; | 행사 및 교육 | 행사 및 교육신청</div>
            </div>
            <hr>
            <div class="edu-list">
                <div class="edu-detail">
                    <div class="edu-detail-content">
                        <table>
                            <colgroup>
                                <col style="width: 10%;">
                                <col>
                                <col>
                                <col>
                                <col style="width: 10%;">
                                <col>
                                <col>
                                <col>
                            </colgroup>
                            <tbody>
                            	<tr>
                            		<td colspan="7">${detail.eduSubject }</td>
                            		<td>
	                            		<div class="edu-edit-del">
	                            			<div>
			                        			<input type="hidden" name="eduId" id="eduId" value="${detail.eduId }" >
			                        			<c:if test="${cnt > 0 }">
			                        			<button type="submit" class="btn bookdel">취소</button>
			                        			</c:if>
	                            			</div>
	                            			<c:if test="${ssslogin.mem_admin > 0 }">
	                            			<div>
		                        				<a href="${pageContext.request.contextPath }/edu/list/update?id=${detail.eduId }"><button type="button" class="btn eduup">수정</button></a>
	                            			</div>
	                            			<div>
			                        			<button type="submit" class="btn edudel">삭제</button>
	                            			</div>
	                            			</c:if>
	                    				</div>
	                    			</td>
                            	</tr>
                                <tr>
                                    <td>신청기간</td><td>${detail.eduBookStart }</td><td>~</td><td>${detail.eduBookEnd }</td><td>운영기간</td><td>${detail.eduStart }</td><td>~</td><td>${detail.eduEnd }</td>
                                </tr>
                                <tr>
                                    <td>운영요일</td><td colspan="3">
                                    <c:choose>
                                    	<c:when test="${detail.eduDay == 'every' }">매일</c:when>
                                    	<c:when test="${detail.eduDay == 'mon' }">월요일</c:when>
                                    	<c:when test="${detail.eduDay == 'tue' }">화요일</c:when>
                                    	<c:when test="${detail.eduDay == 'wed' }">수요일</c:when>
                                    	<c:when test="${detail.eduDay == 'thu' }">목요일</c:when>
                                    	<c:when test="${detail.eduDay == 'fri' }">금요일</c:when>
                                    </c:choose>
                                    </td>
                                    <td>교육장소</td>
                                    <td colspan="3">
                                    ${detail.eduAddress }
                                    </td>
                                </tr>
                                <tr>
                                	<td>교육대상</td>
                                	<td colspan="3">
                                    <c:choose>
                                    	<c:when test="${detail.eduParticipant == 'all' }">모두</c:when>
                                    	<c:when test="${detail.eduParticipant == 'element' }">초등학생</c:when>
                                    	<c:when test="${detail.eduParticipant == 'middle' }">중학생</c:when>
                                    	<c:when test="${detail.eduParticipant == 'high' }">고등학생</c:when>
                                    	<c:when test="${detail.eduParticipant == 'adult' }">성인</c:when>
                                    </c:choose>
                                	</td>
                                	<td>인원</td><td>${detail.eduBookNum }/${detail.eduMaxNum }</td>
                                </tr>
                                <tr id="content">
                                    <td colspan="8">${detail.eduContent }</td>
                                </tr>
                                <c:if test="${not empty detail.eduFileDtoList }">
                                <c:forEach items="${detail.eduFileDtoList }" var="file">
                                <tr>
                                	<td>${file.eduFileId }</td>
                                	<td><a href="${file.eduFilePath }/${file.eduSavedFileName}" download="${file.eduOriginalFileName }">${file.eduOriginalFileName }</a></td>
                                </tr>
                                </c:forEach>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                    <div class="edu-book">
                        <button type="button" class="btn book">신청하기</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="wrap-footer">
            <footer>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae voluptatum magni sit officia ad id
                explicabo adipisci distinctio expedita, voluptas laborum minima labore, animi maxime soluta! Deleniti
                vel nostrum dicta.
            </footer>
        </div>
    </div>
</body>
<script>
$(loadedHandler);
function loadedHandler(){
	$(".btn.book").on("click", bookClkHandler);
	$(".btn.bookdel").on("click", bookDelHandler);
	$(".btn.edudel").on("click", eduDelHandler);
	$(".btn.edulist").on("click", eduListHandler);
	$(".btn.edubooklist").on("click", eduBookListHandler);
}
//교육 목록 페이지 이동
function eduListHandler(){
	location.href = "${pageContext.request.contextPath}/edu";
}
// 교육 신청 현황 페이지 이동
function eduBookListHandler(){
	location.href = "${pageContext.request.contextPath}/edu/book";
}
// 교육 신청하러 가기
function bookClkHandler(){
	location.href = "${pageContext.request.contextPath}/edu/form?id=${detail.eduId}";
}
// 교육 신청 취소
function bookDelHandler(){
	var eduIdVal = $("#eduId").val();
	$.ajax({
		url : "${pageContext.request.contextPath}/edu/book/delete.ajax"
		, method : "post"
		, data : {eduId : eduIdVal}
		, error : ajaxErrorHandler
		, success : function(result){
			if(result == 1){
				alert("교육 신청 취소가 완료되었습니다.");
				location.reload();
			}else{
				alert("교육 신청 취소 중 오류가 발생했습니다.");
			}
		}
	});
}
// 교육 삭제
function eduDelHandler(){
	$.ajax({
		url : "${pageContext.request.contextPath}/edu/delete.ajax"
		, method : "post"
		, data : "${detail.eduId}"
		, error : ajaxErrorHandler
		, success : function(result){
			if(result == 1){
				alert("교육이 삭제되었습니다.");
				location.href = "${pageContext.request.contextPath}/edu";
			}else{
				alert("교육 삭제 중 오류가 발생했습니다.");
			}
		}
	});
}
(function border(){
	$("tr:first-of-type").css("border-bottom", "1px solid white");
	$("#content").css("border-top", "1px solid white");
	$("#content").css("border-bottom", "1px solid white");
	$("tr:last-of-type").css("border-bottom", "1px solid white");
})();
</script>
</html>