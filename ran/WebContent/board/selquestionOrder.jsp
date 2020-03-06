
<%@page import="board.boardDAO"%>
<%@page import="java.util.List"%>
<%@page import="board.boardBean"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

%>

<html lang="order">
<!-- Basic -->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>Freshshop-order</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="../images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="../css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="../css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="../css/custom.css">

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/jsp5shiv/3.7.0/jsp5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  
<%
	boardDAO boardDAO = new boardDAO();
	int count = boardDAO.getBoardCount();
	int pageSize = 100;
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize;

	String sel_qorder = request.getParameter("sel_qorder");
	String qorder = request.getParameter("qorder");
	List<boardBean> list = boardDAO.selqOrder(startRow,pageSize,sel_qorder,qorder);
 

%>

<body>

	<!-- Start Main Top -->
	<header class="main-header">
		<!-- Start Navigation -->
		<nav
			class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
			<div class="container">
				<!-- Start Header Navigation -->
                	<jsp:include page="../repeat/header.jsp" />
                <!-- End Header Navigation -->

				<!-- Collect the nav links, forms, and other content for toggling -->
                	<div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item"><a class="nav-link" href="../index.jsp">메인화면</a></li>
                        <li class="nav-item"><a class="nav-link" href="../member/my-account.jsp">내 정보</a></li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">쇼핑하기</a>
                            <ul class="dropdown-menu">
								<li><a href="../shop/shop.jsp">쇼핑</a></li>
                                <li><a href="../shop/cart.jsp">장바구니</a></li>
                            </ul>
                        </li>
                        <li class="nav-item active"><a class="nav-link" href="../board/questionOrder.jsp">고객센터</a></li>	
                        <li class="nav-item"><a class="nav-link" href="../member/login.jsp">로그인</a></li>  
                    </ul>
                </div>
                <!-- /.navbar-collapse -->

				<!-- Start Atribute Navigation -->
				<div class="attr-nav">
					<ul>
						<li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
						<li class="side-menu"><a href="../shop/cart.jsp"> <i
								class="fa fa-shopping-bag"></i>
								<p>장바구니</p>
						</a></li>
					</ul>
				</div>
				<!-- End Atribute Navigation -->
			</div>
			
		</nav>
		<!-- End Navigation -->
	</header>
	<!-- End Main Top -->
		
	<!-- Start Top Search -->
	<div class="top-search">
		<div class="container">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-search"></i></span>
				<input type="text" class="form-control" placeholder="Search">
				<span class="input-group-addon close-search"><i
					class="fa fa-times"></i></span>
			</div>
		</div>
	</div>
	<!-- End Top Search -->

	<!-- Start All Title Box -->
	<div class="all-title-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h2>고객센터</h2>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">메인화면</a></li>
						<li class="breadcrumb-item active">고객센터</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End All Title Box -->
	
		<!-- 왼쪽메뉴 -->
		<nav id="left_menu">
			<ul>
				<li><a href="questionOrder.jsp">주문 관련 문의</a></li>
				<li><a href="#">배송 문의</a></li>
				<li><a href="#">제품 관련 문의</a></li>
			</ul>
		</nav>
		<!-- 왼쪽메뉴 -->
		<!-- Start 게시판 구현 -->

		
			<article id="right_menu">
				<h1>전체 글 개수: <%=count %></h1>
<%
				String id = (String) session.getAttribute("id");
				if (id != null) {
%>
				<input type="button" value="글쓰기" class="btn hvr-hover" id="wr" onclick="location.href='writeOrder.jsp'">
			
<%
				}
%>
				<table>
					<tr>
						<th>글 번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
<%
				if(count > 0){
					for(int i=0;i<list.size();i++){
					 boardBean bean = list.get(i);
%>
				<tr onclick="location.href='contentOrder.jsp?no=<%=bean.getNo()%>&pageNum=<%=pageNum%>'">
					<td><%=bean.getNo()%></td>
					<td><%=bean.getTitle()%></td>
					<td><%=bean.getWriter()%></td>
					<td><%=bean.getDate()%></td>
					<td><%=bean.getReadcount()%></td>
				</tr>	
<%		 
					}
				 }else{
%>
				<tr>
					<td colspan="5">게시판 글 없음</td>
				</tr>
<%		
				}
%>

				</table>
				<div id="write">

			
				<form action="selquestionOrder.jsp" method="post">
				
					<select name="sel_qorder" id="sel_qorder">
						<option value="title" selected="selected">제목</option>
						<option value="writer">글쓴이</option>
						<option value="content">내용</option>
					</select>
				
					
				
						<input type="text" name="qorder" id="qorder"> 
				
				<button type="submit" class="btn hvr-hover">검색</button>

				</form>
			</div>
		<div id="page">
<%
				if(count>0){
					int pageCount = count / pageSize + (count % pageSize == 0? 0 : 1);
					int pageBlock = 2;
					int startPage = ((currentPage/pageBlock)-(currentPage%pageBlock==0?1:0))*pageBlock +1;
					int endPage = startPage + pageBlock -1;
					if(endPage > pageCount){
						endPage = pageCount;
					}
				}
%>
				
				
			</div>		
				
	</article>
		<!-- End 게시판 구현 -->
	
	<!-- Start Instagram Feed  -->
	<div class="instagram-box">
		<div class="main-instagram owl-carousel owl-theme">
			<div class="item">
				<div class="ins-inner-box">
					<img src="../images/instagram-img-01.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="../images/instagram-img-02.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="../images/instagram-img-03.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="../images/instagram-img-04.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="../images/instagram-img-05.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="../images/instagram-img-06.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="../images/instagram-img-07.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="../images/instagram-img-08.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="../images/instagram-img-09.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="../images/instagram-img-05.jpg" alt="" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Instagram Feed  -->


	<!-- Start Footer  -->
		<jsp:include page="../repeat/footer.jsp"/>
	<!-- End Footer  -->

	<!-- Start copyright  -->
	<div class="footer-copyright">
		<p class="footer-company">
			All Rights Reserved. &copy; 2018 <a href="#">ThewayShop</a> Design By
			: <a href="https://jsp.design/">jsp design</a>
		</p>
	</div>
	<!-- End copyright  -->

	<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

	<!-- ALL JS FILES -->
	<script src="../js/jquery-3.2.1.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->
	<script src="../js/jquery.superslides.min.js"></script>
	<script src="../js/bootstrap-select.js"></script>
	<script src="../js/inewsticker.js"></script>
	<script src="../js/bootsnav.js."></script>
	<script src="../js/images-loded.min.js"></script>
	<script src="../js/isotope.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/baguetteBox.min.js"></script>
	<script src="../js/form-validator.min.js"></script>
	<script src="../js/contact-form-script.js"></script>
	<script src="../js/custom.js"></script>
</body>

</html>

