<?php

namespace App\Services;

use App\Models\User;

class UserService
{

    protected $user;

    public function __construct(User $user)
    {
        $this->user = $user;
    }


    public function createUser(array $data): User
    {
        $user = $this->user->create($data);
        return $user;
    }

    public function updateUser(User $user, array $data): User
    {
       $user->update($data);
        return $user;
    }

    public function deleteUser(User $user): void
    {
        $user->delete();
    }
}
