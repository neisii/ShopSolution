<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sessionId = (String)session.getAttribute("loginedId");
boolean loginOn = sessionId == null ? false:true;
%> <!-- 로그인 여부 확인 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>글쓰기</title>
</head>
<body>

<%
if(loginOn==true){
	if(sessionId.equals("admin")){ //관리자 로그인
%>
<table id="square">
<tr>
<td valign="top" width="60%">
<form id="formID" class="formular" method="post" action="writeProc.jsp">
<table class="bd_list" style="table-layout:fixed;" width="430">
<tr>
	<th>분류</th>
	<td align="left">
		<select name="inCategory" id="selectCategory">
		<option value=분류>분류</option>
		<option value=공지>공지</option>
		<option value=일반>일반</option>
		<option value=질문>질문</option>
		</select>
	</td>
</tr>
<tr>
	<th>제목</th><td align="left"><input type="text" name="inTitle" width="25"/></td>
</tr>
<tr>
	<th>내용</th><td align="left" width="50"><textarea name="inContent" cols="25" rows="10" wrap="hard"></textarea></td>
</tr>
<tr>
<td colspan="2">	<div style="text-align:right;">
	<input type="submit" value="작성" name="write">
	</div></td>
</tr>
	</table>
	</form>
</td>
</tr>
</table>

<%
	}
	else{ //회원 로그인
%>
<table id="square">
<tr>
<td valign="top" width="60%">
<form id="formID" class="formular" method="post" action="writeProc.jsp">
<table class="cs_list">
<tr>
	<th>분류</th>
	<th align="left">
		<select name="inCategory" id="selectCategory">
		<option value=분류>분류</option>
		<option value=일반>일반</option>
		<option value=질문>질문</option>
		</select>
	</th>
</tr>
<tr>
	<th>제목</th ><th align="left"><textarea name="inTitle" cols="20" rows="1"></textarea></th>
</tr>
<tr>
	<th>내용</th ><th><textarea name="inContent" cols="40" rows="10"></textarea></th>
</tr>
	</table>
	<div style="text-align:right;">
	<input type="submit" value="작성" name="write">
	</div>
	</form>
</td>
</tr>
</table>
<%	
	}
}else{ //비 로그인  시도
	out.print("<script>"+"alert('로그인한 후 이용해주세요..'); self.close();"+"</script>");
	}
%>
</body>
</html>