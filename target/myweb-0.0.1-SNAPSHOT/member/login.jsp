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


  <!-- Page Layout -->
  <div class="row container">

	<!-- left menu area -->
	<jsp:include page="/include/left.jsp" />
    <!-- end of left menu area -->

    <div class="col s12 m8 l9">
      <!-- page content  -->
      <div class="section">

        <!-- card panel -->
        <div class="card-panel">
          <div class="row">
            <div class="col s12" style="padding: 0 5%;">

              <h5>로그인</h5>
              <div class="divider" style="margin: 30px 0;"></div>

              <form action="" method="POST">
                <div class="row">
                  <div class="input-field col s12">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="id" type="text" class="validate">
                    <label for="id">아이디</label>
                  </div>
                </div>

                <div class="row">
                  <div class="input-field col s12">
                    <i class="material-icons prefix">password</i>
                    <input id="passwd" type="password" class="validate">
                    <label for="passwd">비밀번호</label>
                  </div>
                </div>

                <p class="row center">
                  <label>
                    <input class="filled-in" type="checkbox" name="rememberMe" />
                    <span>로그인 상태 유지</span>
                  </label>
                </p>

                <br>
                <div class="row center">
                  <button class="btn waves-effect waves-light" type="submit">로그인
                    <i class="material-icons right">login</i>
                  </button>
                  &nbsp;&nbsp;
                  <button class="btn waves-effect waves-light" type="reset">초기화
                    <i class="material-icons right">clear</i>
                  </button>
                </div>

                <br>
                <div class="row center">
                  아이디 찾기
                  &nbsp;<span class="grey-text text-lighten-1">|</span>&nbsp;
                  비밀번호 찾기
                  &nbsp;<span class="grey-text text-lighten-1">|</span>&nbsp;
                  <a href="join.html">회원가입</a>
                </div>
              </form>

            </div>
          </div>
        </div>
         <!-- end of card panel -->

      </div>
    </div>

  </div>
  <!-- end of Page Layout -->
  

  <!-- footer area -->
  <jsp:include page="/include/bottom.jsp" />
  <!-- end of footer area -->


  <!-- Scripts -->
  <jsp:include page="/include/commonJs.jsp" />

</body>

</html>




