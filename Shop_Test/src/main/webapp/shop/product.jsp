<%@page import="shop.dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="shop.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<%
    String productId = request.getParameter("id");
    ProductRepository productDAO = new ProductRepository();
    Product product = productDAO.getProductById(productId);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
	<script>
	
		// ��ٱ��� �߰�
		function addToCart() {
			if( confirm("��ǰ�� ��ٱ��Ͽ� �߰��Ͻðڽ��ϱ�?") ) {
				document.addForm.submit()
			} else {
				document.addForm.reset()
			}
			
		}
		
	</script>

</head>
<body>  
	

<jsp:include page="/layout/header.jsp" />

	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">��ǰ ����</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Shop ���θ� �Դϴ�.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<a href="./products.jsp" class="btn btn-primary btn-lg px-4 gap-3">��ǰ���</a>
			</div>
		</div>
	</div>
	
	<!-- ��ǰ ���� ���� -->
	
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<!-- [NEW] ����� �̹��� ��û�ϱ� �߰� -->
				<img src="..<%=product.getFile()%>" class="w-100 p-2">
			</div>
			<div class="col-md-6">
				<h3 class="mb-5"><%= product.getName() %></h3>
			 	<table class="table">
			 		<colgroup>
			 			<col width="120px">
			 			<col>
			 		</colgroup>
			 		<tbody><tr>
			 			<td>��ǰID :</td>
			 			<td><%=product.getProductId() %></td>
			 		</tr>
			 		<tr>
			 			<td>������ :</td>
			 			<td><%= product.getManufacturer() %></td>
			 		</tr>
			 		<tr>
			 			<td>�з� :</td>
			 			<td><%= product.getCategory() %></td>
			 		</tr>
			 		<tr>
			 			<td>���� :</td>
			 			<td><%= product.getCondition() %></td>
			 		</tr>
			 		<tr>
			 			<td>��� �� :</td>
			 			<td><%= product.getUnitsInStock() %></td>
			 		</tr>
			 		<tr>
			 			<td>���� :</td>
			 			<td><%= product.getUnitPrice() %></td>
			 		</tr>
				</tbody></table>
				<div class="mt-4">
					<form name="addForm" action="./addCart.jsp" method="post">
						<input type="hidden" name="id" value="P000000">
						<div class="btn-box d-flex justify-content-end ">
							<!-- [NEW] ��ٱ��� ��ư �߰� -->
							<a href="./cart.jsp" class="btn btn-lg btn-warning mx-3">��ٱ���</a>
							
							<!-- ������ �̵� ���� :  href="javascript:;" -->			
							<a href="javascript:;" class="btn btn-lg btn-success mx-3" onclick="addToCart()">�ֹ��ϱ�</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	

	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />



</body>
</html>