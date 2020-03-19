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


<h2 id="caption">제품 목록</h2>
<table class="pd_list">
<tr>
	<th>제품코드</th><th>가격</th><th>판매량</th><th>재고</th>
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
		rs = stmt.executeQuery(query);
		
		while(rs.next()) {
%>
	<tr>
		<td><%= rs.getString("pCode") %></td>
		<td><%= rs.getString("pPrice")+"원"%></td>
		<td><%= rs.getString("pSales")+"개" %></td>
		<td><%= rs.getString("pStock")+"개" %></td>
	</tr>
	<!--퀴리 실행 결과로부터 데이터를 읽어옴 --> 

<%
		}
	} catch(SQLException e){
		rs.close();
		stmt.close();
		conn.close();
	}
%>
	</table>
	
	
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
