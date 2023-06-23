<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\AuthRequest;
use App\Services\Auth\AuthService;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    protected $authService;

    public function __construct(AuthService $authService)
    {
        $this->authService = $authService;
    }

    public function login(AuthRequest $request)
    {
        try {
            $token =  $this->authService->login($request->input('mobile'), $request->input('password'));
            return response()->success('Login successfully',['token' => $token]);
        } catch (ValidationException $e) {
            return response()->error($e->getMessage() , $e->errors()); // Unprocessable Entity
        }

    }

    public function register(AuthRequest $request)
    {
        try {
             $this->authService->register($request->input('mobile'), $request->input('password'), $request->input('username'));
            return response()->success('User registered successfully Please Verify Mobile Number'); // Created
        } catch (ValidationException $e) {
            return response()->error($e->getMessage() , $e->errors()); // Unprocessable Entity
        }

    }

    public function verify(AuthRequest $request)
    {

        try {

            $this->authService->verify($request->input('mobile'), $request->input('code'));

            return response()->success('Verification successful'); // Verifyed

        } catch (ValidationException $e) {
            return response()->error($e->getMessage() , $e->errors()); // Unprocessable Entity
        }
    }
}
