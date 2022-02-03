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
		String productId = request.getParameter("productId");
		String name = request.getParameter("name");
		String unitprice = request.getParameter("unitprice");
		String description = request.getParameter("description");
		String category = request.getParameter("category");
		
		String manufacturer = request.getParameter("manufacturer");
		String unitsInstock = request.getParameter("unitsInstock");
		String condition = request.getParameter("condition");
		
		try{
			String sql = "insert into product0203 values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			pstmt.setString(2, name);
			pstmt.setString(3, unitprice);
			pstmt.setString(4, description);
			pstmt.setString(5, category);
			pstmt.setString(6, manufacturer);
			pstmt.setString(7, unitsInstock);
			pstmt.setString(8, condition);
			
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