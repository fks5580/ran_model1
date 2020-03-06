
<%@page import="product.productDAO"%>
<%@page import="cart.cartDAO"%>
<%@page import="product.productBean"%>
<%@page import="cart.cartBean"%>
<%@page import="member.memberDAO"%>
<%@page import="member.memberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<%

	request.setCharacterEncoding("utf-8");
	memberDAO memberDAO = new memberDAO();
	cartDAO cartDAO = new cartDAO();
	productDAO productDAO = new productDAO();
	String id = (String)session.getAttribute("id");
	memberBean mBean = memberDAO.getMember(id);
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
	int sum=0;
	int order_total=0;
	if(id == null){
%>
	    <script>
	    	alert("로그인시 주문할 수 있습니다. 로그인 해주세요");
			location.href="../member/login.jsp";
	    </script>
<%
 	}
	if(cBean.getCart_product1()==0 && cBean.getCart_product2()==0 && cBean.getCart_product3()==0 && cBean.getCart_product4()==0 
		&& cBean.getCart_product5()==0 && cBean.getCart_product6()==0 && cBean.getCart_product7()==0 && cBean.getCart_product8()==0 
		&& cBean.getCart_product9()==0 && cBean.getCart_product10()==0){
%>
		<script>
			alert("장바구니에 상품이 없습니다. 장바구니에 상품을 추가해주세요.");
			location.href = "../shop/shop.jsp";
		</script>
<%                     		
	}
%>
<script>
	
	//우편번호 api
	function execDaumPostcode1() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullAddr = ''; // 최종 주소 변수
	            var extraAddr = ''; // 조합형 주소 변수

	            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                fullAddr = data.roadAddress;

	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                fullAddr = data.jibunAddress;
	            }

	            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	            if(data.userSelectedType === 'R'){
	                //법정동명이 있을 경우 추가한다.
	                if(data.bname !== ''){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있을 경우 추가한다.
	                if(data.buildingName !== ''){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById("order_address").value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById("order_address1").value = fullAddr;

	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("order_address2").focus();
	        }
	    }).open();
	}
	

	
	function new_delivery(){
		document.getElementById("order_name").value = "";
		document.getElementById("order_address").value = "";
		document.getElementById("order_address1").value = "";
		document.getElementById("order_address2").value = "";
	}
	
	function origin_delivery(){
		document.getElementById("order_name").value = "<%=mBean.getName()%>";
		document.getElementById("order_address").value = "<%=mBean.getAddress()%>";
		document.getElementById("order_address1").value = "<%=mBean.getAddress1()%>";
		document.getElementById("order_address2").value = "<%=mBean.getAddress2()%>";
		var city = "<%=mBean.getCity()%>";
		
		if(city=="서울"){
			 $("#order_city").val("서울").prop("selected", true);
		}else if(city=="부산"){
			 $("#order_city").val("부산").prop("selected", true);
		}else if(city=="인천"){
			 $("#order_city").val("인천").prop("selected", true);
		}else if(city=="대구"){
			 $("#order_city").val("대구").prop("selected", true);
		}else if(city=="광주"){
			 $("#order_city").val("광주").prop("selected", true);
		}else if(city=="대전"){
			 $("#order_city").val("대전").prop("selected", true);
		}else{
			 $("#order_city").val("다른 도시").prop("selected", true);
		}
	}
	
	
</script>


