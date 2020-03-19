<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.sql.Statement"%>
<%@ page import ="java.sql.ResultSet"%>
<%@ page import ="java.sql.SQLException"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String sessionId = (String)session.getAttribute("loginedId");
boolean loginOn = sessionId == null ? false:true; //(sessionId =  null)이 참이면 loginOn이 false 아니면 true
%> <!-- 로그인 여부 확인 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 삭제중</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8"); //Set encoding
	int idx = Integer.parseInt(request.getParameter("idx"));
	String userID = null;
	String delPost = "delete from bbs where bNum="+idx;
	String updateNum= "update bbs set bNum=bNum-1 where bNum>"+idx;

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/shopdb";
		String dbUser = "root";
		String dbPass = "12345";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		
		rs = stmt.executeQuery("select bID from bbs where bNum="+idx);
		while(rs.next()){
			userID = rs.getString("bID");
		}//while
			
		if(loginOn == true){ //로그인 상태
			if(sessionId.equals("admin")){ //관리자 로그인
				stmt.executeUpdate(delPost); //게시물 데이터 삭제
				stmt.executeUpdate(updateNum); ///게시물 번호 갱신
				out.print("<script>"+"alert('해당 게시물이 삭제되었습니다.'); self.close(); opener.document.location.reload();"+"</script>");
			
			}else if(sessionId.equals(userID)){ //글쓴이 로그인
				stmt.executeUpdate(delPost);
				stmt.executeUpdate(updateNum);
				out.print("<script>"+"alert('해당 게시물이 삭제되었습니다.'); self.close(); opener.document.location.reload();"+"</script>");
			
			}else if(!sessionId.equals("admin") && !sessionId.equals(userID)){ //관리자도, 글쓴이도 아닌 제 3자 로그인
				out.print("<script>"+"alert('자신의 게시물만 삭제할 수 있습니다!'); history.go(-1);"+"</script>");
			}//if- else if
		}else if(loginOn == false){ //비 로그인 상태
			out.print("<script>"+"alert('로그인한 후 이용해주세요..'); history.go(-1);"+"</script>");
		}//if - else
		rs.close();
		stmt.close();
		conn.close();
		} catch (Exception e) {
			out.println(e);
			}
%>

</body>
</html>