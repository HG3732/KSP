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
    </script>
    <style>
        .wrap-main,
        .wrap-footer {
            margin: 10px auto;
            width: 1100px;
        }
        .wrap-main>.edu-book-info{
            width: fit-content;
            margin: 0 auto;
        }
        .wrap-main>.edu-book-info>form>table>tbody>tr>td>input{
        	background-color: transparent;
            border: 1px solid white;
            width: auto;
        }
        .wrap-main>.edu-book-info>form>table>tbody>tr>td>input:focus
        , .wrap-main>.edu-book-info>form>table>tbody>tr>td>select{
            outline: 0;
        }
        .wrap-main>.edu-book-info>form>table>tbody>tr>td>select{
            width: 100%;
            border: 0;
        }
        .wrap-main>.edu-book-info>form>table{
            line-height: 3em;
            border-collapse: collapse;
        }
        .wrap-main>.edu-book-info>form>table button{
            cursor: pointer;
            background-color: transparent;
            border: 1px solid white;
        }
        .wrap-main>.edu-book-info>form>table>tbody>tr:last-of-type{
            text-align: center;
        }
        .wrap-main>.edu-book-info>form>table>tbody>tr>td>select>optgroup
        , .wrap-main>.edu-book-info>form>table>tbody>tr>td>select>optgroup>option
        , .wrap-main>.edu-book-info>form>table>tbody>tr>td>select{
        	color: black;
        }
        
        .wrap-main .btn:hover{
        	background-color: white;
        	color: black;
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
        <div class="edu-book-info">
        	<input type="hidden" name="email" class="email" value="${ssslogin.mem_email }">
            <form id="frm-edubook">
            <input type="hidden" name="id" value="${detail.eduId }">
                <table>
                    <caption><h2>신청 정보</h2></caption>
                    <colgroup>
                    	<col style="width: 20%;">
                    	<col>
                    	<col style="width: 20%;">
                    	<col>
                    </colgroup>
                    <tbody>
	                    <tr>
	                        <td>신청자명</td><td><input type="text" id="book-name" name="book-name" value="${ssslogin.mem_name }" readonly></td><td>아이디</td><td><input type="text" id="book-id" name="book-id" value="${ssslogin.mem_id }" readonly></td>
	                    </tr>
	                    <tr>
	                        <td>이메일</td><td><input type="email" id="book-email" name="book-email" value="${ssslogin.mem_email }" readonly></td><td colspan="2"><button type="button" class="btn sendcode">발송</button></td>
	                    </tr>
	                    <tr>
	                        <td>인증번호</td>
	                        <td>
	                        <input type="hidden" id="book-code" name="book-code">
	                        <input type="text" id="book-email-code" name="book-email-code">
	                        </td>
	                        <td colspan="2"><button type="button" class="btn checkcode">확인</button></td>
	                    </tr>
	                    <tr>
	                        <td>휴대전화</td><td><input type="tel" id="book-phone" name="book-phone" disabled></td>
	                        <td>참여대상</td>
	                        <td>
	                            <select name="book-level" id="book-level" disabled>
	                                <optgroup label="초등">
	                                    <option value="e1">초등1</option>
	                                    <option value="e2">초등2</option>
	                                    <option value="e3">초등3</option>
	                                    <option value="e4">초등4</option>
	                                    <option value="e5">초등5</option>
	                                    <option value="e6">초등6</option>
	                                </optgroup>
	                                <optgroup label="중등">
	                                    <option value="m1">중등1</option>
	                                    <option value="m2">중등2</option>
	                                    <option value="m3">중등3</option>
	                                </optgroup>
	                                <optgroup label="고등">
	                                    <option value="h1">고등1</option>
	                                    <option value="h2">고등2</option>
	                                    <option value="h3">고등3</option>
	                                </optgroup>
	                                <optgroup label="기타">
	                                    <option value="adult">성인</option>
	                                </optgroup>
	                            </select>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>인솔자명</td><td><input type="text" id="book-part-name" name="book-part-name" disabled></td>
	                        <td>학교명</td><td><input type="text" id="book-school" name="book-school" disabled></td>
	                    </tr>
	                    <tr>
	                    	<td>인원</td><td><input type="number" id="book-num" name="book-num" min=1 disabled></td>
	                    </tr>
	                    <tr>
	                        <td colspan="4"><button type="button" class="btn book" disabled>신청</button></td>
	                    </tr>
                    </tbody>
                </table>
            </form>
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
	$(".btn.sendcode").on("click", sendCodeHandler);
	$(".btn.checkcode").on("click", checkCodeHandler);
	$(".btn.book").on("click", bookMsgHandler);
	$("input").on("keyup", checkValHandler);
}
// 인증번호 발송 
function sendCodeHandler(){
	$.ajax({
		url : "${pageContext.request.contextPath }/edu/book/code/send.ajax"
			, method : "post"
			, async : false
			// serialize --> query string(name : value)형태로 나열해줌_{id : $("[name=id]").val(), pwd : $("[name=pwd]").val()}
			, success : function(result){
				if(result != null){
					alert("인증번호가 발송되었습니다.");
					$("#book-code").val(result);
					console.log($("#book-code").val(result));
					console.log(result);
				}else{
					alert("인증번호 발송 중 오류가 발생했습니다. 나중에 다시 시도해주십시오.");
				}
			}
			, error : function(request, status, error){
				alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n"
						+ "error : " + error);
			}
	});
	
	
}
// 인증번호 확인
function checkCodeHandler(){
	var sendCodeVal = $("#book-code").val();
	var inputCodeVal = $("#book-email-code").val();
	$.ajax({
		url : "${pageContext.request.contextPath}/edu/book/code/check.ajax"
		, method : "post"
		, data : {sendCode : sendCodeVal, inputCode : inputCodeVal}
		, async : false
		, success : function(result){
			if(result == 1){
				alert("인증이 완료되었습니다.");
				successCodeHandler();
				$(".btn.sendcode").prop("disabled", true);
				$("#book-email-code").val("인증 완료");
				$("#book-email-code").prop("disabled", true);
				$(".btn.checkcode").prop("disabled", true);
			}else{
				alert("인증번호가 올바르지 않습니다.");
			}
		}
		, error : function(request, status, error){
			alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n"
					+ "error : " + error);
		}
	});
}
// 신청 정보 입력 활성화
function successCodeHandler(){
	$("#book-phone").prop("disabled", false);
	$("#book-level").prop("disabled", false);
	$("#book-part-name").prop("disabled", false);
	$("#book-school").prop("disabled", false);
	$("#book-num").prop("disabled", false);
}
// 신청 정보 입력 확인
function checkValHandler(){
	if($("#book-phone").val().trim().length != 0
			&& $("#book-level").val().trim().length != 0
			&& $("#book-part-name").val().trim().length != 0
			&& $("#book-school").val().trim().length != 0
			&& $("#book-num").val() > 0
			){
		$(".btn.book").prop("disabled", false);
	}
}
// 신청 완료 여부 메시지 출력
function bookMsgHandler(){
	$.ajax({
		url : "${pageContext.request.contextPath}/edu/form"
		, method : "post"
		, data : $("#frm-edubook").serialize()
		, success : function(result){
			if(result == 1){
				alert("신청이 완료되었습니다.\n교육 목록 페이지로 이동합니다.");
				location.href="${pageContext.request.contextPath}/edu";
			}else{
				alert("정원을 초과하는 인원이거나 신청 중 오류가 발생했습니다.");
				location.href="${pageContext.request.contextPath}/home";
			}
		}
		, error : function(request, status, error){
			alert("정원을 초과하는 인원이거나 신청 중 오류가 발생했습니다.");
			location.href="${pageContext.request.contextPath}/home";
			/* 
			alert("code:"  + request.status + "\n" + "message : "
					+ request.responseText + "\n"
					+"error : " + error);
			 */
		}
	});
}
</script>
</html>