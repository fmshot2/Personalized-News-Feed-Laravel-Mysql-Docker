<?php

namespace App\Repositories\Eloquents;

use App\Models\User;
use App\Repositories\Interfaces\UserRepositoryInterface;

class UserRepository implements UserRepositoryInterface
{

    /**
     * findUserById
     *
     * @param  mixed $id
     * @return mixed
     */
    public function findUserById(int $id)
    {
        // find User
        $user = User::findOrFail($id);

        // return user
        return $user;
    }

    /**
     * findUserByEmail
     *
     * @param  mixed $email
     * @return mixed
     */
    public function findUserByEmail(string $email)
    {
        // find user with email
        $user = User::whereEmail($email)->first();

        // return user or null if user is not found
        return $user;
    }

    /**
     * findUserByEmailOrUsername
     *
     * @param  mixed $key
     * @return mixed
     */
    function findUserByEmailOrUsername(string $key)
    {
        // find user by email or username
        // $user = User::where('email', $key)->orWhere('username', $key)->first();
        $user = User::where('email', $key)->first();

        // return
        return $user;
    }

    /**
     * createUser
     *
     * @param  mixed $data
     * @return mixed
     */
    public function createUser(array $data)
    {
        // create user
        $user = User::create($data);

        // return new user
        return $user->refresh();
    }

    /**
     * updateUser
     *
     * @param  mixed $id
     * @param  mixed $data
     * @return mixed
     */
    function updateUser(string $id, array $data)
    {
        // get user
        $user = User::findOrFail($id);

        // perform update
        $result = $user->update($data);

        // return the updated user or return null if user update failed
        return $result ? $user->refresh() : null;
    }

    /**
     * createUserAuthToken
     *
     * @param  mixed $id
     * @param  mixed $token_name
     * @return mixed
     */
    function createUserAuthToken(string $id, string $token_name)
    {
        // find user
        $user = User::findOrFail($id);

        // return new authentication token
        return $user->createToken($token_name, ['guard:user'])->toArray();
    }
}
