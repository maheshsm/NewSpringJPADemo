<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	
    <title>Resource Management Admin Page</title>

    <!-- Bootstrap Core CSS -->
    <link href="static/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="static/css/startmin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="static/css/font-awesome.min.css" rel="stylesheet" type="text/css">

   
</head>
<body  ng-app="myApp" ng-controller="myController">

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar-top" role="navigation">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Admin</a>
        </div>

        <!-- Top Navigation: Left Menu -->
        <ul class="nav navbar-nav navbar-left navbar-top-links">
            <li><a href="AdminHome.html"><i class="fa fa-home fa-fw"></i> Home</a></li>
        </ul>

        <!-- Top Navigation: Right Menu -->
        <ul class="nav navbar-right navbar-top-links">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> Account <b class="caret"></b>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="#"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                    </li>
                </ul>
            </li>
        </ul>

        <!-- Sidebar -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">

                <ul class="nav" id="side-menu">
                    <li>
                        <a href="AdminHome.html" class="active"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                    </li>
                    <li>
                        <a href="AdminPendingApproval.html"><i class="fa fa-sitemap fa-fw"></i> Pending Approval</a>
                    </li>
                </ul>

            </div>
        </div>
    </nav>

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
			
            <div class="row">
				<div>
					<table>
					<th><h2>Resource Details</h2></th>
					<tr><td><h4>Name : </td><td></td></tr>
					<tr><td><h4>Employee Id : </h4></td><td></td></tr>
					<tr><td><h4>Designation : </h4></td><td></td></tr>
					<tr><td><h4>Department : </h4></td><td></td></tr>
					<tr><td><h4>Project Name : </h4></td><td></td></tr>
					</table>
				</div>
				<div>
					<table>
					<th><h2>Allocation of Resource</h2></th>
					<tr><td><h4>Project Name :</h4></td><td><select></select></td></tr>
					<tr><td><h4>Reason :</h4></td><td><input type="textarea"/></td></tr>
					<tr><td></td><td><input type="button" value="Allocate"/></td></tr>
					</table>
				</div>
			</div>
            <!-- ... Your content goes here ... -->

        </div>
    </div>
<div>{{msg}}</div>
</div>

<!-- jQuery -->
<script src="static/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="static/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="static/js/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="static/js/startmin.js"></script>


<script>

'use strict'

var app = angular.module('myApp', []);

app.controller('myController',['$scope','EmployeeService',function($scope,EmployeeService) 
  {
	
	$scope.projects=[];
	$scope.roles=[];

	fetchAllProjects();
	
	fetchAllRoles();
		
	function fetchAllProjects()
	{
	    	//alert("In Fetch Employee Function"); 
	        EmployeeService.fetchAllProjects()
	            .then(	            	
	            function(d) {
	              $scope.projects = d;
	            },
	            function(errResponse)
	            {
	                alert('Error while fetching Users');
	            }
	        );	   
	}
	
	function fetchAllRoles()
	{
	    //	alert("In Fetch Employee Function"); 
	        EmployeeService.fetchAllRoles()
	            .then(	            	
	            function(d) {
	              $scope.roles = d;
	            },
	            function(errResponse)
	            {
	                alert('Error while fetching Users');
	            }
	        );	   
	}
	
}]);


angular.module('myApp').service('EmployeeService', ['$http', '$q', function($http, $q)
{

	var REST_SERVICE_URI1 = 'http://localhost:8080/ResourceManagement/projects/';
	
	var REST_SERVICE_URI2 = 'http://localhost:8080/ResourceManagement/roles/';

	this.fetchAllProjects= function () 
	{
		//alert(REST_SERVICE_URI1);
		var deferred = $q.defer();
		$http.get(REST_SERVICE_URI1)
		.then(
				function (response) 
				{
					deferred.resolve(response.data);
				},
				function(errResponse)
				{
					console.error('Error while fetching Users');
					deferred.reject(errResponse);
				}
		);
		return deferred.promise;
	}

	this.fetchAllRoles= function () 
	{
		//alert(REST_SERVICE_URI2);
		var deferred = $q.defer();
		$http.get(REST_SERVICE_URI2)
		.then(
				function (response) 
				{
					deferred.resolve(response.data);
				},
				function(errResponse)
				{
					console.error('Error while fetching Users');
					deferred.reject(errResponse);
				}
		);
		return deferred.promise;
	}
	
	
}]);
 
 </script>


</body>
</html>
