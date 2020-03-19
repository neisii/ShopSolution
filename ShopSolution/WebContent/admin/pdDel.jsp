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
<title>제품 삭제 중</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8"); //Set encoding
	String[] checkedD = request.getParameterValues("checkedD");
	String checkedDlist = "";
	//삭제할 목록 체크

	//1. JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");

	Connection conn = null;
	Statement stmt= null;
	ResultSet rs = null;
	
	String jdbcDriver = "jdbc:mysql://localhost:3306/shopdb";
	String dbUser = "root";
	String dbPass = "12345";
	
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt = conn.createStatement();
	
	if(checkedD != null){
		try {
			for(int i = 0; i<checkedD.length; i++)
			{

				String query = "delete from products where pCode='" +checkedD[i]+ "'";
				stmt.executeUpdate(query);
			}
			conn.close();

		} catch (Exception e) {
			out.println(e);
		}
		out.print("<script>"+"alert('해당 제품의 정보가 삭제되었습니다.'); location.href='mgProduct.jsp';"+"</script>");
	}
	else{
		out.print("<script>"+"alert('체크된 항목이 없습니다.'); history.go(-1)"+"</script>");
	}
	
%>

</body>
</html>