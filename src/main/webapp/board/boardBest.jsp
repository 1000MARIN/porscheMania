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
    td {
    	cursor: pointer;
    }
    
   
	 
	 .pagination,
	.jsgrid .jsgrid-pager {
	    display: flex;
	    padding-left: 0;
	    list-style: none;
	    border-radius: 0.25rem
	}
	
	.page-link {
	    color: black
	}
	
	.pagination.pagination-rounded-flat .page-item {
	    margin: 0 .25rem
	}
	
	.pagination-rounded-flat {}
	
	.pagination-success .page-item.active .page-link
	 {
	    background: #f0ad4e;
	    border-color: #00c689
	}
	
	.pagination.pagination-rounded-flat .page-item .page-link
	 {
	    border: none;
	    border-radius: 50px
	}
	 
  </style>
</head>

<body>

  <!-- Navbar area -->
  <jsp:include page="/include/top.jsp" />
  <!-- end of Navbar area -->


  <!-- Page Layout here -->
  <div class="container">

	<!-- left menu area -->
<%-- 	<jsp:include page="/include/left.jsp" /> --%>
    <!-- end of left menu area -->
    

    <div class="col s12 m8 l9">
      <!-- page content  -->
      <div class="section">

        <div class="card-panel">
          <div class="row">
            <div class="col s12" style="padding: 3% 2%;">
              
              <h3 class="text-muted">인기 게시판</h3>
              <hr>
              <br>
              
              <div class="divider" style="margin: 30px 0;"></div>

			  

              <table class="table table-hover table-sm">
				  <thead>
				    <tr>
				      <th scope="col" class="col-md-1 text-center">번호</th>
				      <th scope="col" class="col-md-5 text-center">제목</th>
				      <th scope="col" class="col-md-1 text-center">작성자</th>
				      <th scope="col" class="col-md-1 text-center">작성일</th>
				      <th scope="col" class="col-md-1 text-center">조회</th>
				      <th scope="col" class="col-md-1 text-center">추천</th>
				      
				    </tr>
				  </thead>
				  <tbody>
				    
				    <tr class="table-light ">
				      <th scope="col" class="col-md-1 text-center">1</th>
				      <td class="text-left">제목 테스트</td>
				      <td class="col-md-1 text-center">admin</td>
				      <td class="col-md-1 text-center">2021.09.19</td>
				      <th scope="row" class="col-md-1 text-center">54</th>
				      <th scope="row" class="col-md-1 text-center">33</th>
				    </tr>
				    <tr class="table-light">
				      <th scope="col" class="col-md-1 text-center">1</th>
				      <td class="text-left">제목 테스트</td>
				      <td class="col-md-1 text-center">admin</td>
				      <td class="col-md-1 text-center">2021.09.19</td>
				      <th scope="row" class="col-md-1 text-center">54</th>
				      <th scope="row" class="col-md-1 text-center">33</th>
				    </tr><tr class="table-light ">
				      <th scope="col" class="col-md-1 text-center">1</th>
				      <td class="text-left">제목 테스트</td>
				      <td class="col-md-1 text-center">admin</td>
				      <td class="col-md-1 text-center">2021.09.19</td>
				      <th scope="row" class="col-md-1 text-center">54</th>
				      <th scope="row" class="col-md-1 text-center">33</th>
				    </tr><tr class="table-light ">
				      <th scope="col" class="col-md-1 text-center">1</th>
				      <td class="text-left">제목 테스트</td>
				      <td class="col-md-1 text-center">admin</td>
				      <td class="col-md-1 text-center">2021.09.19</td>
				      <th scope="row" class="col-md-1 text-center">54</th>
				      <th scope="row" class="col-md-1 text-center">33</th>
				    </tr><tr class="table-light ">
				      <th scope="col" class="col-md-1 text-center">1</th>
				      <td class="text-left">제목 테스트</td>
				      <td class="col-md-1 text-center">admin</td>
				      <td class="col-md-1 text-center">2021.09.19</td>
				      <th scope="row" class="col-md-1 text-center">54</th>
				      <th scope="row" class="col-md-1 text-center">33</th>
				    </tr><tr class="table-light ">
				      <th scope="col" class="col-md-1 text-center">1</th>
				      <td class="text-left">제목 테스트</td>
				      <td class="col-md-1 text-center">admin</td>
				      <td class="col-md-1 text-center">2021.09.19</td>
				      <th scope="row" class="col-md-1 text-center">54</th>
				      <th scope="row" class="col-md-1 text-center">33</th>
				    </tr><tr class="table-light ">
				      <th scope="col" class="col-md-1 text-center">1</th>
				      <td class="text-left">제목 테스트</td>
				      <td class="col-md-1 text-center">admin</td>
				      <td class="col-md-1 text-center">2021.09.19</td>
				      <th scope="row" class="col-md-1 text-center">54</th>
				      <th scope="row" class="col-md-1 text-center">33</th>
				    </tr><tr class="table-light ">
				      <th scope="col" class="col-md-1 text-center">1</th>
				      <td class="text-left">제목 테스트</td>
				      <td class="col-md-1 text-center">admin</td>
				      <td class="col-md-1 text-center">2021.09.19</td>
				      <th scope="row" class="col-md-1 text-center">54</th>
				      <th scope="row" class="col-md-1 text-center">33</th>
				    </tr><tr class="table-light ">
				      <th scope="col" class="col-md-1 text-center">1</th>
				      <td class="text-left">제목 테스트</td>
				      <td class="col-md-1 text-center">admin</td>
				      <td class="col-md-1 text-center">2021.09.19</td>
				      <th scope="row" class="col-md-1 text-center">54</th>
				      <th scope="row" class="col-md-1 text-center">33</th>
				    </tr><tr class="table-light ">
				      <th scope="col" class="col-md-1 text-center">1</th>
				      <td class="text-left">제목 테스트</td>
				      <td class="col-md-1 text-center">admin</td>
				      <td class="col-md-1 text-center">2021.09.19</td>
				      <th scope="row" class="col-md-1 text-center">54</th>
				      <th scope="row" class="col-md-1 text-center">33</th>
				    </tr><tr class="table-light ">
				      <th scope="col" class="col-md-1 text-center">1</th>
				      <td class="text-left">제목 테스트</td>
				      <td class="col-md-1 text-center">admin</td>
				      <td class="col-md-1 text-center">2021.09.19</td>
				      <th scope="row" class="col-md-1 text-center">54</th>
				      <th scope="row" class="col-md-1 text-center">33</th>
				    </tr><tr class="table-light ">
				      <th scope="col" class="col-md-1 text-center">1</th>
				      <td class="text-left">제목 테스트</td>
				      <td class="col-md-1 text-center">admin</td>
				      <td class="col-md-1 text-center">2021.09.19</td>
				      <th scope="row" class="col-md-1 text-center">54</th>
				      <th scope="row" class="col-md-1 text-center">33</th>
				    </tr><tr class="table-light ">
				      <th scope="col" class="col-md-1 text-center">1</th>
				      <td class="text-left">제목 테스트</td>
				      <td class="col-md-1 text-center">admin</td>
				      <td class="col-md-1 text-center">2021.09.19</td>
				      <th scope="row" class="col-md-1 text-center">54</th>
				      <th scope="row" class="col-md-1 text-center">33</th>
				    </tr><tr class="table-light ">
				      <th scope="col" class="col-md-1 text-center">1</th>
				      <td class="text-left">제목 테스트</td>
				      <td class="col-md-1 text-center">admin</td>
				      <td class="col-md-1 text-center">2021.09.19</td>
				      <th scope="row" class="col-md-1 text-center">54</th>
				      <th scope="row" class="col-md-1 text-center">33</th>
				    </tr>
				    <tr class="table-light ">
				      <th scope="col" class="col-md-1 text-center">1</th>
				      <td class="text-left">제목 테스트</td>
				      <td class="col-md-1 text-center">admin</td>
				      <td class="col-md-1 text-center">2021.09.19</td>
				      <th scope="row" class="col-md-1 text-center">54</th>
				      <th scope="row" class="col-md-1 text-center">33</th>
				    </tr>
				    <tr class="table-light ">
				      <th scope="col" class="col-md-1 text-center">1</th>
				      <td class="text-left">제목 테스트</td>
				      <td class="col-md-1 text-center">admin</td>
				      <td class="col-md-1 text-center">2021.09.19</td>
				      <th scope="row" class="col-md-1 text-center">54</th>
				      <th scope="row" class="col-md-1 text-center">33</th>
				    </tr>
				    <tr class="table-light ">
				      <th scope="col" class="col-md-1 text-center">1</th>
				      <td class="text-left">제목 테스트</td>
				      <td class="col-md-1 text-center">admin</td>
				      <td class="col-md-1 text-center">2021.09.19</td>
				      <th scope="row" class="col-md-1 text-center">54</th>
				      <th scope="row" class="col-md-1 text-center">33</th>
				    </tr>
				    
				    
				    
				   
				  </tbody>
				</table>

              <br>
              <ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">
                  <li class="page-item"><a class="page-link" href="#" data-abc="true"><i class="fa fa-angle-left"></i></a></li>
                  <li class="page-item active"><a class="page-link" href="#" data-abc="true">1</a></li>
                  <li class="page-item"><a class="page-link" href="#" data-abc="true">2</a></li>
                  <li class="page-item"><a class="page-link" href="#" data-abc="true">3</a></li>
                  <li class="page-item"><a class="page-link" href="#" data-abc="true">4</a></li>
                  <li class="page-item"><a class="page-link" href="#" data-abc="true">5</a></li>
                  <li class="page-item"><a class="page-link" href="#" data-abc="true"><i class="fa fa-angle-right"></i></a></li>
              </ul>
              
			  <hr>
			  
              <div class="divider" style="margin: 30px 0;"></div>
              <form action="" method="GET">
                <div class="container">
                	<div  class="d-flex justify-content-center">
                    <div class="form-group me-sm-2">
                      <select class="form-select" name="type">
                        <option value="T">제목</option>
                        <option value="C">내용</option>
                        <option value="W">작성자</option>
                      </select>
                    </div>

                  <div class="">
                    <!-- AutoComplete -->
                    <div class="d-flex">
                      <input type="text" id="autocomplete-input" class="form-control me-sm-2 autocomplete" name="keyword" placeholder="검색어를 입력하세요.">
	                    <button class="btn btn-outline-warning my-2 my-sm-0 rounded-pill" type="submit">
				        <i class="fas fa-search"></i>
				        </button>
	                    </div>
                    <!-- end of AutoComplete -->
                  </div>
                  
                  
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

</body>

</html>


