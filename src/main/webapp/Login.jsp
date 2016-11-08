<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<script src="<c:url value='/static/app.js' />"></script>
<script src="<c:url value='/static/controller.js' />"></script>
<script src="<c:url value='/static/service.js' />"></script>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
</head>
<body ng-app="myApp" ng-controller="myController">

	<div>
		<form>
			Enter Username : <input type="text" ng-model="employee.username"><br/><br/> 
			Enter Password : <input type="text" ng-model="employee.password"><br/><br/>
			<button ng-click="loginEmployee()">Login</button>
		
		</form>
	</div>
	<br/><br/> 	
</body>

</html>