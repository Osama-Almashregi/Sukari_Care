<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\Doctor\DoctorController;
use App\Http\Controllers\EmailController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\UserController;
use App\Http\Middleware\AuthAdmin;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;

// Auth::routes([
//    'verify' => true
// ]);
// Route::get('/',[HomeController::class,'index'])->name('home');

// Route::middleware(['auth'])->group(function () {
//    Route::get('/account_dashboard',[UserController::class,'index'])->name('user.index'); 
// });
// Route::middleware(['auth',AuthAdmin::class])->group(function () {
//    Route::get('/admin-user-search_user',[AdminController::class,'search']);
//    Route::get('/admin-blog-search',[AdminController::class,'search_blog']);
//    Route::get('/admin-favorite-search',[AdminController::class,'search_favorite']);
//    Route::delete('/delete-favorite/{id}',[AdminController::class,'deleteFavorite'])->name('admin.favorites.destroy');
//    Route::get('/add-to-favorite/{id}', [AdminController::class,'addFavorite'])->name('admin.blog.favorite_blog');
//    Route::get('/favorites',[AdminController::class,'favorites'])->name('admin.favorites.index');
//    Route::post('/update-role', [AdminController::class,'updateRole'])->name('admin.user.update_role');
//    Route::get('/users/status/{user_id}/{status_code}', [AdminController::class,'updateStatus'])->name('user.status.update');
//    Route::get('/admin',[AdminController::class,'index'])->name('admin.index');
//    // Route::get('/register',[AdminController::class,'register'])->name('register');   
//    Route::get('/users',[AdminController::class,'users'])->name('admin.user.index');
//    Route::get('/add-user',[AdminController::class,'add_user'])->name('admin.user.add_user');
//    Route::get('users/{id}/edit-user/',[AdminController::class,'edit_user'])->name('admin.user.edit_user');
//    Route::put('/users/{id}/update-user/',[AdminController::class,'update_user'])->name('admin.user.update_user');
//    Route::delete('/users/{id}/delete-user/',[AdminController::class,'delete_user'])->name('admin.user.delete_user');
//    Route::get('/admin-user-search_user',[AdminController::class,'search']);
   
//    Route::get('/patients',[AdminController::class,'patients'])->name('admin.patients.index');
//    Route::get('/add-patient',[AdminController::class,'add_patient'])->name('admin.patients.add_patient');
//    Route::post('/store-patient',[AdminController::class,'store_patient'])->name('admin.patients.store_patient');
//    Route::get('patients/{id}/edit-patient/',[AdminController::class,'edit_patient'])->name('admin.patients.edit_patient');
//    Route::delete('/patients/{id}/delete-patient/',[AdminController::class,'delete_patient'])->name('admin.patients.delete_patient');
//    Route::get('/admin-patient-search_patient',[AdminController::class,'search_patient']);



//    Route::get('/admin-user-search_doctor',[AdminController::class,'search_doctor']);
//     Route::post('/store-user',[AdminController::class,'store_user'])->name('admin.user.store_user');
//     Route::get('/doctors',[AdminController::class,'doctors'])->name('admin.doctors.index');
//     Route::get('/add-doctor',[AdminController::class,'add_doctor'])->name('admin.doctors.add_doctor');
//     Route::post('/store-doctor',[AdminController::class,'store_doctor'])->name('admin.doctors.store_doctor');
//     Route::get('doctors/{id}/edit-doctor/',[AdminController::class,'edit_doctor'])->name('admin.doctors.edit_doctor');
//     Route::put('doctors/{id}/update-doctor/',[AdminController::class,'update_doctor'])->name('admin.doctors.update_doctor');
//     Route::delete('doctors/{id}/delete-doctor/',[AdminController::class,'delete_doctor'])->name('admin.doctors.delete_doctor');
//     Route::get('doctors_count',[AdminController::class,'doctors_count'])->name('admin.doctors_count');

//     Route::get('/blogs',[AdminController::class,'blogs'])->name('admin.blog.index');
//     Route::get('/add-blog',[AdminController::class,'add_blog'])->name('admin.blog.add_blog');
//     Route::post('/store-blog',[AdminController::class,'store_blog'])->name('admin.blog.store_blog');
//     Route::get('blogs/{id}/edit-blog/',[AdminController::class,'edit_blog'])->name('admin.blog.edit_blog');
//    Route::put('blogs/{id}/update-blog/',[AdminController::class,'update_blog'])->name('admin.blog.update_blog');
//    Route::delete('blogs/{id}/delete-blog/',[AdminController::class,'delete_blog'])->name('admin.blog.delete_blog');
//    Route::get('/comments',[AdminController::class,'comments'])->name('admin.comments.index');
//    Route::get('add-comment',[AdminController::class,'add_comment'])->name('admin.comments.add_comment');
//    Route::post('/store-comment',[AdminController::class,'store_comment'])->name('admin.comments.store_comment');
//    Route::get('comments/{id}/edit-comment/',[AdminController::class,'edit_comment'])->name('admin.comments.edit_comment');
//    Route::put('comments/{id}/update-comment/',[AdminController::class,'update_comment'])->name('admin.comments.update_comment');
//    Route::delete('comments/{id}/delete-comment/',[AdminController::class,'delete_comment'])->name('admin.comments.delete_comment');
// });


// ___________________________________________________________________________
