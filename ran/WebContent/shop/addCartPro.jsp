<%@page import="cart.cartDAO"%>
<%@page import="cart.cartBean"%>
<%@page import="product.productBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	cartBean cBean = new cartBean();
	cartDAO cartDAO = new cartDAO();
	
	String id = (String)session.getAttribute("id");
	int product_count = Integer.parseInt(request.getParameter("product_count"));
	int product_no = Integer.parseInt(request.getParameter("product_no"));
	int cart_no = Integer.parseInt(request.getParameter("cart_no"));
	if(id==null){
%>
		<script>
			alert("로그인해주세요.");
			location.href = "../member/login.jsp";
		</script>
<%		
	}else{
	
		if(product_count==0){
%>
		<script>
			alert("품절되었습니다.");
			history.back();
		</script>
<%	    
		}else{
			cBean.setCart_product1(product_no);
			cBean.setCart_id(id);
			cBean.setCart_no(cart_no);
		    cartDAO.insertCart(cBean);
		
		    
%>
		<script>
			alert("장바구니에 추가되었습니다.");
			history.back();
		</script>
<%
		}
	}
%>	
