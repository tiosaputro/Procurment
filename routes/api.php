<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('/login','LoginController@login');
Route::get('/logout', 'LoginController@logout')->middleware('auth:sanctum');
//EMP BENTU
Route::middleware(['auth:sanctum'])->group(function(){
    //Rfs_bentu
    Route::get('/my-rfs-bentu/{usr_name}','RfsBentuController@getMyRfs');
    Route::get('/all-rfs','RfsBentuController@getAllRfs');
    Route::post('/add-rfs-bentu','RfsBentuController@save');
    Route::get('/edit-rfs-bentu/{code}','RfsBentuController@edit');
    Route::put('/update-rfs-bentu/{code}','RfsBentuController@update');
    Route::get('/change-status-rfs-bentu/{rfs_id}','RfsBentuController@changeStatus');

    //Detail Rfs Bentu
    Route::get('/detail-rfs-bentu/{code}','DetailBentuRfsController@index');
    Route::post('/add-detail-rfs-bentu/{code}','DetailBentuRfsController@save');
    Route::get('/edit-detail-rfs-bentu/{rfsd_id}','DetailBentuRfsController@edit');
    Route::put('/update-detail-rfs-bentu/{rfsd_id}','DetailBentuRfsController@update');
    Route::delete('/delete-detail-rfs-bentu/{rfsd_id}','DetailBentuRfsController@delete');
});
Route::get('/cetak-excel-rfs-bentu-detail/{code}','DetailBentuRfsController@cetakExcel');
Route::get('/cetak-pdf-rfs-bentu-detail/{code}','DetailBentuRfsController@cetakPdf');
