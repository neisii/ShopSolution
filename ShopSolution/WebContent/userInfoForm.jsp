<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.Statement"%>
<%@ page import ="java.sql.ResultSet"%>
<%@ page import ="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sessionId = (String)session.getAttribute("loginedId");
boolean loginOn = sessionId == null ? false:true;
%> <!-- 로그인 여부 확인 -->

<%
	Connection conn = null; Statement stmt = null; 	ResultSet rs, rs2, rs3 = null;
	
	String id = null; String pass = null;	String name = null;	String gender = null;
	String adr = null; String call = null;
	String sDate = null; String sCode = null; String sModel = null; String sQty = null;
	String sState = null; String aDate = null; String aCode = null; String aModel = null;
	String aProb = null; String aState = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/shopdb";
		String dbUser = "root";
		String dbPass = "12345";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		String query = "select * from member where mID='"+sessionId+"'";
		stmt = conn.createStatement();
		
		try{
			rs = stmt.executeQuery(query);

			if(rs != null){
				while (rs.next()) {
					id = rs.getString("mID");
					pass = rs.getString("mPass");
					name = rs.getString("mName");
					gender = rs.getString("mGender");
					adr = rs.getString("mAdress");
					call = rs.getString("mCall");
				}
				if(id != null){
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="/ShopSolution/style.css" type="text/css" />
	<link rel="stylesheet" href="css/validationEngine.jquery.css" type="text/css"/>
	<link rel="stylesheet" href="css/template.css" type="text/css"/>
	<script src="js/jquery-1.8.2.min.js" type="text/javascript">
	</script>
	<script src="js/languages/jquery.validationEngine-ko.js" type="text/javascript" charset="utf-8">
	</script>
	<script src="js/jquery.validationEngine.js" type="text/javascript" charset="utf-8">
	</script>
	<script>
		jQuery(document).ready(function(){
			// binds form submission and fields to the validation engine
			jQuery("#formID").validationEngine();
		});
	</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>휴대폰 판매 1위! 봉돌 전자!</title>

</head>

<body>

	<h2 id="caption">회원 정보</h2>
<form id="formID" class="formular" method="post" action="saveInfo.jsp">
		<fieldset>
			<legend>
				내 정보
			</legend>
			<label>
				<span>&nbsp;</span>
			</label>
			<label>
				<span>아이디(수정불가) : <%=id%></span>
			</label>
			
			<label>
				<span>&nbsp;</span>
			</label>
			
			<label>
				<span>패스워드 : ****** </span><br />
				<span>새 패스워드 : </span>
				<input value="" class="validate[required] text-input" type="password" name="newPass" id="password" />
			</label>
			<label>
				<span>성명(수정불가) : <%=name%></span>
			</label>
			
			<label>
				<span>&nbsp;</span>
			</label>
			
			<label>
			<span>성별(수정불가) : <%=gender%></span>
			</label>
			
			<label>
				<span>&nbsp;</span>
			</label>
			
			<label>
				<span>주소 : <%=adr%></span><br />
				<span>새 주소 : </span>
				<input value="" class="validate[required] text-input" type="text" name="newAdr" id="req1" />
			</label>
			
			<label>
				<span>&nbsp;</span>
			</label>
			
			<label>
				<span>연락처 : <%=call%></span><br />
				<span>새 연락처 : </span>
				<input value="" class="validate[required] text-input" type="text" name="newPhone" id="req2" />
			</label>
			
			<label>
				<span>&nbsp;</span>
			</label>
<%
				}else{
					out.print("회원 정보 조회 실패");
				}
			}
			rs.close();
			stmt.close();
			conn.close();
		}catch(Exception e){
			out.print(" ---회원 정보 조회 실패!----- "+e);
		}
	} catch(Exception e){
		out.println(e);
	}
//여기까지 회원 정보 아래부터 주문/A/S 내역

