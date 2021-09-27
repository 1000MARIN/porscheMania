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


  <!-- Page Layout here -->
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

              <h5>게시판 새글쓰기</h5>
              <div class="divider" style="margin: 30px 0;"></div>

              <form action="" method="POST">
                <div class="row">
                  <div class="input-field col s12">
                    <i class="material-icons prefix">account_box</i>
                    <input id="id" type="text" class="validate">
                    <label for="id">아이디</label>
                    <span class="helper-text" data-error="wrong" data-success="right">필수 정보입니다.</span>
                  </div>
                </div>

                <div class="row">
                  <div class="input-field">
                    <i class="material-icons prefix">subtitles</i>
                    <input type="text" id="title" class="validate">
                    <label for="title">제목</label>
                  </div>
                </div>
                <div class="row">
                  <div class="input-field">
                    <i class="material-icons prefix">subject</i>
                    <textarea id="textarea1" class="materialize-textarea"></textarea>
                    <label for="textarea1">내용</label>
                  </div>
                </div>

                <div class="row">
                  <div class="file-field input-field">
                    <div class="btn">
                      <span><i class="material-icons left">attach_file</i>첨부 파일</span>
                      <input type="file" multiple>
                    </div>
                    <div class="file-path-wrapper">
                      <input type="text" class="file-path validate">
                    </div>
                    <span class="helper-text">첨부파일로 업로드 가능한 용량은 최대 50MB 입니다.</span>
                  </div>
                </div>

                <br>
                <div class="row center">
                  <button class="btn waves-effect waves-light" type="submit">새글등록
                    <i class="material-icons right">create</i>
                  </button>
                  &nbsp;&nbsp;
                  <button class="btn waves-effect waves-light" type="reset">초기화
                    <i class="material-icons right">clear</i>
                  </button>
                  &nbsp;&nbsp;
                  <button class="btn waves-effect waves-light" type="button" onclick="location.href = '/board/boardList.jsp'">글목록
                    <i class="material-icons right">list</i>
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

  <!-- footer area -->
  <jsp:include page="/include/bottom.jsp" />
  <!-- end of footer area -->


  <!-- Scripts -->
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