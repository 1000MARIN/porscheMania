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
	          <h4>회원가입</h4>
	          <br>
	        </div>
	        
	        <form action="/pmania/member/joinPro.jsp" method="POST" id="frm" name="frm">
   		        <div class="d-flex flex-column">
	        	
	            <div class="input-field form-group mb-1">
                    <input id="id" type="text" name="id" class="form-control" id="id" maxlength="20" placeholder="아이디" />
                    <span class="helper-text" data-error="" data-success=""></span>
                 </div>
	            <div class="form-group">
                  	<button type="button" class="btn btn-outline-warning btn-sm" id="btnIdDupChk">ID 중복확인</button>
                 </div>
				<br>
                <div class="input-field form-group mb-2">
                    <input id="passwd" type="password" class="form-control" maxlength="10" name="passwd" placeholder="비밀번호는 10글자까지만 가능합니다.">
                    <div class="valid-feedback">OK!</div>
                </div>

                <div class="input-field form-group">
                    <input id="passwd2" type="password" class="form-control" maxlength="10" placeholder="비밀번호 재확인">
                </div>
				<br>
                <div class="input-field form-group">
                    <input id="name" type="text" class="form-control col" name="name" placeholder="이름">
                </div>
				<br>
                <div class="row">
                  <div class="input-field form-group">
                    <label for="birthday">생년월일</label>
                    <input type="date" class="form-control" id="birthday" name="birthday">
                  </div>
                </div>
				<br>
                <div class="input-field">
					<input type="button" class="btn btn-outline-warning btn-sm mb-1" onclick="execDaumPostcode()" value="우편번호 찾기">
	               	<input type="text" id="postcode" name="postcode" class="form-control mb-2" placeholder="우편번호" readonly>
					<input type="text" id="address" name="address"  class="form-control mb-2" placeholder="주소" readonly>
					<input type="text" id="detailAddress" name="detailAddress"  class="form-control mb-2" placeholder="상세주소">
					<input type="text" id="extraAddress" name="extraAddress"  class="form-control mb-2" placeholder="참고주소" readonly>
					<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
					<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>
                </div>
				<br>
                <div class="row">
                  <div class="input-field col s12">
                    <input id="email" type="email" class="form-control mb-2" name="email" placeholder="example@example.com">
                  </div>
                </div>
                <p class="text-center">
                  알림 이메일 수신 : 
                  <label>
                    <input name="recvEmail" value="Y" type="radio" checked />
                    <span>예</span>
                  </label>
                  <label>
                    <input name="recvEmail" value="N" type="radio" />
                    <span>아니오</span>
                  </label>
                </p>
         	 </div>

                <br>
                <div class="d-grid">
                  <button class="btn btn-lg btn-outline-warning" type="submit">회원가입
                  </button>
                  &nbsp;&nbsp;
                  <button class="btn  btn-lg btn-outline-danger" type="reset">초기화
                  </button>
                </div>
                <div class="modal-footer d-flex justify-content-center">
	        <div class="signup-section">이미 회원이신가요? <a href="/pmania/member/login.jsp" class="text-info">로그인</a>.</div>
	      </div>
            </form>
	        
	      </div>
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
    <!-- end of footer area -->
    
  
	<!-- Scripts -->
	<jsp:include page="/include/commonJs.jsp" />
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		
	
	    // 우편번호 찾기 찾기 화면을 넣을 element
	    var element_wrap = document.getElementById('wrap');
	
	    function foldDaumPostcode() {
	        // iframe을 넣은 element를 안보이게 한다.
	        element_wrap.style.display = 'none';
	    }
	    
	
	    function execDaumPostcode() {
	        // 현재 scroll 위치를 저장해놓는다.
	        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddress").focus();
	
	                // iframe을 넣은 element를 안보이게 한다.
	                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	                element_wrap.style.display = 'none';
	
	                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
	                document.body.scrollTop = currentScroll;
	            },
	            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
	            onresize : function(size) {
	                element_wrap.style.height = size.height+'px';
	            },
	            width : '100%',
	            height : '100%'
	        }).embed(element_wrap);
	
	        // iframe을 넣은 element를 보이게 한다.
	        element_wrap.style.display = 'block';
	    }
	    
	 	// 아이디 중복확인 버튼 클릭 이벤트 연결
		$('button#btnIdDupChk').on('click', function () {
			// 사용자가 입력한 아이디 문자열 가져오기
			var id = $('input#id').val();
			console.log('id : ' + id);
			
			var popupX = (document.body.offsetWidth / 2) - (500 / 2);
			//&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	
			var popupY= (window.screen.height / 2) - (400 / 2);
			//&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
			
			// id가 공백이면 '아이디 입력하세요' 포커스 주기
			if (id == '') { // id.length == 0
				alert('아이디 입력하세요');
				$('input#id').focus();
				return;
			}
			
			// id 중복확인 자식창 열기  window.open();
			open('/pmania/member/joinIdDupChk.jsp?id=' + id, 'idDupChk', 'width=500,height=400, left='+ popupX + ', top='+ popupY);
		});
	  	
	 	// 시작시 아이디 폼에 바로 커서가기 
		$('#loginModal').on('shown.bs.modal', function () {
		  	  $('#id').focus()
		  	})
	</script>  
 </body>
</html>
