<?php

namespace App\Repositories\Interfaces;

interface UserRepositoryInterface
{
    public function findUserById(int $id);
    public function findUserByEmail(String $email);
    public function findUserByEmailOrUsername(string $key);
    public function createUser(array $data);
    public function createUserAuthToken(string $id, string $token_name);
    public function updateUser(string $id, array $data);
}