if(sessionId.equals("admin")){ //관리자 로그인의 경우 표시하지 않음
	%>
		<label>&nbsp;</label>
	<%
	}else{ //회원 로그인
%>
			<label>
			<span>서비스 현황 : </span>
			<p>제품 주문 내역</p>
			<table class="cs_list">
			<tr>
			<th>주문 날짜</th><th>주문 코드</th><th>주문 모델</th><th>수량</th><th>상태</th>
			</tr>
<%
		try{
			String jdbcDriver = "jdbc:mysql://localhost:3306/shopdb";
			String dbUser = "root";
			String dbPass = "12345";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			String query2 = "select * from sales where sID='"+sessionId+"'";
			stmt = conn.createStatement();
			
			try{
				rs2 = stmt.executeQuery(query2);
				if(rs2 != null){ //주문 내역이 존재하는 경우
					while (rs2.next()) {
						sDate = rs2.getString("sDate");
						sCode = rs2.getString("sCode");
						sModel = rs2.getString("sModel");
						sQty = rs2.getString("sQty");
						sState = rs2.getString("sState");
					}
					if(sCode != null){ //주문코드가 존재하는 경우 주문 내역 출력
%>
						<tr>
							<td><%=sDate %></td>
							<td><%=sCode %></td>
							<td><%=sModel %></td>
							<td><%=sQty %>개</td>
							<td><%=sState %></td>
						</tr>
						<!--퀴리 실행 결과로부터 데이터를 읽어옴 -->
<%
					}else{ //주문코드가 존재하지 않은 경우
				%>
				<tr>
				<td align="center" colspan="5">주문 내역이 없습니다.</td>
				</tr>
				<%
					}
				}
				rs2.close();
				stmt.close();
				conn.close();
				}catch(Exception e){
					out.print("주문내역 "+e);
				}
			}catch (Exception e) {
				out.println("1. "+e);
				} //end try
	 %>
</table>
<p>A/S 신청 내역</p>
<table class="cs_list">
	<tr>
	<th>신청 날짜</th><th>신청 코드</th><th>신청 모델</th><th>문제점</th><th>상태</th>
	</tr>
<%
		try{
			String jdbcDriver = "jdbc:mysql://localhost:3306/shopdb";
			String dbUser = "root";
			String dbPass = "12345";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			String query3 = "select * from afterservice where aID='"+sessionId+"'";
			stmt = conn.createStatement();
			
			try{
				rs3 = stmt.executeQuery(query3);
				if(rs3 != null){ //데이터가 존재하는 경우
					while (rs3.next()){
						aDate = rs3.getString("aDate");
						aCode = rs3.getString("aCode");
						aModel = rs3.getString("aModel");
						aProb = rs3.getString("aProb");
						aState = rs3.getString("aState");
						}
					if(aCode != null){ //신청코드가 존재하는 경우 신청 내역 출력
%>
						<tr>
							<td><%=aDate%></td>
							<td><%=aCode%></td>
							<td><%=aModel%></td>
							<td><%=aProb%></td>
							<td><%=aState%></td>
						</tr>
						<!--퀴리 실행 결과로부터 데이터를 읽어옴 -->
<%
					}else{ //신청코드가 존재하지 않는 경우
%>
						<tr>
							<td align="center" colspan="5">A/S 내역이 없습니다.</td>
						</tr>
					<%
					}
				}
				rs3.close();
				stmt.close();
				conn.close();
				}catch(Exception e){
					out.println("as 내역 "+e);
					}//end try
		}catch(Exception e) {
			out.println("2. "+e);
			}
%>

</table>
<%
	}//end else
	 %>
				</label><% if(id.equals("admin")){ %>
		<input class="submit" type="submit" value="수정하기" /><hr/>
		<%}else{ %>
		<input class="submit" type="submit" value="회원탈퇴" name="unsign"  onclick="if (confirm('정말 탈퇴하시겠습니까? \n탈퇴시 삭제되는 모든 정보는 복구되지 않습니다.')) { location.href='unsignProc.jsp'; } else { return false; }" />
		<input class="submit" type="submit" value="수정하기" /><hr/>
		<%} %>
		<legend>
		<a href="index.jsp"> 돌아가기 </a>
		</legend>
		</fieldset>
	</form>
	
</body>
</html>
