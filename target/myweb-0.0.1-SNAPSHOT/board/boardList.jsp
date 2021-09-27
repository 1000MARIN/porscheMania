<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <jsp:include page="/include/head.jsp" />
  <style>
    table tbody tr {
      cursor: pointer;
    }
  </style>
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
      <!-- page content  -->
      <div class="section">

        <div class="card-panel">
          <div class="row">
            <div class="col s12" style="padding: 0 2%;">
              
              <h5>일반 게시판</h5>
              <div class="divider" style="margin: 30px 0;"></div>

              <div class="row">
                <a href="/board/boardWrite.jsp" class="btn waves-effect waves-light right">
                  <i class="material-icons left">create</i>새글쓰기
                </a>
              </div>

              <table class="highlight responsive-table" id="board">
                <thead>
                  <tr>
                    <th class="center-align">번호</th>
                    <th class="center-align">제목</th>
                    <th class="center-align">작성자</th>
                    <th class="center-align">작성일</th>
                    <th class="center-align">조회수</th>
                    <th class="center-align">추천</th>
                  </tr>
                </thead>

                <tbody>
                  <tr onclick="location.href='/board/boardContent.jsp'">
                    <td class="center-align">10</td>
                    <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>
                    <td class="center-align">Web Admin</td>
                    <td class="center-align">2021.05.11</td>
                    <td class="center-align">15000</td>
                    <td class="center-align">264</td>
                  </tr>
                  <tr>
                    <td class="center-align">9</td>
                    <td>Vivamus viverra porttitor commodo.</td>
                    <td class="center-align">Web Admin</td>
                    <td class="center-align">2021.05.11</td>
                    <td class="center-align">150</td>
                    <td class="center-align">22</td>
                  </tr>
                  <tr>
                    <td class="center-align">8</td>
                    <td>In pulvinar fermentum erat a tincidunt. Nulla id magna sit ...</td>
                    <td class="center-align">Sec Admin</td>
                    <td class="center-align">2021.05.11</td>
                    <td class="center-align">15000</td>
                    <td class="center-align">99</td>
                  </tr>
                  <tr>
                    <td class="center-align">7</td>
                    <td>Sed diam velit, dictum a iaculis sed, tempor sed mi.</td>
                    <td class="center-align">Host Admin</td>
                    <td class="center-align">2021.05.11</td>
                    <td class="center-align">150</td>
                    <td class="center-align">11</td>
                  </tr>
                  <tr>
                    <td class="center-align">6</td>
                    <td>Nullam ac dignissim diam. Mauris vitae magna ipsum,</td>
                    <td class="center-align">Host Admin</td>
                    <td class="center-align">2021.05.11</td>
                    <td class="center-align">15</td>
                    <td class="center-align">3</td>
                  </tr>
                  <tr>
                    <td class="center-align">5</td>
                    <td> eget vehicula metus. In euismod sollicitudin lorem eu.</td>
                    <td class="center-align">Host Admin</td>
                    <td class="center-align">2021.05.11</td>
                    <td class="center-align">15000</td>
                    <td class="center-align">334</td>
                  </tr>
                  <tr>
                    <td class="center-align">4</td>
                    <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>
                    <td class="center-align">Sec Admin</td>
                    <td class="center-align">2021.05.11</td>
                    <td class="center-align">1500</td>
                    <td class="center-align">58</td>
                  </tr>
                  <tr>
                    <td class="center-align">3</td>
                    <td>Vivamus viverra porttitor commodo.</td>
                    <td class="center-align">Sec Admin</td>
                    <td class="center-align">2021.05.11</td>
                    <td class="center-align">15</td>
                    <td class="center-align">2</td>
                  </tr>
                  <tr>
                    <td class="center-align">2</td>
                    <td>In pulvinar fermentum erat a tincidunt. Nulla id magna sit ...</td>
                    <td class="center-align">Web Admin</td>
                    <td class="center-align">2021.05.11</td>
                    <td class="center-align">15</td>
                    <td class="center-align">4</td>
                  </tr>
                  <tr>
                    <td class="center-align">1</td>
                    <td>Nullam ac dignissim diam. Mauris vitae magna ipsum,</td>
                    <td class="center-align">Web Admin</td>
                    <td class="center-align">2021.05.11</td>
                    <td class="center-align">150</td>
                    <td class="center-align">27</td>
                  </tr>
                </tbody>
              </table>

              <br>
              <ul class="pagination center">
                <li class="disabled"><a href="#board"><i class="material-icons">chevron_left</i></a></li>
                <li class="active"><a href="#board">1</a></li>
                <li class="waves-effect"><a href="#board">2</a></li>
                <li class="waves-effect"><a href="#board">3</a></li>
                <li class="waves-effect"><a href="#board">4</a></li>
                <li class="waves-effect"><a href="#board">5</a></li>
                <li class="waves-effect"><a href="#board"><i class="material-icons">chevron_right</i></a></li>
              </ul>
              
              <div class="divider" style="margin: 30px 0;"></div>

              <form action="" method="GET">
                <div class="row">
                  <div class="col s12 l4">
                    <div class="input-field">
                      <i class="material-icons prefix">find_in_page</i>
                      <select name="type">
                        <option value="" disabled selected>--</option>
                        <option value="T">제목</option>
                        <option value="C">내용</option>
                        <option value="W">작성자</option>
                      </select>
                      <label>검색 조건</label>
                    </div>
                  </div>

                  <div class="col s12 l4">
                    <!-- AutoComplete -->
                    <div class="input-field">
                      <i class="material-icons prefix">search</i>
                      <input type="text" id="autocomplete-input" class="autocomplete" name="keyword">
                      <label for="autocomplete-input">검색어</label>
                    </div>
                    <!-- end of AutoComplete -->
                  </div>
                  
                  <div class="col s12 l4">
                    <a class="waves-effect waves-light btn-large"><i class="material-icons left">search</i>검색</a>
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
    const sideNav = document.querySelector('.sidenav');
    M.Sidenav.init(sideNav, {});

    const ac = document.querySelector('.autocomplete');
    M.Autocomplete.init(ac, {
        data: {
            '파리': null,
            '베네치아': null,
            '암스테르담': null,
            '부다페스트': null,
            '프랑크푸르트': null,
            '비엔나': null,
            '드라스덴': null,
            '프라하': null,
            '로마': null
        }
    });

    var selects = document.querySelectorAll('select');
    M.FormSelect.init(selects, {});
</script>
</body>

</html>