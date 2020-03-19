<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.Statement"%>
<%@ page import ="java.sql.ResultSet"%>
<%@ page import ="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="/ShopSolution/style.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>휴대폰 판매 1위! 봉돌 전자!</title>
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

	<h2 id="caption">회원 관리</h2>
	<form id="formID" class="formular" method="post" action="delMember.jsp">
			삭제할 회원을 선택하세요.
			<table class="cs_list">
			<tr>
				<th>아이디</th><th>이름</th><th>성별</th><th>주소</th><th>연락처</th><th>회원등급</th><th>가입일</th><th width="30">선택</th>
				</tr>
				<%
				//1. JDBC 드라이버 로딩
				Class.forName("com.mysql.jdbc.Driver");

				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;

				try{String jdbcDriver = "jdbc:mysql://localhost:3306/shopdb";
					String dbUser = "root";
					String dbPass = "12345";
					
						String query = "select * from member where not mID='admin' order by mID";
						conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
						stmt = conn.createStatement();
						
						rs = stmt.executeQuery(query);
						
						while(rs.next()) {
			%>
						<tr>
						<td><%= rs.getString("mID") %></td>
						<td><%= rs.getString("mName")%></td>
						<td><%= rs.getString("mGender") %></td>
						<td><%= rs.getString("mAdress") %></td>
						<td><%= rs.getString("mCall") %></td>
						<td><%= rs.getString("membership") %></td>
						<td><%= rs.getString("signupDate") %></td>
						<td align="center"><input type="checkbox" name="checked" value=<%= rs.getString("mID") %> /></td>
						
						</tr>
						<!--퀴리 실행 결과로부터 데이터를 읽어옴 -->
					<%
						}
					} catch(SQLException ex){
						// 에러 발생
						}
					%>
			</table>
			<div style="text-align:right;">
			<input type="submit" value="삭제" name="delete" />
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
