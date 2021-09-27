<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.example.domain.PageDTO"%>
<%@page import="com.example.domain.Criteria"%>
<%@page import="com.example.domain.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.example.repository.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
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
 <style>
 	body {
     background-color: white;
 	}
    td {
    	cursor: pointer;
    }
    
   
	 
	 .pagination,
	.jsgrid .jsgrid-pager {
	    display: flex;
	    padding-left: 0;
	    list-style: none;
	    border-radius: 0.25rem
	}
	
	.page-link {
	    color: black
	}
	
	.pagination.pagination-rounded-flat .page-item {
	    margin: 0 .25rem
	}
	
	.pagination-rounded-flat {}
	
	.pagination-success .page-item.active .page-link
	 {
	    background: #f0ad4e;
	    border-color: #00c689
	}
	
	.pagination.pagination-rounded-flat .page-item .page-link
	 {
	    border: none;
	    border-radius: 50px
	}
	 
  </style>
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
              
              <h3 class="text-dark">나의 포르쉐</h3>
              <hr>
              <br>
              <%
			  if (session.getAttribute("id") != null) {
				  %>
              <div class="">
              	<a href="/board/boardWrite.jsp?pageNum=<%=pageDTO.getCri().getPageNum() %>">
              	<button type="button" class="btn btn-sm btn-outline-warning">
              	<i class="far fa-edit me-sm-1"></i>새글쓰기
              	</button></a>
              </div>
              	  <%
			  }
			  %>
			  <br>
              <div class="divider" style="margin: 10px 0;"></div>

			  

              <div class="d-flex justify-content-around" style="margin-bottom: 80px">
				<a href="/resources/images/1.jpg" onClick="window.open(this.href, '', 'width=600, height=430'); return false;">
				<img alt="" src="/resources/images/1.jpg"  width="250px">
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
              <div class="d-flex justify-content-around" style="margin-bottom: 80px">
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
              <ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
              <%
              // 이전
              if (pageDTO.isPrev()) {
            	  %>
                  <li class="page-item">
                  	<a class="page-link" href="/board/boardImage.jsp?pageNum=<%=pageDTO.getStartPage() - 1 %>&type=<%=pageDTO.getCri().getType() %>&keyword=<%=pageDTO.getCri().getKeyword() %>#board" data-abc="true"><i class="fa fa-angle-left"></i></a>
                  </li>
                  <%
              }
              %>
              
              <%
              // 페이지블록 내 최대 5개 페이지씩 출력
              for (int i=pageDTO.getStartPage(); i<=pageDTO.getEndPage(); i++) {
            	  %>
                  <li class="page-item <%=(pageDTO.getCri().getPageNum() == i) ? "active" : "" %>">
                  	<a class="page-link" href="/board/boardImage.jsp?pageNum=<%=i %>&type=<%=pageDTO.getCri().getType() %>&keyword=<%=pageDTO.getCri().getKeyword() %>#board" data-abc="true"><%=i %></a>
                  </li>
                   <%
              }
              %>
              
              <%
              // 다음
              if (pageDTO.isNext()) {
            	  %>
                  
                  
                  
                  <li class="page-item">
                  	<a class="page-link" href="/board/boardImage.jsp?pageNum=<%=pageDTO.getEndPage() + 1 %>&type=<%=pageDTO.getCri().getType() %>&keyword=<%=pageDTO.getCri().getKeyword() %>#board" data-abc="true"><i class="fa fa-angle-right"></i></a>
                  </li>
                  <%
              }
              %>
                  
                  
              </ul>
              
			  <hr>
			  
              <div class="divider" style="margin: 30px 0;"></div>
              <form action="" method="GET">
                <div class="container">
                	<div  class="d-flex justify-content-center">
                    <div class="form-group me-sm-2">
                      <select class="form-select" name="type">
                        <option value="subject" <%=(pageDTO.getCri().getType().equals("subject")) ? "selected" : "" %>>제목</option>
                        <option value="content" <%=(pageDTO.getCri().getType().equals("content")) ? "selected" : "" %>>내용</option>
                        <option value="mid" <%=(pageDTO.getCri().getType().equals("mid")) ? "selected" : "" %>>작성자</option>
                      </select>
                    </div>

                  <div class="">
                    <!-- AutoComplete -->
                    <div class="d-flex">
                      <input type="text" id="autocomplete-input" class="form-control me-sm-2 autocomplete" name="keyword" value="<%=pageDTO.getCri().getKeyword() %>" placeholder="검색어를 입력하세요.">
	                    <button class="btn btn-outline-warning my-2 my-sm-0 rounded-pill" type="submit">
				        <i class="fas fa-search"></i>
				        </button>
	                    </div>
                    <!-- end of AutoComplete -->
                  </div>
                  
                  
                	</div>
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
  <script>
    // 검색 버튼 클릭시
  	$('#btnSearch').on('click', function () {
  		
  		var query = $('#frm').serialize();
  		console.log(query);
  		
  		location.href = '/board/boardList.jsp?' + query + '#board';
  	});
  </script>

</body>

</html>


