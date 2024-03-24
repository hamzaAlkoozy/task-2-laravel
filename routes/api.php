<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\TimesheetController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// User authentication
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');

// TODO -hamza undo comment
Route::middleware('auth:sanctum')->group( function () {
    // User API endpoints
    Route::post('/user', [UserController::class, 'store']);
    Route::get('/user/{user}', [UserController::class, 'show']);
    Route::get('/user', [UserController::class, 'index']);
    Route::post('/user/update', [UserController::class, 'update']);
    Route::post('/user/delete', [UserController::class, 'destroy']);

    // Project API endpoints
    Route::post('/project', [ProjectController::class, 'store']);
    Route::get('/project/{project}', [ProjectController::class, 'show']);
    Route::get('/project', [ProjectController::class, 'index']);
    Route::post('/project/update', [ProjectController::class, 'update']);
    Route::post('/project/delete', [ProjectController::class, 'destroy']);

    // Timesheet API endpoints
    Route::post('/timesheet', [TimesheetController::class, 'store']);
    Route::get('/timesheet/{timesheet}', [TimesheetController::class, 'show']);
    Route::get('/timesheet', [TimesheetController::class, 'index']);
    Route::post('/timesheet/update', [TimesheetController::class, 'update']);
    Route::post('/timesheet/delete', [TimesheetController::class, 'destroy']);
});
