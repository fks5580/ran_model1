<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

%>


<script type="text/javascript">

	function fileUpload(){
		var upFile = document.getElementById("upload").value;
		var reg = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/;
		if(!upFile){
			alert("첨부 할 파일을 선택 해 주세요.");
		}else{
		  	if(upFile.match(reg)) {
		  		var open = window.open('about:blank','upload','width=500, height=400');
				var frm = document.getElementById("fileUploadForm");
				frm.action = 'writeProductImg.jsp';
				frm.target ="upload";
				frm.method ="post";
				frm.submit();
			} else {
				alert("해당 파일은 이미지 파일이 아닙니다.");
				return false;
			}	
		}
	}
	
	function checkForm(){
		
		var upFile = document.getElementById("upload").value;
		if($("#product_name").val()==""){
	 		alert("상품이름을 입력해주세요.");
	 		$("#product_name").focus();
	 		return false;
	 	}else if($("#product_price").val()==""){
	 		alert("상품가격을 입력해주세요.");
	 		$("#product_price").focus();
	 		return false;
	 	}else if($("#product_count").val()==""){
	 		alert("상품개수를 입력해주세요.");
	 		$("#product_count").focus();
	 		return false;
	 	}
	 	else if(upFile == ""){
	 		alert("이미지를 등록하지 않으셨습니다.");
	 		return false;
	 	} else if(upFile != ""){
	 		if(!document.getElementById("check_img").innerHTML){
	 			alert("이미지 등록 버튼을 눌러주십시오.");
	 			document.getElementById("uploadBtn").focus();
	 			return false;
	 		}	
	 	}else {
			return;
	 	}
		
	 }

</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="review">
<!-- Basic -->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>Freshshop - 후기 작성</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">

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
 <%
    String id = (String)session.getAttribute("id");
 	if(!id.equals("admin")){
%>
	<script type="text/javascript">
		alert("관리자로 로그인 해주세요");
		location.href="../member/login.jsp";
	</script>
<%
 		
 	}
 %>
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
                        <li class="nav-item"><a class="nav-link" href="index.jsp">메인화면</a></li>
                        <li class="nav-item"><a class="nav-link" href="my-account.jsp">내 정보</a></li>
                        <li class="dropdown active">
                            <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">쇼핑하기</a>
                            <ul class="dropdown-menu">
								<li><a href="shop.jsp">쇼핑</a></li>
                                <li><a href="../cart.jsp">장바구니</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="../board/questionOrder.jsp">고객센터</a></li>	
                        <li class="nav-item"><a class="nav-link" href="login.jsp">로그인</a></li>  
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
			<!-- Start Side Menu -->
			<div class="side">
				<a href="#" class="close-side"><i class="fa fa-times"></i></a>
				<li class="cart-box">
					<ul class="cart-list">
						<li><a href="#" class="photo"><img
								src="../images/img-pro-01.jpg" class="cart-thumb" alt="" /></a>
							<h6>
								<a href="#">Delica omtantur </a>
							</h6>
							<p>
								1x - <span class="price">$80.00</span>
							</p></li>
						<li><a href="#" class="photo"><img
								src="../images/img-pro-02.jpg" class="cart-thumb" alt="" /></a>
							<h6>
								<a href="#">Omnes ocurreret</a>
							</h6>
							<p>
								1x - <span class="price">$60.00</span>
							</p></li>
						<li><a href="#" class="photo"><img
								src="../images/img-pro-03.jpg" class="cart-thumb" alt="" /></a>
							<h6>
								<a href="#">Agam facilisis</a>
							</h6>
							<p>
								1x - <span class="price">$40.00</span>
							</p></li>
						<li class="total"><a href="#"
							class="btn btn-default hvr-hover btn-cart">VIEW CART</a> <span
							class="float-right"><strong>Total</strong>: $180.00</span></li>
					</ul>
				</li>
			</div>
			<!-- End Side Menu -->
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
					<h2>상품등록</h2>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">메인화면</a></li>
						<li class="breadcrumb-item active">상품등록</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End All Title Box -->

	<!-- Start 게시글 입력 -->
	<form action="" method="post" enctype="multipart/form-data" id="fileUploadForm">
     	<div>			
			<span>첨부파일 : </span><input type="file" name="upload" id="upload">
           	<input type="button" class="btn" id="uploadBtn" value="업로드" onclick="fileUpload()">
     	</div>
	</form>
	
	<form action="addProductPro.jsp" method="post" id="productForm" onsubmit="return checkForm();">
			<h1>상품 등록</h1>
		<div>
            	상품이름* : <input type="text" id="product_name" name="product_name"><br>
            	상품가격* : <input type="text" id="product_price" name="product_price">
            	상품개수* : <input type="text" id="product_count" name="product_count">
            
        </div>
          
       		<input type="hidden" class="product_photo" id="product_photo">
       		<input type="hidden" id="img" name="img">
		<div class="form-control my-3" id="img">
			<span id="check_img" name="check_img"></span>
		</div>	
		<input type="submit" class="btn" value ="등록">
        <input type="button" class="btn" onclick="location.href='shop.jsp'" value ="목록으로">
    </form>
	<!-- End 게시글 입력 -->
	
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

