<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="/style.css" type="text/css" />
<title>휴대폰 판매 1위! 봉돌 전자!</title>
</head>

<body>
<div id="middle">
<jsp:include page="loginCheck.jsp"/>
<!-- 로그인 여부를 체크하여 경우에 따른 메뉴를 출력함 -->

<table id="square">
<tr>
<td valign="top" width="0">
	<!--SUB_MENU-->
</td>
<td valign="top" width="20%">
	<jsp:include page="pdTop10.jsp"/>
</td>
<td valign="top" width="60%">
	<jsp:include page="bbsView.jsp"/>
</td>
<td valign="top" width="20%">
	<jsp:include page="news.jsp"/>
</td>
</tr>
</table>

<br clear="all" />
<br />
<div id="copy_area">
<jsp:include page="copy.html"/>
</div>
</div>

</body>
</html>
