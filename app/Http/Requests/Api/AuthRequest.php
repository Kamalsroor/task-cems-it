<?php

namespace App\Http\Requests\Api;

use App\Rules\MobileNumber;
use Illuminate\Foundation\Http\FormRequest;
class AuthRequest extends FormRequest
{
    public function rules()
    {

        switch ($this->route()->getActionMethod()) {
            case 'login':
                return $this->login();
            case 'register':
                return $this->register();
            case 'verify':
                return $this->verify();
            default:
                return [];
        }
    }


    private function login(){
        return [
            'mobile' => ['required','min:8','max:40',new MobileNumber],
            'password' => ['required','string' ,'min:8' ,'max:150'],
        ];
    }

    private function register(){
        return [
            'mobile' => ['required','min:8','max:40','unique:users,mobile',new MobileNumber],
            'password' => ['required','confirmed','string' ,'min:8' ,'max:150'],
            'username' => ['required','string' ,'min:3' ,'max:150'],
        ];
    }

    private function verify(){
        return [
            'mobile' => ['required','min:8','max:40',new MobileNumber],
            'code' => ['required','string'],
        ];
    }
}
