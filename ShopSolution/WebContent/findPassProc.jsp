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
<title>패스워드 찾기</title>
</head>


<%! public String trim(String str) {
		StringBuffer sb = new StringBuffer();
		if (str == null)
			return "";
		for (int i = 0; i < str.length(); i++) {
			if (str.charAt(i) != ' ')
				sb.append(str.charAt(i));
			}
		return sb.toString();
		}
%>
<%	request.setCharacterEncoding("utf-8"); //Set encoding
	String userId = request.getParameter("userId"); //findUser.jsp에서 입력한 아이디
	String userName = request.getParameter("userName");
	String mID = null;
	String mPass = null;
	String mName = null;
	
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
			rs = stmt.executeQuery("select * from member where mID='"+ userId + "'"); //이름을 찾음
			if (rs != null) {
				while (rs.next()) {
					mID = trim(rs.getString("mID")); //디비에서 이름, 연락처, 아이디 가져와 저장
					mPass= trim(rs.getString("mPass"));
					mName= trim(rs.getString("mName"));
					
					if(mID.equals(userId) && mName.equals(userName)){
							out.print("<script>"+"alert('"+mName+" 회원님의 패스워드는 "+mPass+"입니다.'); location.href='findUser.jsp';"+"</script>");
							//out.print("둘다 맞음 "+userId+" "+userName);
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
