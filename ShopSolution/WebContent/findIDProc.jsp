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
<title>아이디 찾기</title>
</head>

<%	request.setCharacterEncoding("utf-8"); //Set encoding
	String userName = request.getParameter("userName"); //findUser.jsp에서 입력한 이름
	String userPhone = request.getParameter("userPhone"); //findUser.jsp에서 입력한 연락처
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/shopdb";
		String dbUser = "root";
		String dbPass = "12345";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); //디비와 연결
		stmt = conn.createStatement();
		
		try {
			rs = stmt.executeQuery("select * from member where mName='"+ userName + "'"); //이름을 찾음
			if (rs != null) {
				while (rs.next()) {
					String mName = trim(rs.getString("mName")); //디비에서 이름, 연락처, 아이디 가져와 저장
					String mCall = trim(rs.getString("mCall"));
					String mID= trim(rs.getString("mID"));
					
					if(mName.equals(userName) && mCall.equals(userPhone)){
						out.print("<script>"+"alert('"+mName+" 회원님의 아이디는 "+mID+"입니다.'); location.href='findUser.jsp';"+"</script>");
					}
					else if(mCall.equals(userPhone) || mName.equals(userName)){
						out.print("<script>"+"alert('연락처가 일치하지 않습니다.'); location.href='findUser.jsp';"+"</script>");
					}
					else{
						out.print("<script>"+"alert('해당하는 정보가 없습니다.'); location.href='findUser.jsp';"+"</script>");
					}
				}
			}
			rs.close();
			stmt.close();
			conn.close();
			} catch (Exception e) {
				out.println(e);
				}
		} catch (Exception e) {
			out.println(e);
			}
%>


<body>
</body>
</html>
