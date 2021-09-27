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
      <!-- Teal page content  -->
      <div class="section">

        <!-- card panel -->
        <div class="card-panel">
          <div class="row">
            <div class="col s12" style="padding: 0 5%;">

              <h5>회원가입</h5>
              <div class="divider" style="margin: 30px 0;"></div>

              <form action="/member/joinPro.jsp" method="POST">
                <div class="row">
                  <div class="input-field col s12">
                    <i class="material-icons prefix">account_box</i>
                    <input id="id" type="text" class="validate" name="id">
                    <label for="id">아이디</label>
                    <span class="helper-text" data-error="wrong" data-success="right">필수 정보입니다.</span>
                  </div>
                </div>

                <div class="row">
                  <div class="input-field col s12">
                    <i class="material-icons prefix">lock</i>
                    <input id="passwd" type="password" class="validate" name="passwd">
                    <label for="passwd">비밀번호</label>
                    <span class="helper-text" data-error="wrong" data-success="right">Helper text</span>
                  </div>

                  <div class="input-field col s12">
                    <i class="material-icons prefix">check</i>
                    <input id="passwd2" type="password" class="validate">
                    <label for="passwd2">비밀번호 재확인</label>
                    <span class="helper-text" data-error="wrong" data-success="right">Helper text</span>
                  </div>
                </div>

                <div class="row">
                  <div class="input-field col s12">
                    <i class="material-icons prefix">person</i>
                    <input id="name" type="text" class="validate" name="name">
                    <label for="name">이름</label>
                  </div>
                </div>

                <div class="row">
                  <div class="input-field">
                    <i class="material-icons prefix">event</i>
                    <input type="date" id="birthday" name="birthday">
                    <label for="birthday">생년월일</label>
                  </div>
                </div>

                <div class="row">
                  <div class="input-field">
                    <i class="material-icons prefix">wc</i>
                    <select name="gender">
                      <option value="" disabled selected>성별을 선택하세요.</option>
                      <option value="M">남자</option>
                      <option value="F">여자</option>
                      <option value="N">선택 안함</option>
                    </select>
                    <label>성별</label>
                  </div>
                </div>

                <div class="row">
                  <div class="input-field col s12">
                    <i class="material-icons prefix">mail</i>
                    <input id="email" type="email" class="validate" name="email">
                    <label for="email">본인 확인 이메일</label>
                  </div>
                </div>

                <p class="row center">
                  알림 이메일 수신 : &nbsp;&nbsp;
                  <label>
                    <input name="recvEmail" value="Y" type="radio" checked />
                    <span>예</span>
                  </label>
                  &nbsp;&nbsp;
                  <label>
                    <input name="recvEmail" value="N" type="radio" />
                    <span>아니오</span>
                  </label>
                </p>

                <br>
                <div class="row center">
                  <button class="btn waves-effect waves-light" type="submit">회원가입
                    <i class="material-icons right">create</i>
                  </button>
                  &nbsp;&nbsp;
                  <button class="btn waves-effect waves-light" type="reset">초기화
                    <i class="material-icons right">clear</i>
                  </button>
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


  <!--  Scripts-->
  <jsp:include page="/include/commonJs.jsp" />
  <script>
    const sideNav = document.querySelector('.sidenav');
    M.Sidenav.init(sideNav, {});

    var textNeedCount = document.querySelectorAll('#member_id, #password');
    M.CharacterCounter.init(textNeedCount);

    var selects = document.querySelectorAll('select');
    M.FormSelect.init(selects, {});
  </script>
</body>

</html>