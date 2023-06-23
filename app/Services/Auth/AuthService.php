<?php

namespace App\Services\Auth;

use Illuminate\Http\Response;

class AuthService
{
    protected $loginService;
    protected $registrationService;
    protected $verificationService;

    public function __construct(
        LoginService $loginService,
        RegistrationService $registrationService,
        VerificationService $verificationService
    ) {
        $this->loginService = $loginService;
        $this->registrationService = $registrationService;
        $this->verificationService = $verificationService;
    }


    public function login(string $mobile, string $password)
    {
        return $this->loginService->login($mobile, $password); // Success
    }

    public function register(string $mobile, string $password, string $username)
    {
        $this->registrationService->register($mobile, $password, $username);
    }

    public function verify(string $mobile, int $code)
    {
        $this->verificationService->verify($mobile, $code);
    }
}
