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
		.wrap-main>.content>.edu-list>.edu-detail>.edu-detail-content>table>tbody>tr>td>.edu-edit-del>div>form>button
		, .wrap-main>.content>.edu-list>.edu-detail>.edu-detail-content>table>tbody>tr>td>.edu-edit-del>div>a>button
		, .wrap-main>.content>.edu-list>.edu-detail>.edu-detail-content>table>tbody>tr>td>.edu-edit-del>div>button{
			background-color: transparent;
			border: 0;
			cursor: pointer;
			font-size: 16px;
		}
        .wrap-main>.content>.edu-list>.edu-detail>.edu-book{
            text-align: center;
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
            <a href="${pageContext.request.contextPath }/edu"><h3>교육 목록</h3></a>
            <a href="${pageContext.request.contextPath }/edu/book"><h3>교육 예약 현황</h3></a>
            <div class="home-menu">
                <a href="#"><img src="https://www.jejusi.go.kr/images/star/icon/home_icon01.png"></a>
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
		                        				<a href="${pageContext.request.contextPath }/edu/update?id=${detail.eduId }"><button type="button" class="btn eduup">수정</button></a>
	                            			</div>
	                            			<div>
			                        			<form action="${pageContext.request.contextPath }/edu/delete" method="post"><input type="hidden" name="eduId" value="${detail.eduId }" ><button type="submit" class="btn edudel">삭제</button></form>
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
                                	<td colspan="7">
                                    <c:choose>
                                    	<c:when test="${detail.eduParticipant == 'all' }">모두</c:when>
                                    	<c:when test="${detail.eduParticipant == 'element' }">초등학생</c:when>
                                    	<c:when test="${detail.eduParticipant == 'middle' }">중학생</c:when>
                                    	<c:when test="${detail.eduParticipant == 'high' }">고등학생</c:when>
                                    	<c:when test="${detail.eduParticipant == 'adult' }">성인</c:when>
                                    </c:choose>
                                	</td>
                                </tr>
                                <tr>
                                    <td colspan="8">${detail.eduContent }</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="edu-book">
                        <a href="${pageContext.request.contextPath }/edu/book/insert?id=${detail.eduId }">신청하기</a>
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
	$(".btn.bookdel").on("click", bookDelHandler);
}
function bookDelHandler(){
	var eduIdVal = $("#eduId").val();
	$.ajax({
		url : "${pageContext.request.contextPath}/edu/book/delete.ajax"
		, method : "post"
		, data : {eduId : eduIdVal}
		, success : function(result){
			if(result == 1){
				alert("교육 신청 취소가 완료되었습니다.");
				location.reload();
			}else{
				alert("교육 신청 취소 중 오류가 발생했습니다.");
			}
		}
		, error : ajaxErrorHandler
	});
}
(function border(){
	$("tr:first-of-type").css("border-bottom", "1px solid white");
	$("tr:last-of-type").css("border-top", "1px solid white");
})();

</script>
</html>