<link href="${pageContext.request.contextPath}/resource/css/reset.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/core.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resource/css/board/board_core.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resource/css/board/board_faq.css"
	rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https:/code.jquery.com/jquery-3.7.1.js"></script>
</head>

<body>
	<div class="wrap-header">
		<header> 
		<%@include file="/WEB-INF/views/common/header.jsp"%>
		</header>
	</div>
	<div class="wrap-main">
		<div class="container">
			<div class="flexnav">
				<a href="${pageContext.request.contextPath}/board/community"
					class="flex community">게시판</a> <a
					href="${pageContext.request.contextPath}/board/faq"
					class="flex faq">FAQ</a>
			</div>
		<div class="location">
				<div class="location main">
					<a href="${pageContext.request.contextPath}/home"> <img
						alt="메인"
						src="${pageContext.request.contextPath}/resource/image/home_icon.png">
					</a>
				</div>
				<div class="l">|</div>
				<div class="location community">
					<span>커뮤니티</span>
				</div>
				<div class="l">|</div>
				<div class="location notice">
					<span>게시판</span>
				</div>
			</div>
			<div class="subject">
				<div>FAQ</div>
			</div>
			<div class="contents">
				<div class="board">
					<div class="board-faq">
						<dl>
							<dt>
								<div class="text">
									<span class="icon"> <img src="${pageContext.request.contextPath}/resource/image/stars.png" alt="Q">
									</span> <span class="title"> <a href="#">별은 왜 망원경으로 봐도 점으로
											보이나요?</a>
									</span> <span class="open active">ㅜ</span>
								</div>
							</dt>
							<dd>
								<div class="faq_detail">
									우리가 지구에서 관측되는 별 중에서 가장 크게 보이는 별은 바로 태양입니다. <br /> <br />태양을
									제외한 일반적으로 우리가 밤하늘에 관측되는 별들은 모두 점처럼 작게 보입니다. <br /> <br />그
									이유는 별의 크기에 비해 지구로부터 거리가 너무나도 멀리 떨어져 있기 때문입니다. <br />(※ 밤하늘의
									별들중 지구에서 가장 가까운 대상은 켄타우르스자리의 프록시마이며, 4.2광년 떨어져있습니다. ) <br /> <br />태양계
									내부에 있는 태양, 달, 행성 등은 우주 전체로 봤을 때 아주 가까운 거리에 있기 때문에 <br /> <br />망원경의
									배율을 조절해 주면 크기가 커지기도 하고 작아지기도 합니다만 별은 그렇지 않습니다.
								</div>
							</dd>
						</dl>
						<dl>
							<dt>
								<div class="text">
									<span class="icon"> <img src="${pageContext.request.contextPath}/resource/image/stars.png" alt="Q">
									</span> <span class="title"> <a href="#">별은 왜 망원경으로 봐도 점으로
											보이나요?</a>
									</span> <span class="open active">ㅜ</span>
								</div>
							</dt>
							<dd>
								<div class="faq_detail">
									우리가 지구에서 관측되는 별 중에서 가장 크게 보이는 별은 바로 태양입니다. <br /> <br />태양을
									제외한 일반적으로 우리가 밤하늘에 관측되는 별들은 모두 점처럼 작게 보입니다. <br /> <br />그
									이유는 별의 크기에 비해 지구로부터 거리가 너무나도 멀리 떨어져 있기 때문입니다. <br />(※ 밤하늘의
									별들중 지구에서 가장 가까운 대상은 켄타우르스자리의 프록시마이며, 4.2광년 떨어져있습니다. ) <br /> <br />태양계
									내부에 있는 태양, 달, 행성 등은 우주 전체로 봤을 때 아주 가까운 거리에 있기 때문에 <br /> <br />망원경의
									배율을 조절해 주면 크기가 커지기도 하고 작아지기도 합니다만 별은 그렇지 않습니다.
								</div>
							</dd>
						</dl>
						<dl>
							<dt>
								<div class="text">
									<span class="icon"> <img src="${pageContext.request.contextPath}/resource/image/stars.png" alt="Q">
									</span> <span class="title"> <a href="#">별은 왜 망원경으로 봐도 점으로
											보이나요?</a>
									</span> <span class="open active">ㅜ</span>
								</div>
							</dt>
							<dd>
								<div class="faq_detail">
									우리가 지구에서 관측되는 별 중에서 가장 크게 보이는 별은 바로 태양입니다. <br /> <br />태양을
									제외한 일반적으로 우리가 밤하늘에 관측되는 별들은 모두 점처럼 작게 보입니다. <br /> <br />그
									이유는 별의 크기에 비해 지구로부터 거리가 너무나도 멀리 떨어져 있기 때문입니다. <br />(※ 밤하늘의
									별들중 지구에서 가장 가까운 대상은 켄타우르스자리의 프록시마이며, 4.2광년 떨어져있습니다. ) <br /> <br />태양계
									내부에 있는 태양, 달, 행성 등은 우주 전체로 봤을 때 아주 가까운 거리에 있기 때문에 <br /> <br />망원경의
									배율을 조절해 주면 크기가 커지기도 하고 작아지기도 합니다만 별은 그렇지 않습니다.
								</div>
							</dd>
						</dl>
						<dl>
							<dt>
								<div class="text">
									<span class="icon"> <img src="${pageContext.request.contextPath}/resource/image/stars.png" alt="Q">
									</span> <span class="title"> <a href="#">별은 왜 망원경으로 봐도 점으로
											보이나요?</a>
									</span> <span class="open active">ㅜ</span>
								</div>
							</dt>
							<dd>
								<div class="faq_detail">
									우리가 지구에서 관측되는 별 중에서 가장 크게 보이는 별은 바로 태양입니다. <br /> <br />태양을
									제외한 일반적으로 우리가 밤하늘에 관측되는 별들은 모두 점처럼 작게 보입니다. <br /> <br />그
									이유는 별의 크기에 비해 지구로부터 거리가 너무나도 멀리 떨어져 있기 때문입니다. <br />(※ 밤하늘의
									별들중 지구에서 가장 가까운 대상은 켄타우르스자리의 프록시마이며, 4.2광년 떨어져있습니다. ) <br /> <br />태양계
									내부에 있는 태양, 달, 행성 등은 우주 전체로 봤을 때 아주 가까운 거리에 있기 때문에 <br /> <br />망원경의
									배율을 조절해 주면 크기가 커지기도 하고 작아지기도 합니다만 별은 그렇지 않습니다.
								</div>
							</dd>
						</dl>
						<dl>
							<dt>
								<div class="text">
									<span class="icon"> <img src="${pageContext.request.contextPath}/resource/image/stars.png" alt="Q">
									</span> <span class="title"> <a href="#">별은 왜 망원경으로 봐도 점으로
											보이나요?</a>
									</span> <span class="open active">ㅜ</span>
								</div>
							</dt>
							<dd>
								<div class="faq_detail">
									우리가 지구에서 관측되는 별 중에서 가장 크게 보이는 별은 바로 태양입니다. <br /> <br />태양을
									제외한 일반적으로 우리가 밤하늘에 관측되는 별들은 모두 점처럼 작게 보입니다. <br /> <br />그
									이유는 별의 크기에 비해 지구로부터 거리가 너무나도 멀리 떨어져 있기 때문입니다. <br />(※ 밤하늘의
									별들중 지구에서 가장 가까운 대상은 켄타우르스자리의 프록시마이며, 4.2광년 떨어져있습니다. ) <br /> <br />태양계
									내부에 있는 태양, 달, 행성 등은 우주 전체로 봤을 때 아주 가까운 거리에 있기 때문에 <br /> <br />망원경의
									배율을 조절해 주면 크기가 커지기도 하고 작아지기도 합니다만 별은 그렇지 않습니다.
								</div>
							</dd>
						</dl>
						<dl>
							<dt>
								<div class="text">
									<span class="icon"> <img src="${pageContext.request.contextPath}/resource/image/stars.png" alt="Q">
									</span> <span class="title"> <a href="#">별은 왜 망원경으로 봐도 점으로
											보이나요?</a>
									</span> <span class="open active">ㅜ</span>
								</div>
							</dt>
							<dd>
								<div class="faq_detail">
									우리가 지구에서 관측되는 별 중에서 가장 크게 보이는 별은 바로 태양입니다. <br /> <br />태양을
									제외한 일반적으로 우리가 밤하늘에 관측되는 별들은 모두 점처럼 작게 보입니다. <br /> <br />그
									이유는 별의 크기에 비해 지구로부터 거리가 너무나도 멀리 떨어져 있기 때문입니다. <br />(※ 밤하늘의
									별들중 지구에서 가장 가까운 대상은 켄타우르스자리의 프록시마이며, 4.2광년 떨어져있습니다. ) <br /> <br />태양계
									내부에 있는 태양, 달, 행성 등은 우주 전체로 봤을 때 아주 가까운 거리에 있기 때문에 <br /> <br />망원경의
									배율을 조절해 주면 크기가 커지기도 하고 작아지기도 합니다만 별은 그렇지 않습니다.
								</div>
							</dd>
						</dl>
						<dl>
							<dt>
								<div class="text">
									<span class="icon"> <img src="${pageContext.request.contextPath}/resource/image/stars.png" alt="Q">
									</span> <span class="title"> <a href="#">별은 왜 망원경으로 봐도 점으로
											보이나요?</a>
									</span> <span class="open active">ㅜ</span>
								</div>
							</dt>
							<dd>
								<div class="faq_detail">
									우리가 지구에서 관측되는 별 중에서 가장 크게 보이는 별은 바로 태양입니다. <br /> <br />태양을
									제외한 일반적으로 우리가 밤하늘에 관측되는 별들은 모두 점처럼 작게 보입니다. <br /> <br />그
									이유는 별의 크기에 비해 지구로부터 거리가 너무나도 멀리 떨어져 있기 때문입니다. <br />(※ 밤하늘의
									별들중 지구에서 가장 가까운 대상은 켄타우르스자리의 프록시마이며, 4.2광년 떨어져있습니다. ) <br /> <br />태양계
									내부에 있는 태양, 달, 행성 등은 우주 전체로 봤을 때 아주 가까운 거리에 있기 때문에 <br /> <br />망원경의
									배율을 조절해 주면 크기가 커지기도 하고 작아지기도 합니다만 별은 그렇지 않습니다.
								</div>
							</dd>
						</dl>
						<dl>
							<dt>
								<div class="text">
									<span class="icon"> <img src="${pageContext.request.contextPath}/resource/image/stars.png" alt="Q">
									</span> <span class="title"> <a href="#">별은 왜 망원경으로 봐도 점으로
											보이나요?</a>
									</span> <span class="open active">ㅜ</span>
								</div>
							</dt>
							<dd>
								<div class="faq_detail">
									우리가 지구에서 관측되는 별 중에서 가장 크게 보이는 별은 바로 태양입니다. <br /> <br />태양을
									제외한 일반적으로 우리가 밤하늘에 관측되는 별들은 모두 점처럼 작게 보입니다. <br /> <br />그
									이유는 별의 크기에 비해 지구로부터 거리가 너무나도 멀리 떨어져 있기 때문입니다. <br />(※ 밤하늘의
									별들중 지구에서 가장 가까운 대상은 켄타우르스자리의 프록시마이며, 4.2광년 떨어져있습니다. ) <br /> <br />태양계
									내부에 있는 태양, 달, 행성 등은 우주 전체로 봤을 때 아주 가까운 거리에 있기 때문에 <br /> <br />망원경의
									배율을 조절해 주면 크기가 커지기도 하고 작아지기도 합니다만 별은 그렇지 않습니다.
								</div>
							</dd>
						</dl>
					</div>
				</div>
				<div class="pageno">
					<div class="flexpage">
						<div class="no 1">
							<button type="submit">1</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	<div class="wrap-footer">
		<footer> 
		<%@include file="/WEB-INF/views/common/footer.jsp" %>
		</footer>
	</div>
	</div>
	<script>
		$(document).ready(function() {$(".open.active").click(function() {
				$(this).toggleClass('active'); // 활성/비활성 클래스 전환
				$(this).parent().parent().next().children(".faq_detail").stop().slideToggle(300); // FAQ 섹션 슬라이드 업/다운
					});
				});
	</script>
</body>

</html>

