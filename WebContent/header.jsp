<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 23 -</title>
	<style>
		*{
			margin: 0; padding: 0;
		}html,body{
			width: 100%; height: 100%;
		}a{
			text-decoration: none;
		}table{
			border: 3px solid black;
			margin: 0 auto;
			border-collapse: collapse;
		}tr,th,td{
			border: 1px solid black;
		}
		
		header{
			width: 100%; height: 15%;
			color: black; background-color: lightgray;
			text-align: center; display: table; 
		}header > h1{
			display: table-cell;
			vertical-align: middle;
			font-size: 3vw;
		}
		
		nav{
			width: 10%; height: 80%;
			color: white; background-color: black;
			text-align: center; display: table;
			float: left;
		}nav > ul{
			display: table-cell;
			vertical-align: top;
			list-style: none;
		}nav > ul li{
			display: block;
			font-size: 1vh;
			margin: 20px 0;
		}nav > ul li > a{
			color: white;
		}nav > ul li > a:HOVER {
			color: red;
		}
		
		section{
			width: 90%; height: 80%;
			color: black; background-color: white;
			float: left;
		}section > h2{
			text-align: center;
			padding: 20px 0;
		}section > p{
			font-weight: bold;
			padding-left: 40px;
		}section > ol{
			padding-left: 40px;
		}
		
		footer{
			width: 100%; height: 5%;
			color: white; background-color: gray;
			text-align: center; display: table;
			clear: both;
		}footer > h3{
			display: table-cell;
			vertical-align: middle;
			font-size: 1vw;
		}
	</style>
	<style>
		#iu_table tr{
			height: 30px;
		}#iu_table th{
			width: 200px;
		}#iu_table td{
			width: 600px;
		}
		
		#iu_table input[type="text"]{
			height: 25px;
			width: 200px;
		}#iu_table input[type="password"]{
			height: 25px;
			width: 300px;
		}#iu_table input[type="number"]{
			height: 25px;
			width: 50px;
		}#iu_table select{
			height: 25px;
			width: 100px;
		}
		
		#btntd{
			text-align: center;
		}#btntd button{
			height: 25px;
			width: 150px;
			background-color: black;
			color: white;
		}
	</style>
	<style>
		#s_table tr{
			height: 30px;
		}#s_table td{
			text-align: center;
		}
		#btn{
			display: block;
			margin: 20px auto;
			height: 30px;
			width: 150px;
			background-color: black;
			color: white;
		}
	</style>
</head>
<body>
	<header>
		<h1>쇼핑몰에 오신 것을 환영합니다.</h1>
	</header>
</body>
</html>