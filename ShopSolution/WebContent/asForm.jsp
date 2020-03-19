<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="sun.misc.Cache"%>
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
<%
if(loginOn==true){
%>
	<form id="formID" class="formular" method="post" action="asProc.jsp">
		<fieldset>
			<legend>
				A/S 신청하기
			</legend>
			<label>
				<span>&nbsp;</span>
			</label>
			<label>
				<span>신청 모델 : </span>
					<select name="pl_select" id="sport" class="validate[required]">
					<option value="">선택하세요</option>

<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String sModel = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/shopdb";
		String dbUser = "root";
		String dbPass = "12345";
		
		String query = "select distinct sModel from sales where sID='"+ sessionId + "'";
		//중복된 값은 제외하고 검색
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		try{
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				sModel = rs.getString("sModel");
			}
			if(sModel != null){
%>
					<option value=<%=sModel%>><%=sModel%></option>
<%
			}else{
				%>
					<option value=>제품 구입 후 이용해주세요.</option>
				<%
			}
		}catch(Exception e){
			out.print("1."+e);
			}
 		rs.close();
 		stmt.close();
 		conn.close();
 	} catch (Exception e) {
		out.print("2."+e);
 	}
 %>

					</select>

			</label>
			<label>
				<span>문제점 : </span>
				<input value="" class="validate[required] text-input" type="text" name="pl_prob" id="req" />
			</label>
		<input class="submit" type="submit" value="신청"/><hr/>
		<legend>
		<a href="index.jsp"> 돌아가기 </a>
		</legend>
		</fieldset>
	</form>
<%
	}else{
%>
	<form id="formID" class="formular">
		<fieldset>
			<legend>
				A/S 신청하기
			</legend>
			<label>
				<span>&nbsp;</span>
			</label>
			<label>
				<span>로그인 후 이용해 주세요</span>
			</label>
		<legend>
		<a href="index.jsp"> 돌아가기 </a>
		</legend>
		</fieldset>
	</form>

<% } %>
</body>
</html>
