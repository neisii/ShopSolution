<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="style.css" type="text/css" />
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
<div id="middle">
<jsp:include page="loginCheck.jsp"/>
<!-- 로그인 여부를 체크하여 경우에 따른 메뉴를 출력함 -->


<table id="square">
<tr>
<td valign="top" width="0">
	<!--SUB_MENU-->
</td>
<td valign="top" width="20%">
	<jsp:include page="pdTop10.jsp"/>
</td>
<td valign="top" width="60%">
	<h2 id="caption">회원가입</h2>
	<form id="formID" class="formular" method="post" action="signupProc.jsp">
		<fieldset>
			<legend>
				회원가입
			</legend>
			<label>
				<span>아이디 : </span>
				<input value="" class="validate[required] text-input" type="text" name="newId" id="req" />
			</label>
			<label>
				<span>패스워드 : </span>
				<input value="" class="validate[required] text-input" type="password" name="newPass" id="password" />
			</label>
			<label>
				<span>성명 : </span>
				<input value="" class="validate[required] text-input" type="text" name="newName" id="req" />
			</label>
			<label>
			<span>성별 : </span><br />
			<span>남자</span> <input class="validate[required] radio" type="radio" name="newGender" id="radio1" value="male"/>
			<span>여자</span> <input class="validate[required] radio" type="radio" name="newGender" id="radio1" value="female"/>
			</label>
			<label>
				<span>주소 : </span>
				<input value="" class="validate[required] text-input" type="text" name="newAdr" id="req" />
			</label>
			<label>
				<span>연락처 : </span>
				<input value="" class="validate[required] text-input" type="text" name="newPhone" id="req" />
			</label>
		<input class="submit" type="submit" value="가입" /><hr/>
		<legend>
		<a href="index.jsp"> 돌아가기 </a>
		</legend>
		</fieldset>
	</form>
</td>
<td valign="top" width="20%">
	<jsp:include page="news.jsp"/>
</td>
</tr>
</table>

<br clear="all" />
<br />
<div id="copy_area">
<jsp:include page="copy.html"/>
</div>
</div>

</body>
</html>
