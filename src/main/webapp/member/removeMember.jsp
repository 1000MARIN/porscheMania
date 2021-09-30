<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String id = (String) session.getAttribute("id"); %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <jsp:include page="/include/head.jsp" />
	<style>
		 body {
		     background-color: white;
		     overflow:auto; 
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
		
		<!-- card panel -->
        <div class="card-panel">
          <div class="row">
            <div class="col s12" style="padding: 3% 2%;">
              
              <h3 class="text-muted">회원탈퇴</h3>
              <hr>
              <br>
              
              <form action="/member/removeMemberPro.jsp" method="POST" id="frm">
                 
                 <div class="">
                  <div class="form-group col s12">
                    <label for="id">아이디</label>
                    <input class="form-control" id="id" type="text" name="id" value="<%=id %>" readonly>
                  </div>
                </div>
				<br>
                <div class="">
                  <div class="form-group col s12">
                    <label for="passwd">비밀번호</label>
                    <input class="form-control" id="passwd" type="password" class="validate" name="passwd" autofocus>
                  </div>
                </div>
                

                <br>
                <br>
                <div class="d-flex justify-content-center">
                  <button class="btn btn-lg btn-outline-danger" type="submit">
                  	<i class="fas fa-user-times me-sm-2"></i>회원탈퇴
                    
                  </button>
                  &nbsp;&nbsp;
                  <button class="btn btn-lg btn-outline-warning" type="reset">
                  	<i class="fas fa-eraser me-sm-2"></i>초기화
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
	<footer class="fixed-bottom bg-dark text-muted">
		<div class="container" style="padding: 2% 0;">
			<div class="d-flex justify-content-between">
				<div class="p-3">
					<h4>&nbsp;Get started</h4>
					<br>
					<div class="p-2">
						<a href="/pmania/index.jsp" class="text-decoration-none text-light"><i class="fas fa-home fa-lg text-warning"></i>&nbsp;Home</a>
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
						<a href="" class="text-decoration-none text-light"><i class="fas fa-clipboard-list fa-lg text-warning"></i>
						&nbsp;나의 포르쉐</a>
					</div>
					<div class="p-2">
						<a href="/pmania/board/boardList.jsp" class="text-decoration-none text-light"><i class="fas fa-clipboard-list fa-lg text-warning"></i>
						&nbsp;포르쉐 정보공유</a>
					</div>
					<div class="p-2">
						<a href="/pmania/websocket/simpleChat.jsp" class="text-decoration-none text-light"><i class="far fa-comments fa-lg text-warning"></i>
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
						<a href="" class="text-decoration-none text-light"><i class="fas fa-bullhorn fa-lg text-warning"></i>
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
    <!-- end of footer area -->

  <!-- Scripts -->
  <jsp:include page="/include/commonJs.jsp" />

</body>

</html>