<!-- Basic -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>Freshshop - 주문하기</title>
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
                    <h2>주문하기</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">메인화면</a></li>
                        <li class="breadcrumb-item active">주문하기</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Cart  -->
    <div class="cart-box-main">
        <div class="container">
            <form action="checkoutPro.jsp" method="post" name="checkout"  class="needs-validation" novalidate>
            <div class="row">
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="checkout-address">
                        <div class="title-left">
                            <h3>내 정보</h3>
                        </div>
                        	<div class="mb-3">
                                <label>아이디*</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="order_id" name="order_id" value=<%=id%> readonly>
                                </div>
                            </div>
                        
                            <div class="mb-3">
                                <label>이름*</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="order_name" name="order_name" placeholder="" required>
                                </div>
                            </div>
                            <div class="row">                          
                              <div class="col-md-5 mb-3">
                                    <label>국가*</label>
                                    <select class="wide w-100" id="order_country" name="order_country" required>
									<option value="대한민국">대한민국</option>
								</select>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label>도시*</label>
                                <select class="wide w-100" id="order_city" name="order_city" required>
                                	<option value="서울" selected="selected">서울</option>
        							<option value="부산">부산</option>
        							<option value="인천">인천</option>
        							<option value="대구">대구</option>
        							<option value="광주">광주</option>
        							<option value="대전">대전</option>
        							<option value="다른 도시">다른 도시</option>   
                                </select>
                            </div>
                            </div>
                            
                          	<div class="mb-3">
								<label>주소*</label>
								<input type="text" class="form-control" name="order_address" id="order_address" placeholder="우편번호" required readonly>
							</div>
					
								<input type="button" onclick="execDaumPostcode1()" value="찾기" class="btn"><br><br>
				
							<div class="mb-3">
								<input type="text" class="form-control" name="order_address1" id="order_address1" placeholder="주소" required readonly>
							</div>
				
							<div class="mb-3">
								<input type="text" class="form-control" name="order_address2" id="order_address2" placeholder="상세주소" required>
							</div>
							
                            <hr class="mb-4">
                            <div class="mb-4">
                                    <div class="custom-control custom-radio" >
                                        <input id="deliveryOption1" name="delivery-option" class="custom-control-input" checked="checked" type="radio" value="기본 배송지" onclick="origin_delivery()" required>
                                        <label class="custom-control-label" for="deliveryOption1">기존 배송지</label> </div>
                                   
                                    <div class="custom-control custom-radio">
                                        <input id="deliveryOption2" name="delivery-option" class="custom-control-input" type="radio" value="새로운 배송지" onclick="new_delivery()"  required>
                                        <label class="custom-control-label" for="deliveryOption2">새로 입력</label></div>
                                   
                             </div>
                            
                            <hr class="mb-4">
                            <div> <span>결제 수단*</span> </div>
                            <div class="d-block my-3">
                                <div class="custom-control custom-radio">
                                    <input id="order_payment" name="order_payment" type="radio" class="custom-control-input" value="신용카드" checked required>
                                    <label class="custom-control-label" for="credit">신용카드</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="cc-name">카드이름*</label>
                                    <input type="text" class="form-control" id="order_card_name" name="order_card_name" placeholder="" required>                  
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="cc-number">카드번호*</label>
                                    <input type="text" class="form-control" id="order_card_number" name="order_card_number" placeholder="" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3 mb-3">
                                    <label for="cc-expiration">만료일*</label>
                                    <input type="text" class="form-control" id="order_expiration_date" name="order_expiration_date" placeholder="" required>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label for="cc-expiration">CVC*</label>
                                    <input type="text" class="form-control" id="order_card_cvc" name="order_card_cvc" placeholder="" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <div class="payment-icon">
                                        <ul>
                                            <li><img class="img-fluid" src="../images/payment-icon/1.png" alt=""></li>
                                            <li><img class="img-fluid" src="../images/payment-icon/2.png" alt=""></li>
                                            <li><img class="img-fluid" src="../images/payment-icon/3.png" alt=""></li>
                                            <li><img class="img-fluid" src="../images/payment-icon/5.png" alt=""></li>
                                            <li><img class="img-fluid" src="../images/payment-icon/7.png" alt=""></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <hr class="mb-1">
                    </div>
                </div>
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="shipping-method-box">
                                <div class="title-left">
                                    <h3>배송 방법</h3>
                                </div>
                                <div class="mb-4">
                                    <div class="custom-control custom-radio">
                                        <input id="shippingOption1" name="shipping-option" class="custom-control-input" checked="checked" type="radio" value="기본 배송" onclick="free()">
                                        <label class="custom-control-label" for="shippingOption1">기본 배송</label> <span class="float-right font-weight-bold">무료</span> </div>
                                    <div class="ml-4 mb-2 small">(2-3일 뒤 도착)</div>
                                    <div class="custom-control custom-radio">
                                        <input id="shippingOption2" name="shipping-option" class="custom-control-input" type="radio" value="빠른 배송" onclick="free1()">
                                        <label class="custom-control-label" for="shippingOption2">빠른 배송</label> <span class="float-right font-weight-bold">2500원</span> </div>
                                    <div class="ml-4 mb-2 small">(1일 뒤 도착)</div>
                                    <div class="custom-control custom-radio">
                                        <input id="shippingOption3" name="shipping-option" class="custom-control-input" type="radio" value="오늘 배송" onclick="free2()">
                                        <label class="custom-control-label" for="shippingOption3">오늘 배송</label> <span class="float-right font-weight-bold">4000원</span> </div>
                                	<div class="ml-4 mb-2 small">(오늘 도착)</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12">
                            <div class="odr-box">
                                <div class="title-left">
                                    <h3>장바구니</h3>
                                </div>
                                <div class="rounded p-2 bg-light">
