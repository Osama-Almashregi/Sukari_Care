<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
       
        if(Auth::user()->role == 'admin')
        {
            return redirect()->route('admin.index');
        }
       elseif(Auth::user()->role == 'doctor' || Auth::user()->role == 'patient' || Auth::user()->role == 'relative')
       {
        if(Auth::user()->status == 'suspend'){
            Auth::logout();
            return redirect()->route('login')->with('error', 'Your  account has been suspended. Please contact the administrator.');
        }
           return redirect()->route('user.index');
       }
       else
       {
        return redirect()->route('user.index');
       }
       
    }
   
}
