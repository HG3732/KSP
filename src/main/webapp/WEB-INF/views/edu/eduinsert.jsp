<link href="${pageContext.request.contextPath}/resource/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/core.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        .wrap-main>.content>.edu-list>.edu-detail>form>.edu-detail-content>table{
            width: 100%;
            line-height: 3em;
        }
        .wrap-main .edu-detail-content input
        , .wrap-main>.content>.edu-list>.edu-detail>form>.edu-detail-content>table>tbody>tr>td>select{
        	background-color: transparent;
        	border: 1px solid white;
        }
        .wrap-main>.content>.edu-list>.edu-detail>form>.edu-detail-content>table>tbody>tr>td>select>option{
        	color: black;
        }
        .wrap-main>.content>.edu-list>.edu-detail>form>.edu-detail-content>table>tbody>tr>td>input[type=text]
        , .wrap-main>.content>.edu-list>.edu-detail>form>.edu-detail-content>table>tbody>tr>td>select{
        	width: 100%;
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
			border: 1px solid white;
			margin-top: 10px;
		}
        .wrap-main>.content>.edu-list>.edu-detail>form>.edu-ins{
            text-align: center;
        }
        .wrap-main>.content>.edu-list>.edu-detail>form>.edu-ins>button{
            margin-top: 10px;
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
					<form id="frm-eduins">
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
                            		<td>교육제목</td><td colspan="7"><input type="text" name="eduSubject" required></td>
                            	</tr>
                                <tr>
                                    <td>신청기간</td>
                                    <td><input type="text" name="eduBookStart" id="eduBookStart" class="datePicker" required autocomplete="off"></td>
                                    <td>~</td>
                                    <td><input type="text" name="eduBookEnd" id="eduBookEnd" class="datePicker" required autocomplete="off"></td>
                                    <td>운영기간</td>
                                    <td><input type="text" name="eduStart" id="eduStart" class="datePicker" required autocomplete="off"></td>
                                    <td>~</td>
                                    <td><input type="text" name="eduEnd" id="eduEnd" class="datePicker" required autocomplete="off"></td>
                                </tr>
                                <tr>
                                    <td>운영요일</td>
                                    <td>
                                    	<select name="eduDay">
                                    		<option value="every">매일</option>
                                    		<option value="mon">월</option>
                                    		<option value="tue">화</option>
                                    		<option value="wed">수</option>
                                    		<option value="thu">목</option>
                                    		<option value="fri">금</option>
                                    	</select>
                                    </td>
                                    <td colspan="2">
                                    </td>
                                    <td>교육장소</td>
                                    <td colspan="3"><input type="text" name="eduAddress" required></td>
                                </tr>
                                <tr>
                                	<td>교육대상</td>
                                	<td>
                                    	<select name="eduParticipant">
                                    		<option value="all">모두</option>
                                    		<option value="element">초등학생</option>
                                    		<option value="middle">중학생</option>
                                    		<option value="high">고등학생</option>
                                    		<option value="adult">성인</option>
                                    	</select>
                                	</td>
                                	<td colspan="2"></td>
                                	<td>정원</td><td><input type="number" name="eduMaxNum" id="eduMaxNum" min=0></td> 
                                </tr>
                                <tr>
                                    <td colspan="8"><textarea name="eduContent" rows="10" required></textarea></td>
                                </tr>
                                <tr>
                                	<td><button type="button" class="btn file">파일추가</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="edu-ins">
                        <button type="button" class="btn eduins">등록하기</button>
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
$(loadedHandler);
function loadedHandler(){
	$(".btn.eduins").on("click", eduInsertHandler);
	$(".btn.file").on("click", eduFileHandler);
}
// 파일 추가
function eduFileHandler(){
	var htmlVal = `
	<tr>
		<td colspan="4">
			<input type="file" name="uploadfiles" class="uploadfiles" required><button type="button" class="btn fileCancel">취소</button>
		</td>
	</tr>
	`;
	$(this).parent().parent().after(htmlVal);
	$(".btn.fileCancel").off("click");
	$(".btn.fileCancel").on("click", eduFileCancelHandler);
}
// 파일 취소
function eduFileCancelHandler(){
	$(this).parent().parent().remove();
}
// 교육 등록 확인창
function eduInsertHandler(){
	var formData = new FormData($("#frm-eduins")[0]);
	if(confirm("교육을 등록하시겠습니까?")){
		$.ajax({
			url : "${pageContext.request.contextPath}/edu/list/insert"
			, method : "post"
			, data : formData
			, contentType : false
			, processData : false
			, error : ajaxErrorHandler
			, success : function(result){
				if(result == 1){
					alert("교육 등록이 완료되었습니다.");
					location.href = "${pageContext.request.contextPath}/edu";
				}else{
					alert("교육 등록 중 오류가 발생했습니다.\n관리자에게 문의해주시기 바랍니다.");
				}
			}
		});
	}
}
// datePicker
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
// 제목 아래, 교육 정보 아래 하얀 선 추가
(function border(){
	$("tr:first-of-type").css("border-bottom", "1px solid white");
	$("tr:last-of-type").css("border-top", "1px solid white");
})();
</script>
</body>

</html>