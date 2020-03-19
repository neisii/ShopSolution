<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/ShopSolution/style.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제품 추가</title>
</head>
<body>
<div id="middle">
<jsp:include page="../loginCheck.jsp"/>
<!-- 로그인 여부를 체크하여 경우에 따른 메뉴를 출력함 -->

<table id="square">
<tr>
<td valign="top" width="0">
	<!--SUB_MENU-->
</td>
<td valign="top" width="20%">
	<jsp:include page="../pdTop10.jsp"/>
</td>
<td valign="top" width="60%">
	<h2 id="caption">제품 추가</h2>
<form id="formID" class="formular" method="post" action="addPdProc.jsp">
<table class="cs_list">
<tr>
	<th>제품코드</th><th>금액</th><th>재고</th>
</tr>
	<tr>
		<td><input value="" type="text" name="pl_code" size="10"/></td>
		<td><input value="" type="text" name="pl_price" size="10"/>원</td>
		<td><input value="" type="text" name="pl_stock" size="5"/>대</td>
	</tr>
	<!--퀴리 실행 결과로부터 데이터를 읽어옴 --> 
	</table>
	<div style="text-align:right;">
	<input type="submit" value="추가" name="add">
	</div>
	</form>

</td>
<td valign="top" width="20%">
	<jsp:include page="../news.jsp"/>
</td>
</tr>
</table>

<br clear="all" />
<br />
<div id="copy_area">
<jsp:include page="../copy.html"/>
</div>
</div>

</body>
</html>