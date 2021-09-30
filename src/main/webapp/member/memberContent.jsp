<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.example.domain.MemberVO"%>
<%@page import="com.example.repository.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//상세보기 아이디 파라미터값 가져오기
String id = request.getParameter("id");

// DAO 객체 준비
MemberDAO memberDAO = MemberDAO.getInstance();

//아이디에 해당하는 자신의 정보를 DB에서 가져오기
MemberVO memberVO = memberDAO.getMemberById(id);

//상세보기할 글 한개 가져오기
MemberVO boardVO = memberDAO.getMemberById("id");

// input type="date" 태그에 설정가능한 값이 되도록 생년월일 문자열을 변경하기
String birthday = memberVO.getBirthday(); // "20020127" -> "2002-01-27"

// 문자열 -> Date 객체 변환
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
Date date = sdf.parse(birthday); // 생년월일 문자열을 Date 객체로 변환

// Date 객체 -> 문자열 변환
SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
String strBirthday = sdf2.format(date);
%>

<!DOCTYPE html>
<html lang="ko">

<head>
<jsp:include page="/include/head.jsp" />
<style>
body {
	background: white;
}
</style>
</head>
<body>

	<!-- Navbar area -->
	<jsp:include page="/include/top.jsp" />
	<!-- end of Navbar area -->

	<!-- Page Layout here -->
	<div class="container">

		<div class="col s12 m8 l9">
			<!-- page content  -->
			<div class="section">

				<!-- card panel -->
				<div class="card-panel">
					<div class="row">
						<div class="col s12" style="padding: 3% 2%;">




							<h4>회원정보 수정</h4>
							<hr>
							<br>
							<form action="/pmania/member/modifyMemberPro.jsp" method="POST" id="frm"
								name="frm">
								<div class="d-flex flex-column">

									<div class="form-group">
										<label for="id" class="form-label text-muted mt-4">아이디</label>
										<input id="id" type="text" name="id" class="form-control"
											id="id" value="<%=memberVO.getId()%>"> <span
											class="helper-text" data-error="" data-success=""></span>
									</div>

									<br>
									<div class="form-group">
										<label for="passwd" class="form-label text-muted mt-4">비밀번호</label>
										<input id="passwd" type="text" class="form-control"
											name="passwd" value="<%=memberVO.getPasswd()%>">
									</div>

									<br>
									<div class="form-group">
										<label for="name" class="form-label text-muted mt-4">이름</label>
										<input id="name" type="text" class="form-control col"
											name="name" value="<%=memberVO.getName()%>">
									</div>
									<br>
									<div class="row">
										<div class="form-group">
											<label for="birth" class="form-label text-muted mt-4">셍년월일</label>
											<input type="date"
												class="form-control" id="birthday" name="birthday"
												value="<%=strBirthday%>">
										</div>
									</div>
									<br>
									<div class="input-field">
										<input type="button"
											class="btn btn-outline-warning btn-sm mb-1"
											onclick="execDaumPostcode()" value="우편번호 찾기"> <input
											type="text" id="postcode" name="postcode"
											class="form-control mb-2" value="<%=memberVO.getPostcode()%>"
											placeholder="우편번호" readonly> <input type="text"
											id="address" name="address" class="form-control mb-2"
											value="<%=memberVO.getAddress()%>" placeholder="주소" readonly>
										<input type="text" id="detailAddress" name="detailAddress"
											class="form-control mb-2"
											value="<%=memberVO.getDetailAddress()%>" placeholder="상세주소">
										<input type="text" id="extraAddress" name="extraAddress"
											class="form-control mb-2"
											value="<%=memberVO.getExtraAddress()%>" placeholder="참고주소"
											readonly>
										<div id="map"
											style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
										<div id="wrap"
											style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
											<img
												src="//t1.daumcdn.net/postcode/resource/images/close.png"
												id="btnFoldWrap"
												style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
												onclick="foldDaumPostcode()" alt="접기 버튼">
										</div>
									</div>
									<br>
									<div class="row">
										<div class="input-field col s12">
											<label for="email" class="form-label text-muted mt-4">이메일</label>
											<input id="email" type="email" class="form-control mb-2"
												name="email" value="<%=memberVO.getEmail()%>">
										</div>
									</div>
									<br>
									<div class="">
									<label for="id" class="form-label text-muted mt-4">이메일 수신 여부</label>
									
									<div class="">
										<label> <input name="recvEmail" value="Y" type="radio" checked /> <span>예</span></label> 
										<label> <input name="recvEmail" value="N" type="radio" /> <span>아니오</span></label>
									</div>
									</div>
								</div>
								
								<br>
								<hr>
								<br>
								<br>
								<div class="d-flex justify-content-center">
									<button class="btn btn-sm btn-outline-warning" type="submit">
									<i class="fas fa-pen me-sm-2"></i>회원정보 수정
									</button>
									
									&nbsp;&nbsp;
					                  <button class="btn btn-sm btn-outline-dark" type="button" onclick="location.href = '/pmania/member/memberList.jsp'">
					                  	<i class="fas fa-clipboard-list me-sm-2"></i>회원현황
					                  </button>
								</div>

							</form>

						</div>
					</div>
				</div>
				<!-- end of card-panel -->

			</div>
		</div>

	</div>


	<!-- footer area -->
<jsp:include page="/include/bottom.jsp" />
  <!-- end of footer area -->

	<!-- Scripts -->
	<jsp:include page="/include/commonJs.jsp" />
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		// 우편번호 찾기 찾기 화면을 넣을 element
		var element_wrap = document.getElementById('wrap');

		function foldDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			element_wrap.style.display = 'none';
		}

		function execDaumPostcode() {
			// 현재 scroll 위치를 저장해놓는다.
			var currentScroll = Math.max(document.body.scrollTop,
					document.documentElement.scrollTop);
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("extraAddress").value = extraAddr;

							} else {
								document.getElementById("extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("detailAddress").focus();

							// iframe을 넣은 element를 안보이게 한다.
							// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
							element_wrap.style.display = 'none';

							// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
							document.body.scrollTop = currentScroll;
						},
						// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
						onresize : function(size) {
							element_wrap.style.height = size.height + 'px';
						},
						width : '100%',
						height : '100%'
					}).embed(element_wrap);

			// iframe을 넣은 element를 보이게 한다.
			element_wrap.style.display = 'block';
		}

		// 시작시 비밀번호 폼에 바로 커서가기 
		$('#loginModal').on('shown.bs.modal', function() {
			$('#passwd').focus()
		})
	</script>
</body>
</html>
