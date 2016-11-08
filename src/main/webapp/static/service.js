'use strict';

angular.module('myApp').service('EmployeeService', ['$http', '$q', function($http, $q)
                                                    {

	var REST_SERVICE_URI4 = 'http://localhost:8080/ResourceManagement/login/';

	var REST_SERVICE_URI5 = 'http://localhost:8080/ResourceManagement/loginSuccess/';
	
	this.loginEmployee = function (employee)
		{
			var deferred = $q.defer();
			$http.post(REST_SERVICE_URI4,employee)
			.then(
					function(response) 
					{
						deferred.resolve(response.data);

					},
					function(reason) 
					{
						console.error("Error while login ");
						deferred.reject(reason);

					});

			return deferred.promise;
		}

		this.fetchId = function ()
		{
			alert('fetching');
			var deferred = $q.defer();
			$http.get(REST_SERVICE_URI5)
			.then(
					function(response) 
					{
						console.log('Hiiiiiii');
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