<%
                                    if(cBean.getCart_product1()!=0){
%>
                                    <div class="media mb-2 border-bottom">
                                        <div class="media-body"><%=pBean1.getProduct_name()%>
                                            <div class="small text-muted">가격:<%=pBean1.getProduct_price()%>원 <span class="mx-2">|</span>개수:1개</div>
                                        </div>
                                    </div>
                                    <input type="hidden" id="cart_product1" name="cart_product1" value="<%=cBean.getCart_product1() %>">
<%
										sum += pBean1.getProduct_price();
                                    }
%>
<%
                                    if(cBean.getCart_product2()!=0){
%>
                                    <div class="media mb-2 border-bottom">
                                        <div class="media-body"><%=pBean2.getProduct_name()%>
                                            <div class="small text-muted">가격:<%=pBean2.getProduct_price()%>원 <span class="mx-2">|</span>개수:1개</div>
                                        </div>
                                    </div>
                                    <input type="hidden" id="cart_product2" name="cart_product2" value="<%=cBean.getCart_product2() %>">
<%
										sum += pBean2.getProduct_price();
                                    }
%>    
<%
                                    if(cBean.getCart_product3()!=0){
%>
                                    <div class="media mb-2 border-bottom">
                                        <div class="media-body"><%=pBean3.getProduct_name()%>
                                            <div class="small text-muted">가격:<%=pBean3.getProduct_price()%>원 <span class="mx-2">|</span>개수:1개</div>
                                        </div>
                                    </div>
                                    <input type="hidden" id="cart_product3" name="cart_product3" value="<%=cBean.getCart_product3() %>">
<%
										sum += pBean3.getProduct_price();
                                    }
%>    
<%
                                    if(cBean.getCart_product4()!=0){
%>
                                    <div class="media mb-2 border-bottom">
                                        <div class="media-body"><%=pBean4.getProduct_name()%>
                                            <div class="small text-muted">가격:<%=pBean4.getProduct_price()%>원 <span class="mx-2">|</span>개수:1개</div>
                                        </div>
                                    </div>
                                    <input type="hidden" id="cart_product4" name="cart_product4" value="<%=cBean.getCart_product4() %>">
<%
										sum += pBean4.getProduct_price();
                                    }
%>    
<%
                                    if(cBean.getCart_product5()!=0){
%>
                                    <div class="media mb-2 border-bottom">
                                        <div class="media-body"><%=pBean5.getProduct_name()%>
                                            <div class="small text-muted">가격:<%=pBean5.getProduct_price()%>원 <span class="mx-2">|</span>개수:1개</div>
                                        </div>
                                    </div>
                                    <input type="hidden" id="cart_product5" name="cart_product5" value="<%=cBean.getCart_product5() %>">
<%
										sum += pBean5.getProduct_price();
                                    }
%>    
<%
                                    if(cBean.getCart_product6()!=0){
%>
                                    <div class="media mb-2 border-bottom">
                                        <div class="media-body"><%=pBean6.getProduct_name()%>
                                            <div class="small text-muted">가격:<%=pBean6.getProduct_price()%>원 <span class="mx-2">|</span>개수:1개</div>
                                        </div>
                                    </div>
                                    <input type="hidden" id="cart_product6" name="cart_product6" value="<%=cBean.getCart_product6() %>">
<%
										sum += pBean6.getProduct_price();
                                    }
%>    
<%
                                    if(cBean.getCart_product7()!=0){
%>
                                    <div class="media mb-2 border-bottom">
                                        <div class="media-body"><%=pBean7.getProduct_name()%>
                                            <div class="small text-muted">가격:<%=pBean7.getProduct_price()%>원 <span class="mx-2">|</span>개수:1개</div>
                                        </div>
                                    </div>
                                    <input type="hidden" id="cart_product7" name="cart_product7" value="<%=cBean.getCart_product7() %>">
<%
										sum += pBean7.getProduct_price();
                                    }
