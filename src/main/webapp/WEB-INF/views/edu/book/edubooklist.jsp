<link href="${pageContext.request.contextPath}/resource/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/core.css" rel="stylesheet">
<%@page import="education.book.model.dto.EduBookListDto"%>
<%@page import="education.book.model.dto.EduBookDto"%>
<%@page import="java.util.List"%>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/6.1.11/index.global.min.js"></script>
    <jsp:include page="/WEB-INF/views/common/common_star.jsp"/>
    <script>
	loginPermission();
    </script>
    <style>
    	.wrap-body {
    		position: relative;
    	}
    	.wrap-main .btn{
    		cursor: pointer;
    	}
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
        .wrap-main>.content>.edu-book-list{
            height: fit-content;
        }
        .wrap-main>.content>.edu-book-list>#calendar{
            margin: 20px auto;
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
        .wrap-main .fc-event-title-container{
        	cursor: pointer;
        	z-index: 9;
        }
        .wrap-main .fc-event-title.fc-sticky{
        	z-index: -1;
        }
        
        
        .wrap-footer{
            clear: both;
        }
        
        /* modal */
        div.hidden{
        	display: none;
        }
        .modal-background {
        	position: absolute;
        	background-color : transparent;
        	width: 100vw;
        	height: 100vh;
        	z-index: 10;
        	display: block;
        }
        .wrap-modal {
        	position: absolute;
        	/* 
        	left: 450px; top: 640px;
        	 */
        	width : 500px;
        	background-color: rgb(34, 21, 64);
        	display : flex;
        	flex-direction : column;
        	border-radius: 10px;
        }
		.wrap-modal > .headbar {
			background-color : #503396;
			display: flex;
    		justify-content: end;
    		border-radius: 10px 10px 0 0;
		}
		.wrap-modal > .headbar > .closemodal {
			padding : 5px;
			width: fit-content;
			margin-right : 5px;
		}
		.wrap-modal > .modal-main {
			padding: 10px;
		}
		.wrap-modal > .modal-main > .section-row {
			display: grid;
			grid-template-columns: 1fr 4fr;
			margin : 10px 0;
		}
		.wrap-modal > .modal-main > .section-row > div:first-child{
			text-align: left;
			border-right: 1px solid white;
		}
		.wrap-modal > .modal-main > .section-row > div:last-child{
			padding-left: 10px;
		}
    	.wrap-modal .btn{
    		cursor: pointer;
    		background-color: transparent;
    		border: 0;
    	}
		
    </style>
    <script>
    $(loadedHandler);
    function loadedHandler(){
    	$(".btn.edulist").on("click", eduListHandler);
    	$(".btn.edubooklist").on("click", eduBookListHandler);
    	$(".fc-event-title-container").on("click", modalClickHandler);
    	$(".btn.closemodal").on("click", closeConfirmHandler);
    }
    </script>
</head>
<body>
   	<div class="modal-background hidden">
		<div class="wrap-modal">
			<div class="headbar">
				<button type="button" class="btn closemodal">X</button>
			</div>
			<div class="modal-main">
				<div class="section-row">
					<div>교육명</div>
					<div id="eduSubject"></div>
				</div>
				<div class="section-row">
					<div>교육장소</div>
					<div id="eduAddress"></div>
				</div>
				<div class="section-row">
					<div>인솔자명</div>
					<div id="eduPartName"></div>
				</div>
				<div class="section-row">
					<div>인원</div>
					<div id="eduPartNum"></div>
				</div>
			</div>
		</div>
	</div>
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
            <c:choose>
           	<c:when test="${empty eduBook }">
           		예약된 내역이 없습니다.
           	</c:when>
            <c:otherwise>
            <div class="edu-book-list">
                <div id="calendar" style="width: 900px; height: 740px;"></div>
            </div>
            </c:otherwise>
            </c:choose>
        </div>
    </div>
    <div class="wrap-footer">
        <footer>
            <%@include file="/WEB-INF/views/common/footer.jsp" %>
        </footer>
    </div>
	<script>
	// 교육 목록 페이지 이동
	function eduListHandler(){
		location.href = "${pageContext.request.contextPath}/edu";
	}
	// 교육 신청 현황 페이지 이동
	function eduBookListHandler(){
		location.href = "${pageContext.request.contextPath}/edu/book";
	}
	// 신청 내역 모달 띄우기
	function modalClickHandler(event){
		var clickObject$ = $(event.target);
		var bookSchool = clickObject$.children("div").html();
		var start = clickObject$.parents("td").data("date");
		$.ajax({
			url : "${pageContext.request.contextPath}/edu/book/info.ajax",  
			method : "post", 
			data : {eduPartSchool : bookSchool, eduStart : start}, 
			error : ajaxErrorHandler, 
			dataType : "json", 
			success : function(data){
				$("#eduSubject").html(data.eduSubject);
				$("#eduAddress").html(data.eduAddress);
				$("#eduPartName").html(data.eduPartName);
				$("#eduPartNum").html(data.eduPartNum);
			}
		});
		var clickPoint = event.target.value;
		$(".wrap-modal").css("left", $(clickObject$).offset().left - 190);
		$(".wrap-modal").css("top", $(clickObject$).offset().top + 30);
		$(".modal-background").removeClass("hidden");
	}
	// 신청 내역 모달 닫기
	function closeConfirmHandler(event){
		$(".modal-background").addClass("hidden");
	}
	
	
	
	document.addEventListener('DOMContentLoaded', function () {
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	        // Tool Bar 목록 document : https://fullcalendar.io/docs/toolbar
	        headerToolbar: {
	            left: 'prev',
	            center: 'title',
	            right: 'next'
	        },
	        selectable: true,
	        selectMirror: true,
	        navLinks: false,
	        editable: false,
	        dayMaxEvents: false,
	        events: [
	        	<%
		List<EduBookListDto> eduBookList = (List<EduBookListDto>)request.getAttribute("eduBook");
		for(EduBookListDto dto : eduBookList){
		%>
		{
			color : '#503396', 
			borderColor : 'white', 
			title : '<%=dto.getEduPartSchool()%>', 
			start : '<%=dto.getEduStart()%>', 
			end : '<%=dto.getEduEnd()%>'
		},
		<%
		}
	 	%>
	        ]
	    });
	    calendar.render();
	});
	</script>
</body>
</html>