<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html ng-app="manager">

  <head>
    <script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    <link rel="stylesheet" href="style.css" />
    <script src="<c:url value='/static/Ncontroller.js' />"></script>
    
  </head>

  <body>
    <div ng-controller="managerLoginController">
      <p>{{ EmployeeService.xxx }}</p>
    </div>
    <div data-ng-controller="managerHomeController">
   The value of xxx is: {{ EmployeeService.xxx }}
    </div>
  </body>

</html>