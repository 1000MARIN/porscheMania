<%@page import="com.example.domain.AttachVO"%>
<%@page import="java.util.List"%>
<%@page import="com.example.domain.BoardVO"%>
<%@page import="com.example.repository.AttachDAO"%>
<%@page import="com.example.repository.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 세션에서 로그인 아이디 가져오기 --%>
<% String id = (String) session.getAttribute("id"); %>

<% 
// num  pageNum 파라미터 가져오기 
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum"); 

// DAO 객체 준비
BoardDAO boardDAO = BoardDAO.getInstance();
AttachDAO attachDAO = AttachDAO.getInstance();

// 글번호에 해당하는 글내용 가져오기
BoardVO boardVO = boardDAO.getBoard(num);
// 글번호에 해당하는 첨부파일 리스트 가져오기
List<AttachVO> attachList = attachDAO.getAttachesByBno(num);
%>

    
<!DOCTYPE html>
<html lang="ko">

<head>
  <jsp:include page="/include/head.jsp" />
  <style>
  	span.filename {
  		display: inline-block;
  		width: 275px;
  		height: 40px;
  	}
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
              
              <h3 class="text-muted">글 수정하기</h3>
              <hr>
              <br>
              
              <form action="/board/boardModifyPro.jsp" method="POST" enctype="multipart/form-data">
              	<input type="hidden" name="pageNum" value="<%=pageNum %>">
              	<input type="hidden" id="id" type="text" name="id" value="<%=id %>">
              	<input type="hidden" name="num" value="<%=boardVO.getNum() %>">
                

                <div class="row">
                  <div class="form-group">
                    <label for="title" class="form-label text-muted mt-4">제목</label>
                    <input type="text" id="title" class="form-control validate" name="subject" value="<%=boardVO.getSubject() %>" autofocus="autofocus">
                  </div>
                </div>
                <div class="row">
                  <div class="form-group">
                    <label for="textarea1" class="form-label text-muted mt-4">내용</label>
                    <textarea id="textarea1" class="form-control" name="content" rows="16"><%=boardVO.getContent() %></textarea>
                  </div>
                </div>
				<br>
				<div class="row">
				  <div class="col s12">
					<button type="button" class="btn btn-outline-dark" id="btnAddFile">
						<i class="fas fa-paperclip me-sm-2"></i>파일 추가</button>	
				  </div>
				</div>
				<br>
				
				
                <div class="row" id="fileBox">
                  <div class="form-group">
                    <input type="file" name="file0">
                    <button class="btn btn-outline-dark btn-sm file-delete"><i class="fas fa-times"></i></button>
                  </div>
                </div>
				
				<!-- 기존 첨부파일 영역 -->
                <div class="row" id="oldFileBox">
                <%
                for (AttachVO attach : attachList) {
                	%>
                  <%-- .delete-oldfile 버튼 클릭시 hidden input의 name 속성값이 oldfile -> delfile 변환됨 --%>
                  <input type="hidden" name="oldfile" value="<%=attach.getUuid() %>">
                  <div class="col s12">
                    <span class="filename"><%=attach.getFilename() %></span>
                    <button class="btn btn-outline-dark btn-sm delete-oldfile"><i class="fas fa-times"></i></button>
                  </div>
                	<%
                }
                %>
                </div>
                
                <!-- 신규 첨부파일 영역 -->
                <div class="row" id="newFileBox"></div>
				
				<hr>			    
                <br>
                <br>
                <div class="d-flex justify-content-center">
                  <button class="btn btn-sm btn-outline-warning" type="submit">
                  	<i class="fas fa-pen me-sm-2"></i>글수정
                  </button>
                  &nbsp;&nbsp;
                  <button class="btn btn-sm btn-outline-danger" type="reset">
                  	<i class="fas fa-eraser me-sm-2"></i>초기화
                  </button>
                  &nbsp;&nbsp;
                  <button class="btn btn-sm btn-outline-dark" type="button" onclick="location.href = '/board/boardList.jsp'">
                  	<i class="fas fa-clipboard-list me-sm-2"></i>글목록
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
  <script>
  	var fileIndex = 0;
  	
  	var currentfileCount = <%=attachList.size() %>;  // 현재 첨부된 파일 갯수
  	const MAX_FILE_COUNT = 5; // 최대 첨부파일 갯수
  
  	// [첨부파일 추가] 버튼을 클릭하면
    $('button#btnAddFile').on('click', function () {
    	if (currentfileCount >= MAX_FILE_COUNT) {
    		alert(`첨부파일은 최대 \${MAX_FILE_COUNT}개 까지만 첨부할 수 있습니다.`);
    		return;
    	}
    	
    	var str = `
    		<div class="form-group">
	            <input type="file" name="file\${fileIndex}">
	            <button class="btn btn-outline-dark btn-sm file-delete"><i class="fas fa-times"></i></button>
     		</div>
    	`;
    	
    	$('div#newFileBox').append(str);
    	
    	fileIndex++;
    	currentfileCount++;
    });
    
    // 동적 이벤트 연결 (이벤트 등록을 이미 존재하는 요소에게 위임하는 방식)
    $('div#newFileBox').on('click', 'button.delete-addfile', function () {
    	
    	//$(this).closest('div').remove(); // empty()와 구분 유의!
    	$(this).parent().remove();
    	
    	currentfileCount--;
    });
    
    
    // 기존 첨부파일에 삭제버튼 눌렀을때
    $('button.delete-oldfile').on('click', function () {
    	
    	$(this).parent().prev().prop('name', 'delfile'); // oldfile -> delfile(서버에서 찾을 파라미터값. 파일삭제용도)
    	
    	// 현재 클릭한 요소의 직계부모(parent) 요소를 삭제하기
    	$(this).parent().remove();
    	currentfileCount--;
    });
    
  </script>
</body>

</html>



