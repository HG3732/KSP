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
    	.wrap-main .btn{
    		cursor: pointer;
    	}
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
        	padding: 10px 30px;
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
        /* 
		 */
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
        
        
        
        /* grid 구조 */
        .wrap-main .grid.eduOne{
            display: grid;
            grid-template-columns: 1fr 2.5fr 1fr 2.5fr 1fr 2.5fr 1fr 2.5fr;
            grid-row-gap: 10px;
            grid-column-gap: 10px;
            align-items: center;
        }
        .wrap-main .grid.eduOne input
        , .wrap-main .grid.eduOne select{
        	background-color: transparent;
        	border: 1px solid white;
        }
        .wrap-main .grid.eduOne option{
        	color: black;
        }
        .wrap-main .grid.item1:nth-child(1){
            grid-column: 1/9;
            display: grid;
            grid-template-columns: 5fr 1fr;
            border-bottom: 1px solid white;
            padding-bottom: 10px;
            margin-bottom: 10px;
        }
        .wrap-main .grid.eduOne input[name=eduSubject]{
        	width: 100%;
        }
        .wrap-main .grid.item1:nth-child(even){
            text-align: center;
        }
        .wrap-main .grid.item1:nth-child(odd)
        , .wrap-main .content .grid.item1:nth-child(4)
        , .wrap-main .content .grid.item1:nth-child(8)
        , .wrap-main .content .grid.item1:nth-child(18){
            text-align: left;
        }
        .wrap-main .grid.item1:nth-child(18){
            border-top: 1px solid white;
            padding-top: 10px;
            margin-top: 10px;
            border-bottom: 1px solid white;
            padding-bottom: 10px;
            margin-bottom: 10px;
        }
        .wrap-main .grid.item1:last-child{
            border-top: 1px solid white;
            padding-top: 10px;
            margin-top: 10px;
        }
        .wrap-main .grid.item1:nth-child(1) .grid.item2:nth-child(1){
            display: grid;
            grid-template-columns: 1fr 12.1fr;
            align-items: center;
        }
        .wrap-main .grid.item1:nth-child(1) .grid.item2:nth-child(2){
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            grid-column-gap: 10px;
            text-align: center;
        }
        .wrap-main .grid.item1:nth-child(11)
        , .wrap-main .grid.item1:nth-child(15){
            grid-column: 2/5;
        }
        .wrap-main .grid.item1:nth-child(13)
        , .wrap-main .grid.item1:nth-child(17){
            grid-column: 6/9;
        }
        .wrap-main .grid.item1:nth-child(18){
            grid-column: 1/9;
            line-height: 3em;
        }
        .wrap-main .grid.item1:nth-child(19){
            grid-column: 1/9;
        }
        .wrap-main .grid.item1:nth-child(19) .grid.item2{
        	grid-column: 1/9;
        }
        .wrap-main .grid.item1:last-child{
            grid-column: 1/9;
            text-align: center;
        }
        
        /* ckeditor 내용 */
        .wrap-main table{
        	border: 1px solid white;
        	border-collapse: collapse;
        }
        .wrap-main table td{
        	border: 1px solid white;
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
                        <div class="grid eduOne">
                            <div class="grid item1">
                                <div class="grid itmem2">
                                    ${eduOne.eduSubject }
                                </div>
                                <div class="grid item2">
                                    <div class="grid item3">
                                    	<c:if test="${cnt > 0 }">
                                        <button type="submit" class="btn bookdel">취소</button>
                                    	</c:if>
                                    </div>
                                    <c:if test="${ssslogin.mem_admin > 0 }">
                                    <div class="grid item3">
                                        <button type="button" class="btn eduup">수정</button>
                                    </div>
                                    <div class="grid item3">
                                        <button type="submit" class="btn edudel">삭제</button>
                                    </div>
                                    </c:if>
                                </div>
                            </div>
                            <div class="grid item1">
                                신청기간
                            </div>
                            <div class="grid item1">
                                ${eduOne.eduBookStart }
                            </div>
                            <div class="grid item1">
                                ~
                            </div>
                            <div class="grid item1">
                                ${eduOne.eduBookEnd }
                            </div>
                            <div class="grid item1">
                                운영기간
                            </div>
                            <div class="grid item1">
                                ${eduOne.eduStart }
                            </div>
                            <div class="grid item1">
                                ~
                            </div>
                            <div class="grid item1">
                                ${eduOne.eduEnd }
                            </div>
                            <div class="grid item1">
                                운영요일
                            </div>
                            <div class="grid item1">
                            <c:choose>
                            	<c:when test="${eduOne.eduDay == 'every' }">매일</c:when>
                            	<c:when test="${eduOne.eduDay == 'mon' }">월요일</c:when>
                            	<c:when test="${eduOne.eduDay == 'tue' }">화요일</c:when>
                            	<c:when test="${eduOne.eduDay == 'wed' }">수요일</c:when>
                            	<c:when test="${eduOne.eduDay == 'thu' }">목요일</c:when>
                            	<c:when test="${eduOne.eduDay == 'fri' }">금요일</c:when>
                            </c:choose>
                            </div>
                            <div class="grid item1">
                                교육장소
                            </div>
                            <div class="grid item1">
                                ${eduOne.eduAddress }
                            </div>
                            <div class="grid item1">
                                교육대상
                            </div>
                            <div class="grid item1">
                                <c:choose>
                                	<c:when test="${eduOne.eduParticipant == 'all' }">모두</c:when>
                                	<c:when test="${eduOne.eduParticipant == 'element' }">초등학생</c:when>
                                	<c:when test="${eduOne.eduParticipant == 'middle' }">중학생</c:when>
                                	<c:when test="${eduOne.eduParticipant == 'middle' }">고등학생</c:when>
                                </c:choose>
                            </div>
                            <div class="grid item1">
                                인원
                            </div>
                            <div class="grid item1">
                                ${eduOne.eduBookNum }/${eduOne.eduMaxNum }
                            </div>
                            <div class="grid item1 eduContent">
                                ${eduOne.eduContent }
                            </div>
                            <div class="grid item1">
                                <button type="button" class="btn book">신청하기</button>
                            </div>
                        </div>
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
	$(".btn.eduup").on("click", eduUpHandler);
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
// 교육 수정하기
function eduUpHandler(){
	location.href = "${pageContext.request.contextPath}/edu/list/update?id=${eduOne.eduId}";
}
// 교육 신청하러 가기
function bookClkHandler(){
	location.href = "${pageContext.request.contextPath}/edu/form?id=${eduOne.eduId}";
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
		, data : "${eduOne.eduId}"
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