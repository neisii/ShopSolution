<%@page import="sun.org.mozilla.javascript.internal.regexp.SubString"%>
<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.Statement"%>
<%@ page import ="java.sql.ResultSet"%>
<%@ page import ="java.sql.SQLException"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>
<%
String sessionId = (String)session.getAttribute("loginedId");
boolean loginOn = sessionId == null ? false:true;
%> <!-- 로그인 여부 확인 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정 중</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8"); //Set encoding
	String newpass = request.getParameter("newPass");
	String newadress = request.getParameter("newAdr");
	String newphone = request.getParameter("newPhone");
	String updateInfo = "update member set mPass ='"+ newpass +"', mAdress ='"+ newadress +"', mCall ='"+ newphone +"' where mID='"+ sessionId +"'";

	Connection conn = null;
	Statement stmt = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/shopdb";
		String dbUser = "root";
		String dbPass = "12345";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		
		stmt.executeUpdate(updateInfo);
		
		stmt.close();
		conn.close();
		
		out.print("<script>"+"alert('회원정보가 수정되었습니다.'); location.href='userInfo.jsp';"+"</script>");

	} catch (Exception e) {
		out.println(e);
	}

%>
</body>
</html>