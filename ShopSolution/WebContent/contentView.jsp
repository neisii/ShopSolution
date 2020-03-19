<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.Statement"%>
<%@ page import ="java.sql.ResultSet"%>
<%@ page import ="java.sql.SQLException"%>

<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs, rs2 = null;
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	int prev = idx-1;
	int next = idx+1;
	String maxidx = null;
	
	String bNum = null;
	String bCategory = null;
	String bTitle = null;
	String bContent = null;
	String bID = null;
	String bDate = null;

	try{
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/shopdb";
		String dbUser = "root";
		String dbPass = "12345";

		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();

		String findmaxIdx = "select bNum from bbs where bNum=(select max(bNum) from bbs)";
		try{ //마지막 게시물 번호 추출
			rs2 = stmt.executeQuery(findmaxIdx);
			if(rs2 != null){
				while(rs2.next()) {
					maxidx = rs2.getString("bNum");
				}
			}
		}catch(Exception e){
			out.print(maxidx+" -------- "+e);
		}
		
		try{
			rs = stmt.executeQuery("select * from bbs where bNum='"+ idx +"'");
			if(rs != null){
				while(rs.next()) {
					bNum = rs.getString("bNum");
					bCategory = rs.getString("bCategory");
					bTitle = rs.getString("bTitle");
					bContent = rs.getString("bContent");
					bID = rs.getString("bID");
					bDate = rs.getString("bDate");
				}
				if(bTitle != null){
					
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>[<%=bCategory%>] <%=bTitle%></title>
</head>

<body>
	<!-- 아래부터 삭제 폼 -->
	<form id="contentView" method="post" action="contDel.jsp?idx=<%=idx%>">
	<table class="bd_list" style="table-layout:fixed;" width="430">
	<tr>
		<th colspan="2"><%=bTitle%></th>
	</tr>	
	<tr>
		<td align="left"><b><%=bID%></b></td>
		<td align="right"><%=bDate%></td>
	</tr>
	<tr>
		<th colspan="2">내 용</th>
	</tr>
	<tr>
		<td colspan="2" style="font-size: medium;"><pre><%=bContent%></pre></td>
	</tr>
	<!--퀴리 실행 결과로부터 데이터를 읽어옴 -->
	<tr>
		<td>
			<a href="contentView.jsp?idx=<%=prev%>">&lt;&lt;이전글</a>&nbsp;&nbsp;<a href="contentView.jsp?idx=<%=next%>">다음글&gt;&gt;</a>
		</td>
		<td align="right">
			<input type="submit" value="삭제" name="ok"  onclick="if (confirm('정말 삭제하시겠습니까?')) { location.href='contDel.jsp'; } else { return false; }"/>
		</td>
	</tr>
	</table>
	</form>

<%
				}else{
					out.print("<script>"+"alert('해당 게시물이 없습니다.'); history.go(-1);"+"</script>");
				}
			}
			rs.close();
			stmt.close();
			conn.close();
		}catch(Exception e){
			out.print("1  "+e);
		}
	} catch(Exception e){
		out.println(e);
	}
%>

</body>
</html>