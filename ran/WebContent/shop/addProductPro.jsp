<%@page import="product.productDAO"%>
<%@page import="product.productBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	productBean pBean = new productBean();
	productDAO productDAO = new productDAO();
	String product_name = request.getParameter("product_name");
	int product_price = Integer.parseInt(request.getParameter("product_price"));
	int product_count = Integer.parseInt(request.getParameter("product_count"));
	String product_photo = request.getParameter("img");
	String id = (String)session.getAttribute("id");
	
 	if(!id.equals("admin")){
 		response.sendRedirect("../member/login.jsp");
 	}else{
 		pBean.setProduct_name(product_name);
 		pBean.setProduct_price(product_price);
 		pBean.setProduct_count(product_count);
 		pBean.setProduct_photo(product_photo);
 		productDAO.insertProduct(pBean);
%>
		<script>
			alert("상품 등록 성공");
			location.href="shop.jsp";
		</script> 
<% 	
 	}
 		
%>
