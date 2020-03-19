<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.Statement"%>
<%@ page import ="java.sql.ResultSet"%>
<%@ page import ="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="/ShopSolution/style.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>휴대폰 판매 1위! 봉돌 전자!</title>
<!-- 팝업창 -->
<script language="JavaScript">
function openNewWindow(window) {
open (window,"viewInfo","left=500, top=20, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=yes, width=270, height=370");
}
</script> 
</head>

<body>
<div id="middle">
<jsp:include page="../loginCheck.jsp"/>
<!-- 로그인 여부를 체크하여 경우에 따른 메뉴를 출력함 -->

<table id="square">
<tr>
<td valign="top" width="0">
	<!--SUB_MENU-->
</td>
<td valign="top" width="20%">
	<jsp:include page="../pdTop10.jsp"/>
</td>
<td valign="top" width="60%">

	<h2 id="caption">주문 목록</h2>
	<form id="formID" class="formular" method="post" action="modifyOrder.jsp">
			<table class="cs_list">
			<tr>
				<th>주문코드</th><th>모델</th><th>수량</th><th>주문자</th><th>주문일</th><th>상태</th><th width="30">선택</th>
				</tr>
			<%
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				
				String userID = null;
				String sCode = null;
				String sModel = null;
				String sQty = null;
				String sDate = null;
				String sState = null;

				try{
					Class.forName("com.mysql.jdbc.Driver");
					String jdbcDriver = "jdbc:mysql://localhost:3306/shopdb";
					String dbUser = "root";
					String dbPass = "12345";
					
						String query = "select * from sales";
						conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
						stmt = conn.createStatement();
						
						rs = stmt.executeQuery(query);

						//5. 쿼리 실행 결과 출력
						while(rs.next()) {
							userID = rs.getString("sID");
							sCode = rs.getString("sCode");
							sModel = rs.getString("sModel");
							sQty = rs.getString("sQty");
							sDate = rs.getString("sDate");
							sState = rs.getString("sState");
						
				%>
						<tr>
						<td><%=sCode%></td>
						<td><%=sModel%></td>
						<td><%=sQty%>대</td>
						<td><a href='javascript:openNewWindow("viewInfo.jsp?user=<%= userID %>")'><%= userID %></a></td>
						<td><%=sDate%></td>
						<% if(sState.equals("취소")){ %>
						<td><font color=red><%=sState%></font></td>
						<% }else{ %>
						<td><%=sState%></td>
						<%} %>
						<td><input type="checkbox" name="checked" value=<%= rs.getString("sCode") %> /></td>
						</tr>
						<!--퀴리 실행 결과로부터 데이터를 읽어옴 -->
					<%
						}
						rs.close();
						stmt.close();
						conn.close();
					} catch(SQLException e){
						out.print(e);
						}
					%>
			</table>
	<div style="text-align:right;">
			<select name="modifyState">
					<option value=대기>대기</option>
					<option value=배송>배송</option>
					<option value=완료>완료</option>
					<option value=취소>취소</option>
			</select>
		<input type="submit" value="저장" name="ok" />
	</div>
	</form>



</td>
<td valign="top" width="20%">
	<jsp:include page="../news.jsp"/>
</td>
</tr>
</table>

<br clear="all" />
<br />
<div id="copy_area">
<jsp:include page="../copy.html"/>
</div>
</div>

</body>
</html>
