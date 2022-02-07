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
		String storeNo = request.getParameter("storeNo");
		String storeName = request.getParameter("storeName");
		String storeTell = request.getParameter("storeTel1");
		String storeTel2 = request.getParameter("storeTel2");
		String storeTel3 = request.getParameter("storeTel3");
		String storeTel = storeTell + "-" + storeTel2 + "-" + storeTel3;
		
		String storeAddress = request.getParameter("storeAddress");
		
		try{
			String sql = "update store0203 set storeName=?,storeTel=?,storeAddress=? where storeNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, storeName);
			pstmt.setString(2, storeTel);
			pstmt.setString(3, storeAddress);
			pstmt.setString(4, storeNo);
			
			pstmt.executeUpdate();
			%><script>
				alert("거래처 수정이 완료되었습니다.");
				location.href = "/HRD_0203/index.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
	 %>
</body>
</html>