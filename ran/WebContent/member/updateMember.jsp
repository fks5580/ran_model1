
<%@page import="member.memberDAO"%>
<%@page import="member.memberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	String pw = (String)session.getAttribute("pw");
	memberDAO memberDAO = new memberDAO();
	memberBean mBean = memberDAO.getMember(id);
%>

<script>
	window.onload = function() { 
		var city = "<%=mBean.getCity()%>";
		
		if(city=="서울"){
			 $("#city").val("서울").prop("selected", true);
		}else if(city=="부산"){
			 $("#city").val("부산").prop("selected", true);
		}else if(city=="인천"){
			 $("#city").val("인천").prop("selected", true);
		}else if(city=="대구"){
			 $("#city").val("대구").prop("selected", true);
		}else if(city=="광주"){
			 $("#city").val("광주").prop("selected", true);
		}else if(city=="대전"){
			 $("#city").val("대전").prop("selected", true);
		}else{
			 $("#city").val("다른 도시").prop("selected", true);
		}
	};
	//우편번호 api
	function execDaumPostcode() {
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
	            document.getElementById('address').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('address1').value = fullAddr;

	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById('address2').focus();
	        }
	    }).open();
	}
	

			
		
	
</script> 
			
           
<html lang="join">
<!-- Basic -->

<head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>




<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>Freshshop - 회원 정보 수정</title>
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
                        <li class="nav-item active"><a class="nav-link" href="my-account.jsp">내 정보</a></li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">쇼핑하기</a>
                            <ul class="dropdown-menu">
								<li><a href="../shop/shop.jsp">쇼핑</a></li>
                                <li><a href="../shop/cart.jsp">장바구니</a></li>
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
					<h2>회원정보 수정</h2>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">회원정보수정</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End All Title Box -->

	<!-- Start join  -->
	<div class="about-box-main">
        <div class="container">
<%				if(id!=null){
%>
         		<div class="title-left center" >
				<h3 class="center">회원정보수정</h3>
				</div>
				<form name="fr" action="updateProc.jsp" method="post" class="needs-validation"  novalidate>
			
				<div class="mb-3">
					<label for="InputId" class="mb-0">아이디 *</label> 
					<input type="text" class="form-control" name="id" id="id" placeholder="" value="<%=session.getAttribute("id") %>" required readonly>
				
				</div>
				
				
				<div class="mb-3">
					<label for="InputPassword" class="mb-0">비밀번호 *</label> 
					<input type="password" class="form-control" name="pw" id="pw" placeholder=""  required>
					
				</div>
				
				<div class="mb-3">
					<label for="InputPassword" class="mb-0">비밀번호 확인*</label> 
					<input type="password" class="form-control" name="pwCheck" id="pwCheck" placeholder=""  required>
					
				</div>
				
				<div class="mb-3">
					<label for="username">이름 *</label>
					<input type="text" class="form-control" name="name" id="name" value="<%=mBean.getName() %>" required>
				</div>
				
				<div class="row">
					<div class="col-md-5 mb-3">
						<label for="country">국가 </label> 
						<select class="wide w-100" name="country" id="country">
							<option value="Choose..." data-display="Select">Choose...</option>
							<option value="대한민국" selected="selected">대한민국</option>
						</select>
						</div>
					
					
					<div class="col-md-4 mb-3">
						<label for="city">도시 </label> 
						<select class="wide w-100" name="city" id="city">
							<option data-display="Select">Choose...</option>
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
					<label for="address">주소</label>
						<input type="text" class="form-control" name="address" id="address" placeholder="우편번호" value="<%=mBean.getAddress() %>" required readonly>
				</div>
					
					<input type="button" onclick="execDaumPostcode()" value="찾기" class="btn"><br><br>
				
				<div class="mb-3">
					<input type="text" class="form-control" name="address1" id="address1" placeholder="주소" value="<%=mBean.getAddress1() %>" required readonly>
				</div>
				
				<div class="mb-3">
					<input type="text" class="form-control" name="address2" id="address2" placeholder="상세주소" value="<%=mBean.getAddress2() %>" required>
				</div>
				
			
					<button type="submit" class="btn hvr-hover">수정</button>
					<input type="button" class="btn hvr-hover" value="탈퇴" onclick="location.href='deleteMember.jsp?id=<%=id%>&pw=<%=pw%>'">
			</form>
<%
				}else{
%>
				<script type="text/javascript">
					alert("로그인해주세요");
					location.href="login.jsp";
				</script>
<%					
				}
%>


        </div>
    </div>
	<!-- End join -->
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

