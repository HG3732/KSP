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
            <form id="frm-edubook" action="${pageContext.request.contextPath }/edu/book/form" method="post">
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
	                        <td>이메일</td><td><input type="email" id="book-email" name="book-email" value="${ssslogin.mem_email }" readonly></td><td colspan="2"><button type="button" class="btn sendMail">발송</button></td>
	                    </tr>
	                    <tr>
	                        <td>인증번호</td><td><input type="text" id="book-email-no" name="book-email-no"></td><td colspan="2"><button type="button" class="btn confMail">확인</button></td>
	                    </tr>
	                    <tr>
	                        <td>휴대전화</td><td><input type="tel" id="book-phone" name="book-phone"></td>
	                        <td>참여대상</td>
	                        <td>
	                            <select name="group">
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
	                                    <option value="m4">중등4</option>
	                                    <option value="m5">중등5</option>
	                                    <option value="m6">중등6</option>
	                                </optgroup>
	                                <optgroup label="고등">
	                                    <option value="h1">고등1</option>
	                                    <option value="h2">고등2</option>
	                                    <option value="h3">고등3</option>
	                                    <option value="h4">고등4</option>
	                                    <option value="h5">고등5</option>
	                                    <option value="h6">고등6</option>
	                                </optgroup>
	                                <optgroup label="기타">
	                                    <option value="adult">성인</option>
	                                </optgroup>
	                            </select>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>수강자명</td><td><input type="text" id="book-part-name" name="book-part-name"></td>
	                        <td>학교명</td><td><input type="text" id="book-school" name="book-school"></td>
	                    </tr>
	                    <tr>
	                        <td colspan="4"><button type="submit" class="btn book">신청</button></td>
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
<script>
$("").url
</script>
</body>

</html>