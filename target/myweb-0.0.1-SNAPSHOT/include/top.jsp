<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <nav class="nav-extended light-blue lighten-1">
    <div class="nav-wrapper container">
      <a id="logo-container" href="/index.jsp" class="brand-logo">Logo</a>
      <ul id="mainMenu" class="right hide-on-med-and-down">
      	<!-- 로그아웃 상태일때 -->
        <li><a href="#!" id="loginMenu" data-has-submenu="false">로그인</a></li>
        <li><a href="#!" id="joinMenu" data-has-submenu="false">회원가입</a></li>
        
        <!-- 로그인 상태일때 -->
        <li><a href="#!" id="logoutMenu" data-has-submenu="false">로그아웃</a></li>
        <li><a href="#!" id="memberMenu" data-has-submenu="true">내정보</a></li>
        
        <!-- 로그인 관계없이 보이는 메뉴 -->
        <li><a href="#!" id="boardMenu" data-has-submenu="true">게시판</a></li>
        <li><a href="#!" id="chatMenu" data-has-submenu="true">채팅</a></li>
      </ul>

      <ul id="nav-mobile" class="sidenav">
        <li><a href="#">Navbar Link</a></li>
      </ul>
      <a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
    </div>
    
    <div id="subMenuArea" class="nav-content container">
      <ul id="subMenu" class="tabs tabs-transparent">
      	<!-- 내정보 서브메뉴 -->
      	<li class="tab submenu-member">a<a href="#!">비밀번호 변경</a></li>
      	<li class="tab submenu-member">a<a href="#!">내정보 수정</a></li>
      	<li class="tab submenu-member">a<a href="#!">회원탈퇴</a></li>
		<!-- 게시판 서브메뉴 -->
      	<li class="tab submenu-board">a<a href="#!">게시판</a></li>
      	<li class="tab submenu-board">a<a href="#!">자료실</a></li>
		<!-- 채팅서브메뉴 -->
      	<li class="tab submenu-board">a<a href="#!">간단한 채팅</a></li>
      	<li class="tab submenu-board">a<a href="#!">채팅방 목록</a></li>
      </ul>
    </div>
  </nav>
  
<script>
	// html문서가 로딩 완료됐을때
	$(document).ready(function () {
		
		function getSubMenu(menuId) {
			var str = '';
			if (menuId == 'memberMenu') {
				str = `
					<li class="tab"><a href="/member/changePasswd.jsp">비밀번호 변경</a></li>
			        <li class="tab"><a href="/member/modifyMember.jsp">내정보 수정</a></li>
			        <li class="tab"><a href="/member/removeMember.jsp">회원탈퇴</a></li>
				`;
			} else if (menuId == 'boardMenu') {
				str = `
					<li class="tab"><a href="/board/boardList.jsp">게시판</a></li>
			        <li class="tab"><a href="#!">자료실</a></li>
				`;
			} else if (menuId == 'chatMenu') {
				var str = `
					<li class="tab"><a href="#!">간단한 채팅</a></li>
			        <li class="tab"><a href="#!">채팅방 목록</a></li>
				`;
			}
			return str;
		} // getSubMenu
		
		
		function requestAddr(menuId) {
			if (menuId == 'joinMenu') {
				location.href = '/member/join.jsp';
			} else if (menuId == 'loginMenu') {
				location.href = '/member/login.jsp';
			} else if (menuId == 'logoutMenu') {
				location.href = '/member/logut.jsp';
			}
		} // requestAddr
		
		
		// 서브메뉴 div 요소를 찾아서 변수에 저장
		var $subMenuArea = $('div#subMenuArea');
		
		
		// 주메뉴 이벤트 연결
		$('ul#mainMenu a').not('').on('click', function (event) {
			event.preventDefault(); // a태그의 기본동작 막기
			
			// 현재 선택한 a태그의 id속성값을 가져오기
			var menuId = $(this).attr('id');
			
			// 하위메뉴가 있는 주메뉴이면
			if (menuId != 'loginMenu' && menuId != 'joinMenu' && menuId != 'logoutMenu') {
				// id속성값에 따라서 해당하는 하위메뉴 태그표현 문자열을 가져오기
				var str = getSubMenu(menuId);
				// 하위메뉴 영역에 표시하기
				$('ul#subMenu').html(str);
				
				var thisMenuSelected = $(this).closest('li').hasClass('active'); // true/false
				console.log(thisMenuSelected);
				if (thisMenuSelected == true) {
					$subMenuArea.slideToggle();
				} else {
					$subMenuArea.slideDown();
				}
			} else {
				// 하위메뉴가 없는 주메뉴이면
				$subMenuArea.slideUp();
				// 메뉴 아이디 속성에 해당하는 URL 주소로 요청하기
				requestAddr(menuId)
				
			}
			
			// 주메뉴에 이미 선택된 active 클래스 제거하기
			$('ul#mainMenu > li').removeClass('active');
			// 주메뉴 선택 acitve 클래스 추가하기
			$(this).closest('li').addClass('active');
		});
		
	});
</script>















