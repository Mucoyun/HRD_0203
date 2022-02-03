<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 23 -</title>
	<script>
		function signin() {
			if(document.iu_form.name.value==""){
				alert("이름을 입력하세요.");
				document.iu_form.name.focus();
			}else if(document.iu_form.pass.value==""){
				alert("비밀번호를 입력하세요.");
				document.iu_form.pass.focus();
			}else if(document.iu_form.repass.value==""){
				alert("확인 비밀번호를 입력하세요.");
				document.iu_form.repass.focus();
			}else if(document.iu_form.pass.value!=document.iu_form.repass.value){
				alert("비밀번호와 확인비밀번호가 일치하지 않습니다.");
				document.iu_form.repass.focus();
			}else{
				document.iu_form.submit();
			}
		}
		function notry() {
			location.href = "/HRD_0203/member0203/member0203_select.jsp";		}
		function mailSelector(email3) {
			console.log(email3.value);
			if(email3.value=="self"){
				document.iu_form.email2.value="";
			}else{
				document.iu_form.email2.value=email3.value;
			}
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		String send_id = request.getParameter("send_id");
	
		try{
			String sql = "select id,name,password,gender,to_char(birth,'yyyy-mm-dd'),email,phone,address,interest from member0203 where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String id = rs.getString(1);
				String name = rs.getString(2);
				String pass = rs.getString(3);
				String gender = rs.getString(4);
				String birth = rs.getString(5);
				String email = rs.getString(6);
				String phone = rs.getString(7);
				String address = rs.getString(8);
				String interest = rs.getString(9);
				
				
				String[] births = birth.split("-");
				String[] emails = email.split("@");
				String[] interests = interest.split(","); 
			%>
	<section>
		<h2>회원 정보 수정 화면</h2>
		<form name="iu_form" method="post" action="member0203_update_process.jsp">
			<hr><table id="iu_table">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" value="<%=id %>" readonly></td>
				</tr>
				<tr>
					<th>성 명</th>
					<td><input type="text" name="name" value="<%=name %>"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pass" value="<%=pass %>"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="repass" value="<%=pass %>"></td>
				</tr>
				<tr>
					<th>성 별</th>
					<td>
						<input type="radio" name="gender" value="1" <%if(gender.equals("1")){ %> checked <% } %>> 남성
						<input type="radio" name="gender" value="2" <%if(gender.equals("2")){ %> checked <% } %>> 여성
					</td>
				</tr>
				<tr>
					<th>생 일</th>
					<td>
						<input type="number" name="birth1" value="<%=births[0]%>"> 년
						<input type="number" name="birth2" value="<%=births[1]%>"> 월
						<input type="number" name="birth3" value="<%=births[2]%>"> 일
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="email1" placeholder="이메일" value="<%=emails[0] %>">@
						<input type="text" name="email2" value="<%=emails[1] %>">
						<select name="email3" onchange="mailSelector(this)">
							<option value="" <%if(emails[1].equals("1")){ %> selected <% } %>>선택하세요</option>
							<option value="self" <%if(emails[1].equals("self")){ %> selected <% } %>>직접입력</option>
							<option value="naver.com" <%if(emails[1].equals("naver.com")){ %> selected <% } %>>naver.com</option>
							<option value="daum.net" <%if(emails[1].equals("daum.net")){ %> selected <% } %>>daum.net</option>
							<option value="nate.com" <%if(emails[1].equals("nate.com")){ %> selected <% } %>>nate.com</option>
							<option value="hanmail.com" <%if(emails[1].equals("hanmail.com")){ %> selected <% } %>>hanmail.com</option>
							<option value="gmail.com" <%if(emails[1].equals("gmail.com")){ %> selected <% } %>>gmail.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="phone" value="<%=phone %>"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" value="<%=address %>"></td>
				</tr>
				<tr>
					<th>관심분야</th>
					<td>
						<input type="checkbox" name="interest" value="프로그램" <%for(String i : interests){if(i.equals("프로그램")){ %> checked <% }} %>> 프로그램
						<input type="checkbox" name="interest" value="독서" <%for(String i : interests){if(i.equals("독서")){ %> checked <% }} %>> 독서
						<input type="checkbox" name="interest" value="등산" <%for(String i : interests){if(i.equals("등산")){ %> checked <% }} %>> 등산
						<input type="checkbox" name="interest" value="여행" <%for(String i : interests){if(i.equals("여행")){ %> checked <% }} %>> 여행
						<input type="checkbox" name="interest" value="컴퓨터" <%for(String i : interests){if(i.equals("컴퓨터")){ %> checked <% }} %>> 컴퓨터
						<input type="checkbox" name="interest" value="영화" <%for(String i : interests){if(i.equals("영화")){ %> checked <% }} %>> 영화
						<input type="checkbox" name="interest" value="운동" <%for(String i : interests){if(i.equals("운동")){ %> checked <% }} %>> 운동
						<input type="checkbox" name="interest" value="진학" <%for(String i : interests){if(i.equals("진학")){ %> checked <% }} %>> 진학
					</td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="signin()">수정</button>
						<button type="button" onclick="notry()">취소</button>
					</td>
				</tr>
				
			</table><hr>
		</form>
	</section>
	<%
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<%@ include file="/footer.jsp" %>
</body>
</html>