%>    
<%
                                    if(cBean.getCart_product8()!=0){
%>
                                    <div class="media mb-2 border-bottom">
                                        <div class="media-body"><%=pBean8.getProduct_name()%>
                                            <div class="small text-muted">가격:<%=pBean8.getProduct_price()%>원 <span class="mx-2">|</span>개수:1개</div>
                                        </div>
                                    </div>
                                    <input type="hidden" id="cart_product8" name="cart_product8" value="<%=cBean.getCart_product8() %>">
<%
										sum += pBean8.getProduct_price();
                                    }
%>    
<%
                                    if(cBean.getCart_product9()!=0){
%>
                                    <div class="media mb-2 border-bottom">
                                        <div class="media-body"><%=pBean9.getProduct_name()%>
                                            <div class="small text-muted">가격:<%=pBean9.getProduct_price()%>원 <span class="mx-2">|</span>개수:1개</div>
                                        </div>
                                    </div>
                                    <input type="hidden" id="cart_product9" name="cart_product9" value="<%=cBean.getCart_product9() %>">
<%
										sum += pBean9.getProduct_price();
                                    }
%>    
<%
                                    if(cBean.getCart_product10()!=0){
%>
                                    <div class="media mb-2 border-bottom">
                                        <div class="media-body"><%=pBean10.getProduct_name()%>
                                            <div class="small text-muted">가격:<%=pBean10.getProduct_price()%>원 <span class="mx-2">|</span>개수:1개</div>
                                        </div>
                                    </div>
                                    <input type="hidden" id="cart_product10" name="cart_product10" value="<%=cBean.getCart_product10() %>">
<%
										sum += pBean10.getProduct_price();
                                    }
									order_total += sum-(sum*0.1)+(sum*0.001);
%>                           						
                                </div>
                            </div>
                        </div>
                        <script>
                        function free(){
                    		document.getElementById("free").innerHTML = "0원";
                    		document.getElementById("delivery_fee").value = "0";
                        }
                    	function free1(){
                    		document.getElementById("free").innerHTML = "2500원";
                    		document.getElementById("total").innerHTML ="<%=order_total%>+2500"+"원";
                    		document.getElementById("delivery_fee").value = "2500";
                    	}
                    	function free2(){
                    		document.getElementById("free").innerHTML = "4000원";
                    		document.getElementById("total").innerHTML ="<%=order_total%>+4000"+"원";
                    		document.getElementById("delivery_fee").value = "4000";
                    	}
                        </script>
                        <div class="col-md-12 col-lg-12">
                            <div class="order-box">
                                <div class="title-left">
                                    <h3>주문하기</h3>
                                </div>
                                <div class="d-flex">
                                    <div class="font-weight-bold">제품</div>
                                    <div class="ml-auto font-weight-bold">합계</div>
                                </div>
                                <hr class="my-1">
                                <div class="d-flex">
                                    <h4>총금액</h4>
                                    <div class="ml-auto font-weight-bold"> <%=sum%>원 </div>
                                </div>
                                <div class="d-flex">
                                    <h4>할인금액</h4>
                                    <div class="ml-auto font-weight-bold"> <%=sum*0.1%>원 </div>
                                </div>
                                <hr class="my-1">
                                <div class="d-flex">
                                    <h4>세금</h4>
                                    <div class="ml-auto font-weight-bold"> <%=sum*0.001 %>원 </div>
                                </div>
                                <div class="d-flex">
                                    <h4>배송비</h4>
                                    <div id="free" class="ml-auto font-weight-bold"> 0원 </div>
                                </div>
                                <hr>
                                <div class="d-flex gr-total">
                                    <h5>결제금액</h5>
                                    <div id="total" class="ml-auto h5"><%=order_total %>원</div>
                                </div>
                                <hr> 
                                </div>
                        </div>
                        	<input type="hidden" id="order_total" name="order_total" value="<%=order_total %>">
                        	<input type="hidden" id="delivery_fee" name="delivery_fee" value="0">
                        <div class="col-12 d-flex shopping-box"> <button type="submit" class="ml-auto btn hvr-hover">주문하기</button> </div>
                    </div>
                </div>
            </div>
 			</form>
        </div>
    </div>
    <!-- End Cart -->

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
    <script src="../js/form-validator.min.js"></script>
    <script src="../js/contact-form-script.js"></script>
    <script src="../js/custom.js"></script>
</body>

</html>