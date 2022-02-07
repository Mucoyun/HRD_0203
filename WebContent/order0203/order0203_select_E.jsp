<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 23 -</title>
	<script>
		function signin() {
			location.href = "/HRD_0203/order0203/order0203_insert.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<% DecimalFormat fo = new DecimalFormat("###,###,###"); %>
	<section>
		<h2>주문 목록(주문일자 / 상품별)</h2>
		<table id="s_table">
			<tr>
				<th width="200">No</th>
				<th width="200">주문일자</th>
				<th width="200">상품번호</th>
				<th width="200">상품명</th>
				<th width="200">주문수량</th>
				<th width="200">주문금액</th>
			</tr>
			<%
			int no = 0;
			int totalOrderQty = 0;
			int totalUnitprice = 0;
			try{
				String sql = "select a.ProductId,b.name,to_char(a.orderDate,'yyyy-mm-dd'),sum(a.orderQty),sum(a.unitprice*a.orderQty) from order0203 a,product0203 b where a.ProductId=b.ProductId group by a.ProductId,b.name,a.orderDate order by a.productId asc,b.name asc,a.orderDate asc";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					no++;
					String ProductId = rs.getString(1);
					String name = rs.getString(2);
					String orderDate = rs.getString(3);
					int orderQty = rs.getInt(4);
					int unitprice = rs.getInt(5);
					
					totalOrderQty = totalOrderQty + orderQty;
					totalUnitprice = totalUnitprice + unitprice;
					%>
					<tr>
						<td><%=no %></td>
						<td><%=ProductId %></td>
						<td><%=name %></td>
						<td><%=orderDate %></td>
						<td class="cost"><%=fo.format(orderQty) %></td>
						<td class="cost"><%=fo.format(unitprice) %></td>
					</tr>
					<%
				}
				%>
				<tr>
					<td colspan="4">합 계</td>
					<td class="cost"><%=fo.format(totalOrderQty) %></td>
				<td class="cost"><%=fo.format(totalUnitprice) %></td>
				</tr>
				<%
			}catch(SQLException e){
				e.printStackTrace();
			}
			%>
		</table>
		<button id="btn" type="button" onclick="signin()">작성</button>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>