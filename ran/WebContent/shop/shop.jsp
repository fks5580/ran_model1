
<%@page import="cart.cartBean"%>
<%@page import="cart.cartDAO"%>
<%@page import="product.productBean"%>
<%@page import="java.util.List"%>
<%@page import="product.productDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<!-- Basic -->
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

	productDAO productDAO = new productDAO();
	cartDAO cartDAO = new cartDAO();
	
	String id =	(String)session.getAttribute("id");
	int count =productDAO.getProductCount();
	int pageSize = 1;
	String product_pageNum = request.getParameter("product_pageNum");

	if(product_pageNum == null){
		product_pageNum = "1";
	}

	int currentPage = Integer.parseInt(product_pageNum);
	int startRow = (currentPage - 1) * pageSize;

	List<productBean> list = productDAO.getProductList(startRow, pageSize);
	cartBean cBean = cartDAO.getCart(id);
%>
<script>
									
	function seq() {
	
	$("#product_seq").change(function(){
		 var s = document.getElementById("product_seq");
		 var product_seq = s.options[s.selectedIndex].value; 
		 window.location.href = "shop.jsp?product_seq=" + product_seq;
		 
	})
	
}

	
	
</script>


<%
	int product_seq=1;

	if(request.getParameter("product_seq")!=null){
		product_seq = Integer.parseInt(request.getParameter("product_seq"));
		
	}
	if(product_seq != 1){

		list = productDAO.sequenceProduct(startRow,pageSize,product_seq);
}
	
%>


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>Freshshop - 쇼핑</title>
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

</head>

<body>
  
    <!-- Start Main Top -->
    <header class="main-header">
        <!-- Start Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">
                <!-- Start Header Navigation -->
                	<jsp:include page="../repeat/header.jsp" />
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                	<div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item"><a class="nav-link" href="../index.jsp">메인화면</a></li>
                        <li class="nav-item"><a class="nav-link" href="../member/my-account.jsp">내 정보</a></li>
                        <li class="dropdown active">
                            <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">쇼핑하기</a>
                            <ul class="dropdown-menu">
								<li><a href="shop.jsp">쇼핑</a></li>
                                <li><a href="cart.jsp">장바구니</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="../board/questionOrder.jsp">고객센터</a></li>
                        <li class="nav-item"><a class="nav-link" href="../member/login.jsp">로그인</a></li>  
                    </ul>
                </div>
                <!-- /.navbar-collapse -->

				<!-- Start Atribute Navigation -->
				<div class="attr-nav">
					<ul>
						<li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
						<li class="side-menu"><a href="cart.jsp"> 
						<i class="fa fa-shopping-bag"></i>
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
                <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
            </div>
        </div>
    </div>
    <!-- End Top Search -->

    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>쇼핑</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">메인화면</a></li>
                        <li class="breadcrumb-item active">쇼핑</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Shop  -->
  
	<article id="shop">
				<h1>전체 상품 : <%=count %></h1>
				<div>
<%
				if(id!=null && id.equals("admin")){
%>
				<input type="button" id="add" value="상품등록" class="btn hvr-hover" onclick="location.href='addProduct.jsp'">
			
<%
				}
%>
				</div> 

<div class="shop-box-inner">
        <div class="container">
            <div class="row">
                <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
                    
                    
                    <div class="right-product-box">
                        <div class="product-item-filter row">
                            <div class="col-12 col-sm-8 text-center text-sm-left">
                                <div class="toolbar-sorter-right">
                                    <span>정렬</span>
                                    <select id="product_seq" name="product_seq" class="selectpicker show-tick form-control" onchange="seq();">
                                    <%if(product_seq==1){
                                    %>
                                    	<option value="1" selected="selected">신상품순</option>
										<option value="2">높은가격순</option>
										<option value="3">낮은가격순</option>
									<%	
                                    }else if(product_seq==2){
                                    %>	
                                    	<option value="1">신상품순</option>
										<option value="2" selected="selected">높은가격순</option>
										<option value="3">낮은가격순</option>
									<%	
                                    }else{
                                    %>
                                    	<option value="1">신상품순</option>
										<option value="2">높은가격순</option>
										<option value="3" selected="selected">낮은가격순</option>
                                    <%
                                    }
                                    %>
										
									</select>
									
                                </div>
                            </div>
                        </div>

                        <div class="product-categorie-box">
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                    <div class="row">
                                        <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                        				
