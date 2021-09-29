# :pushpin: PorscheMania
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

#### `Front-end`
  - Bootstrap
  - jQuery

## 3. 유스케이스 다이어그램
![유스](https://user-images.githubusercontent.com/84886987/135211122-49c3e615-1f68-49a8-8707-5425bdd5c994.png)

## 4. ERD 설계
![ERD](https://user-images.githubusercontent.com/84886987/135211132-3e41da6e-2bd2-4798-b783-b585cbdd51aa.png)

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
### 6.1. 컨텐츠 필터와 페이징 처리 문제
- 저는 이 서비스가 페이스북이나 인스타그램 처럼 가볍게, 자주 사용되길 바라는 마음으로 개발했습니다.  
때문에 페이징 처리도 무한 스크롤을 적용했습니다.

- 하지만 [무한스크롤, 페이징 혹은 “더보기” 버튼? 어떤 걸 써야할까](https://cyberx.tistory.com/82) 라는 글을 읽고 무한 스크롤의 단점들을 알게 되었고,  
다양한 기준(카테고리, 사용자, 등록일, 인기도)의 게시물 필터 기능을 넣어서 이를 보완하고자 했습니다.

- 그런데 게시물이 필터링 된 상태에서 무한 스크롤이 동작하면,  
필터링 된 게시물들만 DB에 요청해야 하기 때문에 아래의 **기존 코드** 처럼 각 필터별로 다른 Query를 날려야 했습니다.

<details>
<summary><b>기존 코드</b></summary>
<div markdown="1">

~~~java
/**
 * 게시물 Top10 (기준: 댓글 수 + 좋아요 수)
 * @return 인기순 상위 10개 게시물
 */
public Page<PostResponseDto> listTopTen() {

    PageRequest pageRequest = PageRequest.of(0, 10, Sort.Direction.DESC, "rankPoint", "likeCnt");
    return postRepository.findAll(pageRequest).map(PostResponseDto::new);
}

/**
 * 게시물 필터 (Tag Name)
 * @param tagName 게시물 박스에서 클릭한 태그 이름
 * @param pageable 페이징 처리를 위한 객체
 * @return 해당 태그가 포함된 게시물 목록
 */
public Page<PostResponseDto> listFilteredByTagName(String tagName, Pageable pageable) {

    return postRepository.findAllByTagName(tagName, pageable).map(PostResponseDto::new);
}

// ... 게시물 필터 (Member) 생략 

/**
 * 게시물 필터 (Date)
 * @param createdDate 게시물 박스에서 클릭한 날짜
 * @return 해당 날짜에 등록된 게시물 목록
 */
public List<PostResponseDto> listFilteredByDate(String createdDate) {

    // 등록일 00시부터 24시까지
    LocalDateTime start = LocalDateTime.of(LocalDate.parse(createdDate), LocalTime.MIN);
    LocalDateTime end = LocalDateTime.of(LocalDate.parse(createdDate), LocalTime.MAX);

    return postRepository
                    .findAllByCreatedAtBetween(start, end)
                    .stream()
                    .map(PostResponseDto::new)
                    .collect(Collectors.toList());
    }
~~~

</div>
</details>

- 이 때 카테고리(tag)로 게시물을 필터링 하는 경우,  
각 게시물은 최대 3개까지의 카테고리(tag)를 가질 수 있어 해당 카테고리를 포함하는 모든 게시물을 질의해야 했기 때문에  
- 아래 **개선된 코드**와 같이 QueryDSL을 사용하여 다소 복잡한 Query를 작성하면서도 페이징 처리를 할 수 있었습니다.

<details>
<summary><b>개선된 코드</b></summary>
<div markdown="1">

~~~java
/**
 * 게시물 필터 (Tag Name)
 */
@Override
public Page<Post> findAllByTagName(String tagName, Pageable pageable) {

    QueryResults<Post> results = queryFactory
            .selectFrom(post)
            .innerJoin(postTag)
                .on(post.idx.eq(postTag.post.idx))
            .innerJoin(tag)
                .on(tag.idx.eq(postTag.tag.idx))
            .where(tag.name.eq(tagName))
            .orderBy(post.idx.desc())
                .limit(pageable.getPageSize())
                .offset(pageable.getOffset())
            .fetchResults();

    return new PageImpl<>(results.getResults(), pageable, results.getTotal());
}
~~~

</div>
</details>

</br>

## 7. 그 외 트러블 슈팅
<details>
<summary>npm run dev 실행 오류</summary>
<div markdown="1">

- Webpack-dev-server 버전을 3.0.0으로 다운그레이드로 해결
- `$ npm install —save-dev webpack-dev-server@3.0.0`

</div>
</details>

<details>
<summary>vue-devtools 크롬익스텐션 인식 오류 문제</summary>
<div markdown="1">
  
  - main.js 파일에 `Vue.config.devtools = true` 추가로 해결
  - [https://github.com/vuejs/vue-devtools/issues/190](https://github.com/vuejs/vue-devtools/issues/190)
  
</div>
</details>
    
</br>

## 8. 회고 / 느낀점
>프로젝트 개발 회고 글: https://zuminternet.github.io/ZUM-Pilot-integer/
