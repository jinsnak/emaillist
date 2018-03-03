<%@page import="kr.co.dhflour.emaillist.vo.EmailListVo"%>
<%@page import="kr.co.dhflour.emaillist.dao.EmailListDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); //post방식 시 Encoding
	
	String firstName = request.getParameter("fn");
	String lastName = request.getParameter("ln");
	String email = request.getParameter("email");
	//dao를 사용하기 위해 생성
	EmailListDao dao = new EmailListDao();
	//vo객체에 담기 위해 생성
	EmailListVo vo = new EmailListVo();
	//생성한 객체에 값을 담는다.
	vo.setFirstName(firstName);
	vo.setLastName(lastName);
	vo.setEmail(email);
	//생성된 객체를 이용하여 테이블에 넣는다.
	boolean result = dao.InsertVo(vo);
	
	//redirect를 시키는 이유 : 페이지에 계속 머물게 되면 새로고침 시 지속적으로 위에서 받은 값으로 Insert문을 반복한다.
	if(result){
		response.sendRedirect("/emaillist");
	}
	else{
		
	}
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>더해주는 페이지입니다.</h1>
	<h4><%=firstName %></h4>
</body>
</html>