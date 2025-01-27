<?php

use App\Http\Controllers\NewsItem\NewsItemController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::controller(NewsItemController::class)->group(function () {
    // Route::get('/fetch-news-api', 'fetchNewsApiNews');
    // Route::get('/fetch-ny-times', 'fetchNYTimesNews');
    // Route::get('/fetch-guardian-news', 'fetchGuardianNews');
});

Route::controller(NewsItemController::class)->group(function () {
    Route::get('/sources', 'getSources')->middleware('auth:sanctum');
    Route::get('/categories', 'getCategories')->middleware('auth:sanctum');
    Route::get('/add-sources/{name}', 'addNewsSource')->middleware('auth:sanctum');
    Route::get('/user-news-preferences', 'getUserNewsPreferences')->middleware('auth:sanctum');
    Route::get('/user-news', 'getUserNews')->middleware('auth:sanctum');
});

