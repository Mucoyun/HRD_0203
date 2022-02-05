<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 23 -</title>
	<script>
		function signin() {
			var interestChk = chkBox();
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
			}else if(!interestChk){
				alert("취미를 하나이상 체크하세요.");
			}else{
				document.iu_form.submit();
			}
		}
		function notry() {
			document.iu_form.reset();
		}
		function mailSelector(email3) {
			console.log(email3.value);
			if(email3.value=="self"){
				document.iu_form.email2.value="";
			}else{
				document.iu_form.email2.value=email3.value;
			}
		}
		
		function chkBox() {
			var interestChk = false;
			var arr_interest = document.getElementsByName("interest");
			for(var i=0; i< arr_interest.length; i++){
				if(arr_interest[i].checked == true){
					interestChk = true;
					break;
				}
			}
			return interestChk;
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		int id = 0;
		try{
			String sql = "select max(id) from member0203";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				id = rs.getInt(1);
				id++;
			}else{
				id = 20200001;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>회원 가입 등록 화면</h2>
		<form name="iu_form" method="post" action="member0203_insert_process.jsp">
			<hr><table id="iu_table">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" value="<%=id %>" readonly>(마지막번호 +1)</td>
				</tr>
				<tr>
					<th>성 명</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pass"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="repass"></td>
				</tr>
				<tr>
					<th>성 별</th>
					<td>
						<input type="radio" name="gender" value="1" checked> 남성
						<input type="radio" name="gender" value="2"> 여성
					</td>
				</tr>
				<tr>
					<th>생 일</th>
					<td>
						<input type="number" name="birth1" value="2022"> 년
						<input type="number" name="birth2" value="01"> 월
						<input type="number" name="birth3" value="01"> 일
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="email1" placeholder="이메일">@
						<input type="text" name="email2">
						<select name="email3" onchange="mailSelector(this)">
							<option value="">선택하세요</option>
							<option value="self">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
							<option value="hanmail.com">hanmail.com</option>
							<option value="gmail.com">gmail.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<th>관심분야</th>
					<td>
						<input type="checkbox" name="interest" value="프로그램"> 프로그램
						<input type="checkbox" name="interest" value="독서"> 독서
						<input type="checkbox" name="interest" value="등산"> 등산
						<input type="checkbox" name="interest" value="여행"> 여행
						<input type="checkbox" name="interest" value="컴퓨터"> 컴퓨터
						<input type="checkbox" name="interest" value="영화"> 영화
						<input type="checkbox" name="interest" value="운동"> 운동
						<input type="checkbox" name="interest" value="진학"> 진학
					</td>
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