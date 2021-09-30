<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 사용자 세션에서 id 가져오기 --%>
<% String id = (String) session.getAttribute("id"); %>
    
<style>
.navbar-brand {
	font-size: 2em;
	font-weight: bold;

}
.nav-item {
	font-size: 1.3em;
	
}
</style>        
<nav class="navbar navbar-expand-lg navbar-dark bg-warning">
  <div class="container d-flex">
    <a class="navbar-brand text-dark" href="/pmania/index.jsp"><img src="/resources/images/porsche_car.png" class="ui-li-icon" width="80px" /> Porsche Mania</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarColor02">
      <ul class="navbar-nav me-auto">
        
        <!-- <li class="nav-item">
          <a class="nav-link p-2" href="/pmania/board/boardImage.jsp">나의 포르쉐</a>
        </li> -->
        <li class="nav-item">
          <a class="nav-link" href="/pmania/board/boardList.jsp">포르쉐 정보공유</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/pmania/websocket/simpleChat.jsp">채팅 서비스</a>
        </li>
        <!-- <li class="nav-item">
          <a class="nav-link" href="/board/boardBest.jsp">인기 게시판</a>
        </li> -->
      </ul>
      <ul class="nav navbar-nav navbar-right"> 
<%
      if (id == null) {
%>
    	 <!-- 로그아웃 상태일때 -->
        <li class="nav-item">
          <a class="nav-link" href="/pmania/member/join.jsp">회원가입</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/pmania/member/login.jsp">로그인</a>
        </li>
        
    	 
<%
      } else {
%>
		
		<!-- 로그인 상태일때 -->
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle btn btn-dark btn-sm text-warning bg-dark rounded-pill" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><%=id %> 님</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/pmania/member/modifyMember.jsp">내정보 수정</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="/pmania/member/removeMember.jsp">회원탈퇴</a>
          </div>
        </li>
        
		<!-- 로그인 & 관리자 상태일때 -->
<%
      if (id.equals(new String("admin"))) {
%>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle " data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">관리자 메뉴</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/pmania/member/memberList.jsp">회원 정보현황</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="/pmania/chart/pieChartEmail.jsp">이메일 수신동의 비율</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="/pmania/chart/pieChartEmailAjax.jsp">이메일 수신동의 비율 - Ajax</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="/pmania/email/multiPartEmail.jsp">단체 메일발송</a>
          </div>
        </li>
        
<%     
      }
%> 
        
        <li class="nav-item">
          <a class="nav-link" href="/pmania/member/logout.jsp">로그아웃</a>
        </li>
      
<%     
      }
%> 
        
        </ul>
        
      
      
    </div>
  </div>
</nav>


    