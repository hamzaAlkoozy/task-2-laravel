<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validatedData = $request->validate([
            'first_name' => 'required|max:255',
            'last_name' => 'required|max:255',
            'date_of_birth' => 'required|date',
            'gender' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:8',
        ]);

        $validatedData['password'] = Hash::make($request->password);

        $user = User::create($validatedData);

        if ($user) {
            $accessToken = $user->createToken('authToken')->plainTextToken;

            return response(['user' => $user, 'access_token' => $accessToken], 200);
        }

        return response(['message' => 'Registration failed'], 400);
    }

    public function login(Request $request)
    {
        $loginData = $request->validate([
            'email' => 'email|required',
            'password' => 'required|min:8|max:32'
        ]);

        if (!auth()->attempt($loginData)) {
            return response(['message' => 'Invalid credentials'], 401);
        }

        $accessToken = auth()->user()->createToken('authToken')->plainTextToken;

        return response(['user' => auth()->user(), 'access_token' => $accessToken]);
    }

    public function logout(Request $request)
    {
        auth()->user()->tokens()->delete();

        return response(['message' => 'Logged out']);
    }
}
