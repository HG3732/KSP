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

		.wrap-main .edu-detail-title{
			float: left;
			width: 80%;
		}
		.wrap-main .edu-edit-del{
		    display: flex;
		    float: right;
		    column-gap: 10px;
		    justify-content: flex-end;
		}

        .wrap-main .edu-list-search input[type=text] {
            width: 200px;
        }

        .wrap-main .btn.search-edu {
            background-color: transparent;
            border: 0;
            cursor: pointer;
        }




        .wrap-main .edu-detail-content table{
            width: 100%;
        }



        .wrap-main .edu-book{
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
            <a href="http://localhost:8080/star/edu/list"><h3>교육 목록</h3></a>
            <a href="http://localhost:8080/star/edu/book/list"><h3>교육 예약 현황</h3></a>
            <div class="home-menu">
                <a href="#"><img src="https://www.jejusi.go.kr/images/star/icon/home_icon01.png"></a>
                <div> &nbsp; | 행사 및 교육 | 행사 및 교육신청</div>
            </div>
            <hr>
            <div class="edu-list">
                <div class="edu-detail">
                	<% %>
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
                            		<td colspan="7">교육 제목</td>
                            		<td>
	                            		<div class="edu-edit-del">
                        				<a href="http://localhost:8080/star/edu/detail/edit">수정</a>
	                        			<a href="해당 글 삭제 doGet">삭제</a>
	                    				</div>
	                    			</td>
                            	</tr>
                                <tr>
                                    <td>신청기간</td><td>시작날짜</td><td>~</td><td>종료날짜</td><td>운영기간</td><td>시작날짜</td><td>~</td><td>종료날짜</td>
                                </tr>
                                <tr>
                                    <td>운영요일</td><td>요일</td><td>교육장소</td><td colspan="5">장소</td>
                                </tr>
                                <tr>
                                    <td colspan="8">Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium iure placeat odio ullam perferendis, nostrum, vel quas modi aut recusandae id, sapiente voluptas facere quibusdam autem et natus. Velit, nulla.</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="edu-book">
                        <a href="http://localhost:8080/star/edu/book/form">신청하기</a>
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

</html>