<%
				if(count > 0){
					for(int i=0;i<list.size();i++){
						productBean pBean = list.get(i);
%>
                                            <div class="products-single fix" id="img_product">
                                                <div class="box-img-hover">
                                                    <div class="type-lb">
                                                        <p class="new">New</p>
                                                    </div>
                                                    <img src='<%=pBean.getProduct_photo()%>' class="img-fluid" alt="Image">
                                                    <div class="mask-icon">
<%
                                                    	if(pBean.getProduct_count()!=0){
%>
                                                        <a class="cart" href="addCartPro.jsp?product_no=<%=pBean.getProduct_no()%>&product_count=<%=pBean.getProduct_count()%>&cart_no=<%=cBean.getCart_no()%>">Add to Cart</a>
<%
														} 
%>                                                       
                                                    </div>
                                                </div>
                                                <div class="why-text">
                                                    <h4><%=pBean.getProduct_name()%></h4>
                                                    <h5><%=pBean.getProduct_price()%>원</h5>
<%
                                                    	if(pBean.getProduct_count()==0){
%>
                                                    	<h5>품절</h5>
<%	    
                                                    	}else{
%>
                                                    <h5><%=pBean.getProduct_count()%>개</h5>
<%
                                                    	}
%>
                                                </div>
<%
                                                if(id!=null && id.equals("admin")){ 
%>     
                                                <input type="button" id="update" value="상품수정" class="btn hvr-hover" onclick="location.href='updateProduct.jsp?product_no=<%=pBean.getProduct_no()%>&product_name=<%=pBean.getProduct_name()%>&product_price=<%=pBean.getProduct_price()%>&product_count=<%=pBean.getProduct_count()%>&product_photo=<%=pBean.getProduct_photo()%>'">
                                            	<input type="button" id="delete" value="상품삭제" class="btn hvr-hover" onclick="location.href='deleteProduct.jsp?product_no=<%=pBean.getProduct_no()%>'">
<%
                                            	}
%>
                                            </div>
<%		 
					
					}
				 }else{
%>
				
					<div>등록된 상품 없음</div>
				
<%		
				}
%>
                                        </div>
                                     
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
				<div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                    <div class="product-categori">
                        <div class="search-product">
                            <form action="searchProduct.jsp">
                                <input class="form-control" id="search" name="search" placeholder="Search here..." type="text">
                                <button type="submit"> <i class="fa fa-search"></i> </button>
                            </form>
                        </div>
                        <div class="filter-sidebar-left">
                            <div class="title-left">
                                <h3>분류</h3>
                            </div>
                            <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
                                <div class="list-group-collapse sub-men">
                                    <a class="list-group-item list-group-item-action" href="#sub-men1" data-toggle="collapse" aria-expanded="true" aria-controls="sub-men1">과일 <small class="text-muted">(100)</small>
								</a>
                                    <div class="collapse show" id="sub-men1" data-parent="#list-group-men">
                                        <div class="list-group">
                                            <a href="#" class="list-group-item list-group-item-action active">사과/배<small class="text-muted">(50)</small></a>
                                            <a href="#" class="list-group-item list-group-item-action">딸기/블루베리<small class="text-muted">(10)</small></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-collapse sub-men">
                                    <a class="list-group-item list-group-item-action" href="#sub-men2" data-toggle="collapse" aria-expanded="false" aria-controls="sub-men2">채소 
								<small class="text-muted">(50)</small>
								</a>
                                    
                                </div>
                                <a href="#" class="list-group-item list-group-item-action"> 생수/음료/주류/커피  <small class="text-muted">(150) </small></a>
                            </div>
                        </div>
                        <div class="filter-price-left">
                            <div class="title-left">
                                <h3>가격</h3>
                            </div>
                            <div class="price-box-slider">
                                <div id="slider-range"></div>
                                <p>
                                    <input type="text" id="amount" readonly style="border:0; color:#fbb714; font-weight:bold;">
                                    <button class="btn hvr-hover" type="submit">필터</button>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    			<div id="shop_page">
<%
				if(count>0){
					int pageCount = count / pageSize + (count % pageSize == 0? 0 : 1);
					int pageBlock = 2;
					int startPage = ((currentPage/pageBlock)-(currentPage%pageBlock==0?1:0))*pageBlock +1;
					int endPage = startPage + pageBlock -1;
					if(endPage > pageCount){
						endPage = pageCount;
					}
					if(startPage>pageBlock){
%>
			<a href="shop.jsp?product_pageNum<%=startPage-pageBlock%>">[이전]</a>	
<% 
					}
					for(int i =startPage; i<=endPage;i++){
%>
			<a href="shop.jsp?product_pageNum=<%=i %>">[<%=i %>]</a>
<%	
						}
					if(endPage < pageCount){
%>
			<a href="shop.jsp?product_pageNum=<%=startPage+pageBlock %>">[다음]</a>
<%
					}
				}
%>
				
				
			</div>
    </article>	
    <!-- End Shop Page -->

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
        <p class="footer-company">All Rights Reserved. &copy; 2018 <a href="#">ThewayShop</a> Design By :
            <a href="https://jsp.design/">jsp design</a></p>
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
    <script src="../js/jquery-ui.js"></script>
    <script src="../js/jquery.nicescroll.min.js"></script>
    <script src="../js/form-validator.min.js"></script>
    <script src="../js/contact-form-script.js"></script>
    <script src="../js/custom.js"></script>
</body>

</html>