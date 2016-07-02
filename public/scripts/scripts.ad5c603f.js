!function(a,b){"object"==typeof exports&&"undefined"!=typeof module?b(require("../moment")):"function"==typeof define&&define.amd?define(["moment"],b):b(a.moment)}(this,function(a){"use strict";var b="Ene._Feb._Mar._Abr._May._Jun._Jul._Ago._Sep._Oct._Nov._Dic.".split("_"),c="Ene_Feb_Mar_Abr_May_Jun_Jul_Ago_Sep_Oct_Nov_Dic".split("_"),d=a.defineLocale("es",{months:"Enero_Febrero_Marzo_Abril_Mayo_Junio_Julio_Agosto_Septiembre_Octubre_Noviembre_Diciembre".split("_"),monthsShort:function(a,d){return/-MMM-/.test(d)?c[a.month()]:b[a.month()]},weekdays:"Domingo_Lunes_Martes_Miércoles_Jueves_Viernes_Sábado".split("_"),weekdaysShort:"Dom._Lun._Mar._Mié._Jue._Vie._Sáb.".split("_"),weekdaysMin:"Do_Lu_Ma_Mi_Ju_Vi_Sá".split("_"),longDateFormat:{LT:"H:mm",LTS:"H:mm:ss",L:"DD/MM/YYYY",LL:"D [de] MMMM [de] YYYY",LLL:"D [de] MMMM [de] YYYY H:mm",LLLL:"dddd, D [de] MMMM [de] YYYY H:mm"},calendar:{sameDay:function(){return"[hoy a la"+(1!==this.hours()?"s":"")+"] LT"},nextDay:function(){return"[mañana a la"+(1!==this.hours()?"s":"")+"] LT"},nextWeek:function(){return"dddd [a la"+(1!==this.hours()?"s":"")+"] LT"},lastDay:function(){return"[ayer a la"+(1!==this.hours()?"s":"")+"] LT"},lastWeek:function(){return"[el] dddd [pasado a la"+(1!==this.hours()?"s":"")+"] LT"},sameElse:"L"},relativeTime:{future:"en %s",past:"hace %s",s:"unos segundos",m:"un minuto",mm:"%d minutos",h:"una hora",hh:"%d horas",d:"un día",dd:"%d días",M:"un mes",MM:"%d meses",y:"un año",yy:"%d años"},ordinalParse:/\d{1,2}º/,ordinal:"%dº",week:{dow:1,doy:4}});return d}),angular.module("config",[]).constant("api_host","http://ildes.coperable.org").constant("instagram_token","").constant("instagram_client_id","").value("debug",!0),angular.module("slamApp",["ngAnimate","ngAria","ngCookies","ngMessages","ngResource","ngRoute","ngSanitize","config","ngTouch","ui.router","pascalprecht.translate","satellizer"]).config(["$routeProvider","$authProvider","$locationProvider",function(a,b,c){a.when("/home",{templateUrl:"views/main.html",controller:"MainCtrl",controllerAs:"main"}).when("/",{templateUrl:"views/main.html",controller:"MainCtrl",controllerAs:"main"}).when("/proyectos",{templateUrl:"views/proyectos.html",controller:"proyecto-list"}).otherwise({redirectTo:"/"})}]).config(["$translateProvider","api_host",function(a,b){a.useUrlLoader(b+"/api/translation"),a.preferredLanguage("es_ES"),a.useMissingTranslationHandlerLog()}]).constant("LOCALES",{locales:{es_ES:"Español",en_US:"English"},preferredLocale:"es_ES"}).directive("ngEnter",function(){return function(a,b,c){b.bind("keydown keypress",function(b){13===b.which&&(a.$apply(function(){a.$eval(c.ngEnter)}),b.preventDefault())})}}).run(["$rootScope","$location","$anchorScroll",function(a,b,c){a.$on("$routeChangeSuccess",function(a,d){b.hash()?c():window.scrollTo(0,0)})}]),angular.module("slamApp").factory("Region",["$resource","api_host",function(a,b){return a(b+"/api/regions/:id",{id:"@id"},{update:{method:"PUT"}})}]).factory("Competition",["$resource","api_host",function(a,b){return a(b+"/api/competitions/:id",{id:"@id"},{update:{method:"PUT"}})}]).factory("Slider",["$resource","api_host",function(a,b){return a(b+"/api/sliders/:id",{id:"@id"},{update:{method:"PUT"}})}]).factory("User",["$resource","api_host",function(a,b){return a(b+"/api/users/:id",{id:"@id"},{update:{method:"PUT"}})}]).factory("Participant",["$resource","api_host",function(a,b){return a(b+"/api/participants/:id",{id:"@id"},{update:{method:"PUT"}})}]).factory("Account",["$http","$rootScope","$auth","$location","api_host",function(a,b,c,d,e){return{profile:!1,profile_id:!1,fetching:!1,current_region:!1,roles:[],regions:[],getProfile:function(f){var g=this;return console.log("1"),c.isAuthenticated()?(console.log("2"),g.profile?(console.log("3"),f?void f(g.profile):(console.log("4"),this.profile)):(console.log("5"),g.fetching?(g.listen(f),!1):(console.log("6"),g.fetching=!0,a.get(e+"/api/me").success(function(a){g.fetching=!1,null==a.user?(c.logout(),g.profile=!1,g.profile_id=!1,b.account=!1,g.broadcast(),d.url("/")):(console.log("7"),g.profile=a.user,g.profile_id=g.profile.id,b.account=g.profile,g.regions=g.profile.regions,g.roles=g.profile.roles,g.broadcast()),f&&f(g.profile)})["catch"](function(a){c.logout(),g.profile=!1,g.profile_id=!1,g.broadcast()})))):void(f&&g.listen(f))},hasRole:function(a){var b=_.find(this.roles,function(b){return b.name==a});return b?!0:!1},logout:function(){c.isAuthenticated()&&(this.profile=!1,this.profile_id=!1,c.logout(),b.account=!1,this.broadcast(),d.url("/"))},getStatus:function(){return a.get(e+"/api/me/status")},updateProfile:function(b){return a.put(e+"/api/me",b)},setCurrentRegion:function(a){this.current_region=a,b.current_region=a,this.fetchRegionSummary()},fetchRegionSummary:function(){console.log("fech "),a.get(e+"/api/region/"+this.current_region.id+"/summary").success(function(a){b.region_summary=a,b.page=a.page,b.$broadcast("region_summary",a)})},broadcastRegion:function(){b.$broadcast("current_region",this.current_region)},listenRegion:function(a){b.$on("current_region",function(b,c){c&&a(c)})},broadcast:function(){console.log("8"),b.$broadcast("account",this.profile)},listen:function(a){console.log("Account: set list for callback"),b.$on("account",function(b,c){c&&(console.log("Account: listening calling callback"),a(c))})}}}]).factory("User",["$resource","api_host",function(a,b){return a(b+"/api/users/:id",{id:"@id"},{update:{method:"POST"}})}]),angular.module("slamApp").controller("MainCtrl",["$scope","$rootScope","$http","$sce","$timeout","api_host","Region","Account",function(a,b,c,d,e,f,g,h){b.home_page=!0,a.summary=b.region_summary,a.random_participants=[],a.newlines=function(a){return a?a.replace(/\n/g,"<br/>"):""},a.calculateRandom=function(b){a.random_participants=_.shuffle(a.summary.participants),a.lap_participants=[];var c=0,d=0;a.lap_participants[d]=[],_.each(a.random_participants,function(b){4==c&&(d+=1,c=0,a.lap_participants[d]=[]),a.lap_participants[d].push(b),c+=1}),e(function(){$("#carousel_EQUIPO").carousel()},1e3)},a.setup_components=function(){setTimeout(function(){jQuery('[data-toggle="tooltip"]').tooltip({trigger:"hover"}),jQuery("#preloader").fadeOut("fast",function(){jQuery(this).remove()})},1e3),a.summary&&(a.random_participants=_.shuffle(a.summary.participants),a.calculateRandom(a.random_participants))},a.setup_components(),b.$on("region_summary",function(b,c){a.summary=c,a.calculateRandom(a.summary.participants)}),a.getYoutubeSrc=function(a){return d.trustAsResourceUrl("http://www.youtube.com/embed/"+a.name)},a.participate=function(b){c.post(f+"/api/competition/"+b.id+"/participate",{}).success(function(b){a.refresh()}).error(function(a){})}}]).controller("slider-controller",["$scope","$auth","$timeout","Slider",function(a,b,c,d){a.sliders=[],d.query(function(b){a.sliders=b,c(function(){jQuery("#home_slider_main").carousel({interval:3e3})},0)})}]).controller("site-controller",["$scope","$rootScope","$http","$auth","$location","$anchorScroll","$timeout","$translate","Region","Account",function(a,b,c,d,e,f,g,h,i,j){a.refresh=function(){j.fetchRegionSummary()},a.isAuthenticated=function(){return d.isAuthenticated()},a.goEquipo=function(){e.path("/"),g(function(){a.scrollTo("sec_equipo")},1e3)},a.goSomos=function(){e.path("/"),g(function(){a.scrollTo("about_menu")},1e3)},a.goProyectos=function(){e.path("/"),g(function(){a.scrollTo("sec_proyectos")},1e3)},a.goContacto=function(){e.path("/"),g(function(){a.scrollTo("sec_contacto")},1e3)},a.scrollTo=function(a){e.hash(a),f()},a.selectLanguage=function(b){h.use(b),a.usedLanguage=b},a.descriptionLanguage=function(){switch(a.usedLanguage){case"es_ES":return"Español";case"en_EN":return"English";case"de_DE":return"Deutsch";default:return"Español"}},a.usedLanguage=h.proposedLanguage()}]).controller("sessionBar",["$scope","$rootScope","$http","$route","$location","Region","Account",function(a,b,c,d,e,f,g){a.regions=[],a.region={},a.summary=b.region_summary,a.is_authenticated=!1,a.account=!1,a.profile=!1,f.query(function(b){a.regions=b,_.isEmpty(a.current_region)&&g.setCurrentRegion(_.first(a.regions))}),g.getProfile(function(b){a.profile=b}),a.changeCurrentRegion=function(a){g.setCurrentRegion(a)},b.$on("account",function(b,c){c&&(a.account=c)}),a.logout=function(){g.logout(),d.reload(),a.refresh(),window.scrollTo(0,0)},a.goProfile=function(){e.path("/invitado/"+g.profile.id)}}]).controller("proyecto-list",["$scope","$rootScope","$http","$timeout","api_host","Region","Account",function(a,b,c,d,e,f,g){b.home_page=!1,b.$on("region_summary",function(b,c){a.processSummary()}),a.competitions=[],a.espacios=[],a.fechas=[],a.tipos=[],a.processSummary=function(){console.log("process summary: ?"+b.region_summary),b.region_summary&&(console.log("ADENTRO"),console.dir(a.region_summary.competitions),a.summary=b.region_summary,a.competitions=a.summary.competitions,a.espacios=a.summary.espacios,jQuery("#preloader").fadeOut("fast",function(){jQuery(this).remove()}),a.processFechas(),a.processTipos(),d(function(){a.doFilterFecha(!1)}))},a.processFechas=function(){a.fechas=[];var b={};_.each(a.summary.competitions,function(c){var d=moment(c.event_date),e="d"+d.format("DDDD");b[e]||(a.fechas.push({code:e,formatted:d.format("ddd D")}),b[e]=!0)})},a.processTipos=function(){a.tipos=[];var b={};_.each(a.summary.competitions,function(c){c.type&&!b[c.type]&&(a.tipos.push({code:c.type}),b[c.type]=!0)})},a.doFilterFecha=function(b){a.current_espacio=!1,a.current_tipo=!1,b?(a.current_fecha=b.code,a.competitions=_.filter(a.summary.competitions,function(a){return"d"+moment(a.event_date).format("DDDD")==b.code})):(a.current_fecha=!1,a.competitions=a.summary.competitions)},a.doFilterTipo=function(b){a.current_espacio=!1,b?(a.current_tipo=b.code,a.competitions=_.filter(a.summary.competitions,function(a){return a.type==b.code})):(a.current_tipo=!1,a.competitions=a.summary.competitions)},a.doFilter=function(b){a.current_fecha=!1,a.current_tipo=!1,b?(a.current_espacio=b.code,a.competitions=_.filter(a.summary.competitions,function(a){return a.region_id==b.id})):(a.current_espacio=!1,a.competitions=a.summary.competitions)},a.processSummary(),a.predicate="title",a.reverse=!1,a.direction=function(b){a.reverse=b},a.sort=function(b){"date"===b&&(a.predicate="id"),"ranking"===b&&(a.predicate="competitions")},a.search_term="",a.competitions=[],a.doSearch=function(){if(""==a.search_term.trim())return void(a.competitions=a.summary.competitions);var b=new RegExp(a.search_term,"gi");a.competitions=_.filter(a.summary.competitions,function(a){return b.test(JSON.stringify(a))})}}]).factory("Contact",["$resource","api_host",function(a,b){return a(b+"/api/contacts/:id",{id:"@id"},{update:{method:"POST"}})}]).controller("ContactController",["$scope","$timeout","$http","Contact",function(a,b,c,d){a.contact=new d,a.is_sent=!1,a.send_contact=function(){a.contact.$save(function(b){a.is_sent=!0,a.contact=new d})}}]),angular.module("slamApp").filter("moment",function(){return function(a,b){return moment(a).locale("es").format(b)}}).filter("newlines",function(){return function(a){return a.replace(/\n/g,"<br/>")}}),angular.module("slamApp").filter("characters",function(){return function(a,b,c){if(isNaN(b))return a;if(0>=b)return"";if(a&&a.length>b){if(a=a.substring(0,b),c)for(;" "===a.charAt(a.length-1);)a=a.substr(0,a.length-1);else{var d=a.lastIndexOf(" ");-1!==d&&(a=a.substr(0,d))}return a+"…"}return a}}).filter("splitcharacters",function(){return function(a,b){if(isNaN(b))return a;if(0>=b)return"";if(a&&a.length>b){var c=a.substring(0,b/2),d=a.substring(a.length-b/2,a.length);return c+"..."+d}return a}}).filter("words",function(){return function(a,b){if(isNaN(b))return a;if(0>=b)return"";if(a){var c=a.split(/\s+/);c.length>b&&(a=c.slice(0,b).join(" ")+"…")}return a}}),+function(a,b){function c(c,d){function e(){var a='<div class="input-group"><span class="input-group-btn"><button data-toggle="collapse" href="#'+d.mapContainerId+'" class="btn btn-default"><span class="glyphicon glyphicon-globe"></span></button></span></div>';return a}function f(){if(d.mapContainerId){var b=a(c),f=b.parent(),g=f.children().index(c);b.replaceWith(e()),f.children().eq(g).append(c)}}function g(a){if(a){var b={query:a};v&&v.textSearch(b,function(a,b){if(b===google.maps.places.PlacesServiceStatus.OK)for(var c=0;c<a.length;c++)return void n(a[c])})}}function h(a){u.geocode({latLng:a},function(a,b){if(b===google.maps.GeocoderStatus.OK&&a[0]){var c=a[0];n(c,!1)}})}function i(){return p=a(d.map).get(0),p||d.mapContainerId&&(p=a("#"+d.mapContainerId+" .placepicker-map").get(0)),p?!0:!1}function j(){i()&&(q=new google.maps.Map(p,d.mapOptions),s.bindTo("bounds",q),google.maps.event.addListener(q,"click",function(a){var b=a.latLng;r.setPosition(b),q.panTo(b),c.blur(),h(b)}),r=new google.maps.Marker({map:q}),v=new google.maps.places.PlacesService(q),a(p).parent().on("show.bs.collapse",function(b){a(b.target).css("display","block").find('img[src*="gstatic.com/"], img[src*="googleapis.com/"]').css("max-width","none"),c.value?t.resize():t.geoLocation(),a(b.target).css("display","")}))}function k(){s=new google.maps.places.Autocomplete(c,d.autoCompleteOptions),google.maps.event.addListener(s,"place_changed",function(){var a=s.getPlace();a.geometry&&n(a)})}function l(){t.resize.call(t)}function m(){if(u=new google.maps.Geocoder,f(),k(),j(),c.value)g(c.value);else{var e=d.latitude||a(d.latitudeInput).prop("value"),h=d.longitude||a(d.longitudeInput).prop("value");e&&h&&t.setLocation(e,h)}a(b).on("resize",l),a(c).on("keypress",function(a){d.preventSubmit&&13===a.keyCode&&(a.preventDefault(),a.stopImmediatePropagation())})}function n(b,e){e="undefined"==typeof e?!0:!1,w=b,t.resize();var f=b.geometry.location;e&&o(f),a(d.latitudeInput).prop("value",f.lat()),a(d.longitudeInput).prop("value",f.lng()),e||(c.value=b.formatted_address),"function"==typeof d.placeChanged&&d.placeChanged.call(t,b)}function o(a){if(q){q.setCenter(a);var b=d.icon||d.placesIcon&&place.icon?place.icon:null;if(b){var c={url:b,size:new google.maps.Size(71,71),origin:new google.maps.Point(0,0),anchor:new google.maps.Point(17,34),scaledSize:new google.maps.Size(35,35)};r.setIcon(c)}r.setPosition(a),r.setVisible(!0)}}var p,q,r,s,t=this,u=null,v=null,w=null,x=null;this.setValue=function(a){c.value=a,g(a)},this.getValue=function(){return c.value},this.setLocation=function(a,b){var c=new google.maps.LatLng(a,b);this.setLatLng(c)},this.getLocation=function(){var a=this.getLatLng();return a?{latitude:a.lat(),longitude:a.lng()}:void 0},this.setLatLng=function(a){x=a,h(x)},this.getLatLng=function(){return w&&w.geometry?w.geometry.location:x},this.getMap=function(){return q},this.reload=function(){q&&g(c.value)},this.resize=function(){if(q){var a=q.getCenter();google.maps.event.trigger(q,"resize"),q.setCenter(a)}},this.geoLocation=function(a){navigator.geolocation?navigator.geolocation.getCurrentPosition(function(b){var c=new google.maps.LatLng(b.coords.latitude,b.coords.longitude);o(c),h(c),a&&a(c)},function(){a&&a(null)}):a&&a(null)},m.call(this)}var d="placepicker",e={map:"",mapOptions:{zoom:15},places:{icons:!1},autoCompleteOptions:{},placeChanged:null,location:null,preventSubmit:!0},f=c;a.fn[d]=function(b){return this.each(function(){return a(this).data(d)||a(this).data(d,new f(this,a.extend({},e,b,a(this).data()))),a(this)})}}(jQuery,window),angular.module("slamApp").run(["$templateCache",function(a){"use strict";a.put("views/main.html",'<!-- SEC: ACERCA DE --> <div id="about_menu"> <div class="clear"></div> <div class="wow fadeIn tabs_about"> <!-- MASK SIRVE PARA GENERAR EL FONDO OPACO Y CON LÍNEAS DIAGONALES --> <div class="mask"> <div class="borde_superior"></div> <ul class="menu_tabs" role="tablist"> <li class="active"> <a class="tab active text-uppercase" data-toggle="tab" role="button" data-target="#sectionA" translate="equipo"> SOMOS </a> </li> <li> <a class="tab text-uppercase" data-toggle="tab" role="button" data-target="#sectionB" translate="mision"> MISIÓN </a> </li> <li> <a class="tab text-uppercase" data-toggle="tab" role="button" data-target="#sectionC" translate="hacemos"> HACEMOS </a> </li> </ul> <div class="gap"></div> <div class="tab-content"> <div id="sectionA" class="tab-pane fade in active"> <ul class="about_columns"> <li class="list right"> <h4 class="uppercase" ng-switch on="usedLanguage"> <strong ng-switch-when="en_EN" ng-bind-html="newlines(page.somos_main_title_en)"></strong> <strong ng-switch-default ng-bind-html="newlines(page.somos_main_title)"></strong> </h4> <ol ng-switch on="usedLanguage"> <li ng-switch-when="en_EN" ng-bind-html="newlines(page.somos_main_en)"></li> <li ng-switch-default ng-bind-html="newlines(page.somos_main)"></li> </ol> </li> <li class="list con_sangria"> <h4 class="uppercase" ng-switch on="usedLanguage"><i class="fa fa-caret-right"></i> <span ng-switch-when="en_EN" ng-bind-html="newlines(page.somos_detail_title_en)"></span> <span ng-switch-default ng-bind-html="newlines(page.somos_detail_title)"></span> </h4> <div class="mini_gap"></div> <div ng-switch on="usedLanguage"> <p ng-switch-when="en_EN" ng-bind-html="newlines(page.somos_detail_en)"></p> <p ng-switch-default ng-bind-html="newlines(page.somos_detail)"></p> </div> </li> </ul> </div> <div id="sectionB" class="tab-pane fade"> <ul class="about_columns"> <li class="list right"> <h4 class="uppercase" ng-switch on="usedLanguage"> <strong ng-switch-when="en_EN" ng-bind-html="newlines(page.mision_main_title_en)"></strong> <strong ng-switch-default ng-bind-html="newlines(page.mision_main_title)"></strong> </h4> <ol ng-switch on="usedLanguage"> <li ng-switch-when="en_EN" ng-bind-html="newlines(page.mision_main_en)"></li> <li ng-switch-default ng-bind-html="newlines(page.mision_main)"></li> </ol> </li> <li class="list con_sangria"> <h4 class="uppercase" ng-switch on="usedLanguage"><i class="fa fa-caret-right"></i> <span ng-switch-when="en_EN" ng-bind-html="newlines(page.mision_detail_title_en)"></span> <span ng-switch-default ng-bind-html="newlines(page.mision_detail_title)"></span> </h4> <div class="mini_gap"></div> <div ng-switch on="usedLanguage"> <p ng-switch-when="en_EN" ng-bind-html="newlines(page.mision_detail_en)"></p> <p ng-switch-default ng-bind-html="newlines(page.mision_detail)"></p> </div> </li> </ul> </div> <div id="sectionC" class="tab-pane fade"> <ul class="about_columns"> <li class="list right"> <h4 class="uppercase" ng-switch on="usedLanguage"> <strong ng-switch-when="en_EN" ng-bind-html="newlines(page.hacemos_main_title_en)"></strong> <strong ng-switch-default ng-bind-html="newlines(page.hacemos_main_title)"></strong> </h4> <ol ng-switch on="usedLanguage"> <li ng-switch-when="en_EN" ng-bind-html="newlines(page.hacemos_main_en)"></li> <li ng-switch-default ng-bind-html="newlines(page.hacemos_main)"></li> </ol> </li> <li class="list con_sangria"> <h4 class="uppercase" ng-switch on="usedLanguage"><i class="fa fa-caret-right"></i> <span ng-switch-when="en_EN" ng-bind-html="newlines(page.hacemos_detail_title_en)"></span> <span ng-switch-default ng-bind-html="newlines(page.hacemos_detail_title)"></span> </h4> <div class="mini_gap"></div> <div ng-switch on="usedLanguage"> <p ng-switch-when="en_EN" ng-bind-html="newlines(page.hacemos_detail_en)"></p> <p ng-switch-default ng-bind-html="newlines(page.hacemos_detail)"></p> </div> </li> </ul> </div> </div> </div> </div> </div> <!-- SEC: EQUIPO --> <div id="sec_equipo" class="seccion"> <div class="borde_superior"></div> <div class="titulo wow fadeIn"> <h2 class="text-uppercase" translate="equipo"> EQUIPO </h2> </div> <div class="mini_gap"></div> <div id="carousel_EQUIPO" class="carousel slide" data-ride="carousel"> <!-- Wrapper for slides --> <div class="carousel-inner width_80" role="listbox"> <div ng-repeat="lap in lap_participants" class="item {{$index == 0 ? \'active\' : \'\'}}"> <div class="row col-md-12"> <div class="col-md-3" ng-class="{\'active\': $index == 0}" ng-repeat="invitado in lap|limitTo:4"> <div class="tarjeta_colaborador wow fadeInRightBig"> <div class="image_box"> <a href data-toggle="modal" data-target="#member_{{invitado.id}}"> <img ng-src="http://images.collab-dev.com/600x600/smart/ildes/{{invitado.cover_photo}}" class="image-responsive"> </a> </div> <!-- Display the Title as a link to the Post\'s permalink. --> <h4>{{invitado.name}} {{invitado.lastname}}</h4> </div> <div class="modal fade" id="member_{{invitado.id}}" tabindex="-1" role="dialog" aria-labelledby="miembro_01_Label"> <div class="modal-dialog" role="document"> <div class="modal-content"> <div class="modal-header"> <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button> <h4 class="modal-title" id="miembro_01_Label"> <strong> {{invitado.name}} {{invitado.lastname}} </strong> </h4> </div> <div class="modal-body"> <img ng-src="http://images.collab-dev.com/600x600/smart/ildes/{{invitado.cover_photo}}" class="image-responsive"> <div class="mini_gap"></div> <div ng-switch on="usedLanguage"> <p ng-switch-when="en_EN" ng-bind-html="newlines(invitado.about_en)"></p> <p ng-switch-default ng-bind-html="newlines(invitado.about)"></p> </div> </div> <div class="modal-footer"> <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> </div> </div> </div> </div> </div> </div> </div> </div> <!-- Controls --> <a class="left left_arrow" data-target="#carousel_EQUIPO" role="button" data-slide="prev"> <!-- span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span --> <svg width="26px" height="48"> <polygon points="3.3,24.5 25.5,2.3 24,0.8 0.3,24.5 24,48.2 25.5,46.7"></polygon> </svg> <span class="sr-only">Previous</span> </a> <a class="right right_arrow" data-target="#carousel_EQUIPO" role="button" data-slide="next"> <!-- span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span --> <svg width="26px" height="48"> <polygon points="22.5,24.5 0.3,2.3 1.8,0.8 25.5,24.5 1.8,48.2 0.3,46.7"></polygon> </svg> <span class="sr-only">Next</span> </a> </div> <div class="mini_gap"></div> </div> <div id="sec_proyectos" class="seccion fondo_gris"> <div class="borde_superior"></div> <div class="titulo wow fadeIn"> <h2 translate="ecosistema-de-proyectos">ECOSISTEMA DE PROYECTOS</h2> </div> <div class="mini_gap"></div> <div class="row width_90 wow fadeInLeftBig"> <div class="container_proy col-xs-12 col-sm-5 col-md-4 col-lg-3" ng-repeat="proyecto in summary.competitions"> <div class="tarjeta_proyectos"> <div class="image_box"> <a href data-toggle="modal" data-target="#proyecto_{{proyecto.id}}"> <img ng-src="http://images.collab-dev.com/smart/ildes/{{proyecto.cover_photo}}" class="image-responsive"> </a> </div> <div class="info_box"> <a href data-toggle="modal" data-target="#proyecto_{{proyecto.id}}"> <div ng-switch on="usedLanguage"> <h4 class="bold" ng-switch-when="en_EN">{{proyecto.title_en}}</h4> <h4 class="bold" ng-switch-default>{{proyecto.title}}</h4> </div> </a> <div ng-switch on="usedLanguage"> <h5 ng-switch-when="en_EN">{{proyecto.description_en|words:10}}</h5> <h5 ng-switch-default>{{proyecto.description|words:10}}</h5> </div> </div> </div> </div> </div> <div class="modal fade" id="proyecto_{{proyecto.id}}" tabindex="-1" role="dialog" aria-labelledby="proyecto_01_Label" ng-repeat="proyecto in summary.competitions"> <div class="modal-dialog" role="document"> <div class="modal-content"> <div class="modal-header"> <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button> <div ng-switch on="usedLanguage"> <h4 class="bold" ng-switch-when="en_EN">{{proyecto.title_en}}</h4> <h4 class="bold" ng-switch-default>{{proyecto.title}}</h4> </div> </div> <div class="modal-body"> <img ng-src="http://images.collab-dev.com/300x/smart/ildes/{{proyecto.cover_photo}}"> <div class="mini_gap"></div> <div ng-switch on="usedLanguage"> <p ng-switch-when="en_EN"><strong>{{proyecto.description_en}}</strong></p> <p ng-switch-default><strong>{{proyecto.description}}</strong></p> </div> <div ng-switch on="usedLanguage"> <p ng-switch-when="en_EN">{{proyecto.rules_en}}</p> <p ng-switch-default>{{proyecto.rules}}</p> </div> </div> <div class="modal-footer"> <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> </div> </div> </div> </div> <div class="width_90"> <a style="visibility: visible; animation-name: fadeInLeft" class="btn btn_principal" href="/#/proyectos" role="button">VER TODOS</a> </div> <div class="gap"></div> </div> <div id="sec_contacto" class="seccion"> <div class="borde_superior"></div> <div class="titulo wow fadeIn"> <h2 class="text-uppercase" translate="contacto">CONTACTO</h2> </div> <div class="row width_90"> <div class="col-xs-12 col-sm-6"> <!--h4>Aquí fa el feed de FB</h4--> </div> <div class="col-xs-12 col-sm-6"> <section id="contact_form" class="span6 form" ng-controller="ContactController"> <div ng-show="!is_sent"> <h3 translate="formulario-contacto"> Formulario de Contacto </h3> <form id="contact_form" method="post" ng-submit="send_contact()" class="span10"> <input type="text" class="form-control" placeholder="Nombre" name="name" ng-model="contact.name" required> <input type="email" class="form-control" placeholder="Email" name="email" ng-model="contact.email" required> <textarea name="comments" class="form-control" cols="10" rows="10" ng-model="contact.comment" required placeholder="Ingrese su mensaje aquí"> </textarea> <input type="submit" class="btn btn_principal" value="Enviar" name="submit"> </form> </div> <div ng-show="is_sent"> <h3 translate="confirmacion-envio"> Confirmación de Envío</h3> <p translate="mensaje-confirmaction-envio">El mensaje ha sido enviado. A la brevedad nos comunicaremos.</p> </div> </section> </div> </div> <div class="gap"></div> </div> <script src="scripts/minify.js"></script>'),a.put("views/proyectos.html",'<div class="gap"></div> <div id="sec_proyectos" class="seccion fondo_gris"> <div class="contenedor_sec torneo_info_inside"> <div class="titulo"> <h2 class="sombra_gris_blanco text-uppercase" translate="proyectos"> Proyectos </h2> </div> <div class="form-group"> <a class="btn btn_filtro" href role="button" ng-click="direction(false)"><i class="fa fa-sort-alpha-asc"></i></a> <a class="btn btn_filtro" href role="button" ng-click="direction(true)"><i class="fa fa-sort-alpha-desc"></i></a> <div class="input-group busqueda"> <input type="text" class="form-control" placeholder="BÚSQUEDA" ng-model="search_term" ng-enter="doSearch()"> <div class="input-group-addon" ng-click="doSearch()"><i class="fa fa-search"></i></div> </div> <div class="mini_gap"></div> </div> <div class="row"> <div class="col-xs-12 col-sm-4 col-md-3 container_proy" ng-repeat="proyecto in competitions| orderBy:predicate:reverse"> <div class="tarjeta_proyectos"> <div class="image_box"> <a href data-toggle="modal" data-target="#proyecto_{{proyecto.id}}"> <img ng-src="http://images.collab-dev.com/smart/ildes/{{proyecto.cover_photo}}" class="image-responsive"> </a> </div> <div class="info_box"> <a href data-toggle="modal" data-target="#proyecto_{{proyecto.id}}"> <div ng-switch on="usedLanguage"> <h4 class="bold" ng-switch-when="en_EN">{{proyecto.title_en}}</h4> <h4 class="bold" ng-switch-default>{{proyecto.title}}</h4> </div> </a> <div ng-switch on="usedLanguage"> <h5 ng-switch-when="en_EN">{{proyecto.description_en|words:10}}</h5> <h5 ng-switch-default>{{proyecto.description|words:10}}</h5> </div> </div> </div> <div class="modal fade" id="proyecto_{{proyecto.id}}" tabindex="-1" role="dialog" aria-labelledby="proyecto_01_Label" ng-repeat="proyecto in summary.competitions"> <div class="modal-dialog" role="document"> <div class="modal-content"> <div class="modal-header"> <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button> <div ng-switch on="usedLanguage"> <h4 class="bold" ng-switch-when="en_EN">{{proyecto.title_en}}</h4> <h4 class="bold" ng-switch-default>{{proyecto.title}}</h4> </div> </div> <div class="modal-body"> <img ng-src="http://images.collab-dev.com/300x/smart/ildes/{{proyecto.cover_photo}}"> <div class="mini_gap"></div> <div ng-switch on="usedLanguage"> <p ng-switch-when="en_EN"><strong>{{proyecto.description_en}}</strong></p> <p ng-switch-default><strong>{{proyecto.description}}</strong></p> </div> <div ng-switch on="usedLanguage"> <p ng-switch-when="en_EN">{{proyecto.rules_en}}</p> <p ng-switch-default>{{proyecto.rules}}</p> </div> </div> <div class="modal-footer"> <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> </div> </div> </div> </div> </div> </div> <div class="mini_gap"></div> </div> </div>')}]);