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
<title>로그인 중</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8"); //Set encoding
		String mID = null;
		String mPass = null;
		String id = request.getParameter("loginId"); //login.jsp에서 입력한 아이디
		String pass = request.getParameter("loginPass"); //login.jsp에서 입력한 패스워드

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
				rs = stmt.executeQuery("select mID, mPass from member where mID='"+ id +"'");
				//1.아이디가 존재하는지 검색 2.존재하는 경우 아이디와 패스워드를 추출
				if(rs != null){ //아이디가 존재하는 경우
					while (rs.next()) { //디비에서 아이디, 패스워드 가져와 저장
						mID = rs.getString("mID");
						mPass = rs.getString("mPass");
					}
					if (mPass.equals(pass)) { //입력된 패스워드와 검색된 패스워드가 일치하는 경우
						session.setAttribute("loginedId", id); //세션 생성
						session.setMaxInactiveInterval(60 * 60 * 5); //5시간동안 세션 유지
						//로그인이 성공한 경우 1.세션을 저장 2.로그인 성공 메시지 출력 3.인덱스로 돌아감
						out.print("<script>"+"alert('로그인 성공!'); location.href='index.jsp';"+"</script>");
						}else{ //패스워드가 일치하지 않는 경우
							out.print("<script>"+"alert('패스워드가 일치하지 않습니다.'); history.go(-1);"+"</script>");
						}
				}
				rs.close();
				stmt.close();
				conn.close();
			} catch (Exception e) { //아이디가 존재하지 않는 경우
				out.print("<script>"+"alert('존재하지 않는 아이디입니다.'); history.go(-1);"+"</script>");
				//e.printStackTrace();
			}

		} catch (Exception e) {
			out.println(e);
		}
	%>
</body>
</html>