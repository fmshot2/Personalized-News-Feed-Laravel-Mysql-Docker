<?php

namespace App\Http\Controllers\User\Auth;

use App\Helpers\ResponseHelper;
use App\Http\Controllers\Controller;
use App\Http\Requests\User\Auth\Login\LoginRequest;
use App\Repositories\Interfaces\UserRepositoryInterface;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    private UserRepositoryInterface $userRepository;

    public function __construct(UserRepositoryInterface $userRepository)
    {
        $this->userRepository    = $userRepository;
    }

    /**
     * login
     *
     * @param  mixed $request
     * @return mixed
     */
    public function login(LoginRequest $request)
    {
        // retrieve the validated input data...
        $validated = $request->validated();

        $credentials = ['email' => $validated['email'], 'password' => $validated['password']];

        if (!Auth::attempt($credentials)) {
            // Return an error response for invalid credentials
           return ResponseHelper::error('The provided credentials are incorrect.', [], 403);
        }

        // Authentication successful, generate a token or proceed with login
        $user = Auth::user();

        // create auth token
        $auth_token = $this->userRepository->createUserAuthToken($user->id, 'authToken');

        // return response
        return $auth_token
            ? ResponseHelper::success(['auth_token' => $auth_token['plainTextToken']], 'User login successfully')
            : ResponseHelper::error('There was an error creating auth token, please try again', [], 500);
    }
}
