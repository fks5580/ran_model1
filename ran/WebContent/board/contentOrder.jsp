
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.boardBean"%>
<%@page import="board.boardDAO"%>
<%@page import="replyboard.replyboardDAO"%>
<%@page import="replyboard.replyboardBean"%>
<%@page import="com.sun.javafx.fxml.BeanAdapter"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	int no = Integer.parseInt(request.getParameter("no"));
	String pageNum = request.getParameter("pageNum");
	String id = (String)session.getAttribute("id");
	boardDAO boardDAO = new boardDAO(); 
	boardDAO.updateReadCount(no);
	boardBean b = boardDAO.getBoard(no);
	
	replyboardDAO replyboardDAO = new replyboardDAO();
	List<replyboardBean> list = replyboardDAO.getreplyBoardList(no); 
	if(id == null){
%>
	    <script>
	    	alert("로그인시 글을 읽을 수 있습니다. 로그인 해주세요");
			location.href="../member/login.jsp";
	    </script>
<%
 	}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="order">
<!-- Basic -->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>Freshshop - 문의 내용</title>
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
				<!-- End
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
<!-- start 왼쪽메뉴 -->
		<nav id="left_menu">
			<ul>
				<li><a href="questionOrder.jsp">주문 관련 문의</a></li>
				<li><a href="#">배송 문의</a></li>
				<li><a href="#">제품 관련 문의</a></li>
			</ul>
		</nav>
		<!-- end 왼쪽메뉴 -->
	<!-- start 게시판 -->
		<article id="right_menu">
			<h1>내용</h1>
			<table id="">
				<tr>
					<td>글번호</td>
					<td><%=b.getNo()%></td>
					<td>조회수</td>
					<td><%=b.getReadcount()%></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><%=b.getWriter()%></td>
					<td>작성일</td>
					<td><%=b.getDate()%></td>
				</tr>
				<tr>
					<td >글제목</td>
					<td colspan="3"><%=b.getTitle()%></td>
				</tr>
				<tr>
					<td>글내용</td>
					<td colspan="3"><%=b.getContent()%></td>
				</tr>
			</table>
				<div id="table_search">
			<%
				if (id != null) {
					if(id.equals(b.getWriter())){
			%>
			
				<input type="button"  value="글수정" class="btn" 
				        onclick="location.href='updatewriteOrder.jsp?writer=<%=id%>&no=<%=b.getNo()%>'">
			<%	
					} 
			%>		
				<input type="button"  value="답글쓰기" class="btn" 
				        onclick="location.href='rewriteOrder.jsp?no=<%=b.getNo()%>&main_seq=<%=b.getMain_seq()%>&main_tab=<%=b.getMain_tab()%>&sub_seq=<%=b.getSub_seq()%>'">
			
			<%
				}
			%>
				<input type="button" value="목록보기" class="btn" 
				       onclick="location.href='questionOrder.jsp'">
			</div>		
		</article>
		<!-- end 게시판 -->
	<!-- start 댓글 -->
    <table id="comment">
    <tr>
    	<td colspan="2">댓글</td>
    </tr>
<%
	if(!list.isEmpty()){
		for(int i=0;i<list.size();i++){
		replyboardBean rbean = list.get(i);
					 
%>    
	   <tr>
	   		<td colspan="2"><%=rbean.getReply_date() %></td>
	   </tr>
       <tr>	
       		<td>글쓴이</td>
       		<td><%=rbean.getReply_writer()%></td>
       </tr>
       <tr>
       		<td>내용</td>
       		<td><%=rbean.getReply_content() %></td>
       </tr>
       <tr>
       		<td>
<%
       		if(id!=null && id.equals(rbean.getReply_writer())){
%>       		
       		<input type="button" class="btn" value="수정"
       			onclick="location.href='updatereplyOrder.jsp?reply_no=<%=rbean.getReply_no()%>&no=<%=rbean.getNo()%>&pageNum=<%=pageNum%>'">
       		<input type="button" class="btn" value="삭제"
       			onclick="location.href='deletereplyOrder.jsp?reply_no=<%=rbean.getReply_no()%>&no=<%=rbean.getNo()%>&pageNum=<%=pageNum%>'">
			<br><br>
<%
			} 
%>       		
       		
       		</td>
       </tr>
      
       
<%		 
		}
	}else{
%>
		<tr>
			<td>댓글 없음</td>
		</tr>
<%		
	}
%>
	</table>
	<form action="writereplyOrderPro.jsp" method="post">
	<input type="hidden" name="no" value=<%=no%>>
	<input type="hidden" name="pageNum" value=<%=pageNum %>>
    <table id="comment">   
       <tr>
       <td>
<%      
       if(id!=null){
%>            
		이름: <input type="text" id="reply_writer" name="reply_writer" value=<%=id%> readonly/>
		패스워드: <input type="password" id="reply_pw" name="reply_pw" placeholder="패스워드"/>
	    
         
       </td>
       </tr>
       <tr>
       	<td>
        	<textarea id="reply_content" name="reply_content" placeholder="댓글을 입력하세요."></textarea>
        	<input type="submit" id="reply_save" name="reply_save" class="btn" value="댓글등록">
<%
		}else{
%>	
		 	<a href="../member/login.jsp">로그인 후 작성가능</a>   
<%
		}
%>
        </td>
       </tr>
    </table>
    </form>        
       
	
	<!-- end 댓글 -->
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

