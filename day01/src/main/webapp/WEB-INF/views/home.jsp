<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<fieldset>
	<legend><h2>DB TEST</h2></legend>
	<h3>${data }</h3>
</fieldset>

<ul>
	<li><a href="${cpath }/ex01">ex01 - request</a></li>
	<li><a href="${cpath }/ex02">ex02 - arguments</a></li>
	<li><a href="${cpath }/ex03">ex03 - command object</a></li>
	<li><a href="${cpath }/ex04">ex04 - hashmap</a></li>
	<br>
	<li><a href="${cpath }/book/insert">insert</a></li>
	<li><a href="${cpath }/book/select">select</a></li>
</ul>

</body>
</html>