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
		<h2>주문 목록(주문일자별 수량 및 금액 합계)</h2>
		<table id="s_table">
			<tr>
				<th width="200">No</th>
				<th width="200">주문일자</th>
				<th width="200">주문수량</th>
				<th width="200">주문금액</th>
			</tr>
			<%
			int no = 0;
			int totalOrderQty = 0;
			int totalUnitprice = 0;
			try{
				String sql = "select to_char(orderDate,'yyyy-mm-dd'),sum(orderQty),sum(unitprice*orderQty) from order0203 group by orderDate order by orderDate asc";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					no++;
					String orderDate = rs.getString(1);
					int orderQty = rs.getInt(2);
					int unitprice = rs.getInt(3);
					
					totalOrderQty = totalOrderQty + orderQty;
					totalUnitprice = totalUnitprice + unitprice;
					%>
					<tr>
						<td><%=no %></td>
						<td><%=orderDate %></td>
						<td class="cost"><%=fo.format(orderQty) %></td>
						<td class="cost"><%=fo.format(unitprice) %></td>
					</tr>
					<%
				}
				%>
				<tr>
					<td colspan="2">합 계</td>
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