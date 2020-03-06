<%@page import="order.orderDAO"%>
<%@page import="order.orderBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id"); 
	orderBean oBean = new orderBean();
	orderDAO orderDAO = new orderDAO();
	
	String order_id = id;
	if(id==null){
%>
		<script>
			alert("로그인해주세요.");
			location.href = "../member/login.jsp";
		</script>
<%		
	}	
	String order_name = request.getParameter("order_name");
	String order_country = request.getParameter("order_country");
	String order_city = request.getParameter("order_city");
	String order_address = request.getParameter("order_address");
	String order_address1 = request.getParameter("order_address1");
	String order_address2 = request.getParameter("order_address2");
	String delivery_option = request.getParameter("delivery-option");
	String order_payment = request.getParameter("order_payment");
	String order_card_name = request.getParameter("order_card_name");
	String order_card_number = request.getParameter("order_card_number");
	String order_expiration_date = request.getParameter("order_expiration_date");    
	String order_card_cvc = request.getParameter("order_card_cvc");
	String shipping_option = request.getParameter("shipping-option");
	int order_total1 = Integer.parseInt(request.getParameter("order_total"));
	int delivery_fee = Integer.parseInt(request.getParameter("delivery_fee"));
	String order_total = String.valueOf(order_total1 + delivery_fee);
	
	if(order_name== "") {
%>		
		<script>
			alert("이름을 입력해주세요.");
			history.back();
		</script>
<%	
	}else if(order_address==""){
%>
		<script>
			alert("주소를 입력해주세요.");
			history.back();
		</script>
<%		
	}else if(order_address1=="") {
%>		
		<script>
			alert("주소를 입력해주세요.");
			history.back();
		</script>
<%	
	}else if(order_address2==""){
%>
		<script>
			alert("주소를 입력해주세요.");
			history.back();
		</script>
<%	
	}else if(order_card_name=="") {
%>
		<script>
			alert("카드 정보를 입력해주세요.");
			history.back();
		</script>
		<%	
	}else if(order_card_number=="") {
%>
		<script>
			alert("카드 정보를 입력해주세요.");
			history.back();
		</script>
	<%	
	}else if(order_expiration_date=="") {
%>
		<script>
			alert("카드 정보를 입력해주세요.");
			history.back();
		</script>
	<%	
	}else if(order_card_cvc=="") {
%>
		<script>
			alert("카드 정보를 입력해주세요.");
			history.back();
		</script>			
<%
	}else{	
		oBean.setOrder_id(order_id);
		oBean.setOrder_name(order_name);
		oBean.setOrder_country(order_country);
		oBean.setOrder_city(order_city);
		oBean.setOrder_address(order_address);
		oBean.setOrder_address1(order_address1);
		oBean.setOrder_address2(order_address2);
		oBean.setDelivery_option(delivery_option);
		oBean.setOrder_payment(order_payment);
		oBean.setOrder_card_name(order_card_name);
		oBean.setOrder_card_number(order_card_number);
		oBean.setOrder_expiration_date(order_expiration_date);
		oBean.setOrder_card_cvc(order_card_cvc);
		oBean.setShipping_option(shipping_option);
		oBean.setOrder_total(order_total);
		if(request.getParameter("cart_product1")!=null){
			oBean.setCart_product1(Integer.parseInt(request.getParameter("cart_product1")));
		}
		if(request.getParameter("cart_product2")!=null){
			oBean.setCart_product2(Integer.parseInt(request.getParameter("cart_product2")));
		}
		if(request.getParameter("cart_product3")!=null){
			oBean.setCart_product3(Integer.parseInt(request.getParameter("cart_product3")));
		}
		if(request.getParameter("cart_product4")!=null){
			oBean.setCart_product4(Integer.parseInt(request.getParameter("cart_product4")));
		}
		if(request.getParameter("cart_product5")!=null){
			oBean.setCart_product5(Integer.parseInt(request.getParameter("cart_product5")));
		}
		if(request.getParameter("cart_product6")!=null){
			oBean.setCart_product6(Integer.parseInt(request.getParameter("cart_product6")));
		}
		if(request.getParameter("cart_product7")!=null){
			oBean.setCart_product7(Integer.parseInt(request.getParameter("cart_product7")));
		}
		if(request.getParameter("cart_product8")!=null){
			oBean.setCart_product8(Integer.parseInt(request.getParameter("cart_product8")));
		}
		if(request.getParameter("cart_product9")!=null){
			oBean.setCart_product9(Integer.parseInt(request.getParameter("cart_product9")));
		}
		if(request.getParameter("cart_product10")!=null){
			oBean.setCart_product10(Integer.parseInt(request.getParameter("cart_product10")));
		}
		orderDAO.insertOrder(oBean);
%>
	<script>
		alert("주문완료");
		location.href="../index.jsp";
	</script>
<%
	}
%>
