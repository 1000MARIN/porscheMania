<%@page import="com.example.domain.PageDTO2"%>
<%@page import="com.example.domain.Criteria2"%>
<%@page import="com.example.domain.MemberVO"%>
<%@page import="com.example.repository.MemberDAO"%>
<%@page import="com.example.domain.PageDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.example.repository.BoardDAO"%>
<%@page import="com.example.domain.Criteria"%>
<%@page import="com.example.domain.BoardVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 글목록 가져오기 조건객체 준비
Criteria2 cri = new Criteria2(); // 기본값 1페이지 10개

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
MemberDAO memberDAO = MemberDAO.getInstance();

// member 테이블에서 전체글 리스트로 가져오기 
List<MemberVO> memberList = memberDAO.getMembers(cri);

// 전체 글개수 가져오기
int totalCount = memberDAO.getCountBySearch(cri); // 검색유형, 검색어가 있으면 적용하여 글개수 가져오기

// 페이지블록 정보 객체준비. 필요한 정보를 생성자로 전달.
PageDTO2 pageDTO = new PageDTO2(cri, totalCount);
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
              
              <h3 class="text-dark">회원 정보현황</h3>
              <hr>
              <br>
              
              <div class="divider" style="margin: 10px 0;"></div>

			  

              <table class="table table-hover table-sm">
				  <thead>
				    <tr>
				      <th scope="col" class="col-md-1 text-center">아이디</th>
				      <th scope="col" class="col-md-1 text-center">패스워드</th>
				      <th scope="col" class="col-md-1 text-center">이름</th>
				      <th scope="col" class="col-md-1 text-center">생년월일</th>
				      <th scope="col" class="col-md-1 text-center">우편번호</th>
				      <th scope="col" class="col-md-1 text-center">주소1</th>
				      <th scope="col" class="col-md-1 text-center">주소2</th>
				      <th scope="col" class="col-md-1 text-center">주소3</th>
				      <th scope="col" class="col-md-1 text-center">이메일</th>
				      <th scope="col" class="col-md-1 text-center">메일수신</th>
				      <th scope="col" class="col-md-1 text-center">가입날짜</th>
				    </tr>
				  </thead>
				  <tbody>
					    <%
	                if (pageDTO.getTotalCount() > 0) {
	                	
	                	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	                	
	                	for (MemberVO memberVO : memberList) {
	                		String strRegDate = sdf.format(memberVO.getRegDate());
	                		%>
				    <tr class="table-light" onclick="location.href='/member/memberContent.jsp?id=<%=memberVO.getId() %>&pageNum=<%=pageDTO.getCri2().getPageNum() %>'">
				      
				      
				      <td scope="row" class="col-md-1 text-center"><%=memberVO.getId() %></td>
				      <td scope="row" class="col-md-1 text-center"><%=memberVO.getPasswd() %></td>
				      <td scope="row" class="col-md-1 text-center"><%=memberVO.getName() %></td>
				      <td scope="row" class="col-md-1 text-center"><%=memberVO.getBirthday() %></td>
				      <td scope="row" class="col-md-1 text-center"><%=memberVO.getPostcode() %></td>
				      <td scope="row" class="col-md-3 text-center"><%=memberVO.getAddress() %></td>
				      <td scope="row" class="col-md-1 text-center"><%=memberVO.getDetailAddress() %></td>
				      <td scope="row" class="col-md-1 text-center"><%=memberVO.getExtraAddress() %></td>
				      <td scope="row" class="col-md-1 text-center"><%=memberVO.getEmail() %></td>
				      <td scope="row" class="col-md-1 text-center"><%=memberVO.getRecvEmail() %></td>
				      <td scope="row" class="col-md-1 text-center"><%=strRegDate %></td>
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

              <br>
              <ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
              <%
              // 이전
              if (pageDTO.isPrev()) {
            	  %>
                  <li class="page-item">
                  	<a class="page-link" href="/member/memberList.jsp?pageNum=<%=pageDTO.getStartPage() - 1 %>&type=<%=pageDTO.getCri2().getType() %>&keyword=<%=pageDTO.getCri2().getKeyword() %>#board" data-abc="true"><i class="fa fa-angle-left"></i></a>
                  </li>
                  <%
              }
              %>
              
              <%
              // 페이지블록 내 최대 5개 페이지씩 출력
              for (int i=pageDTO.getStartPage(); i<=pageDTO.getEndPage(); i++) {
            	  %>
                  <li class="page-item <%=(pageDTO.getCri2().getPageNum() == i) ? "active" : "" %>">
                  	<a class="page-link" href="/member/memberList.jsp?pageNum=<%=i %>&type=<%=pageDTO.getCri2().getType() %>&keyword=<%=pageDTO.getCri2().getKeyword() %>#board" data-abc="true"><%=i %></a>
                  </li>
                   <%
              }
              %>
              
              <%
              // 다음
              if (pageDTO.isNext()) {
            	  %>
                  
                  
                  
                  <li class="page-item">
                  	<a class="page-link" href="/member/memberList.jsp?pageNum=<%=pageDTO.getEndPage() + 1 %>&type=<%=pageDTO.getCri2().getType() %>&keyword=<%=pageDTO.getCri2().getKeyword() %>#board" data-abc="true"><i class="fa fa-angle-right"></i></a>
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
                        <option value="name" <%=(pageDTO.getCri2().getType().equals("name")) ? "selected" : "" %>>이름</option>
                        <option value="id" <%=(pageDTO.getCri2().getType().equals("id")) ? "selected" : "" %>>아이디</option>
                        <option value="birthday" <%=(pageDTO.getCri2().getType().equals("birthday")) ? "selected" : "" %>>생년월일</option>
                      </select>
                    </div>

                  <div class="">
                    <!-- AutoComplete -->
                    <div class="d-flex">
                      <input type="text" id="autocomplete-input" class="form-control me-sm-2 autocomplete" name="keyword" value="<%=pageDTO.getCri2().getKeyword() %>" placeholder="검색어를 입력하세요.">
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
  		
  		location.href = '/member/memberList.jsp?' + query + '#board';
  	});
  </script>

</body>

</html>
