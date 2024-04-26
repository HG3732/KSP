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
        
        
        /* ckeditor */
        .wrap-main #container {
            width: 1000px;
            margin: 20px auto;
        }
        .wrap-main #container *{
        /* 
            background-color: transparent;
         */
            color: black;
        }
        .wrap-main .ck-editor__editable[role="textbox"] {
            /* Editing area */
            min-height: 200px;
        }
        .wrap-main .ck-content .image {
            /* Block images */
            max-width: 80%;
            margin: 20px auto;
        }
        /* 
        .wrap-main .ck.ck-widget__type-around__button.ck-widget__type-around__button_before
        , .wrap-main .ck.ck-widget__type-around__button.ck-widget__type-around__button_after{
        	background-color: white;
        	color: black;
        }
         */
        
        
        
        /* grid 부분 */
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
        .wrap-main .ui-datepicker-trigger{
        	display: none;
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
                <a href="#"><img src="https://www.jejusi.go.kr/images/star/icon/home_icon01.png"></a>
                <div> &nbsp; | 행사 및 교육 | 행사 및 교육신청</div>
            </div>
            <hr>
            <div class="edu-list">
                <div class="edu-detail">
					<form id="frm-edudetail">
	                    <div class="edu-detail-content">
	                		<input type="hidden" name="eduId" value="${detail.eduId }" >
	                        <div class="grid eduOne">
	                            <div class="grid item1">
	                                <div class="grid item2">
	                                	<div class="grid item3">
		                                	교육제목
	                                	</div>
	                                	<div class="grid item3">
	                                    	<input type="text" name="eduSubject" required autocomplete="off">
	                                	</div>
	                                </div>
	                                <div class="grid item2" style="display: none;">
	                                    <div class="grid item3">
	                                        <button type="submit" class="btn bookdel">취소</button>
	                                    </div>
	                                    <div class="grid item3">
	                                        <button type="button" class="btn eduup">수정</button>
	                                    </div>
	                                    <div class="grid item3">
	                                        <button type="submit" class="btn edudel">삭제</button>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="grid item1">
	                                신청기간
	                            </div>
	                            <div class="grid item1">
	                                <input type="text" name="eduBookStart" class="datePicker" required autocomplete="off">
	                            </div>
	                            <div class="grid item1">
	                                ~
	                            </div>
	                            <div class="grid item1">
	                                <input type="text" name="eduBookEnd" class="datePicker" required autocomplete="off">
	                            </div>
	                            <div class="grid item1">
	                                운영기간
	                            </div>
	                            <div class="grid item1">
	                                <input type="text" name="eduStart" class="datePicker" required autocomplete="off">
	                            </div>
	                            <div class="grid item1">
	                                ~
	                            </div>
	                            <div class="grid item1">
	                                <input type="text" name="eduEnd" class="datePicker" required autocomplete="off">
	                            </div>
	                            <div class="grid item1">
	                                운영요일
	                            </div>
	                            <div class="grid item1">
	                            	<select name="eduDay">
	                            		<option value="every">매일</option>
	                            		<option value="mon">월요일</option>
	                            		<option value="tue">화요일</option>
	                            		<option value="wed">수요일</option>
	                            		<option value="thu">목요일</option>
	                            		<option value="fri">금요일</option>
	                            	</select>
	                            </div>
	                            <div class="grid item1">
	                                교육장소
	                            </div>
	                            <div class="grid item1">
	                                <input type="text" name="eduAddress" required autocomplete="off">
	                            </div>
	                            <div class="grid item1">
	                                교육대상
	                            </div>
	                            <div class="grid item1">
	                            	<select name="eduParticipant">
	                            		<option value="all">모두</option>
	                            		<option value="element">초등학생</option>
	                            		<option value="middle">중학생</option>
	                            		<option value="high">고등학생</option>
	                            		<option value="adult">성인</option>
	                            	</select>
	                            </div>
	                            <div class="grid item1">
	                                정원
	                            </div>
	                            <div class="grid item1">
	                                <input type="number" name="eduMaxNum" min=1 required autocomplete="off">
	                            </div>
	                            <div class="grid item1">
	                            	교육내용
	                                <div id="container">
	                               		<textarea name="eduContent" id="editor"></textarea>
	                               	</div>
	                            </div>
	                            <div class="grid item1">
	                                첨부파일
	                            </div>
	                            <div class="grid item1">
	                                <button type="button" class="btn eduup">수정하기</button>
	                            </div>
	                        </div>
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
<script src="https://cdn.ckeditor.com/ckeditor5/41.3.1/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/41.3.1/classic/translations/ko.js"></script>
<!-- 
<script src="https://upload-widget.cloudinary.com/global/all.js" type="text/javascript"></script>
 -->
<script>
    const ckInstance = ClassicEditor
        .create( document.querySelector( '#editor' ), {
	    	language: {ui : 'ko', content : 'ko'}, 
	        //  tokenUrl: 'https://81478.cke-cs.com/token/dev/de0d9159dc2b7ce3ecb85191c28f789217b087f58ae6880e30d89820724d',
	        //  uploadUrl: 'https://81478.cke-cs.com/easyimage/upload/'
        	//	uploadUrl: '${pageContext.request.contextPath}/fileupload.ajax'
    		ckfinder : { uploadUrl : '${pageContext.request.contextPath}/fileupload.ajax' }, 
        	toolbar: {
                items: [
                    'undo', 'redo',
                    '|', 'heading',
                    '|', 'bold', 'italic',
                    '|', 'link', 'insertImage', 'insertTable', 'mediaEmbed', 'blockQuote', 
                    '|', 'bulletedList', 'numberedList', 'outdent', 'indent'
                ]
            },
            link: {
                // Automatically add target="_blank" and rel="noopener noreferrer" to all external links.
                addTargetToExternalLinks: true,

                // Let the users control the "download" attribute of each link.
                decorators: [
                    {
                        mode: 'manual',
                        label: 'Downloadable',
                        attributes: {
                            download: 'download'
                        }
                    }
                ]
            }
        } )
		.then( editor => {
			editor = editor;
		} )
        .catch( error => {
            console.error(error);
        } );
</script>
<script>
$(loadedHandler);
function loadedHandler(){
	$(".btn.eduup").on("click", eduUpdateHandler);
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
// 교육 내용 수정하기
function eduUpdateHandler(){
	if(confirm("교육 내용을 수정하시겠습니까?")){
		$.ajax({
			url : "${pageContext.request.contextPath}/edu/list/update"
			, method : "post"
			, data : $("#frm-edudetail").serialize()
			, error : ajaxErrorHandler
			, success : function(result){
				if(result == 1){
					alert("교육 수정이 완료되었습니다.");
					location.href = "${pageContext.request.contextPath}/edu/one?id=" + $("input[name=eduId]").val();
				}else{
					alert("교육 수정 중 오류가 발생했습니다.\n관리자에게 문의해주시기 바랍니다.");
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
// 제목 아래와 교육 정보 아래에 하얀 선 추가
(function border(){
	$("tr:first-of-type").css("border-bottom", "1px solid white");
	$("tr:last-of-type").css("border-top", "1px solid white");
})();
// 교육 수정 페이지 진입 시 기존에 등록된 항목 기본선택
(function selected(){
	var day = $("input[name=eduDayHidden]").val();
	var part = $("input[name=eduParticipantHidden]").val();
	$("#eduDay").val(day).prop("selected", true);
	$("#eduParticipant").val(part).prop("selected", true);
})();
</script>
</body>

</html>