<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.Statement"%>
<%@ page import ="java.sql.ResultSet"%>
<%@ page import ="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>게시판</title>

<script language="JavaScript">
function openNewWindow(window) {
open (window,"contentView","left=500, top=20, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=yes, width=300, height=200");
}
</script> 


</head>

<body>
	<h2 id="caption">공지 사항</h2>
<table class="cs_list">
<tr>
	<th>제목</th><th>작성일</th>
</tr>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String bNum = null;
	String bTitle = null;
	String bDate = null;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/shopdb";
		String dbUser = "root";
		String dbPass = "12345";
		
		String query = "select * from bbs where bCategory="+"'공지'"+"order by bNum desc limit 5";

		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		
		try{
			rs = stmt.executeQuery(query);
			if(rs != null){
				while(rs.next()) {
					bNum = rs.getString("bNum");
					bTitle = rs.getString("bTitle");
					bDate = rs.getString("bDate");
					if(bTitle != null){
%>
	<tr>
		<td><a href='javascript:openNewWindow("contentView.jsp?idx=<%=bNum%>")'><%=bTitle%></a></td>
		<td><%=bDate%></td>
	</tr>
	<!--퀴리 실행 결과로부터 데이터를 읽어옴 --> 

<%
				
					}else{
				%>
				<tr>
				<td align="center" colspan="2">작성된 공지가 없습니다.</td>
				</tr>
				<%
					}
				}
			}
			rs.close();
			stmt.close();
			conn.close();
		}catch(Exception e){
			out.print(" ---공지 조회 실패!----- "+e);
		}
	} catch(Exception e){
		out.print("2321 "+e);
	}
%>
	</table>
</body>
</html>