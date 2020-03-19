<%@page import="javax.print.DocFlavor.STRING"%>
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
<title>주문 처리 중</title>
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
	//날짜 생성

	request.setCharacterEncoding("utf-8");
	
	String model = request.getParameter("pl_select"); //주문할 모델
	String qty = request.getParameter("pQty"); //주문 수량

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/shopdb";
		String dbUser = "root";
		String dbPass = "12345";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		String code = null; //newDate+num형태로 주문코드 생성
		
		String findSub = "select sCode from sales where sCode=(select max(sCode) from sales)";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(findSub); //마지막 주문코드 검색
		
		while (rs.next()) {

			String sCode = rs.getString("sCode"); // ex) 1311200001
			int front = Integer.parseInt(sCode.substring(0,6));
			int rear = Integer.parseInt(sCode.substring(6,10));
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
		
		String id = sessionId;
		
		// *********************재고 및 판매량 업데이트*********************//
		String updatePd1 = "select * from products where pCode='"+ model +"' ";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(updatePd1); //선택한 모델의 정보를 가져옴
		
		while (rs.next()) {
			int NewQty = Integer.parseInt(qty);
			int NewSales = Integer.parseInt(rs.getString("pSales"));
			int NewStock = Integer.parseInt(rs.getString("pStock"));
			
			if(NewStock == 0){
				out.print("<script>"+"alert('재고가 없습니다!'); location.href='order.jsp';"+"</script>");
			}
			else if(NewStock < NewQty){ //주문수량이 재고보다 많은 경우
				out.print("<script>"+"alert('주문 가능 수량을 초과했습니다!'); history.back(-1);"+"</script>");
			}
			else{//재고량 > 주문수량인경우 주문정보 저장 및 재고&판매량 업데이트
				String intoSales = "insert into sales(sDate, sID, sCode, sModel, sQty, sState)value('"
										+ newDate2 + "','"+ id + "','"+ code + "','" + model + "','" + qty +"','대기')";
				stmt = conn.createStatement();
				stmt.executeUpdate(intoSales); //여기까지 주문 정보 저장
				
				NewSales = NewSales+NewQty;
				NewStock = NewStock-NewQty;
				
				String updatePd2 = "update products set pSales ='"+ NewSales +"', pStock ='"+ NewStock +"' where pCode='"+ model +"'";
				stmt = conn.createStatement();
				stmt.executeUpdate(updatePd2); //선택한 모델의 정보를 가져옴
				
				out.print("<script>"+"location.href='orderSucc.jsp';"+"</script>");
				}
			}//여기까지 while(rs)
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
