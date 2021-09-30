<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.example.domain.Criteria"%>
<%@page import="com.example.domain.PageDTO"%>
<%@page import="com.example.domain.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.example.repository.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
// 글목록 가져오기 조건객체 준비
Criteria cri = new Criteria(); // 기본값 1페이지 10개
// 요청 페이지번호 파라미터값 가져오기
String strPageNum = request.getParameter("pageNum");
if (strPageNum != null) { // 요청 페이지번호 있으면
	cri.setPageNum(Integer.parseInt(strPageNum)); // cri에 값 설정
}
//요청 글개수 파라미터값 가져오기
String strAmount = request.getParameter("amount");
if (strAmount != null) {
	cri.setAmount(Integer.parseInt(strAmount));
}

// 요청 검색유형 파라미터값 가져오기
String type = request.getParameter("type"); // null or ""
if (type != null && type.length() > 0) {
	cri.setType(type);
}
//요청 검색어 파라미터값 가져오기
String keyword = request.getParameter("keyword"); // null or ""
if (keyword != null && keyword.length() > 0) {
	cri.setKeyword(keyword);
}

System.out.println("cri : " + cri);

//============= 요청 파라미터값 가져와서 Criteria에 저장 완료 =============


// DAO 객체 준비
BoardDAO boardDAO = BoardDAO.getInstance();
// board 테이블에서 전체글 리스트로 가져오기 
List<BoardVO> boardList = boardDAO.getBoards(cri);

// 전체 글개수 가져오기
//int totalCount = boardDAO.getCountAll();
int totalCount = boardDAO.getCountBySearch(cri); // 검색유형, 검색어가 있으면 적용하여 글개수 가져오기

// 페이지블록 정보 객체준비. 필요한 정보를 생성자로 전달.
PageDTO pageDTO = new PageDTO(cri, totalCount);
%>    	
	
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/include/head.jsp" />
</head>
<style>
	body {
	    background-color: white;
	}
	
	td {
		cursor: pointer;
	}
</style>

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
						<div class="d-flex justify-content-center">
						<iframe width="560" height="315" src="https://www.youtube.com/embed/ZxCu9hoWY4M" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						&nbsp;&nbsp;&nbsp;
						<iframe width="560" height="315" src="https://www.youtube.com/embed/35FriPVFftw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						</div>
						<br>
						<br>
						<br>
							<h4>
								<a href=""
									class="text-decoration-none text-dark">나의 포르쉐</a>
							</h4>
							<hr>
							<div class="divider" style="margin: 10px 0;">
								<div class="d-flex justify-content-around">
								<a href="/resources/images/1.jpg" onClick="window.open(this.href, '', 'width=600, height=430'); return false;">
								<img alt="" src="/resources/images/1.jpg"  width="250px" height="190px">
								</a>
								
								<a href="/resources/images/2.jpg" onClick="window.open(this.href, '', 'width=600, height=430'); return false;">
								<img alt="" src="/resources/images/2.jpg" width="250px" height="190px">
								</a>
								
								
								<a href="/resources/images/4.jpg" onClick="window.open(this.href, '', 'width=600, height=430'); return false;">
								<img alt="" src="/resources/images/4.jpg" width="250px" height="190px">
								</a>
								
								<a href="/resources/images/5.jpeg" onClick="window.open(this.href, '', 'width=600, height=430'); return false;">
								<img alt="" src="/resources/images/5.jpeg" width="250px" height="190px">
								</a>
								
								</div>
		

								
								<br> 
								<br>
								<br>
									<h4>
										<a href="/pmania/board/boardList.jsp"
											class="text-decoration-none text-dark">포르쉐 정보공유</a>
									</h4>
									<hr>
									<div class="divider" style="margin: 10px 0;">



										<table class="table table-hover table-sm">
										  <thead>
										    <tr>
										      <th scope="col" class="col-md-1 text-center">번호</th>
										      <th scope="col" class="col-md-7 text-center">제목</th>
										      <th scope="col" class="col-md-1 text-center">작성자</th>
										      <th scope="col" class="col-md-1 text-center">작성일</th>
										      <th scope="col" class="col-md-1 text-center">조회</th>
										      <th scope="col" class="col-md-1 text-center">추천</th>
										    </tr>
										  </thead>
										  <tbody>
											    <%
							                if (pageDTO.getTotalCount() > 0) {
							                	
							                	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
							                	
							                	for (BoardVO boardVO : boardList) {
							                		String strRegDate = sdf.format(boardVO.getRegDate());
							                		%>
										    <tr class="table-light" onclick="location.href='/pmania/board/boardContent.jsp?num=<%=boardVO.getNum() %>&pageNum=<%=pageDTO.getCri().getPageNum() %>'">
										      <th scope="col" class="col-md-1 text-center"><%=boardVO.getNum() %></th>
										      <td class="text-left">
										      <%
							                    if (boardVO.getReLev() > 0) { // 답글이면
							                    	%>
										      		<span class="reply-level" style="width: <%=boardVO.getReLev() * 15 %>px"></span>
							                    	&nbsp;&nbsp;
							                    	<i class="fas fa-angle-double-right"></i>&nbsp;<i class="fab fa-replyd fa-lg"></i>
							                    	&nbsp;
							                    	<%
							                    }
							                    %>
							                    	<%=boardVO.getSubject() %>
										      </td>
										      <td class="col-md-1 text-center"><%=boardVO.getMid() %></td>
										      <td class="col-md-1 text-center"><%=strRegDate %></td>
										      <th scope="row" class="col-md-1 text-center"><%=boardVO.getReadcount() %></th>
										      <th scope="row" class="col-md-1 text-center">33</th>
										    </tr>
												    <%
								                	} // for
								                } else { // pageDTO.getTotalCount() == 0
								                	%>
								                	<tr>
								                		<td class="center-align" colspan="5">게시판 글이 없습니다.</td>
								                	</tr>
								                	<%
								                }
								                %>
												    
										    
										    
										   
										  </tbody>
										</table>
										


									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- footer area -->
	<jsp:include page="/include/bottom.jsp" />
	<!-- end of footer area -->

	<!-- Scripts -->
	<jsp:include page="/include/commonJs.jsp" />
</body>
</html>