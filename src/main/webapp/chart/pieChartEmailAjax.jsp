<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/include/head.jsp" />
</head>
<body>

	<!-- Navbar area -->
	<jsp:include page="/include/top.jsp" />
	<!-- end of Navbar area -->
	<!-- Page Layout here -->
	<div class="container">

		<!-- left menu area -->
		<%-- 	<jsp:include page="/include/left.jsp" /> --%>
		<!-- end of left menu area -->


		<div class="col s12 m8 l9">
			<!-- page content  -->
			<div class="section">

				<div class="card-panel">
					<div class="row">
						<div class="col s12" style="padding: 3% 2%;">
							<h3 class="text-dark">이메일 수신 동의 비율 - Ajax
							&nbsp;
							<button class="btn btn-lg btn-warning" type="button" id="btn">버튼</button></h3>
									
							<hr>
							<br>

							<div class="d-flex justify-content-center">
								<div>
									<canvas id="myChart" width="800" height="600"></canvas>

								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- footer area -->
	<footer class="fixed-bottom bg-dark text-muted">
		<div class="container" style="padding: 2% 0;">
			<div class="d-flex justify-content-between">
				<div class="p-3">
					<h4>&nbsp;Get started</h4>
					<br>
					<div class="p-2">
						<a href="/pmania/index.jsp" class="text-decoration-none text-light"><i
							class="fas fa-home fa-lg text-warning"></i>&nbsp;Home</a>
					</div>
					<div class="p-2">

						<a href="/pmania/member/login.jsp"
							class="text-decoration-none text-light"><i
							class="far fa-user fa-lg text-warning"></i> &nbsp;로그인</a>
					</div>

				</div>
				<div class="p-3">
					<h4>&nbsp;Board</h4>
					<br>
					<div class="p-2">
						<a href=""
							class="text-decoration-none text-light"><i
							class="fas fa-clipboard-list fa-lg text-warning"></i> &nbsp;나의
							포르쉐</a>
					</div>
					<div class="p-2">
						<a href="/pmania/board/boardList.jsp"
							class="text-decoration-none text-light"><i
							class="fas fa-clipboard-list fa-lg text-warning"></i> &nbsp;포르쉐
							정보공유</a>
					</div>
				</div>
				<div class="p-3">
					<h4>&nbsp;Support</h4>
					<br>
					<div class="p-2">
						<a href="/pmania/member/join.jsp" class="text-decoration-none text-light"><i
							class="fas fa-user-plus fa-lg text-warning"></i> &nbsp;회원가입</a>
					</div>
					<div class="p-2">
						<a href=""
							class="text-decoration-none text-light"><i
							class="fas fa-bullhorn fa-lg text-warning"></i> &nbsp;공지사항</a>
					</div>
				</div>
				<div class="p-3">
					<h4>&nbsp;Social Network</h4>
					<br>
					<div class="p-2">
						<a href="https://www.instagram.com/"
							class="text-decoration-none text-light"><i
							class="fab fa-instagram-square fa-lg text-warning"></i>
							&nbsp;인스타그램</a>
					</div>
					<div class="p-2">
						<a href="https://www.facebook.com/"
							class="text-decoration-none text-light"><i
							class="fab fa-facebook-square fa-lg text-warning"></i> &nbsp;페이스북</a>
					</div>
					<div class="p-2">
						<a href="https://twitter.com/?lang=ko"
							class="text-decoration-none text-light"><i
							class="fab fa-twitter-square fa-lg text-warning"></i> &nbsp;트위터</a>
					</div>

				</div>
			</div>
		</div>
	</footer>

	<!-- end of footer area -->
	<script src="/resources/js/jquery-3.6.0.js"></script>
	<script src="/resources/js/chart.min.js"></script>
	<script>
		// 버튼 클릭하면 파이차트 표시하기
		$('#btn').on('click', function() {

			requestChartData();
		});

		function requestChartData() {
			$.ajax({
				url : '/api/chart/gender-per-count',
				method : 'GET',
				success : function(data) {
					console.log(typeof data); // object
					console.log(data);

					drawChart(data.labelList, data.dataList);
				}
			});
		} // requestChartData

		function drawChart(labelList, dataList) {
			// 차트를 그릴 캔버스 객체 가져오기
			var canvas = document.getElementById('myChart');
			// 캔버스 객체에 그림을 그릴 컨텍스트 객체 가져오기
			var context = canvas.getContext('2d');
			// 파이 차트 그리기
			var myChart = new Chart(context, {
				type : 'pie',
				data : {
					labels : labelList, // 차트 레이블 적용
					datasets : [ {
						data : dataList, // 차트 데이터 적용
						backgroundColor : [ 'rgb(240, 173, 78)', 'rgb(41, 43, 44)' ],
						hoverBackgroundColor : [ 'rgb(250, 203, 108)', 'rgb(61, 63, 64)' ]
					} ]
				},
				options : {
					responsive : false
				}
			});
		} // drawChart
	</script>
</body>
</html>




