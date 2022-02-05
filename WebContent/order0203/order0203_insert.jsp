<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 23 -</title>
	<style>
		#iu_table tr{
			height: 30px;
		}#iu_table th{
			width: 200px;
		}#iu_table td{
			width: 300px !important;
		}
		
		#iu_table input[type="text"]{
			height: 25px;
			width: 200px !important;
		}#iu_table input[type="date"]{
			height: 25px;
			width: 200px !important;
		}#iu_table input[type="number"]{
			height: 25px;
			width: 200px !important;
		}
		
		#btntd{
			text-align: center;
		}#btntd button{
			height: 25px;
			width: 150px;
			background-color: black;
			color: white;
		}
		
		#pSelect{
			height: 25px;
			width: 200px !important;
		}
	</style>
	<script>
		function orderin() {
			if(document.iu_form.orderDate.value==""){
				alert("주문일자를 입력하세요.");
				document.iu_form.orderDate.focus();
			}else if(document.iu_form.orderName.value==""){
				alert("주문자 이름을 입력하세요.");
				document.iu_form.orderName.focus();
			}else if(document.iu_form.productId.value==""){
				alert("상품코드를 입력하세요.");
				document.iu_form.productId.focus();
			}else if(document.iu_form.orderQty.value==""){
				alert("주문수량을 입력하세요.");
				document.iu_form.orderQty.focus();
			}else if(document.iu_form.orderAddress.value==""){
				alert("주문주소를 입력하세요.");
				document.iu_form.orderAddress.focus();
			}else{
				document.iu_form.action = "order0203_insert_process.jsp";
				document.iu_form.submit();
			}
		}
		function notry() {
			location.href = "/HRD_0203/order0203/order0203_select.jsp";
		}
		
		function idchk() {
			document.iu_form.submit();
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		String orderDate = request.getParameter("orderDate");
		String orderName = request.getParameter("orderName");
		String productId = request.getParameter("productId");
		String orderQty = request.getParameter("orderQty");
		String orderAddress = request.getParameter("orderAddress");
		
		String name = "";
		int unitprice = 0;
		int unitsInstock = 0;
		
		try{
			String sql = "select name,unitprice,unitsInstock from product0203 where productId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			rs = pstmt.executeQuery();
			if(rs.next()){
				name = rs.getString(1);
				unitprice  = rs.getInt(2);
				unitsInstock  = rs.getInt(3);
			}else if(productId==null || orderQty!="0"){
				productId = "";
				orderDate = "2022-01-01";
				orderName = "";
				orderQty = "0";
				orderAddress = "";
				
			}else{
				productId = "";
				%><script>
					alert("등록되지 않은 상품코드입니다.");
					idchk();
				</script><%
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		if(Integer.parseInt(orderQty) < 0){
			orderQty = "0";
		}else if(Integer.parseInt(orderQty) > unitsInstock){
			orderQty = Integer.toString(unitsInstock);
			%><script>
				alert("주문 수량이 재고 수량보다 많습니다.");
			</script><%
		}
		int orderUnitprice = unitprice * Integer.parseInt(orderQty);
	%>
	<section>
		<h2>주문 정보 등록</h2>
		<form name="iu_form" method="post" action="order0203_insert.jsp">
			<hr><table id="iu_table">
				<tr>
					<th>주문일자</th>
					<td><input type="date" name="orderDate" value="<%=orderDate %>"></td>
					<th>주문자 이름</th>
					<td><input type="text" name="orderName" value="<%=orderName %>"></td>
				</tr>
				<tr>
					<th>상품코드</th>
					<td><input type="text" name="productId" onchange="idchk()" value="<%=productId %>"></td>
					<th>상 품 명</th>
					<td><input type="text" name="name" value="<%=name %>" readonly></td>
				</tr>
				<tr>
					<th>단 가</th>
					<td><input type="text" name="unitprice" value="<%=unitprice %>" readonly></td>
					<th>주문수량</th>
					<td><input type="number" name="orderQty" value="<%=orderQty %>" onchange="idchk()"></td>
				</tr>
				<tr>
					<th>주문금액</th>
					<td><input type="number" name="orderUnitprice" value="<%=orderUnitprice %>" readonly></td>
					<th>주문주소</th>
					<td><input type="text" name="orderAddress" value="<%=orderAddress %>"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="4">
						<button type="button" onclick="notry()">목록</button>
						<button type="button" onclick="orderin()">등록</button>
					</td>
				</tr>
				
			</table><hr>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>