'use strict';

angular.module('myApp').controller('myController',['$scope','EmployeeService',function($scope,EmployeeService) 
{
	$scope.projects = [];
	$scope.roles = [];
	$scope.resources = [];
	$scope.project = {proj_name:''};
	$scope.employee= {username:'',password:''};
	$scope.employees;
	$scope.adminhome={proj_name:'',role:''};
	$scope.projectlist= {proj_name:''};
	$scope.rolelist={role:''};
	$scope.adminhome={proj_name:'',role:''};


	function fetchId()
		{
			EmployeeService.fetchId().then(	            	
					function(d) 
					{
						$scope.employees = d;
						console.log(d);
						console.log(d.desigination);
						if(d.desigination == "manager")
							{
							console.log(d);
							alert('redirecting manager');
							window.location.href = "http://localhost:8080/ResourceManagement/ManagerHome.jsp";
							}

						if(d.desigination == "admin")
							{
							window.location.href = "http://localhost:8080/ResourceManagement/AdminHome.jsp"
							console.log(d);
							}

						else
							alert('Invalid User.');
					},
					function(errResponse){
						console.error('Error while fetching Users');
					}
			);	   
		}

		$scope.loginEmployee= function()
		{
			alert("IN login Employee Function 2");
			EmployeeService.loginEmployee($scope.employee).then(fetchId,function(errorMsg)
					{
				console.error('Failed to login');
					});
		}
		
}]);








