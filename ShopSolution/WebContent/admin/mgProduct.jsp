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

	<h2 id="caption">제품 목록</h2>
	<form method="post" action="addPd.jsp">
	<div style="text-align:right;">
		<input type="submit" value="제품 추가" name="add" />
	</div>
	</form>
	
	<!-- 아래부터 삭제 폼 -->
	<form id="formID" method="post" action="pdDel.jsp">
	<table class="cs_list">
	<tr>
		<th width="75">제품코드</th><th width="75">금액</th><th width="60">판매량</th>
		<th width="60">재고</th><!-- <th width="30">수정</th> --><th width="30">선택</th>
	</tr>
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
	
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcDriver = "jdbc:mysql://localhost:3306/shopdb";
			String dbUser = "root";
			String dbPass = "12345";
			
			String query = "select * from products order by pCode";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();
			
			//4. 쿼리 실행
			rs = stmt.executeQuery(query);
			
			//5. 쿼리 실행 결과 출력
			while(rs.next()) {
	%>
		<tr>
			<td><%= rs.getString("pCode") %></td>
			<td><%= rs.getString("pPrice") %>원</td>
			<td><%= rs.getString("pSales") %>대</td>
			<td><%= rs.getString("pStock") %>대</td>
			<td><input type="checkbox" name="checkedD" value="<%= rs.getString("pCode") %>" /></td>
	
		</tr>
		<!--퀴리 실행 결과로부터 데이터를 읽어옴 --> 
	
	<%
			}
		} catch(SQLException ex){
			// 에러 발생
			//out.println("<b>Error Detected</b><br>");
		}
	%>
	</table>
	<div style="text-align:right;">
		<input type="submit" value="삭제" name="ok" />
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
