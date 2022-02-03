<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 23 -</title>
	<script>
		function signin() {
			
			if(document.iu_form.productId.value==""){
				alert("상품코드를 입력하세요.");
				document.iu_form.productId.focus();
			}else if(document.iu_form.name.value==""){
				alert("상품명을 입력하세요.");
				document.iu_form.name.focus();
			}else if(document.iu_form.name.value.length<4 || document.iu_form.name.value.length>50){
				alert("[상품명]\n최소 4자에서 최대 50자리까지 입력하세요.");
				document.iu_form.name.focus();
			}else if(document.iu_form.unitprice.value==""){
				alert("가격을 입력하세요.");
				document.iu_form.unitprice.focus();
			}else if(isNaN((document.iu_form.unitprice.value))){
				alert("[가격]\n숫자만 입력하세요.");
				document.iu_form.unitprice.focus();
			}else if(document.iu_form.unitprice.value < 0){
				alert("[가격]\n음수를 입력할 수 없습니다.");
				document.iu_form.unitprice.focus();
			}else if(isNaN((document.iu_form.unitsInstock.value))){
				alert("[재고]\n숫자만 입력하세요.");
				document.iu_form.unitsInstock.focus();
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
	<section>
		<h2>상품 등록 화면</h2>
		<form name="iu_form" method="post" action="product0203_insert_process.jsp">
			<hr><table id="iu_table">
				<tr>
					<th>상품코드</th>
					<td><input type="text" name="productId"></td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="unitprice"></td>
				</tr>
				<tr>
					<th>상세정보</th>
					<td><input type="text" name="description"></td>
				</tr>
				<tr>
					<th>제조사</th>
					<td><input type="text" name="manufacturer"></td>
				</tr>
				<tr>
					<th>분류</th>
					<td>
						<select id="pSelect" name="category">
							<option value="10" selected>it 제품</option>
							<option value="20">주방 제품</option>
							<option value="30">전자 제품</option>
							<option value="40">일반 잡화</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>재고수</th>
					<td><input type="text" name="unitsInstock"></td>
				</tr>
				<tr>
					<th>상태</th>
					<td>
						<input type="radio" name="condition" value="신규제품" checked> 신규 제품
						<input type="radio" name="condition" value="중고제품"> 중고 제품
						<input type="radio" name="condition" value="재생제품"> 재생 제품
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