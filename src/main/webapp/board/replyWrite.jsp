<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 세션에서 로그인 아이디 가져오기 --%>
<% String id = (String) session.getAttribute("id"); %>

<% 
// reRef  reLev  reSeq   pageNum  파라미터 가져오기
String reRef = request.getParameter("reRef");
String reLev = request.getParameter("reLev");
String reSeq = request.getParameter("reSeq");
String pageNum = request.getParameter("pageNum"); 
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

    <div class="col s12 m8 l9">
      <!-- page content  -->
      <div class="section">
		
		<!-- card panel -->
        <div class="card-panel">
          <div class="row">
            <div class="col s12" style="padding: 3% 2%;">
              
              <h3 class="text-muted">답글 쓰기</h3>
              <hr>
              <br>
              
              <form action="/pmania/board/replyWritePro.jsp" method="POST" enctype="multipart/form-data">
              	<input type="hidden" name="pageNum" value="<%=pageNum %>">
              	<input type="hidden" id="id" type="text" name="id" value="<%=id %>">
              	<input type="hidden" name="reRef" value="<%=reRef %>">
              	<input type="hidden" name="reLev" value="<%=reLev %>">
              	<input type="hidden" name="reSeq" value="<%=reSeq %>">
                

                <div class="row">
                  <div class="form-group">
                    <label for="title" class="form-label text-muted mt-4">제목</label>
                    <input type="text" id="title" class="form-control validate" name="subject" autofocus>
                  </div>
                </div>
                <div class="row">
                  <div class="form-group">
                    <label for="textarea1" class="form-label text-muted mt-4">내용</label>
                    <textarea id="textarea1" class="form-control" name="content" rows="16"></textarea>
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
                
				<hr>			    
                <br>
                <br>
                <div class="d-flex justify-content-center">
                  <button class="btn btn-sm btn-outline-warning" type="submit">
                  	<i class="fas fa-pen me-sm-2"></i>답글등록
                  </button>
                  &nbsp;&nbsp;
                  <button class="btn btn-sm btn-outline-danger" type="reset">
                  	<i class="fas fa-eraser me-sm-2"></i>초기화
                  </button>
                  &nbsp;&nbsp;
                  <button class="btn btn-sm btn-outline-dark" type="button" onclick="location.href = '/pmania/board/boardList.jsp'">
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
  	var fileIndex = 1;
  	var fileCount = 1;
  
    $('button#btnAddFile').on('click', function () {
    	if (fileCount >= 5) {
    		alert('첨부파일은 최대 5개 까지만 첨부할 수 있습니다.');
    		return;
    	}
    	
    	var str = `
    		<div class="col s12">
	            <input type="file" name="file\${fileIndex}">
	            <button class="btn btn-outline-dark btn-sm file-delete"><i class="fas fa-times"></i></button>
            </div>
    	`;
    	
    	$('div#fileBox').append(str);
    	
    	fileIndex++;
    	fileCount++;
    });
    
    // 동적 이벤트 연결 (이벤트 등록을 이미 존재하는 요소에게 위임하는 방식)
    $('div#fileBox').on('click', 'button.file-delete', function () {
    	
    	//$(this).closest('div').remove(); // empty()와 구분 유의!
    	$(this).parent().remove();
    	
    	fileCount--;
    });
    
  </script>
</body>

</html>






