# :pushpin: [PorscheMania](https://bit.ly/3ojWVxz)
>![main](https://user-images.githubusercontent.com/84886987/135220247-5b59b92d-e0cd-4244-878a-cd00d29524a2.png)
>취미 커뮤니티 게시판  

</br>

## 1. 제작 기간 & 참여 인원
- 2021년 8월 10일 ~ 9월 17일
- 개인 프로젝트


## 2. 사용 기술
#### `Back-end`
  - Java 8
  - JSP
  - Junit
  - AWS

#### `Front-end`
  - Bootstrap
  - jQuery

## 3. 유스케이스 다이어그램
![유스](https://user-images.githubusercontent.com/84886987/135211122-49c3e615-1f68-49a8-8707-5425bdd5c994.png)

</br>

## 4. ERD 설계
![ERD](https://user-images.githubusercontent.com/84886987/135211132-3e41da6e-2bd2-4798-b783-b585cbdd51aa.png)

</br>

## 5. 핵심 기능
JSP를 활용하여 사용되는 서버 프로그램 중에서 
데이터를 INSERT, SELECT, UPDATE, DELETE할 수 있는 
게시판 웹 서버 프로그램을 주제로 하여 만들어 보았습니다. 

<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 5.1. DB 연결

- :pushpin: [코드 확인](https://github.com/1000MARIN/porscheMania/blob/master/src/main/java/com/example/repository/JdbcUtils.java#L12)
  - Eclipse project에 JDBC 라이브러리 추가하였습니다.
  - MySQL JDBC Driver 등록 하였습니다.

### 5.2. Service


- **가입시 아이디 중복 확인** :pushpin: [코드 확인](https://github.com/1000MARIN/porscheMania/blob/master/src/main/webapp/member/joinIdDupChk.jsp#L33) :pushpin: [코드 확인](https://github.com/1000MARIN/porscheMania/blob/master/src/main/java/com/example/repository/MemberDAO.java#L163)
  - 아이디 조건으로 카운트합니다.
  - 아이디가 있으면 count가 1 없으면 0으로 조회합니다.

- **다중 파일 첨부** :pushpin: [코드 확인](https://github.com/1000MARIN/porscheMania/blob/master/src/main/webapp/board/boardWritePro.jsp#L71)
  - MultipartRequest 를 사용하기 위해서는 com.oreilly.servlet 패키지를 import 해야 합니다.   
  - MultipartRequest 는 객체를 생성하자 마자 파일을 업로드 합니다.
  
- **채팅** :pushpin: [코드 확인](https://github.com/1000MARIN/porscheMania/blob/master/src/main/webapp/websocket/simpleChat.jsp#L98)
  - 서버측 자바 소스에서 @ServerEndpoint 부분이 클라이언트에서 접속할 서버 주소입니다.
  - @OnMessage는 클라이언트로부터 메시지가 도착했을 경우 처리 방법입니다.
  - @OnOpen과 @onClose는 클라이언트가 접속을 할 때와 접속이 끊어졌을떄의 처리입니다.

### 5.3. 관리자 모드

- **Json를 이용하여 이메일 수신 비율 차트** :pushpin: [코드 확인](https://github.com/1000MARIN/porscheMania/blob/master/src/main/webapp/chart/pieChartEmail.jsp#L25)
  - 서버에서 제공하는 데이터를 받아 옵니다.
  - JSON 파일을 읽어서 배열로 저장하여 처리합니다.
  

- **Ajax를 이용하여 이메일 수신 비율 차트** :pushpin: [코드 확인](https://github.com/1000MARIN/porscheMania/blob/master/src/main/webapp/chart/pieChartEmailAjax.jsp#L128)
  - 방대한 데이터를 가져오는것에 Ajax로 가져오는것이 안정적이고 속도가 빠릅니다.

<details>
<summary><b>이메일 수신 비율 차트 서버 코드</b></summary>
<div markdown="1">

  ```java
  @WebServlet(urlPatterns = "/api/chart/*")
public class ChartRestServlet extends HttpServlet {

	private static final String BASE_URI = "/api/chart";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		System.out.println("requestURI : " + requestURI);

		String str = requestURI.substring(BASE_URI.length());
		str = str.substring(1); // 맨 앞에 슬래시(/) 제거
		System.out.println("str = " + str);

		if (str.equals("gender-per-count")) {
			printGenderPerCount(request, response);
		}

	} // doGet


	private void printGenderPerCount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// http://localhost:8090/api/chart/gender-per-count

		MemberDAO memberDAO = MemberDAO.getInstance();

		List<Map<String, Object>> list = memberDAO.getGenderPerCount();


		List<String> labelList = new ArrayList<>(); // 레이블을 담을 리스트 준비
		List<Integer> dataList = new ArrayList<>(); // 데이터를 담을 리스트 준비

		for (Map<String, Object> map : list) {

			labelList.add((String) map.get("recv_email"));
			dataList.add((Integer) map.get("cnt"));
		} // for

		// Gson 객체 준비
		Gson gson = new Gson();

		Map<String, Object> map = new HashMap<>(); // { labelList: ['남성','여성'], dataList: [2,1] }
		map.put("labelList", labelList);
		map.put("dataList", dataList);

		String strJson = gson.toJson(map);
		System.out.println("strJson : " + strJson);

		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(strJson);
		out.flush();
	} // printGenderPerCount
}
  ```

</div>
</details>
	
<br>
	
- **단체 메일 발송하기** :pushpin: [코드 확인](https://github.com/1000MARIN/porscheMania/blob/master/src/main/java/com/example/email/MultiPartEmailServlet.java#L23)
  - Jakarta Commons Email API는 이메일 발송을 쉽게 처리하기 위한 클래스를 이용합니다.
  - 파일을 첨부하기 위해서는 org.apache.commons.mail.EmailAttachment 클래스와 org.apache.commons.mail.MultiPartEmail 이메일을 사용합니다.

<details>
<summary><b>단체 메일 발송 서버 코드</b></summary>
<div markdown="1">

  ```java
  @WebServlet("/email/multipart-mail")
public class MultiPartEmailServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uploadFolder = "C:/LCJ/upload"; // 업로드 기준경로

		File uploadPath = new File(uploadFolder, getFolder()); // "C:/LCJ/upload/2021/08/03"
		System.out.println("uploadPath : " + uploadPath.getPath());

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		// MultipartRequest 인자값
		// 1. request
		// 2. 업로드할 물리적 경로.  "C:/LCJ/upload"
		// 3. 업로드 최대크기 바이트 단위로 제한. 1024Byte * 1024Byte = 1MB 
		// 4. request의 텍스트 데이터, 파일명 인코딩 "utf-8"
		// 5. 파일명 변경 정책. 파일명 중복시 이름변경규칙 가진 객체를 전달

		// 파일 업로드하기
		MultipartRequest multi = new MultipartRequest(
				request
				, uploadPath.getPath()
				, 1024 * 1024 * 50
				, "utf-8"
				, new DefaultFileRenamePolicy());
		// ===== 파일 업로드 완료됨. =====
		
		
		// 요청 파라미터 값 가져오기
		String receiver = multi.getParameter("receiver"); // "aa@a.com, bb@b.com, ..."
		String[] receivers = receiver.split(","); // 받는사람 배열타입(여러명일수 있음)
		
		String subject = multi.getParameter("subject"); // 메일 제목
		String msg = multi.getParameter("msg"); // 메일 내용
		String filename = multi.getFilesystemName("file"); // 업로드된 파일명


		// MultiPartEmail 클래스 : 텍스트 메시지와 파일을 함께 전송 용도
		// EmailAttachment 클래스 : 첨부파일 정보 표현
		
		long beginTime = System.currentTimeMillis(); // 시작시간
		
		// 첨부파일 EmailAttachment 객체 생성
		EmailAttachment attach = new EmailAttachment();
		// 경로상에 한글이 있으면 에러가 발생하므로 유의
		attach.setPath(uploadPath.getPath() + "/" + filename);
		attach.setDescription("파일 설명글");
		attach.setName("");
		
		
		// MultiPartEmail 객체 생성
		MultiPartEmail email = new MultiPartEmail();
		
		// SMTP 서버 연결설정
		email.setHostName("smtp.gmail.com");
		email.setSmtpPort(465); // 기본포트  465(SSL)  587(TLS)
		email.setAuthentication("springjava0506", "spring0506");
		
		// SMTP  SSL, TLS 활성화 설정
		email.setSSLOnConnect(true);
		email.setStartTLSEnabled(true);
		
		String message = "fail";
		
		try {
			// 보내는 사람 설정. 제약사항: 보내는사람은 로그인한 아이디와 동일한 계정이 되어야 함.
			email.setFrom("springjava0506@gmail.com", "관리자", "utf-8");
			
			// 받는사람 설정
//			email.addTo("example@example.com", "이철진", "utf-8");

			for (String emailAddr : receivers) {
				email.addTo(emailAddr.trim());
			} // for
			
			// 받는사람(참조인) 설정
			//email.addCc("example@example.com", "이철진", "utf-8");
			
			// 받는사람(숨은참조인) 설정
			//email.addBcc("example@example.com", "이철진", "utf-8");
			
			
			// 제목 설정
			email.setSubject(subject);
			// 본문 설정
			email.setMsg(msg);
			
			// 첨부파일 정보 추가
			email.attach(attach);
			
			// 메일 전송
			message = email.send();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		long endTime = System.currentTimeMillis(); // 종료시간
		
		long execTime = endTime - beginTime;
		System.out.println("execTime : " + execTime);
		
		System.out.println("message : " + message);
		
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		StringBuilder sb = new StringBuilder();
		sb.append("<script>");
		sb.append("    alert('메일 전송 성공! 전송시간: " + execTime + "ms message : " + message + "');");
		sb.append("    location.href = '/email/multiPartEmail.jsp';");
		sb.append("</script>");
		
		out.print(sb.toString());
		out.flush();
	} // doPost
	
	
	
	
	// 년/월/일 폴더명 생성하는 메소드
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); // "yyyy-MM-dd"
		Date date = new Date();
		String str = sdf.format(date);
		//str = str.replace("-", File.separator);
		return str;
	} // getFolder
	
}
  ```

</div>
</details>

	
</div>
</details>
	
</br>

## 6. 핵심 트러블 슈팅
### 6.1. AWS 배포 후 게시판 글쓰기가 안되는 문제
- 집에서 localhost 서버에 올렸을 때에는 프로그램에 문제가 없었지만, AWS서버에 배포 후 게시판 글쓰기가 되지 않았습니다.

- 글쓰기에서 첨부파일 기능이 있었는데 uplode 위치가 C:/ 로 되어 있는게 원인이 있습니다.

- :pushpin: [코드 확인](https://github.com/1000MARIN/porscheMania/blob/master/src/main/webapp/board/boardWritePro.jsp#L53)
	
### 6.2. 회원 가입시 주소 입력 값 받아오기
- 우리가 사용하는 웹 사이트처럼 회원 가입시에 주소 입력을 받을 수 있는 외부 API를 이용하여 주소 값을 받아 오게 하는 것을 구현 하였습니다.

- 하지만 데이터에는 'null' 값으로만 받아 와서 무엇이 문제인지 코드를 계속보다가 input태그의 name속성을 입력을 비워둔게 원인이었습니다. 


<details>
<summary><b>코드</b></summary>
<div markdown="1">

~~~java
<div class="input-field">
	<input type="button" class="btn btn-outline-warning btn-sm mb-1" onclick="execDaumPostcode()" value="우편번호 찾기">
	<input type="text" id="postcode" name="postcode" class="form-control mb-2" placeholder="우편번호" readonly>
	<input type="text" id="address" name="address"  class="form-control mb-2" placeholder="주소" readonly>
	<input type="text" id="detailAddress" name="detailAddress"  class="form-control mb-2" placeholder="상세주소">
	<input type="text" id="extraAddress" name="extraAddress"  class="form-control mb-2" placeholder="참고주소" readonly>
	<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
	<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
	<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" 				onclick="foldDaumPostcode()" alt="접기 버튼">
	</div>
</div>
~~~

</div>
</details>

</br>

## 7. 회고 / 느낀점
> 간단한 웹 프로그램을 만들더라도 아직 시간이 많이 걸리고 작은 버그들이 조금씩 있어서 완성도가 제 기준에 못 미치는 것 같습니다. 
현재 본 프로그램에서 구상하고 있는 기능들은 더 있지만 기존 기능들을 더 익숙하게 만들어 추후 다른 프로그램을 만들 때에는 조금이나마 발전할 수 있도록 계속 배우고 노력 하겠습니다. 
