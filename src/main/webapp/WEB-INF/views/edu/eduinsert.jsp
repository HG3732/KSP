<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KimParkSeo</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <link href="${pageContext.request.contextPath}/resource/css/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/core.css" rel="stylesheet">
    <style>
        .wrap-main,
        .wrap-footer {
            margin: 10px auto;
            width: 1100px;
            height: fit-content;
        }

        .wrap-main ul {
            text-align: center;
        }

        .wrap-main li {
            list-style-type: none;
            display: inline-block;
        }

        .wrap-main li>a {
            text-decoration: none;
        }

        .wrap-main .content {
            overflow: hidden;
        }

        .wrap-main .content > a {
            float: left;
            width: 50%;
            box-sizing: border-box;
            cursor: pointer;
            text-align: center;
        }

        .wrap-main .home-menu{
            display: flex;
            float: right;
            align-items: center;
            margin: 10px 0;
        }

        .wrap-main hr {
            clear: both;
        }










        .wrap-main .home-menu img {
            width: 1em;
            height: 1em;
            background-color: white;
        }

        .wrap-main .edu-list {
            clear: both;
            line-height: 3em;
        }
        
        .wrap-main .edu-detail{
        	padding: 30px;
        }

        .wrap-main .edu-list-search {
            background-color: silver;
            padding: 5px 0;
            text-align: center;
        }

        .wrap-main .edu-list-detail form {
            display: inline-block;
        }

        .wrap-main .edu-list-search input[type=text] {
            width: 200px;
        }

        .wrap-main .btn.search-edu {
            background-color: transparent;
            border: 0;
            cursor: pointer;
        }

        .wrap-main div.edu-list-detail {
            display: flex;
            flex-wrap: wrap;
            flex-direction: row;
            justify-content: space-between;
            column-gap: 5px;
        }

        .wrap-main .edu-list-detail>div {
            width: 30%;
        }





        .wrap-main .edu-detail-content input
        , .wrap-main .edu-detail-content textarea{
            border: 1px solid white;
            background-color: transparent;
        }
        
        .wrap-main .edu-detail-content table{
            width: 100%;
        }
        .wrap-main .edu-detail-content textarea{
            width: 100%;
            box-sizing: border-box;
            border: 1px solid white;
            resize: none;
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
        <div>

        </div>
        <div class="content">
            <a href="http://localhost:8080/star/edu/list"><h3>교육 목록</h3></a>
            <a href="http://localhost:8080/star/edu/book/list"><h3>교육 예약 현황</h3></a>
            <div class="home-menu">
                <a href="#"><img src="https://www.jejusi.go.kr/images/star/icon/home_icon01.png"></a>
                <div> &nbsp; | 행사 및 교육 | 행사 및 교육신청</div>
            </div>
            <hr>
            <div class="edu-list">
                <div class="edu-detail">
                    <div class="edu-detail-content">
                        <table border="1" style="border-collapse: collapse;">
                            <colgroup>
                                <col style="width: 10%;">
                                <col>
                                <col style="width: 10%;">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>교육제목</td><td colspan="3"><input type="text" name="book-period" style="width: 43%;"></td>
                                </tr>
                                <tr>
                                    <td>신청기간</td><td><input type="text" name="book-period"></td><td>운영기간</td><td><input type="text" name="oper-period"></td>
                                </tr>
                                <tr>
                                    <td>운영요일</td><td><input type="text" name="oper-day"></td><td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td colspan="4"><textarea rows="10"></textarea></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <button type="button" class="btn eduIns">등록하기</button>
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

</html>