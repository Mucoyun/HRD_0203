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
		String orderDate = request.getParameter("orderDate");
		String orderName = request.getParameter("orderName");
		String productId = request.getParameter("productId");
		String unitprice = request.getParameter("unitprice");
		String orderQty = request.getParameter("orderQty");
		String orderAddress = request.getParameter("orderAddress"); //7
		
		int unitsInstock;
		int getOrderQty;

		try{
			String sql = "select a.unitsInstock,b.orderQty from product0203 a,order0203 b where a.productId=b.productId and a.productId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			rs = pstmt.executeQuery();
			if(rs.next()){
				unitsInstock = rs.getInt(1); //5
				getOrderQty = rs.getInt(2); //5
			}else{
				unitsInstock = 0;
				getOrderQty = 0;
			}
			
			int resultUnitsInstock = (unitsInstock+getOrderQty)-Integer.parseInt(orderQty);
			
			sql = "update product0203 set unitsInstock=? where productId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resultUnitsInstock);
			pstmt.setString(2, productId);
			pstmt.executeUpdate();
			
			sql = "update order0203 set productId=?,unitprice=?,orderQty=?,orderAddress=? where orderDate=? and orderName=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			pstmt.setString(2, unitprice);
			pstmt.setString(3, orderQty);
			pstmt.setString(4, orderAddress);
			pstmt.setString(5, orderDate);
			pstmt.setString(6, orderName);
			pstmt.executeUpdate();
			
			%><script>
				alert("수정이 완료되었습니다.");
				location.href = "/HRD_0203/index.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
	 %>
</body>
</html>