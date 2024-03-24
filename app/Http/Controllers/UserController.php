<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function store(Request $request)
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
        return response()->json($user, 201);
    }

    public function show(User $user)
    {
        return $user;
    }

    public function index(Request $request)
    {
        return User::filter($request->filter)->get();
    }

    public function update(Request $request)
    {
        $user = User::find($request->id);
        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }

        $validatedData = $request->validate([
            'first_name' => 'required|max:255',
            'last_name' => 'required|max:255',
            'date_of_birth' => 'required|date',
            'gender' => 'required',
            'email' => 'required|email|unique:users,email,' . $user->id,
            'password' => 'required|min:8',
        ]);

        $user->update($validatedData);
        return response()->json($user, 200);
    }

    public function destroy(Request $request)
    {
        $user = User::find($request->id);
        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }

        // Detach the relationships
        $user->projects()->detach();
        $user->timesheets()->delete();

        $user->delete();
        return response()->json(['success' => 'Deleted successfully'], 200);
    }
}
