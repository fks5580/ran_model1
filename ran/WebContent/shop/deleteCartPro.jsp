<%@page import="cart.cartDAO"%>
<%@page import="cart.cartBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	cartDAO cartDAO = new cartDAO();
	String cart_product = request.getParameter("cart_product");
	String id = (String)session.getAttribute("id");
	
 	if(id==null){
 		response.sendRedirect("../member/login.jsp");
 	}else{
 		cartDAO.deleteCart(id,cart_product);
%>
		<script>
			alert("삭제 성공");
			location.href="cart.jsp";
		</script> 
<% 	
 	}
 		
%>
