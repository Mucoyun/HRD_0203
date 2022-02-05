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
	<style>
		p{
			width: 1300px;
			margin: 0 auto;
			padding: 0 !important;
		}a{
			color: blue;
			font-weight: bold;
		}a:HOVER{
			color: red;
			font-weight: bold;
		}
	</style>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		int no = 0;
		try{
			String sql = "select count(*) from order0203";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				no = rs.getInt(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>주문 목록</h2>
		<p>총 <%=no %>개의 주문정보가 있습니다.</p>
		<hr><table id="s_table">
			<tr>
				<th width="100">ID</th>
				<th width="100">주문일자</th>
				<th width="100">주문자 성명</th>
				<th width="100">상품번호</th>
				<th width="200">상품명</th>
				<th width="100">단가</th>
				<th width="100">주문수량</th>
				<th width="300">주문자 주소</th>
				<th width="100">구분</th>
			</tr>
			<%
			no = 0;
			try{
				String sql = "select to_char(a.orderDate,'yyyy-mm-dd'),a.orderName,a.productId,b.name,to_char(a.unitprice,'999,999,999,999'),a.orderQty,a.orderAddress from order0203 a,product0203 b where a.productId=b.productId order by orderDate asc";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					no++;
					String orderDate = rs.getString(1);
					String orderName = rs.getString(2);
					String productId = rs.getString(3);
					String name = rs.getString(4);
					String unitprice = rs.getString(5);
					String orderQty = rs.getString(6);
					String orderAddress = rs.getString(7);
					%>
					<tr>
						<td><%=no %></td>
						<td><%=orderDate %></td>
						<td><%=orderName %></td>
						<td><%=productId %></td>
						<td><%=name %></td>
						<td><%=unitprice %></td>
						<td><%=orderQty %></td>
						<td><%=orderAddress %></td>
						<td>
							<a href="/HRD_0203/order0203/order0203_update.jsp?send_orderDate=<%=orderDate %>&send_orderName=<%=orderName %>">수정</a>
							<span>|</span>
							<a href="/HRD_0203/order0203/order0203_delete.jsp?send_orderDate=<%=orderDate %>&send_orderName=<%=orderName %>"
							onclick="if(!confirm('정말로 삭제하겠습니까?')){return false;}">삭제</a>						
						</td>
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