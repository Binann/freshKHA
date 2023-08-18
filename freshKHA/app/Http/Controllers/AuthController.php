<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function login(){
        return view('layouts.login');
    }

    public function loginPost(Request $request){
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',        
        ]);

        $credentials = ([
            'email' => $request->email,
            'password' => $request->password,
        ]);

        if(Auth::attempt($credentials)){           
            return redirect()->route('home');
        }        
        return back()->with('error', 'Email or Password is not valid');
    }

    public function register(){
        return view('layouts.register');
    }

    public function registerPost(Request $request){
        $request->validate([
            'name' => 'required|string|max:50',
            'email' => 'required|email|unique:users',
            'password' => 'min:6|required_with:confirm_password|same:confirm_password',
            'confirm_password' => 'required|min:6' 
        ]);

        $user = new User();
        $user -> name = $request -> name;
        $user -> email = $request -> email;
        $user -> password = Hash::make($request->password);
        $user->save();
        return back()->with('success', 'Register successfully');
        
    }

    public function logout(){     
        Auth::logout();
        return redirect() -> route('login');
    }
}
