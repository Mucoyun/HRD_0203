<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 23 -</title>
	<script>
		function signin() {
			location.href = "/HRD_0203/store0203/store0203_insert.jsp";
		}
	</script>
	<style>
		p{
			width: 1000px;
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
			String sql = "select count(*) from store0203";
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
		<h2>거래처 목록</h2>
		<p>총 <%=no %>개의 거래처가 있습니다.</p>
		<hr><table id="s_table">
			<tr>
				<th width="100">No</th>
				<th width="100">거래처 코드</th>
				<th width="100">거래처 이름</th>
				<th width="300">거래처 전화번호</th>
				<th width="300">거래처 주소</th>
				<th width="100">구분</th>
			</tr>
			<%
			no = 0;
			try{
				String sql = "select storeNo,storeName,storeTel,storeAddress from store0203 order by storeNo";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					no++;
					String storeNo = rs.getString(1);
					String storeName = rs.getString(2);
					String storeTel = rs.getString(3);
					String storeAddress = rs.getString(4);
					
					%>
					<tr>
						<td><%=no %></td>
						<td><a href="/HRD_0203/store0203/store0203_update.jsp?send_storeNo=<%=storeNo %>"><%=storeNo %></a></td>
						<td><%=storeName %></td>
						<td><%=storeTel %></td>
						<td><%=storeAddress %></td>
						<td>
							<a href="/HRD_0203/store0203/store0203_delete.jsp?send_storeNo=<%=storeNo %>"
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