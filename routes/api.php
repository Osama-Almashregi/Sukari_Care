<?php

use App\Http\Controllers\Auth\TokenController;
use App\Http\Controllers\Doctor\DoctorController;
use App\Http\Controllers\Patient\PatientController;
use App\Http\Controllers\UserController;
use App\Http\Middleware\AuthAdmin;
use App\Models\User;
use Illuminate\Container\Attributes\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use PhpParser\Comment\Doc;
Route::post('/send_otp', [UserController::class,'sendPhoneOtp']);
Route::post('/verify_otp', [UserController::class,'verifyPhoneOtp']);
Route::post('reset_password', [UserController::class,'resetPassword']);


Route::group(['middleware' => 'auth:sanctum'],function () {
    Route::delete('/logout', [TokenController::class,'destroy']);
    Route::get('/user', function (Request $request) {
        $user = $request->user();
        if($user->role == 'doctor'){
            $user->load('profile','doctor');
            $combinedData = [
                'id' => $user->id,
                'doctor_id' =>  $user->doctor->id,
                'doctor_name' => $user->profile->first_name . ' ' . $user->profile->last_name,
                'name' => $user->name,
                'email' => $user->email,
                // إضافة بيانات الملف الشخصي
                'date_of_birth' => $user->profile->date_of_birth,
                'contact_info' => $user->profile->contact_info,
             ];
             return response()->json($combinedData);
        }elseif($user->role == 'patient'){
            $user->load('profile','patient');
            $combinedData = [
                'id' => $user->id,
                'patient_id' =>  $user->patient->id,
                'patient_name' => $user->profile->first_name . ' ' . $user->profile->last_name,
                'name' => $user->name,
                'email' => $user->email,
                // إضافة بيانات الملف الشخصي
                'date_of_birth' => $user->profile->date_of_birth,
                'contact_info' => $user->profile->contact_info,
             ];
             return response()->json($combinedData);
        }
        
     
        // دمج البيانات في مصفوفة واحدة
       

});
    Route::post('/getPatients',[DoctorController::class,'getPatients'])->name('getPatients');
    Route::get('/blogs',[DoctorController::class,'show_blogs'])->name('show_blogs');
    Route::post('/getPatient',[DoctorController::class,'getPatient'])->name('getPatient');
    Route::post('/updateDoctorProfile',[DoctorController::class,'update_Doctor_profile'])->name('updateDoctorProfile');
    Route::post('/addPatient',[DoctorController::class,'add_patient'])->name('addPatient');
    Route::get('/doctor_blogs',[DoctorController::class,'show_doctor_blogs'])->name('doctor_blogs');
    Route::post('/add_blog',[DoctorController::class,'add_blog']);
    Route::get('/show_blog',[DoctorController::class,'show_blog'])->name('show_blog');
    Route::post('/add_favorite',[DoctorController::class,'add_favorite']);
    Route::post('/get_favorites',[DoctorController::class,'get_favorites']);
    Route::post('/delete_favorite',[DoctorController::class,'deleteFavorite']);
    Route::post('/add_meal_recommendation',[DoctorController::class,'add_meal_recommendation'])->name('add_meal_recommendation');
    Route::get('/get_comments',[DoctorController::class,'get_comments_of_blog'])->name('get_comments');
    Route::post('/add_drug_recommendation',[DoctorController::class,'add_drug_recommendation'])->name('add_drug_recommendation');
    Route::post('/add_exercise_recommendation',[DoctorController::class,'add_exercise_recommendation'])->name('add_exercise_recommendation');
    Route::post('/add_comment',[DoctorController::class,'add_comment']);
    Route::delete('/delete_comment',[DoctorController::class,'delete_comment'])->name('delete_comment');
    Route::post('/edit_blog',[DoctorController::class,'edit_blog'])->name('edit_blog');
    Route::delete('/delete_blog',[DoctorController::class,'delete_blog'])->name('delete_blog');
    Route::get('/Patient_info',[PatientController::class,'patient_info'])->name('patient_info');
    Route::post('add_blood_test',[PatientController::class,'add_blood_test']);
    Route::post('/update_User',[PatientController::class,'update_User']);
    Route::get('/get_meal_recommendation',[PatientController::class,'get_meal_recommendation'])->name('get_meal_recommendation');
    Route::post('/add_meal_system',[PatientController::class,'add_meal_system']);
    Route::post('/update_doctor_profile',[DoctorController::class,'update_Doctor_profile']);
    Route::get('/get_exercise_recommendation',[PatientController::class,'get_exercise_recommendation']);
    Route::get('/get_drug_recommendation',[PatientController::class,'get_drug_recommendation'])->name('get_drug_recommendation');
    Route::get('/get_patients_reading',[PatientController::class,'get_patients_readings'])->name('get_patients_reading');
    Route::get('/get_statistics',[PatientController::class,'get_statistics']);
    Route::post('/Add_glucose_reading',[PatientController::class,'Add_glucose_reading']);
    Route::post('/add_alarm',[PatientController::class,'add_alarm']);
    Route::post('/add_p',[DoctorController::class,'add_p']);
    Route::get('/get_alarms',[PatientController::class,'get_alarms']);
    Route::delete('/delete_alarm',[PatientController::class,'delete_alarm']);
    Route::get('/getNotifications',[PatientController::class,'getNotifications']);

});
// Route::post('/edit_comment',[DoctorController::class,'edit_comment'])->name('edit_comment');
// Route::get('/getDoctor',[DoctorController::class,'getDoctor'])->name('getDoctor');
//not need Authorizatil;gonloginon to access this route______________________________________________________________________
Route::post('/getLoginToken', [TokenController::class,'getLoginToken']);
// Route::get('/getDoctors',[DoctorController::class,'getAllDoctors'])->name('getDoctors');


// Route::post('/addLifeStyle',[DoctorController::class,'addLifeStyle'])->name('addLifeStyle');
// Route::post('/getLifeStyle',[DoctorController::class,'getlifeStyle'])->name('getLifeStyle');


// Route::delete('/delete_comment',[DoctorController::class,'delete_comment'])->name('delete_comment');



Route::post('/add_relative',[PatientController::class,'add_relative'])->name('add_relative');
Route::get('/get_relative',[PatientController::class,'get_relative'])->name('get_relative');
Route::post('/update_relative',[PatientController::class,'update_relative'])->name('update_relative');


    