<%@page import="com.example.repository.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 파라미터값 id 가져오기
String id = request.getParameter("id");

// DAO 객체 준비
MemberDAO memberDAO = MemberDAO.getInstance();

// 아이디 중복여부 확인
int count = memberDAO.getCountById(id); // count 1: 아이디 중복, 0: 아이디 중복아님
%>
    
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/include/head.jsp" />
</head>
<style>
	body {
	    background-color: white;
		margin: 30px    
	}
	
</style>
<body>
<div class="container">
	<h2>ID 중복확인</h2>
	<hr>
	<%
	if (count == 1) {
		%>
		<p>이미 사용중인 ID 입니다. 다른 ID를 입력하세요.</p>
		<%
	} else { // count == 0
		%>
		<p><%=id %> 는 사용가능한 ID 입니다.
			<button type="button" class="btn btn-outline-warning btn-sm" id="btnUseId">ID 사용</button>
		</p>
		
		<%
	}
	%>
	
	<form action="/pmania/member/joinIdDupChk.jsp" method="get" name="frm">
		<input type="text" class="form-control form-control-sm mb-1" name="id" value="<%=id %>">
		<button class="btn btn-outline-warning btn-sm" type="submit">ID 중복확인</button>
	</form>
</div>
<script src="/resources/js/jquery-3.6.0.js"></script>
<script>
	$('button#btnUseId').on('click', function () {
		// 검색한 ID값을 부모창의 id 입력상자에 넣기
		window.opener.document.frm.id.value = frm.id.value;
		// 현재창 닫기  window.close();
		close();
	});
</script>
</body>
</html>








