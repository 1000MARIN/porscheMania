<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<jsp:include page="/include/head.jsp" />
<style>
body {
	background-color: white;
}
</style>
</head>

<body>

	<!-- Navbar area -->
	<jsp:include page="/include/top.jsp" />
	<!-- end of Navbar area -->


	<!-- Page Layout here -->
	<div class="container">

		<div class="col s12 m8 l9">
			<!-- page content  -->
			<div class="section">

				<!-- card panel -->
				<div class="card-panel">
					<div class="row">
						<div class="col s12" style="padding: 3% 2%;">

							<h3 class="text-muted">단체 메일발송</h3>
							<hr>
							<br>



							<form action="/pmania/email/multipart-mail" method="post"
								enctype="multipart/form-data">

								<div class="row">
									<div class="form-group">
										<label for="title" class="form-label text-muted mt-4">받는
											사람</label> <input type="text" name="receiver" class="form-control"
											placeholder="여러명 입력시 aa@a.com, bb@b.com, ...">
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<label for="textarea1" class="form-label text-muted mt-4">메일
											제목</label> <input type="text" name="subject" class="form-control">

									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<label for="textarea1" class="form-label text-muted mt-4">메일
											내용</label>
										<textarea rows="16" cols="40" name="msg" class="form-control"></textarea>

									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<label for="textarea1" class="form-label text-muted mt-4">첨부
											파일</label> <input type="file" name="file">

									</div>
								</div>
								<br>
								<hr>

								<div class="d-flex justify-content-center">
									<button class="btn btn-sm btn-outline-warning" type="submit">
										<i class="fas fa-pen me-sm-2"></i>메일 보내기
									</button>
									&nbsp;&nbsp;
									<button class="btn btn-sm btn-outline-danger" type="reset">
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
	<jsp:include page="/include/bottom.jsp" />
	<!-- end of footer area -->
</body>
</html>






