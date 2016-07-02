<?php

Route::post('auth/social/{name}', 'Auth\AuthController@doSocial');

Route::post('auth/login', 'Auth\AuthController@login');
Route::post('auth/signup', 'Auth\AuthController@signup');

Route::get('api/profile', ['middleware' => 'auth', 'uses' => 'ParticipantController@getProfile']);

Route::get('api/me', ['middleware' => 'auth', 'uses' => 'UserController@getUser']);
Route::put('api/me', ['middleware' => 'auth', 'uses' => 'UserController@updateUser']);

Route::get('api/region/{regionId}/summary', ['uses' => 'RegionController@summary']);

Route::post('api/users/assign/roles',  ['middleware' => 'auth', 'uses' => 'UserController@assignRoles']);
Route::post('api/users/assign/regions',  ['middleware' => 'auth', 'uses' => 'UserController@assignRegions']);

Route::resource('api/users', 'UserController');

Route::resource('api/participants', 'ParticipantController');
Route::resource('api/competitions', 'CompetitionController');
Route::resource('api/regions', 'RegionController');
Route::resource('api/roles', 'RoleController');
Route::resource('api/sliders', 'SliderController');
Route::resource('api/contacts', 'ContactController');

Route::get('api/regions/{regionId}/competitions', ['middleware' => 'auth', 'uses' => 'RegionController@competitions']);

Route::post('api/media/upload', ['middleware' => 'auth', 'uses' => 'MediaController@storeImage']);
Route::post('api/media/slider/upload', ['middleware' => 'auth', 'uses' => 'MediaController@storeImageSlider']);
Route::post('api/media/videos/search', ['uses' => 'MediaController@videosSearch']);

Route::resource('api/translations', 'TranslationController');
Route::resource('api/parametric/languages', 'LanguageController');
Route::get('api/translation', ['uses' => 'LanguageController@translation']);

Route::get('/', function () {
    return view('welcome');
});
