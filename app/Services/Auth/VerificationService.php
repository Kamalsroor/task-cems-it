<?php

namespace App\Services\Auth;

use App\Models\User;
use Auth;
use Illuminate\Validation\ValidationException;

class VerificationService
{
    protected $user;



    public function __construct(User $user)
    {
        $this->user = $user;
    }

    public function verify(string $mobile, int $code)
    {
        $user = $this->user->where('mobile', $mobile)->first();

        if (!$user) {
            throw ValidationException::withMessages([
                'mobile' => ['Mobile number not found'],
            ]);
        }
        if ($user->verification_code != $code) {
            throw ValidationException::withMessages([
                'code' => ['Invalid verification code'],
            ]);
        }

        $user->verification_code = null;
        $user->mobile_verified_at = now();
        $user->save();

        Auth::guard('api')->login($user);
    }
}
