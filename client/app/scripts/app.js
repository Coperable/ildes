'use strict';

angular
.module('slamApp', [
    'ngAnimate',
    'ngAria',
    'ngCookies',
    'ngMessages',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'config',
    'ngTouch',
    'ui.router',
    'pascalprecht.translate',
    'satellizer'
])
.config(function($routeProvider, $authProvider, $locationProvider) {
    $routeProvider
    .when('/home', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl',
        controllerAs: 'main'
    })
    .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl',
        controllerAs: 'main'
    })
    .when('/proyectos', {
        templateUrl: 'views/proyectos.html',
        controller: 'proyecto-list'
    })
    .otherwise({
        redirectTo: '/'
    });

})
.config(function ($translateProvider, api_host) {

    //$translateProvider.useMissingTranslationHandlerLog();

    $translateProvider.useUrlLoader(api_host+'/api/translation');
    $translateProvider.preferredLanguage('es_ES');
    $translateProvider.useMissingTranslationHandlerLog();


    //$translateProvider.useLocalStorage();

})
.constant('LOCALES', {
    'locales': {
        'es_ES': 'Español',
        'en_US': 'English'
    },
    'preferredLocale': 'es_ES'
})

.directive('ngEnter', function () {
    return function (scope, element, attrs) {
        element.bind("keydown keypress", function (event) {
            if(event.which === 13) {
                scope.$apply(function (){
                    scope.$eval(attrs.ngEnter);
                });

                event.preventDefault();
            }
        });
    };
})
.run(function($rootScope, $location, $anchorScroll) {
    $rootScope.$on('$routeChangeSuccess', function(newRoute, oldRoute) {
        if($location.hash()) {
            $anchorScroll();
        } else {
            window.scrollTo(0, 0);

        }
    });
});

;
