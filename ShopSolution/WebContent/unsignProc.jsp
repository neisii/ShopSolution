<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.Statement"%>
<%@ page import ="java.sql.ResultSet"%>
<%@ page import ="java.sql.SQLException"%>
<%@ page import ="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String sessionId = (String)session.getAttribute("loginedId");
boolean loginOn = sessionId == null ? false:true;
%> <!-- 로그인 여부 확인 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴 처리</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	Connection conn = null;
	Statement stmt = null;

	String id = sessionId;
	String del = "delete from member where mID= '"+id+"'";
	String up = "update sales set sState='취소됨' where sID= '"+id+"'";
	String up2 = "update afterservice set aState='취소됨' where aID= '"+id+"'";
	String up3 = "update bbs set bID='Unknown' where bID= '"+id+"'";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/shopdb";
		String dbUser = "root";
		String dbPass = "12345";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		
		stmt.executeUpdate(up);
		stmt.executeUpdate(up2);
		stmt.executeUpdate(up3);
		stmt.executeUpdate(del); //회원정보 삭제
		session.invalidate(); //모든 세션값 삭제	 
		out.print("<script>"+"alert('탈퇴처리되었습니다.'); self.close(); location.href='index.jsp';"+"</script>");

		stmt.close();
		conn.close();

	} catch (Exception e) {
		out.println(e);
	}
%>
</body>
</html>