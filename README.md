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
  - URL 유효성 체크와 이미지, 제목 파싱이 끝난 컨텐츠는 DB에 저장합니다.
  - 저장된 컨텐츠는 다시 Repository - Service - Controller를 거쳐 화면단에 송출됩니다.

- **Ajax를 이용하여 이메일 수신 비율 차트** :pushpin: [코드 확인](https://github.com/1000MARIN/porscheMania/blob/master/src/main/webapp/chart/pieChartEmailAjax.jsp#L128)
  - URL 유효성 체크와 이미지, 제목 파싱이 끝난 컨텐츠는 DB에 저장합니다.
  - 저장된 컨텐츠는 다시 Repository - Service - Controller를 거쳐 화면단에 송출됩니다.
  
- **단체 메일 발송하기** :pushpin: [코드 확인](https://github.com/1000MARIN/porscheMania/blob/master/src/main/java/com/example/email/MultiPartEmailServlet.java#L23)
  - URL 유효성 체크와 이미지, 제목 파싱이 끝난 컨텐츠는 DB에 저장합니다.
  - 저장된 컨텐츠는 다시 Repository - Service - Controller를 거쳐 화면단에 송출됩니다.

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
