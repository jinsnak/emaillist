<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.dhflour.emaillist.vo.EmailListVo"%>
<%@page import="kr.co.dhflour.emaillist.dao.EmailListDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//프로젝트 개발 순서.
	//1. vo 및 dao 작성
	//2. test 패키지를 작성하여 dao 단에 에러를 체크한다.(dao단에 모든 에러를 잡는다.)
	//3. 이후 JSP 파일을 작성하여 프로젝트를 진행한다.
    //WEB-INF의 jdbc 파일이 없으면 에러가 난다.
	//프로젝트의 Properties 에서 Deployment설정을 이용하여 Java Resource에 존재하는 라이브러리를 WebContent의 lib 위치로 이동(배치)시킨다.
	EmailListDao dao = new EmailListDao();
	List<EmailListVo> list = dao.fetchList();
%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>메일 리스트에 가입되었습니다.</h1>
	<p>입력한 정보 내역입니다.</p>
	<%
		for(EmailListVo vo:list) {
	%>
		<table border="1" cellpadding="5" cellspacing="2">
			<tr>
				<td align=right>First name: </td>
				<td><%=vo.getFirstName() %></td>
			</tr>
			<tr>
				<td align="right" width="110">Last name: </td>
				<td width="110"><%=vo.getLastName() %></td>
			</tr>
			<tr>
				<td align=right>Email address: </td>
				<td><%=vo.getEmail() %></td>
			</tr>
		</table>
		<br>
	<%
		}
	%>
	<br>
	<p>
		<a href="/emaillist/form.jsp">추가메일 등록</a>
	</p>
	<br>
</body>
</html>