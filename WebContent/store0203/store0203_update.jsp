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
			location.href="/HRD_0203/store0203/store0203_select.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		String send_storeNo = request.getParameter("send_storeNo");
		String storeNo = "";
		String storeName = "";
		String storeTel = "";
		String[] storeTels = {};
		
		String storeAddress = "";
	
		try{
			String sql = "select storeNo,storeName,storeTel,storeAddress from store0203 where storeNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_storeNo);
			rs = pstmt.executeQuery();
			if(rs.next()){
				storeNo = rs.getString(1);
				storeName = rs.getString(2);
				storeTel = rs.getString(3);
				storeAddress = rs.getString(4);
				
				storeTels = storeTel.split("-");
			}
		}catch(SQLException e){
			e.printStackTrace();	
		}
	%>
	<section>
		<h2>거래처 수정 화면</h2>
		<form name="iu_form" method="post" action="store0203_update_process.jsp">
			<hr><table id="iu_table">
				<tr>
					<th>거래처코드</th>
					<td><input type="text" name="storeNo" value="<%=storeNo %>" readonly>(sequence 발생)</td>
				</tr>
				<tr>
					<th>거래처 이름</th>
					<td><input type="text" name="storeName" value="<%=storeName %>"></td>
				</tr>
				<tr>
					<th>거래처 전화번호</th>
					<td>
						<select name="storeTel1">
							<option value="02" <%if(storeTels[0].equals("02")){ %> selected <% } %>>서울(02)</option>
							<option value="031" <%if(storeTels[0].equals("031")){ %> selected <% } %>>경기(031)</option>
							<option value="032" <%if(storeTels[0].equals("032")){ %> selected <% } %>>인천(032)</option>
							<option value="033" <%if(storeTels[0].equals("033")){ %> selected <% } %>>강원(033)</option>
							<option value="041" <%if(storeTels[0].equals("041")){ %> selected <% } %>>충남(041)</option>
							<option value="042" <%if(storeTels[0].equals("042")){ %> selected <% } %>>대전(042)</option>
							<option value="043" <%if(storeTels[0].equals("043")){ %> selected <% } %>>충북(043)</option>
							<option value="044" <%if(storeTels[0].equals("044")){ %> selected <% } %>>세종(044)</option>
							<option value="051" <%if(storeTels[0].equals("051")){ %> selected <% } %>>부산(051)</option>
							<option value="052" <%if(storeTels[0].equals("052")){ %> selected <% } %>>울산(052)</option>
							<option value="053" <%if(storeTels[0].equals("053")){ %> selected <% } %>>대구(053)</option>
							<option value="054" <%if(storeTels[0].equals("054")){ %> selected <% } %>>경북(054)</option>
							<option value="055" <%if(storeTels[0].equals("055")){ %> selected <% } %>>경남(055)</option>
							<option value="061" <%if(storeTels[0].equals("061")){ %> selected <% } %>>전남(061)</option>
							<option value="062" <%if(storeTels[0].equals("062")){ %> selected <% } %>>광주(062)</option>
							<option value="063" <%if(storeTels[0].equals("063")){ %> selected <% } %>>전북(063)</option>
							<option value="064" <%if(storeTels[0].equals("064")){ %> selected <% } %>>제주(064)</option>
						</select>-
						<input type="text" name="storeTel2" value="<%=storeTels[1] %>">-
						<input type="text" name="storeTel3" value="<%=storeTels[2] %>">
					</td>
				</tr>
				<tr>
					<th>거래처주소</th>
					<td><input type="text" name="storeAddress" value="<%=storeAddress %>"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="signin()">변경</button>
						<button type="button" onclick="notry()">취소</button>
					</td>
				</tr>
				
			</table><hr>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>