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

/*
Route::get('/', function () {
    return view('welcome');
});
*/




Route::get('home', ['as'=>'posts','uses'=>'PostController@index']);
// Authentication routes...
Route::get('auth/login', 'Auth\AuthController@getLogin');
Route::post('auth/login', 'Auth\AuthController@postLogin');
Route::get('auth/logout', 'Auth\AuthController@getLogout');
// Registration routes...
Route::get('auth/register', 'Auth\AuthController@getRegister');
Route::post('auth/register', 'Auth\AuthController@postRegister');
// Password reset link request routes...
Route::get('password/email', 'Auth\PasswordController@getEmail');
Route::post('password/email', 'Auth\PasswordController@postEmail');
// Password reset routes...
Route::get('password/reset/{token}', 'Auth\PasswordController@getReset');
Route::post('password/reset', 'Auth\PasswordController@postReset');


get('/',['as'=>'posts','uses'=>'PostController@index']);
get('account/unpublished',['as'=>'posts.unpublished','uses'=>'PostController@unpublished']);
get('account',['as'=>'posts.account','uses'=>'PostController@account']);
/*
get('post/create',['as'=>'posts.create','uses'=>'PostController@create']);
post('post',['as'=>'posts.store','uses'=>'PostController@store']);
get('post/{post}',['as'=>'posts.show','uses'=>'PostController@show']);
get('post/{post}/edit',['as'=>'posts.edit','uses'=>'PostController@edit']);
post('post/{post}',['as'=>'posts.update','uses'=>'PostController@update']);
*/
$router->resource('post','PostController');


