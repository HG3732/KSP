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
	adminPermission();
    </script>
    <style>
        .wrap-main
        , .wrap-footer{
            margin: 10px auto;
            width: 1100px;
            height: fit-content;
        }
        .wrap-main>.content{
            overflow: hidden;
        }
        .wrap-main>.content>a{
            text-align: center;
		    display: inline-block;
		    float: left;
		    width: 50%;
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
            background-color: white;
        }
        .wrap-main>.content>hr{
            clear: both;
        }
        .wrap-main>.content>.edu-list{
            clear: both;
        }
        .wrap-main>.content>.edu-list>.edu-list-search{
            background-color: silver;
            padding: 5px 0;
            text-align: center;
            margin-top: 15px;
        }
        .wrap-main>.content>.edu-list>.edu-list-search>div{
            display: flex;
            justify-content: center;
            position: relative;
        }
        .wrap-main>.content>.edu-list>.edu-list-search>div>input[type=text]{
        	color: black;
            width: 200px;
        }
        .wrap-main>.content>.edu-list>.edu-list-search>div>input[type=image]{
            height: 100%;
        }
        .wrap-main>.content>.edu-list>.edu-list-search>div>a>.btn.eduIns{
            cursor: pointer;
            color: black;
        }
        .wrap-main>.content>.edu-list>.edu-list-search>div>a{
        	color: black;
        	cursor: pointer;
        	position: absolute;
		    right: 10px;
		    top: 8.38px;
        }
        .wrap-main>.content>.edu-list>.edu-list-detail{
            display: flex;
            flex-wrap: wrap;
            flex-direction: row;
            column-gap: 10px;
            row-gap: 10px;
        }
        .wrap-main>.content>.edu-list>.edu-list-detail>div{
            width: 29%;
            height: max-content;
            border: 1px solid white;
    		margin: 10px 20px;
    		box-sizing: border-box;
        }
        .wrap-main>.content>.edu-list>.edu-list-detail>div>a>.edu-content>table{
        	margin: 20px 10px;
        }
        .wrap-main>.content>.edu-list>.edu-list-detail>div>a>.edu-content>table>tbody>tr>td:nth-of-type(2){
        	display: flex;
        }
        .wrap-main>.content>.edu-paging{
        	line-height: 3em;
        }
        .wrap-main>.content>.edu-paging>ul{
            text-align: center;
        }
        .wrap-main>.content>.edu-paging>ul>li{
            list-style-type: none;
            display: inline-block;
        }
        .wrap-main>.content>.edu-paging>li>a{
            text-decoration: none;
        }
        .wrap-footer{
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
            <div class="edu-list">
	            <c:choose>
	            	<c:when test="${empty edulist }">
	            		등록된 교육이 없습니다.
	            	</c:when>
		            <c:otherwise>
			            <div class="edu-list-detail">
			            	<c:forEach items="${edulist }" var="edu" varStatus="vs">
				                    <div>
				                        <a href="${pageContext.request.contextPath }/edu/one?id=${edu.eduId}">
				                        	<div class="edu-content">
					                            <table style="line-height: 4em; padding-right: 10px;">
					                                <colgroup>
					                                    <col style="width: 33%;">
					                                    <col>
					                                </colgroup>
					                                <thead>
						                                <tr>
						                                    <td class="edu-title" colspan="2"><div>${edu.eduSubject }</div></td>
						                                </tr>
					                                </thead>
					                                <tbody>
					                                    <tr>
					                                        <td>진행기간</td>
					                                        <td><div>${edu.eduStart }</div>~<div>${edu.eduEnd }</div></td>
					                                    </tr>
					                                    <tr>
					                                        <td>신청기간</td>
					                                        <td><div>${edu.eduBookStart }</div>~<div>${edu.eduBookEnd }</div></td>
					                                    </tr>
					                                    <tr>
					                                        <td>모집대상</td>
					                                        <td><div>${edu.eduParticipant }</div></td>
					                                    </tr>
					                                </tbody>
					                            </table>
				                        	</div> 
				                        </a>
				                    </div>
			            	</c:forEach>
				        </div>
		            </c:otherwise>
	            </c:choose>
        	</div>
        </div>
    </div>
    <div class="wrap-footer">
        <footer>
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae voluptatum magni sit officia ad id explicabo adipisci distinctio expedita, voluptas laborum minima labore, animi maxime soluta! Deleniti vel nostrum dicta.
        </footer>
    </div>






















<script>
$(loadedHandler);
function loadedHandler(){
	$(".btn.search-edu").on("click", searchSubjectHandler);
}
function searchSubjectHandler(){
	location.href="${pageContext.request.contextPath}/edu/list?edu-name=" + $("#edu-name").val() ;
}
function searchSubjectEnterHandler(){
	if(window.event.keyCode == 13){
		searchSubjectHandler();
	}
}
</script>
</body>
</html>