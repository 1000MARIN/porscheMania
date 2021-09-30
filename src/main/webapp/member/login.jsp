<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  	<jsp:include page="/include/head.jsp" />
  </head>
  <body>
  	
	<!-- Navbar area -->
	<jsp:include page="/include/top.jsp" />
	<!-- end of Navbar area -->
	
	
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header border-bottom-0">
	        
	      </div>
	      <div class="modal-body">
	        <div class="form-title text-center">
	          <h4>로그인</h4>
	          <br>
	        </div>
          <form action="/pmania/member/loginPro.jsp" method="POST">
	        <div class="d-flex flex-column text-center">
	            <div class="form-group mb-2" autofocus>
	              <input type=text class="form-control" id="id" name="id" placeholder="아이디"  autofocus="" />
	            </div>
	            <div class="form-group mb-2">
	              <input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호">
	            </div>
	            
	            <p class="row center">
                  <label>
                    <input class="form-check-input" type="checkbox" name="rememberMe" checked="" />
                    <span>로그인 상태 유지</span>
                  </label>
                </p>
	            
	            <br>
	            <br>
	            <div class="d-grid">
				  <button class="btn btn-lg btn-warning" type="submit">로그인</button>
				</div>
	          <br>
	          <div class="text-center text-muted delimiter">또는 SNS로 연결하기</div>
	          <br>
	          	<div class="d-flex justify-content-center social-buttons">
	            <button type="button" class="btn btn-dark btn-round me-sm-2" data-toggle="tooltip" data-placement="top" title="Twitter">
	              <i class="fab fa-twitter"></i> 
	            </button>
	            <button type="button" class="btn btn-dark btn-round me-sm-2" data-toggle="tooltip" data-placement="top" title="Facebook">
	              <i class="fab fa-facebook"></i> 
	            </button>
	            <button type="button" class="btn btn-dark btn-round me-sm-2" data-toggle="tooltip" data-placement="top" title="Instagram">
	              <i class="fab fa-instagram"></i> 
	            </button>
        		</div>
	      </div>
        </form>
	    </div>
	      <div class="modal-footer d-flex justify-content-center">
	        <div class="signup-section">아직 회원이 아닌가요? <a href="/pmania/member/join.jsp" class="text-info">회원가입</a>.</div>
	      </div>
	      
	  </div>
	</div>
	</div>
	
	<footer class="fixed-bottom bg-dark text-muted">
	<div class="container" style="padding: 2% 0;">
		<div class="d-flex justify-content-between">
			<div class="p-3">
				<h4>&nbsp;Get started</h4>
				<br>
				<div class="p-2">
					<a href="/index.jsp" class="text-decoration-none text-light"><i class="fas fa-home fa-lg text-warning"></i>&nbsp;Home</a>
				</div>
				<div class="p-2">
					
					<a href="/pmania/member/login.jsp" class="text-decoration-none text-light"><i class="far fa-user fa-lg text-warning"></i>
					&nbsp;로그인</a>
				</div>

			</div>
			<div class="p-3">
				<h4>&nbsp;Menu</h4>
				<br>
				<div class="p-2">
					<a href="/board/boardImage.jsp" class="text-decoration-none text-light"><i class="fas fa-clipboard-list fa-lg text-warning"></i>
					&nbsp;나의 포르쉐</a>
				</div>
				<div class="p-2">
					<a href="/board/boardList.jsp" class="text-decoration-none text-light"><i class="fas fa-clipboard-list fa-lg text-warning"></i>
					&nbsp;포르쉐 정보공유</a>
				</div>
				<div class="p-2">
					<a href="/websocket/simpleChat.jsp" class="text-decoration-none text-light"><i class="far fa-comments fa-lg text-warning"></i>
					&nbsp;채팅 서비스</a>
				</div>
			</div>
			<div class="p-3">
				<h4>&nbsp;Support</h4>
				<br>
				<div class="p-2">
					<a href="/pmania/member/join.jsp" class="text-decoration-none text-light"><i class="fas fa-user-plus fa-lg text-warning"></i>
					&nbsp;회원가입</a>
				</div>
				<div class="p-2">
					<a href="/board/boardNotice.jsp" class="text-decoration-none text-light"><i class="fas fa-bullhorn fa-lg text-warning"></i>
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
	
	<!-- Scripts -->
	<jsp:include page="/include/commonJs.jsp" />
  	<script>
  	
  	// 시작시 아이디 폼에 바로 커서가기 
  	$('#loginModal').on('shown.bs.modal', function () {
  	  $('#id').focus()
  	})
  	</script>
  </body>
</html>


