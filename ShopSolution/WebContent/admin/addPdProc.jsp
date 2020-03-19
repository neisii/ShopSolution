<%@page import="javax.print.DocFlavor.STRING"%>
<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.Statement"%>
<%@ page import ="java.sql.ResultSet"%>
<%@ page import ="java.sql.SQLException"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>
<%@ page import ="java.text.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제품 추가</title>
</head>
<body>

<%
	Connection conn = null;
	Statement stmt = null;
	//ResultSet rs = null;
	
	request.setCharacterEncoding("utf-8"); //Set encoding
	String pl_code = request.getParameter("pl_code");
	String pl_price = request.getParameter("pl_price");
	String pl_stock = request.getParameter("pl_stock");
	
	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/shopdb";
		String dbUser = "root";
		String dbPass = "12345";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		String query = "insert into products(pCode, pPrice, pStock, pSales)value('"
				+ pl_code + "','" + pl_price + "','" + pl_stock + "','0')";
		stmt.executeUpdate(query);
		
		stmt.close();
		conn.close();

	} catch (Exception e) {
		out.println(e);
	}
	out.print("<script>"+"alert('제품코드 "+pl_code+"이 추가되었습니다.'); location.href='mgProduct.jsp';"+"</script>");

			
%>
</body>
</html>