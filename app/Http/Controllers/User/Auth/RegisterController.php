<?php

namespace App\Http\Controllers\User\Auth;

use App\Events\User\Auth\UserCreatedEvent;
use App\Helpers\ResponseHelper;
use App\Http\Controllers\Controller;
use App\Http\Requests\User\Auth\Register\RegistersRequest;
use App\Repositories\Interfaces\UserRepositoryInterface;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{
    private UserRepositoryInterface $userRepository;

    public function __construct(UserRepositoryInterface $userRepository)
    {
        $this->userRepository    = $userRepository;
    }

    /**
     * register
     *
     * @param  mixed $request
     * @return mixed
     */
    public function register(RegistersRequest $request)
    {
        // get validated data
        $validated = $request->validated();


        // Add additional data to validated variable
        $validated['password'] = Hash::make($validated['password']);

        // create user in db
        $user = $this->userRepository->createUser($validated);

        // if user was not created return error
        if (!$user) return ResponseHelper::error('there was an error while creating user', [], 500);

        // dispatch the user created event
        // UserCreatedEvent::dispatch($user);

        //create sanctum authentication token
        $auth_token = $this->userRepository->createUserAuthToken($user->id, 'authToken');

        // return response
        return $auth_token
            // ? ResponseHelper::success(['user' => $user->refresh(), 'auth_token' => $auth_token], 'User registered successfully')
            ? ResponseHelper::success(['auth_token' => $auth_token['plainTextToken']], 'User registered successfully')
            : ResponseHelper::error('Registration was successful but there was an error creating auth token, please login', [], 500);
    }
}
