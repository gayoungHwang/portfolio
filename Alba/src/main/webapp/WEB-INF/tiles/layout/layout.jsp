<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AlbaExit</title>

</head>
<body>
	<div id="wrapper">
	  <div id="header">
	  	<tiles:insertAttribute name="header"></tiles:insertAttribute>  
	  </div>
	  <div id="content">
	  	<tiles:insertAttribute name="content"></tiles:insertAttribute>
	  </div>
	  <div id="footer">
	  	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	  </div>		
	</div>

</body>

</html>