<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.Statement"%>
<%@ page import ="java.sql.ResultSet"%>
<%@ page import ="java.sql.SQLException"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 삭제 처리 중</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8"); //Set encoding

	String[] checked = request.getParameterValues("checked");
	String checkedlist = "";
	//POST로 memberList.jsp로부터 입력받은 내용을 변수화

	//1. JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");

	Connection conn = null;
	Statement stmt = null;
	
	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/shopdb";
		String dbUser = "root";
		String dbPass = "12345";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		for(int i = 0; i<checked.length; i++)
		{
			String del = "delete from member where mID='" +checked[i]+ "'";
			String up = "update sales set sState='취소됨' where sID= '" +checked[i]+ "'";
			String up2 = "update afterservice set aState='취소됨' where aID= '" +checked[i]+ "'";
			String up3 = "update bbs set bID='Unknown' where bID= '" +checked[i]+ "'";
			
			stmt.executeUpdate(up);
			stmt.executeUpdate(up2);
			stmt.executeUpdate(up3);
			stmt.executeUpdate(del);
			out.print("<script>"+"alert('해당 회원이 삭제되었습니다.'); self.close(); location.href='mgMember.jsp';"+"</script>");
		}
		
		stmt.close();
		conn.close();
	} catch (Exception e) {
		out.println(e);
	}
%>

</body>
</html>