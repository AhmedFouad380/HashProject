<?php

use App\Http\Controllers\Admin\SynonymController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\InboxController;
use App\Http\Controllers\Admin\UserController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/login', function () {
    return view('login');
})->name('login');
Route::get('Admin-Panel', function () {
    return redirect('inbox');
});


Route::get('/admin/login', function () {
    return view('login');
});

Route::POST('/UserLogin', [\App\Http\Controllers\Admin\AdminController::class, 'login']);
Route::get('/logout', [\App\Http\Controllers\Admin\AdminController::class, 'logout']);


Route::get('lang/{lang}', function ($lang) {

    if (session()->has('lang')) {
        session()->forget('lang');
    }
    if ($lang == 'en') {
        session()->put('lang', 'en');
    } else {
        session()->put('lang', 'ar');
    }


    return back();
});

Route::group(['middleware' => ['web', 'User']], function () {

    Route::get('/', function () {
        if (Auth::guard('admins')->check()) {
            return redirect('Setting');
        } else {
            return redirect('inbox');

        }
    });
    Route::get('/Users', [UserController::class, 'index'])->middleware('Admin');


    Route::get('/Profile', [\App\Http\Controllers\Admin\AdminController::class, 'Profile']);
    Route::post('/Update_Profile', [\App\Http\Controllers\Admin\AdminController::class, 'Update_Profile']);


    Route::get('/inbox', [InboxController::class, 'index'])->middleware('User');
    Route::get('/outbox', [InboxController::class, 'outbox']);


    Route::get('/inbox/{id}', [InboxController::class, 'SingleInbox']);
    Route::get('/replies/{id}', [InboxController::class, 'Replies']);
    Route::get('/get-users/{type}', [InboxController::class, 'getUsers']);
    Route::post('/sendInbox', [InboxController::class, 'store']);
    Route::post('/sendReply', [InboxController::class, 'StoreReply']);

});
Route::post('/Update_Setting', [\App\Http\Controllers\Admin\SettingController::class, 'update'])->middleware('Admin');;
Route::get('/Setting', [\App\Http\Controllers\Admin\SettingController::class, 'index'])->middleware('Admin');;


Route::get('/Users', [UserController::class, 'index'])->middleware('Admin');
Route::post('/Create_Users', [UserController::class, 'store'])->middleware('Admin');;
Route::get('/Delete_Users', [UserController::class, 'delete'])->middleware('Admin');;
Route::post('/Update_Users', [UserController::class, 'update'])->middleware('Admin');;
Route::get('/UsersSearch', [UserController::class, 'Search'])->middleware('Admin');
Route::get('/Edit_User', [UserController::class, 'edit'])->middleware('Admin');
Route::get('/Edit_User_notation', [UserController::class, 'show']);

Route::get('/Admins', [\App\Http\Controllers\Admin\AdminController::class, 'index'])->middleware('Admin');;

Route::post('/Create_Admins', [\App\Http\Controllers\Admin\AdminController::class, 'store'])->middleware('Admin');;
Route::get('/Delete_Admins', [\App\Http\Controllers\Admin\AdminController::class, 'delete'])->middleware('Admin');;
Route::post('/Update_Admins', [\App\Http\Controllers\Admin\AdminController::class, 'update'])->middleware('Admin');;
Route::get('/AdminsSearch', [\App\Http\Controllers\Admin\AdminController::class, 'search'])->middleware('Admin');;
Route::get('/Edit_Admins', [\App\Http\Controllers\Admin\AdminController::class, 'edit'])->middleware('Admin');;
Route::get('/UpdateStatusAdmin', [\App\Http\Controllers\Admin\AdminController::class, 'UpdateStatusUser'])->middleware('Admin');;


Route::get('/Synonym', [SynonymController::class, 'index'])->middleware('Admin');
Route::post('/Create_Synonym', [SynonymController::class, 'store'])->middleware('Admin');;
Route::get('/Delete_Synonym', [SynonymController::class, 'delete'])->middleware('Admin');;
Route::post('/Update_Synonym', [SynonymController::class, 'update'])->middleware('Admin');;
Route::get('/Edit_Synonym', [SynonymController::class, 'edit'])->middleware('Admin');
