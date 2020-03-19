<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.Statement"%>
<%@ page import ="java.sql.ResultSet"%>
<%@ page import ="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매 순위 TOP10</title>
</head>
<body>
	<h2 id="caption">제품 TOP10</h2>
<table class="pd_list">
<tr>
	<th>제품코드</th>
</tr>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String pl_code = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/shopdb";
		String dbUser = "root";
		String dbPass = "12345";
		
		String query = "select * from products order by pSales desc limit 10";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		
			while (rs.next()) {
					pl_code = rs.getString("pCode");

	 	%>
	<tr>
		<td>
		<%=pl_code%>
		</td>
	</tr>
<%		
		}
			rs.close();
			stmt.close();
			conn.close();
	 	} catch (SQLException e) {
	 		out.println(e);
	 	}
	 %>
	</table>

</body>
</html>