<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
 */
// ini_set('display_errors', 1); ini_set('display_startup_errors', 1); error_reporting(E_ALL);

if (isset($_SERVER['HTTP_ORIGIN'])) {
    // Decide if the origin in $_SERVER['HTTP_ORIGIN'] is one
    // you want to allow, and if so:
    header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
    header('Access-Control-Allow-Credentials: true');
    header('Access-Control-Max-Age: 86400'); // cache for 1 day
}

// Access-Control headers are received during OPTIONS requests
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {

    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
    // may also be using PUT, PATCH, HEAD etc
    {
        header("Access-Control-Allow-Methods: GET, POST, PUT, PATCH, DELETE, OPTIONS");
    }

    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS'])) {
        header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");
    }

    exit(0);
}

$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->group(['prefix' => 'masterdata/satuan'], function () use ($router) {
    $router->get('satuan', 'MasterDataController@index');
    // $router->get('satu', 'MasterDataController@index');
    $router->post('insert', 'MasterDataController@save');
    // $router->post('firststep/{params}', 'Oawebcontroller@firststep');

    // $router->post('save', 'Oawebcontroller@save');
    // $router->get('update', 'Oawebcontroller@update');

    // // $router->get('cekdetail','Oawebcontroller@cekdetail');
    // $router->get('cekdetail/{id}', 'Oawebcontroller@cekdetail');
    // // signature

    // $router->post('savesignature', 'Oawebcontroller@save_signature');
    // $router->post('daftar_baru', 'Oawebcontroller@daftar_baru');
});

$router->get('sendata/{id}', 'Oawebcontroller@sendata');
$router->get('encp/{param_id}', 'Oawebcontroller@encp');
