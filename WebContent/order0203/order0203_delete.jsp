<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 23 -</title>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%
		String send_orderDate = request.getParameter("send_orderDate");
		String send_orderName = request.getParameter("send_orderName");
		
		int unitsInstock = 0;
		int orderQty = 0;
		String productId = "";
		
		try{
			//기존 재고값 과 주문재고값을 가저온후 더하여 기존재고값을 업데이트 해주기. 
			String sql = "select a.unitsInstock,b.orderQty,b.productId from product0203 a,order0203 b where a.productId=b.productId and b.orderDate=? and b.orderName=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_orderDate);
			pstmt.setString(2, send_orderName);
			rs = pstmt.executeQuery();
			if(rs.next()){
				unitsInstock = rs.getInt(1);
				orderQty = rs.getInt(2);
				productId = rs.getString(3);
			}else{
				%><script>
					alert("주문 정보 삭제가 실패되었습니다.");
					location.href = "/HRD_0203/order0203/order0203_select.jsp";
				</script><%
			}
			
			sql = "update product0203 set unitsInstock=? where productId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, unitsInstock+orderQty);
			pstmt.setString(2, productId);
			pstmt.executeUpdate();
			
			
			sql = "delete from order0203 where orderDate=? and orderName=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_orderDate);
			pstmt.setString(2, send_orderName);
			
			pstmt.executeUpdate();
			%><script>
				alert("삭제가 완료되었습니다.");
				location.href = "/HRD_0203/order0203/order0203_select.jsp";
			</script><%
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	 %>
</body>
</html>