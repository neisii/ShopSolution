<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.Statement"%>
<%@ page import ="java.sql.ResultSet"%>
<%@ page import ="java.sql.SQLException"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%
String sessionId = (String)session.getAttribute("loginedId");
%> <!-- 로그인 여부 확인 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="/ShopSolution/style.css" type="text/css" />
	<link rel="stylesheet" href="css/validationEngine.jqry.css" type="text/css"/>
	<link rel="stylesheet" href="css/template.css" type="text/css"/>
	<script src="js/jqry-1.8.2.min.js" type="text/javascript">
	</script>
	<script src="js/languages/jqry.validationEngine-ko.js" type="text/javascript" charset="utf-8">
	</script>
	<script src="js/jqry.validationEngine.js" type="text/javascript" charset="utf-8">
	</script>
	<script>
		jqry(document).ready(function(){
			// binds form submission and fields to the validation engine
			jqry("#formID").validationEngine();
		});
	</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>신청 처리 중</title>
</head>

<body>
	<%!public String trim(String str) { //db 글자
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

<%
	Date now = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyMMdd", Locale.KOREA);
	SimpleDateFormat formatter2 = new SimpleDateFormat("yy/MM/dd", Locale.KOREA);
	String newDate = formatter.format(now);
	String newDate2 = formatter2.format(now);

	request.setCharacterEncoding("utf-8");
	String qry1, qry2, qry00;
	String model = request.getParameter("pl_select"); //신청할 모델
	String prob = request.getParameter("pl_prob"); //해당 모델의 문제점

	Connection conn = null;
	Statement stmt= null;
	ResultSet rs, rs1= null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/shopdb";
		String dbUser = "root";
		String dbPass = "12345";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		stmt = conn.createStatement();
		
		String findSub = "select aCode from afterservice where aCode=(select max(aCode) from afterservice)";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(findSub); //마지막 주문코드 검색
		
		String code = null;
		String id = sessionId;
		
		while (rs.next()) {
			String aCode = rs.getString("aCode"); // ex) 1311200001
			int front = Integer.parseInt(aCode.substring(0,6));// 131120
			int rear = Integer.parseInt(aCode.substring(6,10));// 0001
			String suffix = null;
			
			if(front == Integer.parseInt(newDate)){
				if(rear >= 1){
					//int temp = rear+1;
					suffix = String.format("%04d", rear+1);
					code = newDate+suffix;
				}else if(rear >= 10){
					suffix = String.format("%03d", rear+1);
					code = newDate+suffix;
				}else if(rear >= 100){
					suffix = String.format("%02d", rear+1);
					code = newDate+suffix;
				}else if(rear >= 1000){
					suffix = String.format("%01d", rear+1);
					code = newDate+suffix;
				}
			}else{
				code = newDate+"0001";
			}
		}

		qry1 = "insert into afterservice(aCode, aModel, aProb, aID, aDate, aState)value('"
			+ code + "','"+ model + "','"+ prob + "','"+ id + "','" + newDate2 + "','대기')";
		stmt.executeUpdate(qry1); //주문 정보 저장
		response.sendRedirect("asSucc.jsp");
		
		rs.close();
		stmt.close();
		conn.close();
		}//end try
		catch (Exception e) {
			out.println(e);
		}
%>
</body>
</html>
