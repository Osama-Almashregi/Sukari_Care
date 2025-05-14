<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\meal_system;
use App\Models\patient;
use App\Models\User;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TokenController extends Controller
{
    public function getLoginToken(Request $request)
    {
        // dd($request->all());
        $this->validate($request, [
            // 'email' => 'required|email',
            'phone' => 'required',
            'password' => 'required',
        ]);
        // dd($request->all());

        if (!Auth::attempt($request->only('phone', 'password'))) {
            return response()->json(['message' => 'خطأ في رقم الهاتف أو كلمة المرور'], 401);
        } elseif (User::where('phone', $request->phone)->where('role', 'admin')->first() == true) {
            return response()->json(['message' => 'You are not allowed to login as admin'], 401);
        }
       
        return [
            'token' => $request->user()->createToken('web')->plainTextToken,
            'id' => $request->user()->id,
            'name' => $request->user()->name,
            'phone' => $request->user()->phone,
            'role' => $request->user()->role,
            'status' => $request->user()->status,
            //check if user has image
            'image_url' => $request->user()->profile->image_url ?? null,
            'has_meal_system' => patient::where('user_id', Auth::user()->id)->first() && meal_system::where('patient_id', patient::where('user_id', Auth::user()->id)->first()->id)->first() ? true : false

        ];
    }
    public function destroy(Request $request)
    {

        $request->user()->currentAccessToken()->delete();
        return ['message' => 'Successfully logged out'];
    }
}
