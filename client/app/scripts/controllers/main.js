'use strict';

/**
 * @ngdoc function
 * @name slamApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the slamApp
 */
angular.module('slamApp')
.controller('MainCtrl', function ($scope, $rootScope, $http, $sce, $timeout, api_host, Region, Account) {
	$rootScope.home_page = true;

    $scope.summary = $rootScope.region_summary;

    $scope.random_participants = [];

    $scope.newlines = function(text) {
        if(text) {
            return text.replace(/\n/g, '<br/>');
        } 
        return '';
    };

    $scope.setup_components = function() {
        setTimeout(function() {
            jQuery("#home_slider_2").carousel({
                interval:7e3
            });

            jQuery('[data-toggle="tooltip"]').tooltip({
                trigger: 'hover'
		    });

            jQuery('#carousel-torneos').carousel({
                interval: 1000,
                wrap: false
            });

            jQuery("#preloader").fadeOut("fast",function(){
                jQuery(this).remove()
            });


        }, 1000);
        if($scope.summary) {
            $scope.random_participants = _.shuffle($scope.summary.participants);
            $scope.calculateRandom($scope.random_participants);
        }

    };

    $scope.setup_components();

    $scope.calculateRandom = function(participants) {
        $scope.random_participants = _.shuffle($scope.summary.participants);

        $scope.lap_participants= [];

        var count = 0,
        lap = 0;

        $scope.lap_participants[lap] = [];

        _.each($scope.random_participants, function(model) {
            if(count == 4) {
                lap = lap + 1;
                count = 0;
                $scope.lap_participants[lap] = [];
            }
            $scope.lap_participants[lap].push(model);
            count = count + 1;
        });

        $timeout(function () {
            $('#carousel_EQUIPO').carousel();
        }, 1000);


    };

    $rootScope.$on("region_summary", function(event, summary) {
        $scope.summary = summary;
        $scope.calculateRandom($scope.summary.participants);
    });

    $scope.getYoutubeSrc = function(video) {
        return $sce.trustAsResourceUrl("http://www.youtube.com/embed/"+video.name);
    };

    $scope.participate = function(competition) {
        $http.post(api_host+'/api/competition/'+competition.id+'/participate', {})
        .success(function(data) {
            $scope.refresh();
        })
        .error(function(error) {

        });
    };

})
.controller('slider-controller', function ($scope, $auth, $timeout, Slider) {
    $scope.sliders = [];
    Slider.query(function(sliders) {
        $scope.sliders = sliders;
        console.dir(sliders);
        $timeout(function() {
            jQuery("#home_slider_main").carousel({
                interval: 3000
            });
        });
    });


})
.controller('site-controller', function ($scope, $rootScope, $http, $auth, $location, $anchorScroll, $timeout, $translate , Region, Account) {
    $scope.refresh = function() {
        Account.fetchRegionSummary();
    };

    $scope.isAuthenticated = function() {
        return $auth.isAuthenticated();
    };

    $scope.goEquipo = function() {
        $location.path('/');
        $timeout(function() {
            $scope.scrollTo('sec_equipo');
        }, 1000);
    };


    $scope.goSomos = function() {
        $location.path('/');
        $timeout(function() {
            $scope.scrollTo('about_menu');
        }, 1000);
    };

    $scope.goProyectos = function() {
        $location.path('/');
        $timeout(function() {
            $scope.scrollTo('sec_proyectos');
        }, 1000);
    };

    $scope.goContacto = function() {
        $location.path('/');
        $timeout(function() {
            $scope.scrollTo('sec_contacto');
        }, 1000);
    };

    $scope.scrollTo = function(id) {
      $location.hash(id);
      $anchorScroll();
   }

    $scope.selectLanguage = function(code) {
        $translate.use(code);
        $scope.usedLanguage = code;
    };

    $scope.descriptionLanguage = function() {
        switch($scope.usedLanguage) {
            case 'es_ES':
                return 'Español';
            case 'en_EN':
                return 'English';
            case 'de_DE':
                return 'Deutsch';
            default:
                return 'Español';
        }
    };

    $scope.usedLanguage = $translate.proposedLanguage();


})
.controller('sessionBar', function ($scope, $rootScope, $http, $route, $location, Region, Account) {
    $scope.regions = [];
    $scope.region = {};
    $scope.summary = $rootScope.region_summary;

    $scope.is_authenticated = false;
    $scope.account = false;
    $scope.profile = false;

    Region.query(function(regions) {
        $scope.regions = regions;
        if(_.isEmpty($scope.current_region)) {
            Account.setCurrentRegion(_.first($scope.regions));
        }
    });

    Account.getProfile(function(data) {
        $scope.profile = data;
    });

    $scope.changeCurrentRegion = function(region) {
        Account.setCurrentRegion(region);
    };

    $rootScope.$on("account", function(event, profile) {
        if(profile) {
            $scope.account = profile;
        }
    });

    $scope.logout = function() {
        Account.logout();
        $route.reload();
        $scope.refresh();
        window.scrollTo(0, 0);
    };

    $scope.goProfile = function() {
        $location.path('/invitado/'+Account.profile.id);
    };


})
.controller('proyecto-list', function ($scope, $rootScope, $http, $timeout, api_host, Region, Account) {
	$rootScope.home_page = false;

    $rootScope.$on("region_summary", function(event, summary) {
        $scope.processSummary();
    });

    $scope.competitions = [];
    $scope.espacios = [];
    $scope.fechas = [];
    $scope.tipos = [];


    $scope.processSummary = function() {
        console.log('process summary: ?'+$rootScope.region_summary);
        if($rootScope.region_summary) {
            console.log('ADENTRO');

            console.dir($scope.region_summary.competitions);
            $scope.summary = $rootScope.region_summary;
            $scope.competitions = $scope.summary.competitions;
            $scope.espacios  = $scope.summary.espacios;
            jQuery("#preloader").fadeOut("fast",function(){
                jQuery(this).remove()
            });
            $scope.processFechas();
            $scope.processTipos();
            $timeout(function() {
                $scope.doFilterFecha(false);
            });
        }
    };

    $scope.processFechas = function() {
        $scope.fechas = [];
        var fechas_map = {};
        _.each($scope.summary.competitions, function(model) {
            var fecha_moment = moment(model.event_date),
                code = 'd'+fecha_moment.format('DDDD');
            if(!fechas_map[code]) {
                $scope.fechas.push({
                    code: code,
                    formatted: fecha_moment.format('ddd D')
                });
                fechas_map[code] = true;
            }
        });
        
    };

    $scope.processTipos = function() {
        $scope.tipos = [];
        var tipos_map = {};
        _.each($scope.summary.competitions, function(model) {
            if(model.type && !tipos_map[model.type]) {
                $scope.tipos.push({
                    code: model.type
                });
                tipos_map[model.type] = true;
            }
        });
        
    };

    $scope.doFilterFecha = function(fecha) {
        $scope.current_espacio = false;
        $scope.current_tipo = false;
        if(fecha) {
            $scope.current_fecha = fecha.code;
            $scope.competitions = _.filter($scope.summary.competitions, function(model) {
                return 'd'+moment(model.event_date).format('DDDD') == fecha.code;
            });
        } else {
            $scope.current_fecha = false;
            $scope.competitions = $scope.summary.competitions;
        }
    };

    $scope.doFilterTipo = function(tipo) {
        $scope.current_espacio = false;
        if(tipo) {
            $scope.current_tipo = tipo.code;
            $scope.competitions = _.filter($scope.summary.competitions, function(model) {
                return model.type == tipo.code;
            });
        } else {
            $scope.current_tipo = false;
            $scope.competitions = $scope.summary.competitions;
        }
    };


    $scope.doFilter = function(espacio) {
        $scope.current_fecha = false;
        $scope.current_tipo = false;
        if(espacio) {
            $scope.current_espacio = espacio.code;
            $scope.competitions = _.filter($scope.summary.competitions, function(model) {
                return model.region_id == espacio.id;
            });
        } else {
            $scope.current_espacio = false;
            $scope.competitions = $scope.summary.competitions;
        }
    };

    $scope.processSummary();

	$scope.predicate = 'title';
	$scope.reverse = false;

    $scope.direction = function(direction) {
        $scope.reverse = direction;
    };

    $scope.sort = function(field) {
        if(field === 'date') {
            $scope.predicate = 'id';
        }
        if(field === 'ranking') {
            $scope.predicate = 'competitions';
        }
    };

    $scope.search_term = '';

    $scope.competitions = [];

    $scope.doSearch = function() {
        if($scope.search_term.trim() == '') {
            $scope.competitions = $scope.summary.competitions;
            return;
        }
        var pattern = new RegExp($scope.search_term, "gi");
        $scope.competitions = _.filter($scope.summary.competitions, function(model) {
            return pattern.test(JSON.stringify(model));
        });
    };


})

;
