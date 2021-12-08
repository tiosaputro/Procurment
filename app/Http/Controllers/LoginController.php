<?php

namespace App\Http\Controllers;

use Session;
use App\User;
use Auth;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    public function login(Request $request){

        $user= User::where('usr_email', $request->email)->first();
        
        if (!is_null ($user)) {
            if(Hash::check($request->password, $user->usr_passwd)) {
                $token = $user->createToken('ApiToken')->plainTextToken;
                    $response = [
                        'success'   => true,
                        'user'      => $user,
                        'token'     => $token,
                        'usr_name'  => $user->usr_name
                    ];
                    return response($response, 201);
                }else{
                    return response()->json(["success" => false, "password" => "Unable to login. Incorrect password."],422);
                    }
                 }else{
                    return response()->json(["success" => false, "email" => "Email doesnt exist."],422);
                }
            } 

            public function logout(Request $request)
            {
                $user = Auth::user()->tokens()->delete();
                return response()->json([
                    'success'    => true,
                    'message'    => $user,
                ], 200);
            }
        }