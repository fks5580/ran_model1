
<%@page import="board.boardDAO"%>
<%@page import="product.productDAO"%>
<%@page import="product.productBean"%>
<%@page import="java.util.List"%>
<%@page import="cart.cartDAO"%>
<%@page import="cart.cartBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<!-- Basic -->
<%
	request.setCharacterEncoding("UTF-8");
	cartDAO cartDAO = new cartDAO();
	productDAO productDAO = new productDAO();
	String id = (String)session.getAttribute("id");
	cartBean cBean = cartDAO.getCart(id);
	productBean pBean1 = productDAO.getProduct_cart(cBean.getCart_product1());
	productBean pBean2 = productDAO.getProduct_cart(cBean.getCart_product2());
	productBean pBean3 = productDAO.getProduct_cart(cBean.getCart_product3());
	productBean pBean4 = productDAO.getProduct_cart(cBean.getCart_product4());
	productBean pBean5 = productDAO.getProduct_cart(cBean.getCart_product5());
	productBean pBean6 = productDAO.getProduct_cart(cBean.getCart_product6());
	productBean pBean7 = productDAO.getProduct_cart(cBean.getCart_product7());
	productBean pBean8 = productDAO.getProduct_cart(cBean.getCart_product8());
	productBean pBean9 = productDAO.getProduct_cart(cBean.getCart_product9());
	productBean pBean10 = productDAO.getProduct_cart(cBean.getCart_product10());
	if(id == null){
%>
	    <script>
	    	alert("로그인시 이용할 수 있습니다. 로그인 해주세요");
			location.href="../member/login.jsp";
	    </script>
<%
 	}
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>Freshshop - 장바구니</title>
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
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
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
                        <li class="dropdown">
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
						<li class="side-menu"><a href="cart.jsp"> <i
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
                    <h2>장바구니</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">메인화면</a></li>
                        <li class="breadcrumb-item active">장바구니</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Wishlist  -->
    <div class="wishlist-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-main table-responsive">
                    
                        <table class="table">
                                <thead>                    
                                 <tr>
                                    <th>이미지</th>
                                    <th>상품이름</th>
                                    <th>상품가격</th>
                                    <th>상품수</th>
                                    <th>삭제</th>
                                 </tr>
                                </thead>                 
                          		<tbody>
                                <tr>
<%
                                    if(cBean.getCart_product1()!=0){
%>                                
	                                    <td class="thumbnail-img"><img src="<%=pBean1.getProduct_photo()%>" alt="" width="250px" height="200px" /></td>
	                                    <td class="name-pr"><%=pBean1.getProduct_name()%></td>
	                                    <td class="price-pr"><p><%=pBean1.getProduct_price()%></p></td>
	                                    <td class="quantity-box">1</td>
	                                    <td class="remove-pr"><a href="deleteCartPro.jsp?cart_product=cart_product1"><i class="fas fa-times"></i></a></td>
<%
                                    }
%>										
                                 </tr>
                                 <tr>  
<%
                                    if(cBean.getCart_product2()!=0){
%>                                
	                                    <td class="thumbnail-img"><img src="<%=pBean2.getProduct_photo()%>" alt="" width="250px" height="200px" /></td>
	                                    <td class="name-pr"><%=pBean2.getProduct_name()%></td>
	                                    <td class="price-pr"><p><%=pBean2.getProduct_price()%></p></td>
	                                    <td class="quantity-box">1</td>
	                                    <td class="remove-pr"><a href="deleteCartPro.jsp?cart_product=cart_product2"><i class="fas fa-times"></i></a></td>
<%
                                    }
%>										
                                 </tr> 
                                 <tr>  
<%
                                    if(cBean.getCart_product3()!=0){
%>                                
	                                    <td class="thumbnail-img"><img src="<%=pBean3.getProduct_photo()%>" alt="" width="250px" height="200px" /></td>
	                                    <td class="name-pr"><%=pBean3.getProduct_name()%></td>
	                                    <td class="price-pr"><p><%=pBean3.getProduct_price()%></p></td>
	                                    <td class="quantity-box">1</td>
	                                    <td class="remove-pr"><a href="deleteCartPro.jsp?cart_product=cart_product3"><i class="fas fa-times"></i></a></td>
<%
                                    }
%>										
                                 </tr>
                                                                  <tr>  
<%
                                    if(cBean.getCart_product4()!=0){
%>                                
	                                    <td class="thumbnail-img"><img src="<%=pBean4.getProduct_photo()%>" alt="" width="250px" height="200px" /></td>
	                                    <td class="name-pr"><%=pBean4.getProduct_name()%></td>
	                                    <td class="price-pr"><p><%=pBean4.getProduct_price()%></p></td>
	                                    <td class="quantity-box">1</td>
	                                    <td class="remove-pr"><a href="deleteCartPro.jsp?cart_product=cart_product4"><i class="fas fa-times"></i></a></td>
<%
                                    }
