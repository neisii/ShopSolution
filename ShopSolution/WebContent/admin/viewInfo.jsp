<%@page import="org.apache.catalina.User"%>
<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.Statement"%>
<%@ page import ="java.sql.ResultSet"%>
<%@ page import ="java.sql.SQLException"%>


<%
		request.setCharacterEncoding("utf-8"); //Set encoding
		String id = request.getParameter("user"); //클릭한 회원 아이디
		String mID = null;
		String mName = null;
		String mGender = null;
		String mAdr = null;
		String mCall = null;
		String membership = null;
		String signupDate = null;

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
				rs = stmt.executeQuery("select * from member where mID='"+ id +"'");
				//1.아이디가 존재하는지 검색 2.존재하는 경우 해당 회원 정보를 추출
				if(rs != null){ //아이디가 존재하는 경우
					while (rs.next()) { //디비에서 아이디, 패스워드 가져와 저장
						mID = rs.getString("mID");
						mName = rs.getString("mName");
						mGender = rs.getString("mGender");
						mAdr = rs.getString("mAdress");
						mCall = rs.getString("mCall");
						membership = rs.getString("membership");
						signupDate = rs.getString("signupDate");
					}
					if (mID != null) { //입력된 패스워드와 검색된 패스워드가 일치하는 경우
						
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/ShopSolution/style.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=mID%>님의 정보</title>
</head>
<body>
	<h2 id="caption">회원 정보</h2>
<table class="cs_list" width="320" height="200" style="table-layout:fixed;">
	<tr>
	<th>아이디</th><td><%=mID%></td>
	</tr>
	<tr>
	<th>이름</th><td><%=mName%></td>
	</tr>
	<tr>
	<th>성별</th><td><%=mGender%></td>
	</tr>
	<tr>
	<th>주소</th><td><%=mAdr%></td>
	</tr>
	<tr>
	<th>연락처</th><td><%=mCall%></td>
	</tr>
	<tr>
	<th>회원등급</th><td><%=membership%></td>
	</tr>
	<tr>
	<th>가입일</th><td><%=signupDate%></td>
	</tr>
	<tr>
	<td align="center" colspan="2"><input type="submit" value="닫기" onClick="self.close()" />
	</td>
	</tr>
	</table>
	<!--퀴리 실행 결과로부터 데이터를 읽어옴 -->

<%				
					
					}else{ //선택한 회원이 존재하지않은 경우
							//out.println(rs);
							out.print("<script>"+"alert('탈퇴한 회원입니다!'); self.close();"+"</script>");
						}
				}
				rs.close();
				stmt.close();
				conn.close();
			} catch (Exception e) { //아이디가 존재하지 않는 경우
				//out.print("<script>"+"alert('탈퇴한 회원입니다.'); self.close();"+"</script>");
				out.print(e);
			}

		} catch (Exception e) {
			out.println(e);
		}
	%>
</body>
</html>