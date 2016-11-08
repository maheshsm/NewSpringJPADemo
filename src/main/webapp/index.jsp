<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="<c:url value='/static/app.js' />"></script>
<script src="<c:url value='/static/controller.js' />"></script>
<script src="<c:url value='/static/service.js' />"></script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resource Management System</title>

</head>
<body ng-app="myApp" ng-controller="myController">

	<div>
		{{employees}}
		Select By Projects <select ng-model="projName" ng-change="fetchAllResources(projName)" data-ng-options="ProjectTable.proj_name for ProjectTable in projects"></select>
		
		Select By Roles   <select ng-model="selectedName" ng-options=" RoleTable.role for RoleTable in roles"></select>
	
	<br/><br/>
	
	<table border="1">
		<thead>
			<tr>				
				<th>Employee Id</th>
                <th>Department</th>
                <th>Designation</th>
                <th>Name</th>
                <th>Billing</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Role</th>
                <th>Action</th>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="u in resources">
				<td><span ng-bind="u[0]"></span></td>
				<td><span ng-bind="u[1]"></span></td>
				<td><span ng-bind="u[2]"></span></td>
				<td><span ng-bind="u[3]"></span></td>
				<td><span ng-bind="u[4]"></span></td>
				<td><span ng-bind="u[5]"></span></td>
				<td><span ng-bind="u[6]"></span></td>
				<td><span ng-bind="u[7]"></span></td>
				<td><a href="release.jsp">Release</td>
			</tr>
		</tbody>
	</table>


	</div>

</body>
</html>