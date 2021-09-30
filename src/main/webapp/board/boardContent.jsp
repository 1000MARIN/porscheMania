<%@page import="com.example.domain.AttachVO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.example.domain.BoardVO"%>
<%@page import="com.example.repository.AttachDAO"%>
<%@page import="com.example.repository.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 상세보기 글번호 파라미터값 가져오기
int num = Integer.parseInt(request.getParameter("num"));

// 요청 페이지번호 파라미터값 가져오기
String pageNum = request.getParameter("pageNum");

// DAO객체 준비
BoardDAO boardDAO = BoardDAO.getInstance();
AttachDAO attachDAO = AttachDAO.getInstance();

// 조회수 1 증가시키기
boardDAO.updateReadcount(num);

// 상세보기할 글 한개 가져오기
BoardVO boardVO = boardDAO.getBoard(num);

// 화면에 표시할 날짜형식
SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");

// 첨부파일 정보 리스트 가져오기
List<AttachVO> attachList = attachDAO.getAttachesByBno(num);
%>
    
    
<!DOCTYPE html>
<html lang="ko">

<head>
  <jsp:include page="/include/head.jsp" />
  <style>
    time.comment-date {
      font-size: 13px;
    				}
	body {
		    background-color: white;
			}
	#content {
			white-space: pre-line;
			}					
  </style>
</head>

<body>

  <!-- Navbar area -->
  <jsp:include page="/include/top.jsp" />
  <!-- end of Navbar area -->


  <!-- Page Layout here -->
  <div class=" container">

    <div class="col s12 m8 l9">
      <!-- page content  -->
      <div class="section">
		
		<!-- card panel -->
        <div class="card-panel bd-layout">
          <div class="row bd-main">
            <div class="col s12" style="padding: 3% 2%;">

              <h3 class="text-muted">일반 게시판</h3>
              <hr>
              <br>
			
              <table class="table table-sm" id="boardList">
              	<thead>
                  <tr>
                    <th colspan="6" class="fs-5"><%=boardVO.getSubject() %></th>
                  </tr>
                 </thead>
                 <thead>
                  <tr>
                    <th class="col-md-1">작성자</th>
                    <td class="col-md-7"><%=boardVO.getMid() %></td>
                    <th class="text-end">작성일</th>
                    <td><%=sdf.format(boardVO.getRegDate()) %></td>
                    <th class="text-end">조회</th>
                    <td><%=boardVO.getReadcount() %></td>
                  </tr>
                  </thead>
                  <tr>
                    <td id="content" colspan="6" class="table-light">
                    <%
                   	if (attachList.size() > 0) { // 첨부파일이 있으면
                   		%>
                   		<%
                   		for (AttachVO attach : attachList) {
                   			 if (attach.getFiletype().equals("I")) { // 이미지파일
                   				// 썸네일 이미지 경로
                   				String fileCallPath = attach.getUploadpath() + "/s_" + attach.getFilename();
                   				// 원본 이미지 경로
                   				String fileCallPathOrigin = attach.getUploadpath() + "/" + attach.getFilename();
                   				%>
                       			<a href="/pmania/board/display.jsp?fileName=<%=fileCallPathOrigin %>">
                       				<img src="/pmania/board/display.jsp?fileName=<%=fileCallPathOrigin %>" width="80%">
                    			</a>
                       			<%
	                   			} // end of if
	                   		} // end of for
                   			%>
                   		<%
	                   	}
	                   	%>
                      <%=boardVO.getContent() %>
                      <br>
                    </td>
                  </tr>
                  <tr>
                    <th class="table-light">첨부파일</th>
                    <td colspan="5" class="table-light">
                   	<%
                   	if (attachList.size() > 0) { // 첨부파일이 있으면
                   		%>
                   		
                   		<%
                   		for (AttachVO attach : attachList) {
                   			if (attach.getFiletype().equals("O")) { // 일반파일
                   				// 다운로드할 일반파일 경로
                   				String fileCallPath = attach.getUploadpath() + "/" + attach.getFilename();
                   				%>
                       			<p>
                       				<a href="/pmania/board/download.jsp?fileName=<%=fileCallPath %>" class="text-decoration-none">
	                       				<i class="fas fa-download"></i>
                       				&nbsp;
	                       				<%=attach.getFilename() %>
                       				</a>
                       			</p>
                       			<%
                   			} else if (attach.getFiletype().equals("I")) { // 이미지파일
                   				// 썸네일 이미지 경로
                   				String fileCallPath = attach.getUploadpath() + "/s_" + attach.getFilename();
                   				// 원본 이미지 경로
                   				String fileCallPathOrigin = attach.getUploadpath() + "/" + attach.getFilename();
                   				%>
                       			<p class="mb-2">
                       				<a href="/pmania/board/display.jsp?fileName=<%=fileCallPathOrigin %>">
                       					<img src="/pmania/board/display.jsp?fileName=<%=fileCallPath %>">
                       				</a>
                       			<p>
                       			<%
                   			}
                   			
                   		}
                   		%>
                   		
                   		<%
                   	} else { // attachList.size() == 0  // 첨부파일이 없으면
                   		%>첨부파일 없음<%
                   	}
                   	%>
                    </td>
                  </tr>
              </table>


              <div class="d-flex justify-content-center">
                  <%
                  String id = (String) session.getAttribute("id");
                  if (id != null) { // 로그인 했을때
                	  if (id.equals(boardVO.getMid())) { // 로그인 아이디와 글작성자 아이디가 같을때
                		  %>
                		<a href="/pmania/board/boardModify.jsp?num=<%=boardVO.getNum() %>&pageNum=<%=pageNum %>">
	                		<button class="btn btn-sm btn-outline-primary" type="button" >
		                      <i class="fas fa-pencil-alt me-sm-2"></i>글수정
		                    </button>
                		  </a>
                   		  &nbsp;&nbsp;
	                      <a>
	                    
	                        <button class="btn btn-sm btn-outline-danger" type="button" onclick="remove(event)">
	                        <i class="far fa-trash-alt me-sm-2"></i>글삭제
	                        </button>
	                      </a>
                		  <%
                	  }
                	 %>
                	 
                	 &nbsp;&nbsp;
                	 <a href="/pmania/board/replyWrite.jsp?reRef=<%=boardVO.getReRef() %>&reLev=<%=boardVO.getReLev() %>&reSeq=<%=boardVO.getReSeq() %>&pageNum=<%=pageNum %>">
	                   <button class="btn btn-sm btn-outline-warning" type="button" >
	                     <i class="far fa-edit me-sm-2"></i>답글쓰기
	                   </button>
                	 </a>
                	 <% 
                  }
                  %>
                  &nbsp;&nbsp;
                  <a href="/pmania/board/boardList.jsp?pageNum=<%=pageNum %>">
                    <button class="btn btn-sm btn-outline-dark" type="button" >
                      <i class="fas fa-clipboard-list me-sm-2"></i>글목록
                    </button>
                  </a>
              </div>

              
              <!-- comment area -->
              
              <!-- end of comment area -->

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
    // 글삭제 버튼을 클릭하면 호출되는 함수
  	function remove(event) {
    	event.preventDefault(); // a태그 기본동작 막기
    	
  		var isRemove = confirm('이 글을 삭제하시겠습니까?');
  		if (isRemove == true) {
  			location.href = '/pmania/board/boardRemove.jsp?num=<%=boardVO.getNum() %>&pageNum=<%=pageNum %>';
  		}
  	}
  </script>
</body>

</html>





