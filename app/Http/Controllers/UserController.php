<?php

namespace App\Http\Controllers;

use App\Models\User;
use Error;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index()
    {
        return view('user.index');
    }
    public function sendPhoneOtp(Request $request)
    {

        try {
            DB::beginTransaction();
                
                    $user = User::query()->where('phone', $request->phone)->first();
                    
                        $otpCode = rand(111111, 999999);
                        $user->otp = Hash::make($otpCode);
                        $user->save();
                        $message = 'رمز التحقق الخاص بك هو'.$otpCode;
                        // return response()->json($user);

                        //send otp via WhatsApp
                        if (Common::checkPhoneRegisteredOnWhatsapp($request->phone)) {
                            Common::sendWhatsappTextMessage($request->phone,$message);
                        }
            DB::commit();
            return response()->json('تم إرسال رقم التحقق الى تطبيق الواتس أب الخاص بك .. إذا لم يكن الرقم مسجل مسبقاً في تطبيق الواتس أب سيتم إرسال رمز التحقق اليك من قبل خدمة العملاء برسالة نصية ( قد يستغرق بعض الوقت ).. شكراً لك ');
        } catch (Exception|Error $th) {
            DB::rollBack();
            return response(['data' => [$th->getMessage()]], 423);
        }
    }


    public function verifyPhoneOtp(Request $request)
    {
        try {
            
                
                    $user = User::query()->where('phone', $request->phone)->first();
                    if ($user) {
                        if (Hash::check($request->code, $user->otp)) {
                            $user->otp = Hash::make(rand(111111, 999999));
                            $user->save();
                            return response()->json('تم التحقق بنجاح');
                        } else {
                            return response(['data' => ['عذرا . رمز التحقق غير صحيح']], 422);
                        }
                    } else {
                        return response(['data' => ['عذرا . لا يوجد رمز تحقق لهذا الرقم']], 422);
                    }

            

        } catch (Exception|Error $th) {
            return response(['data' => [$th->getMessage()]], 422);
        }
    }
    public function resetPassword(Request $request)
    {
        try {
            DB::beginTransaction();
            $user = User::query()->where('phone', $request->phone)->first();
            $user->password = Hash::make($request->password);
            $user->save();
            DB::commit();
            return response()->json('تم تغيير كلمة المرور بنجاح');
        } catch (Exception|Error $th) {
            DB::rollBack();
            return response(['data' => [$th->getMessage()]], 422);
        }
    }
}
