<?php

/*
  |--------------------------------------------------------------------------
  | Application Routes
  |--------------------------------------------------------------------------
  |
  | Here is where you can register all of the routes for an application.
  | It's a breeze. Simply tell Laravel the URIs it should respond to
  | and give it the controller to call when that URI is requested.
  |
 */

Route::get('/', function () {
    return view('welcome');
});

Route::auth();

Route::get('/home', 'HomeController@index');



Route::group(['prefix' => 'admin'], function () {
    Route::get('index', [
        'as' => 'admin_index', 'uses' => 'Admin\IndexController@index'
    ]);
});

Route::group(['prefix' => 'home'], function () {
    Route::get('index', [
        'as' => 'home_index', 'uses' => 'Home\IndexController@index'
    ]);
});

