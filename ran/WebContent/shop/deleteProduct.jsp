<%@page import="cart.cartDAO"%>
<%@page import="product.productDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	productDAO productDAO = new productDAO();
	cartDAO cDAO = new cartDAO();
    String id = (String)session.getAttribute("id");
    int product_no = Integer.parseInt(request.getParameter("product_no"));
 	if(!id.equals("admin")){
 		response.sendRedirect("../member/login.jsp");
 	}else{	
 		productDAO.deleteProduct(product_no);
 		cDAO.deleteproductCart(product_no);
%>
	
		<script>
			alert("상품 삭제 성공");
			location.href="shop.jsp";
		</script> 
<%
	}
%> 	
	






