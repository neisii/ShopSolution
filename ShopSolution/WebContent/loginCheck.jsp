<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sessionId = (String)session.getAttribute("loginedId");
boolean loginOn = sessionId == null ? false:true;
%> <!-- 로그인 여부 확인 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="style.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>휴대폰 판매 1위! 봉돌 전자!</title>
</head>

<body>
<div id="title"><a href="/ShopSolution/index.jsp">봉돌 전자~</a></div>
<div id="greeting">휴대폰 판매 1위! 봉돌 전자!</div>
<%
if(loginOn==true){ //로그인한 경우
	if(sessionId.equals("admin")){ //관리자 로그인
%>
<ul id="menu_area">
<li id="menu_link_now"><a href="/ShopSolution/admin/mgMember.jsp">회원 관리</a></li>
<li id="menu_link_now"><a href="/ShopSolution/admin/mgProduct.jsp">제품 관리</a></li>
<li id="menu_link_now"><a href="/ShopSolution/admin/mgOrder.jsp">주문 관리</a></li>
<li id="menu_link_now"><a href="/ShopSolution/admin/mgAfterservice.jsp">A/S 관리</a></li>
<li id="menu_link_now"><a href="/ShopSolution/freeBBS.jsp">게시판 관리</a></li>
<li id="menu_link">
<a href="/ShopSolution/userInfo.jsp"><%=sessionId %></a>님 안녕하세요! 
<a href="/ShopSolution/logout.jsp">로그아웃</a>
</li>
</ul>
<%
	}else{ //회원 로그인
%>
<ul id="menu_area">
<li id="menu_link_now"><a href="/ShopSolution/order.jsp">주문하기</a></li>
<li id="menu_link_now"><a href="/ShopSolution/aService.jsp">A/S신청</a></li>
<li id="menu_link_now"><a href="/ShopSolution/freeBBS.jsp">게시판</a></li>
<li id="menu_link">
<a href="/ShopSolution/userInfo.jsp"><%=sessionId %></a>님 안녕하세요!
<a href="/ShopSolution/logout.jsp">로그아웃</a>
</li>
</ul>
<%	
		}
	}else{ //로그인하지 않은 경우
		%>
		
		<ul id="menu_area">
		<li id="menu_link_now"><a href="order.jsp">주문하기</a></li>
		<li id="menu_link_now"><a href="aService.jsp">A/S신청</a></li>
		<li id="menu_link_now"><a href="freeBBS.jsp">게시판</a></li>
		<%
		out.print("<a href="+"login.jsp"+">"+"로그인"+"</a>"+"해주세요.");
		%>
		</ul>
		<%
		}
%>

</body>
</html>