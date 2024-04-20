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
	<link href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <jsp:include page="/WEB-INF/views/common/common_star.jsp"/>
    <script>
    loginPermission();
	adminPermission();
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
            background-color: white;
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
        .wrap-main>.content>.edu-list>.edu-detail>form>.edu-detail-content>table{
            width: 100%;
            line-height: 3em;
        }
        .wrap-main>.content>.edu-list>.edu-detail>form>.edu-detail-content>table>tbody>tr>td>input{
        	background-color: transparent;
        	border: 0;
        }
		.wrap-main>.content>.edu-list>.edu-detail>form>.edu-detail-content>table>tbody>tr>td>.edu-edit-del{
		    display: flex;
		    float: right;
		    column-gap: 10px;
		    justify-content: flex-end;
		}
		.wrap-main .ui-datepicker-trigger{
			display: none;
		}
		.wrap-main>.content>.edu-list>.edu-detail>form>.edu-detail-content>table>tbody>tr>td>textarea{
			resize: none;
			width: 100%;
			background-color: transparent;
			border: 0;
		}
        .wrap-main>.content>.edu-list>.edu-detail>form>.edu-book{
            text-align: center;
        }
        .wrap-main>.content>.edu-list>.edu-detail>form>.edu-book>button{
            background-color: transparent;
            border: 0;
            cursor: pointer;
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
					<form id="frm-edudetail" action="${pageContext.request.contextPath}/edu/update" method="post">
                    <div class="edu-detail-content">
                	<input type="hidden" name="eduId" value="${detail.eduId }" >
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
                            		<td>교육제목</td><td colspan="7"><input type="text" name="eduSubject" value="${detail.eduSubject }" required></td>
                            	</tr>
                                <tr>
                                    <td>신청기간</td><td><input type="text" name="eduBookStart" id="eduBookStart" class="datePicker" value="${detail.eduBookStart }"></td><td>~</td><td><input type="text" name="eduBookEnd" id="eduBookEnd" class="datePicker" value="${detail.eduBookEnd }"></td><td>운영기간</td><td><input type="text" name="eduStart" id="eduStart" class="datePicker" value="${detail.eduStart }"></td><td>~</td><td><input type="text" name="eduEnd" id="eduEnd" class="datePicker" value="${detail.eduEnd }"></td>
                                </tr>
                                <tr>
                                    <td>운영요일</td><td colspan="3"><input type="text" name="eduDay" value="${detail.eduDay }"></td><td>교육장소</td><td colspan="3"><input type="text" name="eduAddress" value="${detail.eduAddress }"></td>
                                </tr>
                                <tr>
                                	<td>교육대상</td><td colspan="7"><input type="text" name="eduParticipant" value="${detail.eduParticipant }"></td>
                                </tr>
                                <tr>
                                    <td colspan="8"><textarea name="eduContent">${detail.eduContent }</textarea></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="edu-book">
                        <button type="submit">수정하기</button>
                    </div>
					</form>
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
    
    
    
<script>
	$(function() {
	    //input을 datepicker로 선언
	    $(".datePicker").datepicker({
	        dateFormat: 'yy-mm-dd' //달력 날짜 형태
	        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	        ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
	        ,changeYear: false //option값 년 선택 가능
	        ,changeMonth: false //option값  월 선택 가능                
	        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	        ,buttonImageOnly: false //버튼 이미지만 깔끔하게 보이게함
	        ,buttonText: "선택" //버튼 호버 텍스트              
	        ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
	        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
	        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
	        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
	        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
	        ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	        ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
	    });                    
	    
	    //초기값을 오늘 날짜로 설정해줘야 합니다.
	    //$('.datePicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
	});
</script>
</body>

</html>