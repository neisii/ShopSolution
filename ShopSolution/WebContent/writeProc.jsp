<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.Statement"%>
<%@ page import ="java.sql.ResultSet"%>
<%@ page import ="java.sql.SQLException"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String sessionId = (String)session.getAttribute("loginedId");
boolean loginOn = sessionId == null ? false:true;
%> <!-- 로그인 여부 확인 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글작성 중</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");
	Date now = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyMMdd", Locale.KOREA);
	SimpleDateFormat formatter2 = new SimpleDateFormat("yy/MM/dd", Locale.KOREA);
	String newDate = formatter.format(now);
	String newDate2 = formatter2.format(now);
	
	Connection conn = null;
	Statement stmt, stmt2 = null;
	ResultSet rs = null;
	
	String bCategory = request.getParameter("inCategory");
	String bTitle = request.getParameter("inTitle");
	String bContent = request.getParameter("inContent");
	String bID = sessionId;
	int bNum; 
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/shopdb";
		String dbUser = "root";
		String dbPass = "12345";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		stmt2 = conn.createStatement();
		

		String query2 = "select bNum from bbs where bNum=(select max(bNum) from bbs)";
		rs = stmt.executeQuery(query2);
		
		if (rs != null) {
			while (rs.next()) {
				bNum = rs.getInt("bNum");
				bNum = bNum+1;
				
				String query = "insert into bbs(bCategory, bNum, bDate, bID, bTitle, bContent)value('"
				+ bCategory + "','"+bNum+ "','" + newDate2 + "','" + bID + "','" + bTitle + "','" + bContent + "')";
				stmt2.executeUpdate(query);
			}
		}
		rs.close();
		stmt.close();
		stmt2.close();
		conn.close();

	} catch (Exception e) {
		out.println(e);
	}
	out.print("<script>"+"alert('게시물이 작성되었습니다.'); self.close(); opener.document.location.reload();"+"</script>");
%>
</body>
</html>