%>										
                                 </tr>  
                                                                  <tr>  
<%
                                    if(cBean.getCart_product5()!=0){
%>                                
	                                    <td class="thumbnail-img"><img src="<%=pBean5.getProduct_photo()%>" alt="" width="250px" height="200px" /></td>
	                                    <td class="name-pr"><%=pBean5.getProduct_name()%></td>
	                                    <td class="price-pr"><p><%=pBean5.getProduct_price()%></p></td>
	                                    <td class="quantity-box">1</td>
	                                    <td class="remove-pr"><a href="deleteCartPro.jsp?cart_product=cart_product5"><i class="fas fa-times"></i></a></td>
<%
                                    }
%>										
                                 </tr>  
                                                                  <tr>  
<%
                                    if(cBean.getCart_product6()!=0){
%>                                
	                                    <td class="thumbnail-img"><img src="<%=pBean6.getProduct_photo()%>" alt="" width="250px" height="200px" /></td>
	                                    <td class="name-pr"><%=pBean6.getProduct_name()%></td>
	                                    <td class="price-pr"><p><%=pBean6.getProduct_price()%></p></td>
	                                    <td class="quantity-box">1</td>
	                                    <td class="remove-pr"><a href="deleteCartPro.jsp?cart_product=cart_product6"><i class="fas fa-times"></i></a></td>
<%
                                    }
%>										
                                 </tr>  
                                                                  <tr>  
<%
                                    if(cBean.getCart_product7()!=0){
%>                                
	                                    <td class="thumbnail-img"><img src="<%=pBean7.getProduct_photo()%>" alt="" width="250px" height="200px" /></td>
	                                    <td class="name-pr"><%=pBean7.getProduct_name()%></td>
	                                    <td class="price-pr"><p><%=pBean7.getProduct_price()%></p></td>
	                                    <td class="quantity-box">1</td>
	                                    <td class="remove-pr"><a href="deleteCartPro.jsp?cart_product=cart_product7"><i class="fas fa-times"></i></a></td>
<%
                                    }
%>										
                                 </tr>  
                                                                  <tr>  
<%
                                    if(cBean.getCart_product8()!=0){
%>                                
	                                    <td class="thumbnail-img"><img src="<%=pBean8.getProduct_photo()%>" alt="" width="250px" height="200px" /></td>
	                                    <td class="name-pr"><%=pBean8.getProduct_name()%></td>
	                                    <td class="price-pr"><p><%=pBean8.getProduct_price()%></p></td>
	                                    <td class="quantity-box">1</td>
	                                    <td class="remove-pr"><a href="deleteCartPro.jsp?cart_product=cart_product8"><i class="fas fa-times"></i></a></td>
<%
                                    }
%>										
                                 </tr>  
                                                                  <tr>  
<%
                                    if(cBean.getCart_product9()!=0){
%>                                
	                                    <td class="thumbnail-img"><img src="<%=pBean9.getProduct_photo()%>" alt="" width="250px" height="200px" /></td>
	                                    <td class="name-pr"><%=pBean9.getProduct_name()%></td>
	                                    <td class="price-pr"><p><%=pBean9.getProduct_price()%></p></td>
	                                    <td class="quantity-box">1</td>
	                                    <td class="remove-pr"><a href="deleteCartPro.jsp?cart_product=cart_product9"><i class="fas fa-times"></i></a></td>
<%
                                    }
%>										
                                 </tr>  
                                                                  <tr>  
<%
                                    if(cBean.getCart_product10()!=0){
%>                                
	                                    <td class="thumbnail-img"><img src="<%=pBean10.getProduct_photo()%>" alt="" width="250px" height="200px" /></td>
	                                    <td class="name-pr"><%=pBean10.getProduct_name()%></td>
	                                    <td class="price-pr"><p><%=pBean10.getProduct_price()%></p></td>
	                                    <td class="quantity-box">1</td>
	                                    <td class="remove-pr"><a href="deleteCartPro.jsp?cart_product=cart_product10"><i class="fas fa-times"></i></a></td>
<%
                                    }
%>										
                                 </tr>  
                                       
                   	 </tbody>
                        </table>

                        	<input id="order_btn" class="btn hvr-hover" type="button" value="주문" onclick="location.href='checkout.jsp'" >

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Wishlist -->

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
            <a href="https://html.design/">html design</a></p>
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