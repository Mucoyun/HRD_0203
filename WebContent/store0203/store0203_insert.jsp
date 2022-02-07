<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 23 -</title>
	<script>
		function signin() {
			if(document.iu_form.storeName.value==""){
				alert("거래처 이름을 입력하세요.");
				document.iu_form.storeName.focus();
			}else{
				document.iu_form.submit();
			}
		}
		function notry() {
			document.iu_form.reset();
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		int storeNo = 0;
		try{
			String sql = "select store0203_seq.nextval from dual";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				storeNo = rs.getInt(1);	
			}
		}catch(SQLException e){
			e.printStackTrace();	
		}
	%>
	<section>
		<h2>거래처 등록 화면</h2>
		<form name="iu_form" method="post" action="store0203_insert_process.jsp">
			<hr><table id="iu_table">
				<tr>
					<th>거래처코드</th>
					<td><input type="text" name="storeNo" value="<%=storeNo %>" readonly>(sequence 발생)</td>
				</tr>
				<tr>
					<th>거래처 이름</th>
					<td><input type="text" name="storeName"></td>
				</tr>
				<tr>
					<th>거래처 전화번호</th>
					<td>
						<select name="storeTel1">
							<option value="02">서울(02)</option>
							<option value="031">경기(031)</option>
							<option value="032">인천(032)</option>
							<option value="033">강원(033)</option>
							<option value="041">충남(041)</option>
							<option value="042">대전(042)</option>
							<option value="043">충북(043)</option>
							<option value="044">세종(044)</option>
							<option value="051">부산(051)</option>
							<option value="052">울산(052)</option>
							<option value="053">대구(053)</option>
							<option value="054">경북(054)</option>
							<option value="055">경남(055)</option>
							<option value="061">전남(061)</option>
							<option value="062">광주(062)</option>
							<option value="063">전북(063)</option>
							<option value="064">제주(064)</option>
						</select>-
						<input type="text" name="storeTel2">-
						<input type="text" name="storeTel3">
					</td>
				</tr>
				<tr>
					<th>거래처주소</th>
					<td><input type="text" name="storeAddress"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="signin()">등록</button>
						<button type="button" onclick="notry()">취소</button>
					</td>
				</tr>
				
			</table><hr>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>