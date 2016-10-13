<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Registration Details</title>

</head>
<body>
	<form:form action="status" modelAttribute="Student" commandName="Student" >
		<table border="1" align="center">
			<tr><td>Enter Your Roll Number :</td><td><form:input path="rollno"/></td></tr>
			<tr><td>Enter Your First Name  :</td><td><form:input path="firstname"/></td></tr>
			<tr><td>Enter Your Last Name   :</td><td><form:input path="lastname"/></td></tr>
			<tr><td>Enter Your Marks       :</td><td><form:input path="marks"/></td></tr>
			<tr><td>Enter Your City        :</td><td><form:input path="city"/></td></tr>
			<tr><td><input type="submit" value="Register Me"/></td></tr>
		</table>
	</form:form>
</body>
</html>