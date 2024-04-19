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
        .wrap-main>.edu-book-info>table>tbody>tr>td{
        	text-align: center;
        }
        .wrap-main>.edu-book-info>table>tbody>tr>td>input{
        	background-color: transparent;
            border: 0;
            width: auto;
        }
        .wrap-main>.edu-book-info>table>tbody>tr>td>input:focus
        , .wrap-main>.edu-book-info>table>tbody>tr>td>select{
            outline: 0;
        }
        .wrap-main>.edu-book-info>table{
            line-height: 3em;
            border-collapse: collapse;
        }
        .wrap-main>.edu-book-info>table button{
            cursor: pointer;
            background-color: transparent;
            border: 1px solid white;
        }
        .wrap-main>.edu-book-info>table>tbody>tr:last-of-type{
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
        <div class="edu-book-info">
            <input type="hidden" name="id" value="${ssslogin.mem_id }">
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
                     <td>이메일</td><td><input type="email" id="book-email" name="book-email" value="${ssslogin.mem_email }" readonly></td><td><button type="button" class="btn sendMail">발송</button></td>
                 </tr>
                </tbody>
            </table>
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
	$(".btn.sendMail").on("click", sendEmailHandler);
}
function sendEmailHandler(){
	$.ajax({
		url : "${pageContext.request.contextPath }/email/send"
			, method : "post"
			, data : $("#frm-edubook").serialize()
			, async : false
			// serialize --> query string(name : value)형태로 나열해줌_{id : $("[name=id]").val(), pwd : $("[name=pwd]").val()}
			, success : function(result){
				if(result == 1){
					alert("제출 양식이 발송되었습니다.\n이메일 확인 후 링크에 접속하셔서 제출해주시기 바랍니다.");
				}else{
					alert("이메일 정보가 올바르지 않습니다.\n회원 정보를 수정해주시기 바랍니다.");
				}
			}
			, error : function(request, status, error){
				alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n"
						+ "error : " + error);
			}
	});
}


</script>
</html>