<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.Statement"%>
<%@ page import ="java.sql.SQLException"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가입처리 중</title>
</head>
<body>

<%
	Date now = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyMMdd", Locale.KOREA);
	SimpleDateFormat formatter2 = new SimpleDateFormat("yy/MM/dd", Locale.KOREA);
	String newDate = formatter.format(now);
	String newDate2 = formatter2.format(now);
	
	request.setCharacterEncoding("utf-8"); //Set encoding
	String id = request.getParameter("newId");
	String pass = request.getParameter("newPass");
	String name = request.getParameter("newName");
	String gender = request.getParameter("newGender");
	if (gender.equals("male")) {
		gender = "남자";
	} else {
		gender = "여자";
	}

	String adress = request.getParameter("newAdr");
	String phone = request.getParameter("newPhone");
	//POST로 signup.jsp로부터 입력받은 내용을 변수화

	Connection conn = null;
	Statement stmt = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/shopdb";
		String dbUser = "root";
		String dbPass = "12345";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		
		String query = "insert into member(mID, mPass, mName, mGender, mAdress, mCall, membership, signupDate)value('"
				+ id
				+ "','"
				+ pass
				+ "','"
				+ name
				+ "','"
				+ gender
				+ "','" + adress + "','" + phone + "','준회원','" + newDate2 +"')";
		stmt.executeUpdate(query);
		
		stmt.close();
		conn.close();
		
		response.sendRedirect("signupSucc.jsp");
	} catch (Exception e) {
		out.println(e);
	}
%>

</body>
</html>