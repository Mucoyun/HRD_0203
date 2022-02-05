<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 23 -</title>
	<script>
		function signin() {
			location.href = "/HRD_0203/product0203/product0203_insert.jsp";
		}
	</script>
	<style>
		p{
			width: 1200px;
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
			String sql = "select count(*) from product0203";
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
		<h2>회원 목록</h2>
		<p>총 <%=no %>개의 상품이 있습니다.</p>
		<hr><table id="s_table">
			<tr>
				<th width="100">상품코드</th>
				<th width="100">상품명</th>
				<th width="100">단가</th>
				<th width="300">상세정보</th>
				<th width="100">제조사</th>
				<th width="200">분류</th>
				<th width="100">재고수</th>
				<th width="100">상태</th>
				<th width="100">구분</th>
			</tr>
			<%
			try{
				String sql = "select productId,name,unitprice,description,manufacturer,category,unitsInstock,condition from product0203";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					String productId = rs.getString(1);
					String name = rs.getString(2);
					String unitprice = rs.getString(3);
					String description = rs.getString(4);
					String manufacturer = rs.getString(5);
					String category = rs.getString(6);
					String unitsInstock = rs.getString(7);
					String condition = rs.getString(8);
					
					if(category.equals("10")){ category="it 제품"; }
					else if(category.equals("20")){ category="주방제품"; }
					else if(category.equals("30")){ category="전자제품"; }
					else if(category.equals("40")){ category="일반 잡화"; }
					
					%>
					<tr>
						<td><a href="/HRD_0203/product0203/product0203_update.jsp?send_productId=<%=productId %>"><%=productId %></a></td>
						<td><%=name %></td>
						<td><%=unitprice %></td>
						<td><%=description %></td>
						<td><%=manufacturer %></td>
						<td><%=category %></td>
						<td><%=unitsInstock %></td>
						<td><%=condition %></td>
						<td>
							<a href="/HRD_0203/product0203/product0203_delete.jsp?send_productId=<%=productId %>"
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
		<button id="btn" type="button" onclick="signin()">등록</button>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>