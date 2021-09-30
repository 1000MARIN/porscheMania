<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>	
<%@page import="java.util.List"%>
<%@page import="com.example.repository.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDAO memberDAO = MemberDAO.getInstance();

List<Map<String, Object>> list = memberDAO.getGenderPerCount();

// chart.js에서 사용될수 있도록 데이터를 가공하기

List<String> labelList = new ArrayList<>(); // 레이블을 담을 리스트 준비
List<Integer> dataList = new ArrayList<>(); // 데이터를 담을 리스트 준비

for (Map<String, Object> map : list) {
	
	labelList.add((String) map.get("recv_email"));
	dataList.add((Integer) map.get("cnt"));
} // for

// Gson 객체 준비
Gson gson = new Gson();
		
String strLabel = gson.toJson(labelList);
String strData = gson.toJson(dataList);

System.out.println("strLabel : " + strLabel); // ["남성","여성"]
System.out.println("strData : " + strData);   // [2,1]
%>

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
              <h3 class="text-dark">이메일 수신 동의 비율</h3>
              <hr>
              <br>

              <div class="d-flex justify-content-center">
<canvas id="myChart" width="800" height="600"></canvas>
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
					<a href="/pmania/index.jsp" class="text-decoration-none text-light"><i class="fas fa-home fa-lg text-warning"></i>&nbsp;Home</a>
				</div>
				<div class="p-2">
					
					<a href="/pmania/member/login.jsp" class="text-decoration-none text-light"><i class="far fa-user fa-lg text-warning"></i>
					&nbsp;로그인</a>
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
					<a href="/pmania/board/boardList.jsp" class="text-decoration-none text-light"><i class="fas fa-clipboard-list fa-lg text-warning"></i>
					&nbsp;포르쉐 정보공유</a>
				</div>
			</div>
			<div class="p-3">
				<h4>&nbsp;Support</h4>
				<br>
				<div class="p-2">
					<a href="/pmania/websocket/simpleChat.jsp" class="text-decoration-none text-light"><i class="far fa-comments fa-lg text-warning"></i>
					&nbsp;채팅 서비스</a>
				</div>
				<div class="p-2">
					<a href="/pmania/member/join.jsp" class="text-decoration-none text-light"><i class="fas fa-user-plus fa-lg text-warning"></i>
					&nbsp;회원가입</a>
				</div>
				<div class="p-2">
					<a href="" class="text-decoration-none text-light"><i class="fas fa-bullhorn fa-lg text-warning"></i>
					&nbsp;공지사항</a>
				</div>
			</div>
			<div class="p-3">
				<h4>&nbsp;Social Network</h4>
				<br>
				<div class="p-2">
					<a href="https://www.instagram.com/" class="text-decoration-none text-light"><i class="fab fa-instagram-square fa-lg text-warning"></i>
					&nbsp;인스타그램</a>
				</div>
				<div class="p-2">
					<a href="https://www.facebook.com/" class="text-decoration-none text-light"><i class="fab fa-facebook-square fa-lg text-warning"></i> 
					&nbsp;페이스북</a>
				</div>
				<div class="p-2">
					<a href="https://twitter.com/?lang=ko" class="text-decoration-none text-light"><i class="fab fa-twitter-square fa-lg text-warning"></i>
					&nbsp;트위터</a>
				</div>
				
			</div>
		</div>
	</div>
</footer>

<!-- end of footer area -->


<script src="/resources/js/chart.min.js"></script>
<script>
// 차트를 그릴 캔버스 객체 가져오기
var canvas = document.getElementById('myChart');
// 캔버스 객체에 그림을 그릴 컨텍스트 객체 가져오기
var context = canvas.getContext('2d');

// 파이 차트 그리기
var myChart = new Chart(context, {
	type: 'pie',
	data: {
		labels: JSON.parse('<%=strLabel %>'), // JSON.parse('["차단","수신"]')
		datasets: [
			{
				data: JSON.parse('<%=strData %>'), // JSON.parse('[1,2]')
				backgroundColor: ['rgb(240, 173, 78)', 'rgb(41, 43, 44)'],
				hoverBackgroundColor: ['rgb(250, 203, 108)', 'rgb(61, 63, 64)']
			}
		]
	},
	options: {
		responsive: false
	}
});
</script>
</body>
</html>


