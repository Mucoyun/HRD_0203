<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			try{
				String sql = "select to_char(orderDate,'yyyy-mm-dd'),to_char(sum(orderQty),'999,999,999'),to_char(sum(unitprice),'999,999,999') from order0203 group by orderDate order by orderDate asc";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					no++;
					String orderDate = rs.getString(1);
					String orderQty = rs.getString(2);
					String unitprice = rs.getString(3);
					
					
					
					%>
					<tr>
						<td><%=no %></td>
						<td><%=orderDate %></td>
						<td class="cost"><%=orderQty %></td>
						<td class="cost"><%=unitprice %></td>
					</tr>
					<%
				}
				
				sql = "select to_char(sum(orderQty),'999,999,999'),to_char(sum(unitprice),'999,999,999') from order0203";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					String tatalOrderQty = rs.getString(1);
					String tatalUnitprice = rs.getString(2);
					%>
					<tr>
						<td colspan="2">합 계</td>
						<td class="cost"><%=tatalOrderQty %></td>
						<td class="cost"><%=tatalUnitprice %></td>
					</tr>
					<%
				}
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