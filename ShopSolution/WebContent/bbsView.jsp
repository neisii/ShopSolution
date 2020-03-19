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
<!-- 팝업창 -->
<script language="JavaScript">
function openNewWindow(window) {
open (window,"contentView","left=500, top=20, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=yes, width=500px, height=400px");
}
</script>
</head>

<body>

	<h2 id="caption">게시판</h2>
	<form action="write.jsp">
	<div style="text-align:right;">
		<input type="submit" value="글쓰기" name="write" a href="javascript:;" onclick="window.open('write.jsp','write','resizable=no width=390 height=290');return false;" />
		<!-- return false가 없으면 부모페이지에도 로딩됨 -->
	</div>
	</form>

<table class="cs_list">
<tr>
	<th>번호</th><th>분류</th><th>제목</th><th>작성자</th><th>작성일</th>
</tr>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String bNum = null;
	String bTitle = null;
	String bCategory = null;
	String bID = null;
	String bDate = null;

	try{
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/shopdb";
		String dbUser = "root";
		String dbPass = "12345";
		
		String query = "select * from bbs order by bNum desc";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		
		try{
			rs = stmt.executeQuery(query);
			if(rs != null){
				while(rs.next()) {
					bNum = rs.getString("bNum");
					bTitle = rs.getString("bTitle");
					bCategory = rs.getString("bCategory");
					bID = rs.getString("bID");
					bDate = rs.getString("bDate");
					if(bNum != null){
					
%>
	<tr>
		<td><%=bNum%></td>
		<td><%=bCategory%></td>
		<td><a href='javascript:openNewWindow("contentView.jsp?idx=<%=bNum%>")'><%=bTitle%></a></td>
		<td><%=bID%></td>
		<td><%=bDate%></td>
	</tr>
	<!--퀴리 실행 결과로부터 데이터를 읽어옴 --> 

<%
					}else{
				%>
				<tr>
				<td align="center" colspan="5">작성된 게시물이 없습니다.</td>
				</tr>
				<%
					}
				}
			}
			rs.close();
			stmt.close();
			conn.close();
		}catch(Exception e){
			out.print(" ---게시물 조회 실패!----- "+e);
		}
	} catch(Exception e){
		out.println(e);
	}
%>
	</table>
</body>
</html>