<?php

namespace App\Services\Auth;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;

class LoginService
{

    protected $user;

    public function __construct(User $user)
    {
        $this->user = $user;
    }


    public function login(string $mobile, string $password)
    {

        $user = $this->user->where('mobile', $mobile)->first();


        if ($user && $user->mobile_verified_at === null) {

            throw ValidationException::withMessages([
                'mobile' => ['Mobile number is not verified.'],
            ]);

        }


        if (Auth::guard('api')->attempt(['mobile' => $mobile, 'password' => $password])) {
            $token = Auth::guard('api')->attempt(['mobile' => $mobile, 'password' => $password]);
            return $token;
        }

        throw ValidationException::withMessages([
            'mobile' => ['Invalid mobile number or password'],
        ]);
    }
}
