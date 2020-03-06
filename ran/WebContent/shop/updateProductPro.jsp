<%@page import="product.productDAO"%>
<%@page import="product.productBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	productBean pBean = new productBean();
	productDAO productDAO = new productDAO();
	int product_no = Integer.parseInt(request.getParameter("product_no"));
	String product_name = request.getParameter("product_name");
	int product_price = Integer.parseInt(request.getParameter("product_price"));
	int product_count = Integer.parseInt(request.getParameter("product_count"));
	String product_photo = request.getParameter("img");
	String id = (String)session.getAttribute("id");
	
 	if(!id.equals("admin")){
 		response.sendRedirect("../member/login.jsp");
 	}else{
 	    pBean.setProduct_no(product_no);
 		pBean.setProduct_name(product_name);
 		pBean.setProduct_price(product_price);
 		pBean.setProduct_count(product_count);
 		pBean.setProduct_photo(product_photo);
 		productDAO.updateProduct(pBean);
%>
		<script>
			alert("상품 수정 성공");
			location.href="shop.jsp";
		</script> 
<% 	
 	}
 		
%>
