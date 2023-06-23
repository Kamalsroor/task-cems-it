<?php

namespace App\Services\Auth;

use App\Models\User;
use App\Services\TwilioSmsService;
use Hash;

class RegistrationService
{
    protected $user;
    protected $twilio;

    public function __construct(User $user , TwilioSmsService $twilio)
    {
        $this->user = $user;
        $this->twilio = $twilio;
    }

    public function register(string $mobile, string $password, string $username)
    {

        $code = generate_verification_code();
        // $message = $this->twilio->messages->create(
        //     $mobile,
        //     [
        //         'from' => config('services.twilio.from'),
        //         'body' => "Your verification code is: $code",
        //     ]
        // );





        $user = new User();
        $user->mobile = $mobile;
        $user->password = $password;
        $user->username = $username;
        $user->verification_code = $code;
        $user->save();


        $result = $this->twilio->send($mobile, "Your verification code is: $code");
    }
}
