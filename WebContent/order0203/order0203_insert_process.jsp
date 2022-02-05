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
		String orderAddress = request.getParameter("orderAddress");
		int unitsInstock;
		
		try{
			String sql = "select unitsInstock from product0203 where productId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			rs = pstmt.executeQuery();
			if(rs.next()){
				unitsInstock = rs.getInt(1);
			}else{
				unitsInstock = 0;
			}
			
			sql = "update product0203 set unitsInstock=? where productId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, unitsInstock-Integer.parseInt(orderQty));
			pstmt.setString(2, productId);
			pstmt.executeUpdate();
			
			
			sql = "insert into order0203 values(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderDate);
			pstmt.setString(2, orderName);
			pstmt.setString(3, productId);
			pstmt.setString(4, unitprice);
			pstmt.setString(5, orderQty);
			pstmt.setString(6, orderAddress);
			pstmt.executeUpdate();
			
			
			%><script>
				alert("등록이 완료되었습니다.");
				location.href = "/HRD_0203/index.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
	 %>
</body>
</html>