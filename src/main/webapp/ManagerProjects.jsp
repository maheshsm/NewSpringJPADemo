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
<body >

<div id="wrapper" ng-app="myApp" ng-controller="myController">

    <!-- Navigation -->
    <nav class="navbar-top" role="navigation">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Manager</a>
        </div>

        <!-- Top Navigation: Left Menu -->
        <ul class="nav navbar-nav navbar-left navbar-top-links">
            <li><a href="Login.jsp"><i class="fa fa-home fa-fw"></i> Home</a></li>
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
                        <a href="Login.jsp" class="active"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
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
                <label class="page-header">Search Resource</label>
				 
				<select class="page-header"  ng-model="projectlist"  ng-init="projectlist = projects[0]"  ng-options="ProjectTable.proj_name for ProjectTable in projects"></select>
				
				<select class="page-header" ng-model="rolelist" ng-options="RoleTable.role for RoleTable in roles"></select>
						                        
           <button ng-click="SearchResource()">Search</button>
                  
            </div>

          
        </div>

   
    <table border="1">
		<thead>
			<tr>
				<th>Employee Id</th>
				<th>Employee Name</th>
				<th>Designation</th>
				<th>Billing</th>
				<th>Start Date</th>
				<th>Allocate</th>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="emp in resource">
			<!-- 	<td><span ng-bind="u.empid"></span></td>
				<td><span ng-bind="u.ename"></span></td>
				<td><span ng-bind="u.designation"></span></td>
				<td><span ng-bind="u.billing"></span></td>
				<td><span ng-bind="u.startdate"></span></td>
				<td><button ng-model="" >Allocate</button></td>
			 -->		
				<td>{{emp.empid}}</td>
				<td>{{emp.ename}}</td>
				<td>{{emp.designation}}</td>
				<td>{{emp.billing}}</td>
				<td>{{emp.startdate}}</td>
				<td><button ng-click="AllocateResource()" >Allocate</button></td> 
			</tr>
		</tbody>
	</table>  
	</div>
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

app.controller('myController',['$scope','EmployeeService',function($scope,EmployeeService,$location) 
  {
	$scope.projectlist= {proj_name:''};
	$scope.rolelist={role:''};
	$scope.adminhome={proj_name:'',role:''};
	$scope.projects=[];
	$scope.roles=[];
	$scope.resource=[];
	
	
	$scope.msg ="MESSAGE";
	
	
	fetchAllManagerProjects();
	
	fetchAllManagerRoles();
		
	function fetchAllManagerProjects()
	{
	    	//alert("In Fetch Employee Function"); 
	        EmployeeService.fetchAllManagerProjects()
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
	
	function fetchAllManagerRoles()
	{
	    //	alert("In Fetch Employee Function"); 
	        EmployeeService.fetchAllManagerRoles()
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
	///////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	$scope.SearchResource= function()
	    {
		 // alert("IN Search Resource Function 1");
		//  alert($scope.projectlist.proj_name);
		// alert($scope.rolelist.role);
		  $scope.adminhome.proj_name=$scope.projectlist.proj_name;
		  $scope.adminhome.role=$scope.rolelist.role;
		  EmployeeService.SearchProjectId($scope.adminhome)
		   .then(	            	
	            function(d) {
	             $scope.resource = d;
	           //  alert(d);
	           //  alert($scope.resource);
	            },
	            function(errResponse)
	            {
	                alert('Error while fetching Users');
	            });
	    } 
    
}]);


angular.module('myApp').service('EmployeeService', ['$http', '$q', function($http, $q)
{

	var REST_SERVICE_URI1 = 'http://localhost:8080/ResourceManagement/loginManagerSuccess/';
	
	var REST_SERVICE_URI2 = 'http://localhost:8080/ResourceManagement/roles/';

	var REST_SERVICE_URI3 = 'http://localhost:8080/ResourceManagement/SearchProjectId/';
	

	this.fetchAllManagerProjects= function () 
	{
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

	this.fetchAllManagerRoles= function () 
	{
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


	this.SearchProjectId = function (adminhome)
	{
		var deferred = $q.defer();
		$http.post(REST_SERVICE_URI3,adminhome)
		.then(
				function(response) 
				{
					alert("SHOW DATA");
					deferred.resolve(response.data);
					
				},
				function(reason) 
				{
					console.error("Error while login ");
					deferred.reject(reason);
				});
		
		return deferred.promise;
	}	
}]);
 
 </script>

</body>
</html>
