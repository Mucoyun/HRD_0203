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
		String send_productId = request.getParameter("send_productId");
		
		try{
			String sql = "delete from product0203 where productId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_productId);
			
			pstmt.executeUpdate();
			%><script>
				alert("삭제가 완료되었습니다.");
				location.href = "/HRD_0203/product0203/product0203_select.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
	 %>
</body>
</html>